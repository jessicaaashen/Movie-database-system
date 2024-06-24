from django.db import models
from django.db.models import Avg

# 改成了中文  cx

class User(models.Model):
    username = models.CharField(max_length=255, unique=True, verbose_name="用户名")
    password = models.CharField(max_length=255, verbose_name="密码")
    email = models.EmailField(verbose_name="邮箱")

    class Meta:
        db_table = 'user_user'
        verbose_name_plural = "普通用户"
        verbose_name = "普通用户"

    def __str__(self):
        return self.username


class Tags(models.Model):
    name = models.CharField(max_length=255, verbose_name="电影标签", unique=True)

    class Meta:
        db_table = 'user_tags'
        verbose_name = "电影标签"
        verbose_name_plural = "电影标签"

    def __str__(self):
        return self.name


class UserTagPrefer(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, blank=True, verbose_name="用户id",
    )
    tag = models.ForeignKey(Tags, on_delete=models.CASCADE, verbose_name='电影标签')
    score = models.FloatField(default=0)

    class Meta:
        db_table = 'user_usertagprefer'
        verbose_name = "用户喜好"
        verbose_name_plural = "喜好"
        unique_together = (('user', 'tag'),)     # cx 0623，保证唯一性（一个用户对一个标签至多有一条记录）

    def __str__(self):
        return self.user.username + str(self.score)




# 以下是我新加的表
class Company(models.Model):
    name = models.CharField(max_length=255, verbose_name='公司名称', unique=True)    # cx 0623 保证唯一性
    city = models.CharField(max_length=64, verbose_name='所在城市')
    # 增加了"company"的别名“公司信息”  cx
    class Meta:
        db_table = 'user_company'
        verbose_name = "公司信息"
        verbose_name_plural = "公司信息"

    def __str__(self):
        return self.name
# 以上是我新加的表


# 新增的演员信息管理  cx
class Actor(models.Model):
    name = models.CharField(verbose_name="演员姓名", max_length=255)
    gender = models.CharField(verbose_name="性别", max_length=4)
    birthday = models.DateField(verbose_name="生日")
    introduction = models.TextField(verbose_name="简介")
    nationality = models.CharField(verbose_name="国籍", max_length=255)
    prize = models.CharField(verbose_name="获奖信息", max_length=255)
    image_link = models.FileField(verbose_name="演员照片", max_length=255, upload_to='actor_photo',null=True, blank=True)

    class Meta:
        db_table = 'user_actor'
        verbose_name = "演员信息"
        verbose_name_plural = "演员信息"

    def __str__(self):
        return self.name
    

# 新增的导演信息管理  cx
class Director(models.Model):
    name = models.CharField(verbose_name="导演姓名", max_length=255, unique=True)
    gender = models.CharField(verbose_name="性别", max_length=4)
    birthday = models.DateField(verbose_name="生日")
    introduction = models.TextField(verbose_name="简介")
    nationality = models.CharField(verbose_name="国籍", max_length=255)
    prize = models.CharField(verbose_name="获奖信息", max_length=255)
    image_link = models.FileField(verbose_name="导演照片", max_length=255, upload_to='director_photo',null=True, blank=True)

    class Meta:
        db_table = 'user_director'
        verbose_name = "导演信息"
        verbose_name_plural = "导演信息"

    def __str__(self):
        return self.name



