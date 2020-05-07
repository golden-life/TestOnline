# Create your views here.
from django.views.generic.base import View
from .form import RegisterForm, LoginForm
from django.shortcuts import render, redirect
from django.contrib.auth.hashers import make_password, check_password
from .models import Student, Teacher,Course,Question,Paper,Grade,Sdept
from django.contrib.auth import authenticate, login, logout
import re
title = "在线考试系统"


def md5(pwd):
    # md5 加密
    import hashlib
    md5 = hashlib.md5()
    md5.update(pwd.encode())
    return md5.hexdigest()


def index(request):
    return render(request, 'index.html')

# 注册账户


class RegisterView(View):
    # @staticmethod
    def get(self, request):
        # 把form传给前端,里边是验证码需要在前端显示
        register_form = RegisterForm()   # 获得注册表单，空表单等待输入
        return render(request, 'register.html', {'register_form': register_form, "title": title})  # 转到注册界面

    # @staticmethod
    def post(self, request):  # 把前端注册表单的内容传到后端
        # 进行注册处理
        register_form = RegisterForm(request.POST)  # 该注册表单已有输入的内容
        stu_id = request.POST.get('sid', '')
        if len(stu_id) == 0:
            return render(request, 'register.html', {"msg":"学号不能为空！", 'register_form': register_form, "title": title})
            # 去表里查询有没有这个学号,有就是已经注册过了
        if Student.objects.filter(sid=stu_id):
            return render(request, 'register.html',{"title": title, 'register_form': register_form, 'msg': u'学号已经存在'})
            # 没有就是新用户,继续流程
        else:
                # 获取前端填的表单,写进user库里
            stu_password = request.POST.get("password", "")
            if len(stu_password)<6:
                return render(request, "register.html", {'script': "alert", 'msg0': u"密码至少6位"})
            #if len(stu_password)==0:
            #    return render(request, "register.html", {'script': "alert", 'msg0': u"密码不能为空"})
            if len(stu_password)>=6:
                stu_name = request.POST.get("name", "")
                if len(stu_name)==0:
                    return render(request, "register.html", {'script': "alert", 'msg0': u"姓名不能为空"})
                stu_sclass = request.POST.get("sclass", "")
                if len(stu_sclass)==0:
                    return render(request, "register.html", {'script': "alert", 'msg0': u"班号不能为空"})
                stu_sdept = request.POST.get("sdept", "")
                sdept = Sdept.objects.get(name = stu_sdept)
                stu_email = request.POST.get("email")
                if len(stu_email)==0:
                    return render(request, "register.html", {'script': "alert", 'msg0': u"邮箱不能为空"})
                if re.match(r'[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$',stu_email):
                    stu_profile = Student()
                    stu_profile.sid = stu_id
                        # stu_profile.password = make_password(stu_password)  # 加密密码之后再存入表
                    stu_profile.password = md5(stu_password)
                    stu_profile.name = stu_name
                    stu_profile.sclass = stu_sclass
                    stu_profile.sdept_id = sdept.id
                    stu_profile.email = stu_email
                    stu_profile.is_active = True  # 用户激活状态，目前不太清楚用处
                    stu_profile.save()
                    return render(request, "register.html", {'script': "alert", 'msg0': u"注册成功"})
                else:
                    return render(request, "register.html", {'script': "alert", 'msg0': u"邮箱格式错误"})
        #else:
            #return render(request, 'register.html', {"msg":"输入不能为空！", 'register_form': register_form, "title": title})
            # 把register_form传给前端是因为 这里包含错误信息,需要在前端显示


# 学生登录


class LoginView(View):
    # @staticmethod
    def get(self, request):
        login_form = LoginForm()
        return render(request, "login.html", {"login_form": login_form, "title": title})

    # @staticmethod
    def post(self, request):
        print(1)
        login_form = LoginForm(request.POST)

        #if login_form.is_valid():  # 验证表是否为空
        print(3)
        stu_id = request.POST.get("sid", "")
        if len(stu_id)==0:
            return render(request, "login.html", {"msg":"输入不能为空！", "login_form": login_form})
        print(4)
        stu_passw = request.POST.get("password", "")  # 获取从前端输入的密码
        if len(stu_passw)==0:
            return render(request, "login.html", {"msg":"输入不能为空！", "login_form": login_form})
        stu_list = Student.objects.filter(sid=stu_id)  # 得到数据库中该学号对应的那条记录,列表形式
        if stu_list:
            stu = stu_list[0]
            stu_password = md5(stu_passw)  # 对前端输入的密码进行加密
            print(stu_id)
            # user = authenticate(username=stu_id, password=stu_password)
            # print(user)
            # if user is not None:
            # if check_password(stu_passw, stu.password):
            if stu_password == stu.password:
                # login(request, user)
                print(5)
                request.session['sid'] = stu.sid
                request.session['password'] = stu.password
                request.session['name'] = stu.name
                request.session['sclass'] = stu.sclass
                sdept = Sdept.objects.get(id = stu.sdept_id)
                request.session['sdept'] = sdept.name
                request.session['email'] = stu.email
                #papers = Paper.objects.filter()
                return render(request, "studentinfo.html", {"stu": stu})
            else:
                # u"用户名或密码错误"
                return render(request, "login.html", {"msg": "密码错误！", "login_form": login_form})
        else:
            return render(request, "login.html", {"msg": "用户不存在！", "login_form": login_form})
        #else:
            #return render(request, "login.html", {"msg":"输入不能为空！", "login_form": login_form})


