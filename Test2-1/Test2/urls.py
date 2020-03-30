"""Test2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.contrib import admin
from users.views import RegisterView, LoginView, LogoutView, index, TeacherLoginView, StuInfoPersonal, TeaInfoPersonal

urlpatterns = [
    # 管理员登陆
    path('admin/', admin.site.urls),
    # path('captcha/', include('captcha.urls')),
    path('', index, name="index"),  # 首页
    path('register/', RegisterView.as_view(), name="register"),  # 学生注册
    path('login/', LoginView.as_view(), name='login'),  # 学生登录
    # path('logout/', LogoutView.as_view(), name="logout"),
    path('teacherlogin/', TeacherLoginView.as_view(), name='teacherlogin'),  # 老师登录
    path('login/personal/', StuInfoPersonal, name="StuInfoPersonal"),  # 学生的个人信息
    path('teacherlogin/personal/', TeaInfoPersonal, name="TeaInfoPersonal"),  # 教师的个人信息

]

