from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.

DEPT = (
    ('计算机科学与技术学院', '计算机科学与技术学院'),
    ('电气与自动化学院', '电气与自动化学院'),
    ('外国语学院', '外国语学院'),
    ('理学院', '理学院'),
)


class Student(AbstractUser):  # 继承，学生表在继承的基础上包含以下内容
    sid = models.CharField('学号', max_length=20, primary_key=True)  # 学号
    password = models.CharField('密码', max_length=40, default='123456')  # 密码
    name = models.CharField('姓名', max_length=20)  # 姓名
    sclass = models.CharField('班号', max_length=20)  # 班号
    sdept = models.CharField('学院', max_length=20, choices=DEPT, null=True)  # 学院
    email = models.EmailField('邮箱', default=None)  # 邮箱

    class Meta:  # 表名
        db_table = 'student'
        verbose_name = '学生'
        verbose_name_plural = verbose_name

    def __str__(self):  # 主键
        return self.sid


class Teacher(models.Model):
    sid = models.CharField("教工号", max_length=20, primary_key=True)
    name = models.CharField('姓名', max_length=20)
    sdept = models.CharField('学院', max_length=20, choices=DEPT,  null=True)
    email = models.EmailField('邮箱', default=None)
    password = models.CharField('密码', max_length=40, default='000000')

    class Meta:
        db_table = 'teacher'
        verbose_name = '教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.sid