class LogoutView(View):
    # @staticmethod
    def get(self, request):
        logout(request)
        return render(request, "index.html")


class TeacherLoginView(View):
    # @staticmethod
    def get(self, request):
        login_form = LoginForm()
        return render(request, "teacherlogin.html", {"login_form": login_form, "title": title})

    # @staticmethod
    def post(self, request):
        print(1)
        login_form = LoginForm(request.POST)

        #if login_form.is_valid():  # 验证表是否为空
        print(3)
        tea_id = request.POST.get("sid", "")
        if len(tea_id)==0:
            return render(request, "teacherlogin.html", {"msg": "输入不能为空！", "login_form": login_form})
        print(4)
        tea_passw = request.POST.get("password", "")  # 获取从前端输入的密码
        if len(tea_passw)==0:
            return render(request, "teacherlogin.html", {"msg": "输入不能为空！", "login_form": login_form})
        tea_list = Teacher.objects.filter(sid=tea_id)  # 得到数据库中该教工号对应的那条记录，列表形式
        if tea_list:
            tea=tea_list[0]
                # tea_password = md5(tea_passw)  # 对前端输入的密码进行加密
            print(tea_id)
            # user = authenticate(username=stu_id, password=stu_password)
            # print(user)
            # if user is not None:
            # if check_password(stu_passw, stu.password):
            # if tea_password == tea.password:
            if tea_passw == tea.password:
                # login(request, user)
                request.session['sid'] = tea.sid
                request.session['password'] = tea.password
                request.session['name'] = tea.name
                sdept = Sdept.objects.get(id = tea.sdept_id)
                request.session['sdept'] = sdept.name
                request.session['email'] = tea.email
                return render(request, "teacherinfo.html", {"tea": tea})
            else:
                # u"密码错误"
                return render(request, "teacherlogin.html", {"msg": "密码错误！", "login_form": login_form})
        else:
            return render(request, "teacherlogin.html", {"msg": "用户不存在！", "login_form": login_form})
        #else:
        #    return render(request, "teacherlogin.html", {"msg": "输入不能为空！", "login_form": login_form})
    
#教师查看成绩
def TeaShowGrade(request):
    print("----")
    print('姓名',request.session['sdept'])
    sdept = Sdept.objects.get(name = request.session['sdept'])
    grade = Grade.objects.filter(stu_id__sdept_id=sdept.id) #查询该学院中所有学生的成绩
    #for i in grade:
        #print("examname:",i.exam_name,"sid",i.stu_id,"grade",i.grade)
    return render(request, "teashowgrade.html", {"grade": grade})



        
def StuInfoPersonal(request):
    return render(request, 'stuinfo-personal.html')


def TeaInfoPersonal(request):
    return render(request, 'teainfo-personal.html')


def StuExamInfo(request):
    paper =Paper.objects.filter()
    return render(request, "stuexaminfo.html", {"paper": paper})


def StuGradeInfo(request):
    print('姓----名')
    #stu=request.session()
    print('姓名',request.session['name'])
    grade =Grade.objects.filter(stu_id = request.session['sid'])
    return render(request, "stugradeinfo.html",{"grade": grade})
    
#考试
class PaperView(View):
    #试卷
    def StartExam(request):
        sid = request.GET.get('sid')
        papername = request.GET.get('papername')
        print('|||学号', sid, '试卷名称', papername)
        stu = Student.objects.get(sid=sid)
        paper = Paper.objects.filter(name=papername)
        print('学号', sid, '试卷名称', papername,'姓名',stu.name)
        return render(request, "exam.html", {'stu':stu,"paper": paper,"papername": papername})
        # return render(request, 'index.html')
    #成绩计算
    def calGrade(request):
        if request.method=='POST':
            sid = request.POST.get('sid')
            papername = request.POST.get('papername')
            print('|学号|', sid, '试卷名称', papername)
            stu = Student.objects.get(sid=sid)
            print('学号',stu.sid,'姓名',stu.name)
            paper = Paper.objects.get(name = papername)
            #grade = Grade.objects.filter(stu=stu.sid)
            question = paper.pid.all()
            course = Course.objects.get(id=paper.course_id)
            print('科目',course.name)
            wrong_question = [] #记录错题
            exam_grade=0
            for i in question:
                qid = str(i.id)
                ans = request.POST.get(qid)
                #print(qid+':'+ans+'|')
                okans = i.answer
                #print(qid+'::'+okans+'|')
                if ans==okans:
                    exam_grade += i.score
                else:
                    wrong_question.append(i)
                    print('add')
            wrong_question_now = tuple(wrong_question)
            wrong_question_count = len(wrong_question_now)
            print(wrong_question_count)
            Grade.objects.create(stu_id=sid,exam_name=papername,grade=exam_grade,course_id=course.id)
            print(exam_grade)
            return render(request,"score.html",{"grade":exam_grade, "wrong_question":wrong_question_now, "wrong_num":wrong_question_count})
