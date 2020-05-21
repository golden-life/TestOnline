from __future__ import unicode_literals
from django.db import models
from datetime import datetime
from django.contrib.auth.models import AbstractUser

# Create your models here.

DEPT = (
    ('计算机科学与技术学院', '计算机科学与技术学院'),
    ('电气与自动化学院', '电气与自动化学院'),
    ('外国语学院', '外国语学院'),
    ('理学院', '理学院'),
)

#学院表
class Sdept(models.Model):
    name = models.CharField(max_length=100, verbose_name=u"学院名",choices=DEPT, null=True)
    decs = models.CharField(max_length=500, verbose_name=u"学院说明", default="",null=True)

    class Meta:
        db_table = 'sdept'
        verbose_name = u'学院'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

#班级表
class Sclass(models.Model):
    cid = models.CharField('班号', max_length=20)  # 班号
    sdept = models.ForeignKey(Sdept, verbose_name=u"学院", on_delete=models.CASCADE, null=True)  # 学院

    class Meta:
        db_table = 'sclass'
        verbose_name = u'班级'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.cid


class Student(models.Model):  # 继承，学生表在继承的基础上包含以下内容
    sid = models.CharField('学号', max_length=20, primary_key=True)  # 学号
    password = models.CharField('密码', max_length=40, default='123456')  # 密码
    name = models.CharField('姓名', max_length=20)  # 姓名
    sclass = models.ForeignKey(Sclass, verbose_name=u"班号", on_delete=models.CASCADE, null=True)  # 班号
    sdept = models.ForeignKey(Sdept, verbose_name=u"学院", on_delete=models.CASCADE, null=True)  # 学院
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
    sdept = models.ForeignKey(Sdept, verbose_name=u"学院", on_delete=models.CASCADE)  # 学院
    email = models.EmailField('邮箱', default=None)
    password = models.CharField('密码', max_length=40, default='000000')

    class Meta:
        db_table = 'teacher'
        verbose_name = '教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.sid

#科目表
class Course(models.Model):
    name = models.CharField(max_length=100, verbose_name=u"科目名")
    decs = models.CharField(max_length=500, verbose_name=u"科目说明", default="",null=True)

    class Meta:
        db_table = 'course'
        verbose_name = u'科目'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

#题目标
class Question(models.Model):
    LEVEL = {
        ('1', 'easy'),
        ('2', 'general'),
        ('3', 'difficult'),
    }

    id = models.AutoField(primary_key=True)
    questionType = models.CharField(max_length=20, choices=(("single_choice", u"单选"), ("judgment", u"判断"), ("multiple_choice", u"多选")),default="single_choice", verbose_name=u"题型")
    course = models.ForeignKey(Course, verbose_name=u"科目", on_delete=models.CASCADE)
    content = models.TextField(verbose_name=u"题目内容")
    answer = models.TextField(verbose_name=u"正确答案")
    choice_a = models.TextField(verbose_name=u"A选项", default="A.",null=True)
    choice_b = models.TextField(verbose_name=u"B选项", default="B.",null=True)
    choice_c = models.TextField(verbose_name=u"C选项", default="C.",null=True)
    choice_d = models.TextField(verbose_name=u"D选项", default="D.",null=True)
    choice_e = models.TextField(verbose_name=u"E选项", default="E.",null=True)
    choice_f = models.TextField(verbose_name=u"F选项", default="F.",null=True)
    boolt = models.TextField(verbose_name=u"判断正确", default="对",null=True)
    boolf = models.TextField(verbose_name=u"判断错误", default="错",null=True)
    choice_num = models.IntegerField(verbose_name=u"选项数", default=4)
    level = models.CharField(verbose_name=u'等级', max_length=10, choices=LEVEL,null=True)
    score = models.IntegerField(verbose_name=u'分数', default=1)
    collect = models.ManyToManyField(Student)

    class Meta:
        db_table = 'question'
        verbose_name = u'题目'
        verbose_name_plural = verbose_name

    def get_content(self):  #获取题干
        return self.content

    def __unicode__(self):
        return u"科目：{0}(题干:{1} | 正确答案:{2} )".format(self.course.name, self.content, self.answer)

#试卷表
class Paper(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"科目", default=1, on_delete=models.CASCADE)
    pid = models.ManyToManyField(Question)  # 多对多
    name = models.CharField(max_length=100, verbose_name=u"试卷名称", default=u"")
    start_time = models.DateField(default=datetime.now, verbose_name=u"开始时间")
    single_choice_num = models.IntegerField(verbose_name=u"单选题数", default=0)
    single_choice_score = models.IntegerField(verbose_name=u"单选分值", default=0)
    judgment = models.IntegerField(verbose_name=u"判断题数", default=0)
    judgment_score = models.IntegerField(verbose_name=u"判断分值", default=0)
    multiple_choice_num = models.IntegerField(verbose_name=u"多选题数", default=0)
    multiple_choice_score = models.IntegerField(verbose_name=u"多选分值", default=0)
    total_num = models.IntegerField(verbose_name=u'总题数', default=0)
    total_score = models.IntegerField(verbose_name=u'总分', default=100)
    exam_time = models.IntegerField(verbose_name=u'考试时间（min）', default=120)

    class Meta:
        db_table='paper'
        verbose_name=u'试卷'
        verbose_name_plural=verbose_name

    def __unicode__(self):
        return u"{0} ({1}，{2})".format(self.name,self.total_score,self.exam_time)

#成绩表
class Grade(models.Model):
    stu=models.ForeignKey(Student,verbose_name=u"学生",on_delete=models.CASCADE,default='')#添加外键
    exam_name=models.CharField(u'试卷名称',max_length=100,default='')
    grade=models.IntegerField(verbose_name=u'考试成绩', default=0)
    exam_time = models.DateTimeField(default=datetime.now, verbose_name=u"考试时间")
    course = models.ForeignKey(Course, verbose_name=u"科目", default=1, on_delete=models.CASCADE, null=True)
    flag=models.IntegerField(verbose_name=u'成绩类型', default=0)

    class Meta:
        db_table='grade'
        verbose_name=u'成绩'
        verbose_name_plural=verbose_name

    def __unicode__(self):
        return u"({0},{1},{2})".format(self.stu,self.exam_name,self.grade)




