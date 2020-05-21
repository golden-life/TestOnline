
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
from users.views import RegisterView, LoginView, LogoutView, index,StuInfoPersonalView,EditStuInfo, TeaInfoPersonalView, TeacherLoginView,PaperView,StuExamInfoView,StuGradeInfoView,TeaShowGradeView,TeaSearchGradeView,AddPaperView,StatisticView,CollectView,StuSearchGradeView

urlpatterns = [
    # 管理员登陆
    path('admin/', admin.site.urls),
    path('logout/admin/', admin.site.urls),
    # path('captcha/', include('captcha.urls')),
    path('', index, name="index"),  # 首页
    path('register', RegisterView.as_view(), name="register"),  # 学生注册
    path('login/', LoginView.as_view(), name='login'),  # 学生登录
    # path('logout/', LogoutView.as_view(), name="logout"),
    path('teacherlogin/', TeacherLoginView.as_view(), name='teacherlogin'),  # 老师登录
    path('logout/', LogoutView.as_view(), name='logout'),  # 学生退出
    path('login/personal/', StuInfoPersonalView.StuInfoPersonal, name="StuInfoPersonal"),  # 学生的个人信息
    path('login/personal/editinfo',EditStuInfo.ShowEditInfo,name="ShowEditInfo"), 
    path('login/personal/edit',EditStuInfo.Edit,name="Edit"), 
    path('login/StuExamInfo/', StuExamInfoView.StuExamInfo, name="StuExamInfo"),  # 学生的考试信息
    path('login/StuGradeInfo/', StuGradeInfoView.StuGradeInfo, name="StuGradeInfo"),  # 学生的成绩信息
    path('login/StuCollect/', CollectView.ShowCollect, name="ShowCollect"),  # 收藏夹
    path('login/StuCollect/collectlist/', CollectView.CollectList, name="CollectList"),  # 查看收藏夹
    path('login/deletecollect/', CollectView.DeleteCollect, name="DeleteCollect"),  # 学生取消收藏夹
    path('teacherlogin/personal/', TeaInfoPersonalView.TeaInfoPersonal, name="TeaInfoPersonal"),  # 教师的个人信息
    path('teacherlogin/showgrade/', TeaShowGradeView.TeaShowGrade, name="TeaShowGrade"),  # 教师查看成绩
    path('teacherlogin/statistic/', StatisticView.TeaStatistic, name="TeaStatistic"),  # 教师统计成绩
    path('teacherlogin/statistic/show', StatisticView.ShowSta, name="show"),  # 统计成绩
    path('teacherlogin/addpaper/', AddPaperView.AddPaper, name="AddPaper"),  # 教师组卷
    path('teacherlogin/addpaper/ChooseQuestion/', AddPaperView.ChooseQuestion, name="ChooseQuestion"),
    path('teacherlogin/showgrade/search/', TeaSearchGradeView.TeaSearchGrade, name="TeaSearchGrade"), 
    path('login/StuGradeInfo/search/', StuSearchGradeView.StuSearchGrade, name="StuSearchGrade"),
    path('login/StuExamInfo/StartExam', PaperView.StartExam, name="StartExam"),  # 学生开始考试
    path('login/StuExamInfo/collect/', CollectView.AddCollect, name="AddCollect"),  # 学生添加收藏夹
    url('^calGrade/$',PaperView.calGrade),
    url('^getChoose/$',AddPaperView.GetChoose),
]


