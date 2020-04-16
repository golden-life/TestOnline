# Generated by Django 3.0.4 on 2020-04-08 18:49

import datetime
from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='Student',
            fields=[
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('sid', models.CharField(max_length=20, primary_key=True, serialize=False, verbose_name='学号')),
                ('password', models.CharField(default='123456', max_length=40, verbose_name='密码')),
                ('name', models.CharField(max_length=20, verbose_name='姓名')),
                ('sclass', models.CharField(max_length=20, verbose_name='班号')),
                ('email', models.EmailField(default=None, max_length=254, verbose_name='邮箱')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
            ],
            options={
                'verbose_name': '学生',
                'verbose_name_plural': '学生',
                'db_table': 'student',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='科目名')),
                ('decs', models.CharField(default='', max_length=500, null=True, verbose_name='科目说明')),
            ],
            options={
                'verbose_name': '科目',
                'verbose_name_plural': '科目',
                'db_table': 'course',
            },
        ),
        migrations.CreateModel(
            name='Sdept',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(choices=[('计算机科学与技术学院', '计算机科学与技术学院'), ('电气与自动化学院', '电气与自动化学院'), ('外国语学院', '外国语学院'), ('理学院', '理学院')], max_length=100, null=True, verbose_name='学院名')),
                ('decs', models.CharField(default='', max_length=500, null=True, verbose_name='学院说明')),
            ],
            options={
                'verbose_name': '学院',
                'verbose_name_plural': '学院',
                'db_table': 'sdept',
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('sid', models.CharField(max_length=20, primary_key=True, serialize=False, verbose_name='教工号')),
                ('name', models.CharField(max_length=20, verbose_name='姓名')),
                ('email', models.EmailField(default=None, max_length=254, verbose_name='邮箱')),
                ('password', models.CharField(default='000000', max_length=40, verbose_name='密码')),
                ('sdept', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.Sdept', verbose_name='学院')),
            ],
            options={
                'verbose_name': '教师',
                'verbose_name_plural': '教师',
                'db_table': 'teacher',
            },
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('questionType', models.CharField(choices=[('single_choice', '单选'), ('judgment', '判断'), ('multiple_choice', '多选')], default='single_choice', max_length=20, verbose_name='题型')),
                ('content', models.TextField(verbose_name='题目内容')),
                ('answer', models.TextField(verbose_name='正确答案')),
                ('choice_a', models.TextField(default='A.', null=True, verbose_name='A选项')),
                ('choice_b', models.TextField(default='B.', null=True, verbose_name='B选项')),
                ('choice_c', models.TextField(default='C.', null=True, verbose_name='C选项')),
                ('choice_d', models.TextField(default='D.', null=True, verbose_name='D选项')),
                ('choice_e', models.TextField(default='E.', null=True, verbose_name='E选项')),
                ('choice_f', models.TextField(default='F.', null=True, verbose_name='F选项')),
                ('boolt', models.TextField(default='对', null=True, verbose_name='判断正确')),
                ('boolf', models.TextField(default='错', null=True, verbose_name='判断错误')),
                ('choice_num', models.IntegerField(default=4, verbose_name='选项数')),
                ('level', models.CharField(choices=[('2', 'general'), ('1', 'easy'), ('3', 'difficult')], max_length=10, null=True, verbose_name='等级')),
                ('score', models.IntegerField(default=1, verbose_name='分数')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.Course', verbose_name='科目')),
            ],
            options={
                'verbose_name': '题目',
                'verbose_name_plural': '题目',
                'db_table': 'question',
            },
        ),
        migrations.CreateModel(
            name='Paper',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=100, verbose_name='试卷名称')),
                ('start_time', models.DateField(default=datetime.datetime.now, verbose_name='开始时间')),
                ('single_choice_num', models.IntegerField(default=0, verbose_name='单选题数')),
                ('single_choice_score', models.IntegerField(default=0, verbose_name='单选分值')),
                ('judgment', models.IntegerField(default=0, verbose_name='判断题数')),
                ('judgment_score', models.IntegerField(default=0, verbose_name='判断分值')),
                ('multiple_choice_num', models.IntegerField(default=0, verbose_name='多选题数')),
                ('multiple_choice_score', models.IntegerField(default=0, verbose_name='多选分值')),
                ('total_num', models.IntegerField(default=0, verbose_name='总题数')),
                ('total_score', models.IntegerField(default=100, verbose_name='总分')),
                ('exam_time', models.IntegerField(default=120, verbose_name='考试时间（min）')),
                ('course', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='users.Course', verbose_name='科目')),
                ('pid', models.ManyToManyField(to='users.Question')),
            ],
            options={
                'verbose_name': '试卷',
                'verbose_name_plural': '试卷',
                'db_table': 'paper',
            },
        ),
        migrations.CreateModel(
            name='Grade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('exam_name', models.CharField(default='', max_length=100, verbose_name='试卷名称')),
                ('grade', models.IntegerField(default=0, verbose_name='考试成绩')),
                ('exam_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='考试时间')),
                ('course', models.ForeignKey(default=1, null=True, on_delete=django.db.models.deletion.CASCADE, to='users.Course', verbose_name='科目')),
                ('stu', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='学生')),
            ],
            options={
                'verbose_name': '成绩',
                'verbose_name_plural': '成绩',
                'db_table': 'grade',
            },
        ),
        migrations.AddField(
            model_name='student',
            name='sdept',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='users.Sdept', verbose_name='学院'),
        ),
        migrations.AddField(
            model_name='student',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions'),
        ),
    ]