class Movie(models.Model):
    tags = models.ManyToManyField(Tags, verbose_name='电影标签')      # 删掉了最后的 , blank = True cx0622
    collect = models.ManyToManyField(User, verbose_name="收藏用户")   # 删掉了最后的 , blank = True cx0622
    name = models.CharField(verbose_name="电影名称", max_length=255, unique = True)
    director = models.ManyToManyField(Director, through='MovieDirector', verbose_name="导演", max_length=255)         # cx 0622
    country = models.CharField(verbose_name="国家/地区", max_length=255)
    years = models.DateField(verbose_name='上映时间')
    actor = models.ManyToManyField(Actor, through='MovieActor',verbose_name="演员", max_length=1024)          # cx 0622
    d_rate = models.DecimalField(verbose_name="豆瓣评分", max_digits=3, decimal_places=1)          # cx 0622 0623
    intro = models.TextField(verbose_name="情节简介")
    num = models.IntegerField(verbose_name="浏览数量", default=0)
    image_link = models.FileField(verbose_name="宣传图", max_length=255, upload_to='movie_cover',null=True, blank=True)

    # 下列字段是sjy加入的
    duration = models.IntegerField(verbose_name='电影时长', null=True)
    state = models.CharField(verbose_name="上映状态",max_length=20)
    language = models.CharField(verbose_name="语言",max_length=20,default="英语")
    company = models.ForeignKey(Company,verbose_name="涉及公司",on_delete=models.CASCADE, blank=True)


    @property
    def movie_rate(self):
        movie_rate = Rate.objects.filter(movie_id=self.id).aggregate(Avg('mark'))['mark__avg']
        return movie_rate or '暂无评分'

    class Meta:
        db_table = 'user_movie'
        verbose_name = "电影信息"
        verbose_name_plural = "电影信息"

    def __str__(self):
        return self.name



# sjy加入 0623
class MovieActor(models.Model):
    movie = models.ForeignKey(Movie, on_delete=models.RESTRICT, verbose_name="电影")
    actor = models.ForeignKey(Actor, on_delete=models.RESTRICT, verbose_name="演员")
    duty = models.TextField(verbose_name="饰演角色")

    class Meta:
        # 定义数据库约束名称，确保它们与 SQL 脚本中的相匹配（如果需要）
        db_table = 'user_movie_actor'  # 指定数据库中的表名称
        verbose_name = "电影与演员关系"
        verbose_name_plural = "电影与演员关系"
        unique_together = (('movie', 'actor', 'duty'),)     # cx 0623，保证唯一性

    def __str__(self):
        return f"{self.movie.name} - {self.actor.name}"



class MovieDirector(models.Model):
    movie = models.ForeignKey(Movie, on_delete=models.RESTRICT, verbose_name="电影")
    director = models.ForeignKey(Director, on_delete=models.RESTRICT, verbose_name="导演")
    duty = models.TextField(verbose_name="工作职责")

    class Meta:
        # 定义数据库约束名称，确保它们与 SQL 脚本中的相匹配（如果需要）
        db_table = 'user_movie_director'  # 指定数据库中的表名称
        verbose_name = "电影与导演关系"
        verbose_name_plural = "电影与导演关系"
        unique_together = (('movie', 'director', 'duty'),)     # cx 0623，保证唯一性

    def __str__(self):
        return f"{self.movie.name} - {self.director.name}"



class Rate(models.Model):
    movie = models.ForeignKey(
        Movie, on_delete=models.CASCADE, blank=True, null=True, verbose_name="电影ID"
    )
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, blank=True, null=True, verbose_name="用户名",
    )
    mark = models.FloatField(verbose_name="评分")
    create_time = models.DateTimeField(verbose_name="评分时间", auto_now_add=True)

    @property
    def avg_mark(self):
        average = Rate.objects.all().aggregate(Avg('mark'))['mark__avg']
        return average

    class Meta:
        db_table = 'user_rate'
        verbose_name = "评分信息"
        verbose_name_plural = "评分信息"
        unique_together = (('movie', 'user'),)           # cx 0623，保证唯一性（用户对一个电影只能有一个评分）



class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户名")
    content = models.CharField(max_length=255, verbose_name="评论内容", blank=False, null=False)
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="评论时间")
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, verbose_name="电影")

    class Meta:
        db_table = 'user_comment'
        verbose_name = "评论信息"
        verbose_name_plural = "评论信息"



class LikeComment(models.Model):
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE, verbose_name='评价')
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户名')

    class Meta:
        db_table = 'user_likecomment'
        verbose_name = "点赞信息"
        verbose_name_plural = "点赞信息"


