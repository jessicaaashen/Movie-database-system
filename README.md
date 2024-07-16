# Movie-Database-System

基于django的电影数据库打分系统

## Windows版本问题：

- 可能需要手动安装restframework这个django package
- 报C++14依赖错误

https://stackoverflow.com/questions/64261546/python-cant-install-packages

安装或modify VS Studio里面的C++ build tool然后再重新安装包

---

Mac一步到位，暂没啥问题

## 运行

包在requirements.txt里面，venv或者conda都可以

```python
#安装包
pip install -r requirements.txt
```


```python
#运行服务器
python manage.py runserver
```

本地地址：

 http://127.0.0.1:8000/

后台地址：

http://127.0.0.1:8000/admin

## 基本功能

1. 登陆注册

2. 电影的分类，排序，搜索功能

3. 对电影进行打分，评论

4. 收藏喜爱的电影

5. 管理员后台进行管理

   ```python
   # 创建超级管理员
   python manage.py createsuperuser
   ```

## 文件功能

1. api

   调用的端口


2. media
  
   存放静态文件，如导演、演员和电影的图片，并在数据库中存放相应的链接，实现前端图片的展示功能。

   
3. movie 

   是 Django 的默认文件，负责基础设置的配置，URL 路由和部署等。

   
4. static
   
   内存有 css 文件和 js 文件，是框架自带的，也负责存放一些数据库页面展示中的基础图片元素。

   
5. user

   是本项目的主要代码文件夹，以下我们将详细介绍其组成架构：
   
   ·user/templates/为前端页面模板文件夹，负责存放众多 HTML 文件;
   
   ·user/admins.py 为管理员后台代码（本项目的管理员后台采取了通过 Django 框架自动生成的动态页面）；
   
   ·user/forms.py 为前端表单代码，定义了；
   
   ·user/models.py 为数据库的 ORM 模型，和数据库的实体表一一对应；
   
   ·user/urls 为路由注册文件，用户可以在页面输入访 URL，通过 URL 来匹配相应的视图函数；
   
   ·user/views 为负责处理前端请求和与后端数据库交互的模块，是业务处理的核心模块。

   
7. cache.py
   
   存放缓存的 key 值名称的文件。

   
8. manage.py

   可以从这里启动来运行主程序。

   
9. requirements.txt

   存放了所有所需要的依赖包

   
