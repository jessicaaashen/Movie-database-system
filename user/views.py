import json
import logging
from functools import wraps

from django.core.cache import cache
from django.core.paginator import Paginator
from django.db.models import Q, Count
from django.http import HttpResponse
from django.http import HttpResponseBadRequest
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from django.db import connection

from cache_keys import USER_CACHE, ITEM_CACHE, ALS_CACHE
from .forms import *

logger = logging.getLogger()
logger.setLevel(level=0)


def login_in(func):  # 验证用户是否登录
    @wraps(func)
    def wrapper(*args, **kwargs):
        request = args[0]
        is_login = request.session.get("login_in")
        if is_login:
            return func(*args, **kwargs)
        else:
            return redirect(reverse("login"))

    return wrapper


def movies_paginator(movies, page):
    paginator = Paginator(movies, 8)
    if page is None:
        page = 1
    movies = paginator.page(page)
    return movies


class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs["content_type"] = "application/json"
        super(JSONResponse, self).__init__(content, **kwargs)


# 登录功能
def login(request):
    if request.method == "POST":
        form = Login(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            result = User.objects.filter(username=username)
            if result:
                user = User.objects.get(username=username)
                if user.password == password:
                    request.session["login_in"] = True
                    request.session["user_id"] = user.id
                    request.session["name"] = user.username
                    return redirect(reverse("index"))
                else:
                    return render(
                        request, "user/new_login.html", {"form": form, "message": "Wrong Password!"}
                    )
            else:
                return render(
                    request, "user/new_login.html", {"form": form, "message": "Account does not exist!"}
                )
    else:
        form = Login()
        return render(request, "user/new_login.html", {"form": form})


# 注册功能
def register(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        error = None
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password2"]
            email = form.cleaned_data["email"]
            User.objects.create(
                username=username,
                password=password,
                email=email,
            )
            request.session['new'] = 'true'
            # 根据表单数据创建一个新的用户
            return redirect(reverse("login"))  # 跳转到登录界面
        else:
            error = form.errors
            return render(
                request, "user/register.html", {"form": form, "error": error}
            )  # 表单验证失败返回一个空表单到注册页面
    form = RegisterForm()
    return render(request, "user/register.html", {"form": form})


def logout(request):
    if not request.session.get("login_in", None):  # 不在登录状态跳转回首页
        return redirect(reverse("index"))
    request.session.flush()  # 清除session信息
    return redirect(reverse("index"))


def index(request):
    tags = Tags.objects.raw("select * from user_tags")
    order = request.GET.get('order')
    tag_id = request.GET.get('tag_id')
    if tag_id is not None:
        movies = Movie.objects.raw('''
            SELECT user_movie.*
            FROM user_movie
            JOIN user_movie_tags ON user_movie.id = user_movie_tags.movie_id
            WHERE user_movie_tags.tags_id = %s;
        ''', [tag_id])
    else:
        movies = Movie.objects.raw("select * from user_movie")
    temp = Movie.objects.none()
    for movie in movies:
        obj = Movie(movie.id)
        temp |= Movie.objects.filter(pk = obj.pk)
    movies = temp
    #     评分排序
    if order == '1':
        movies = movies.annotate(marks=Avg('rate__mark')).order_by('-marks')
    #    收藏排序
    elif order == '2':
        movies = movies.annotate(user_collector=Count('collect')).order_by('-user_collector')
    #     时间排序
    elif order == '3':
        movies = movies.order_by('-years')
    elif order == '4':
        movies = movies.order_by('-num')
    #     默认
    paginator = Paginator(movies, 6)
    current_page = request.GET.get("page", 1)
    movies = paginator.page(current_page)
    return render(request, 'index.html', {'tags': tags, 'movies': movies})


def search(request):  # 搜索
    if request.method == "POST":  # 如果搜索界面
        key = request.POST["search"]
        request.session["search"] = key  # 记录搜索关键词解决跳页问题
    else:
        key = request.session.get("search")  # 得到关键词

    # movies = Movie.objects.filter.distinct()(
    #     # Q(name__icontains=key)  | Q(intro__icontains=key)| Q(director__icontains=key) cx 0623
    #     Q(name__icontains=key) | Q(moviedirector__director__name__icontains=key) | Q(movieactor__actor__name__icontains=key)
    # )  # 进行内容的模糊搜索

    search_key = f"%{key}%"  # 模糊搜索关键字
    sql_query = '''
    SELECT DISTINCT *
    FROM `user_movie`
    WHERE `user_movie`.`id` IN (
        SELECT `user_movie`.`id`
        FROM `user_movie`
        LEFT OUTER JOIN `user_movie_director` ON (`user_movie`.`id` = `user_movie_director`.`movie_id`)
        LEFT OUTER JOIN `user_director` ON (`user_movie_director`.`director_id` = `user_director`.`id`)
        LEFT OUTER JOIN `user_movie_actor` ON (`user_movie`.`id` = `user_movie_actor`.`movie_id`)
        LEFT OUTER JOIN `user_actor` ON (`user_movie_actor`.`actor_id` = `user_actor`.`id`)
        WHERE `user_movie`.`name` LIKE %s 
        OR `user_director`.`name` LIKE %s 
        OR `user_actor`.`name` LIKE %s
    )
    '''
    movies = Movie.objects.raw(sql_query, [search_key, search_key, search_key])

    page_num = request.GET.get("page", 1)
    movies = movies_paginator(movies, page_num)
    return render(request, "index.html", {"movies": movies, 'title': "Search Results"})


# cx 0623 新增演员搜索
def actor_search(request):
    if request.method == "POST":  # 如果搜索界面
        key = request.POST["search"]
        request.session["search"] = key  # 记录搜索关键词解决跳页问题
    else:
        key = request.session.get("search")  # 得到关键词
    sql = """
        SELECT * FROM user_actor
        WHERE name LIKE %s OR nationality LIKE %s
    """
    params = [f'%{key}%', f'%{key}%']
    actors = Actor.objects.raw(sql, params)
    page_num = request.GET.get("page", 1)
    actors = movies_paginator(actors, page_num)
    return render(request, 'actors.html', {'actors': actors})


# cx 0623 新增导演搜索
def director_search(request):
    if request.method == "POST":  # 如果搜索界面
        key = request.POST["search"]
        request.session["search"] = key  # 记录搜索关键词解决跳页问题
    else:
        key = request.session.get("search")  # 得到关键词
    sql = """
        SELECT * FROM user_director
        WHERE name LIKE %s OR nationality LIKE %s
    """
    params = [f'%{key}%', f'%{key}%']
    directors = Director.objects.raw(sql, params)
    page_num = request.GET.get("page", 1)
    directors = movies_paginator(directors, page_num)
    return render(request, 'directors.html', {'directors': directors})


# cx 0624 新增公司搜索
def company_search(request):
    if request.method == "POST":  # 如果搜索界面
        key = request.POST["search"]
        request.session["search"] = key  # 记录搜索关键词解决跳页问题
    else:
        key = request.session.get("search")  # 得到关键词
    sql = """
        SELECT * FROM user_company
        WHERE name LIKE %s OR city LIKE %s
    """
    params = [f'%{key}%', f'%{key}%']
    companies = Company.objects.raw(sql, params)
    page_num = request.GET.get("page", 1)
    companies = movies_paginator(companies, page_num)
    return render(request, 'companies.html', {'companies': companies})


# 请求单个电影数据时调用的接口
# sjy0622
# cx 0623 加了最后一行的 'comments': comments,
def movie(request, movie_id):
    movie = Movie.objects.get(pk=movie_id)
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_movie_actor` 
    INNER JOIN 
        `user_actor` 
    ON 
        (`user_movie_actor`.`actor_id` = `user_actor`.`id`) 
    WHERE 
        `user_movie_actor`.`movie_id` = %s
    '''
    actor_roles = MovieActor.objects.raw(sql_query, [movie_id])
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_movie_director` 
    INNER JOIN 
        `user_director` 
    ON 
        (`user_movie_director`.`director_id` = `user_director`.`id`) 
    WHERE 
        `user_movie_director`.`movie_id` = %s
    '''
    director_roles = MovieDirector.objects.raw(sql_query, [movie_id])
    movie.num += 1
    movie.save()
    comments = movie.comment_set.order_by("-create_time")
    user_id = request.session.get("user_id")
    movie_rate = Rate.objects.filter(movie=movie).all().aggregate(Avg('mark'))
    if movie_rate:
        movie_rate = movie_rate['mark__avg']
    else:
        movie_rate = 0
    if user_id is not None:
        user_rate = Rate.objects.filter(movie=movie, user_id=user_id).first()
        user = User.objects.get(pk=user_id)
        is_collect = movie.collect.filter(id=user_id).first()
    return render(request, "user/details.html", locals())


@login_in
# 给电影打分 在打分的时候清除缓存
def score(request, movie_id):
    user_id = request.session.get("user_id")
    user = User.objects.get(id=user_id)
    movie = Movie.objects.get(id=movie_id)
    score = float(request.POST.get("score"))
    get, created = Rate.objects.get_or_create(user_id=user_id, movie=movie, defaults={"mark": score})
    if created:
        # 清理缓存
        user_cache = USER_CACHE.format(user_id=user_id)
        item_cache = ITEM_CACHE.format(user_id=user_id)
        als_cache = ALS_CACHE.format(user_id=user_id)
        cache.delete(user_cache)
        cache.delete(item_cache)
        cache.delete(als_cache)
        print('cache deleted')
        # update_item_movie_sim_matrix(movie_id, user_id)
        # user_cf.update_all_user(user=user)
    return redirect(reverse("movie", args=(movie_id,)))


@login_in
# 给电影进行评论
# cx 0623 增加了“非空”的条件
def make_comment(request, movie_id):
    user = User.objects.get(id=request.session.get("user_id"))
    movie = Movie.objects.get(id=movie_id)
    # movie.score.com += 1
    # movie.score.save()
    # comment = request.POST.get("comment") 
    comment = request.POST.get("comment", "").rstrip()      # 获取评论内容，并去除尾部空白
    if not comment:  # 检查评论内容是否为空
        return HttpResponseBadRequest("评论内容不能为空，请输入有效的评论。")  # 返回HTTP 400错误响应
    Comment.objects.create(user=user, movie=movie, content=comment)
    return redirect(reverse("movie", args=(movie_id,)))     # 评论成功后重定向


@login_in
def collect(request, movie_id):
    user = User.objects.get(id=request.session.get("user_id"))
    movie = Movie.objects.get(id=movie_id)
    movie.collect.add(user)
    movie.save()
    return redirect(reverse("movie", args=(movie_id,)))


@login_in
def decollect(request, movie_id):
    user = User.objects.get(id=request.session.get("user_id"))
    movie = Movie.objects.get(id=movie_id)
    movie.collect.remove(user)
    # movie.rate_set.count()
    movie.save()
    return redirect(reverse("movie", args=(movie_id,)))


@login_in
def personal(request):
    user = User.objects.get(id=request.session.get("user_id"))
    if request.method == "POST":
        form = Edit(instance=user, data=request.POST)
        if form.is_valid():
            form.save()
            return render(
                request, "personal.html", {"message": "Modified successfully!", "form": form}
            )
        else:
            return render(
                request, "personal.html", {"message": "Failure to modify", "form": form}
            )
    form = Edit(instance=user)
    return render(request, "personal.html", {"user": user, 'form': form})


@login_in
def mycollect(request):
    user = User.objects.get(id=request.session.get("user_id"))
    movie = user.movie_set.all()
    return render(request, "user/mycollect.html", {"item": movie})


@login_in
def myjoin(request):
    user_id = request.session.get("user_id")
    user = User.objects.get(id=user_id)
    user_actions = user.action_set.all()
    return render(request, "user/myaction.html", {"item": user_actions})


@login_in
# 展示我的评论的地方
def my_comments(request):
    user = User.objects.get(id=request.session.get("user_id"))
    comments = user.comment_set.all()
    print('comment:', comments)
    return render(request, "user/my_comment.html", {"item": comments})


@login_in
def delete_comment(request, comment_id):
    Comment.objects.get(pk=comment_id).delete()
    return redirect(reverse("my_comments"))


@login_in
def my_rate(request):
    user = User.objects.get(id=request.session.get("user_id"))
    rate = user.rate_set.all()
    return render(request, "message.html", {"item": rate})


def delete_rate(request, rate_id):
    Rate.objects.filter(pk=rate_id).delete()
    return redirect(reverse("my_rate"))


# 电影的标签页面
def all_tags(request):
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_tags`
    '''
    tags = Tags.objects.raw(sql_query)
    return render(request, "user/tags.html", {"tags": tags})    # 这里连接到了user/templates/user/tags.html


@login_in
@csrf_exempt
def choose_tags(request):
    tags_name = json.loads(request.body)
    user_id = request.session.get('user_id')
    for tag_name in tags_name:
        tag = Tags.objects.filter(name=tag_name.strip()).first()
    # request.session.pop('new')
    return redirect(reverse("index"))


# 新增导演浏览页面 cx 20240613
def all_directors(request):
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_director`
    '''
    directors = Director.objects.raw(sql_query)
    paginator = Paginator(directors, 6)    # cx 0623 分页
    current_page = request.GET.get("page", 1)
    directors = paginator.page(current_page)
    return render(request, "directors.html", {"directors": directors})    # 连接到了user/templates/user/directors.html（新增文件）


# 新增演员浏览页面 cx 20240613
def all_actors(request):
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_actor`
    '''
    actors = Actor.objects.raw(sql_query)
    paginator = Paginator(actors, 6)    # cx 0623 分页
    current_page = request.GET.get("page", 1)
    actors = paginator.page(current_page)
    return render(request, "actors.html", {"actors": actors})              # 连接到了user/templates/user/actors.html（新增文件）


# 新增公司浏览/详情页面 cx 0624
def all_companies(request):
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_company`
    '''
    companies = Company.objects.raw(sql_query)
    paginator = Paginator(companies, 6)    # cx 0623 分页
    current_page = request.GET.get("page", 1)
    companies = paginator.page(current_page)
    return render(request, "companies.html", {"companies": companies})     # 连接到了user/templates/user/companies.html（新增文件）


# sjy 0621修改 跳转演员详情的界面
# 注意这里有两个参数，在urls和actors里面要提供两个参数 cx0622
def actor(request, actor_id):
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_actor`
    WHERE 
        `user_actor`.`id` = %s
    '''
    actor = Actor.objects.raw(sql_query, [actor_id])[0]
    return render(request, "user/actor_details.html", locals())


# cx 0622修改 跳转导演详情的界面
# 注意这里有两个参数，在urls和directors里面要提供两个参数 cx0622
def director(request, director_id):
    sql_query = '''
    SELECT 
        *
    FROM 
        `user_director`
    WHERE 
        `user_director`.`id` = %s
    '''
    director = Director.objects.raw(sql_query, [director_id])[0]
    return render(request, "user/director_details.html", locals())



@login_in
def clear_cache(request):
    cache.clear()
    return redirect(reverse('index'))
