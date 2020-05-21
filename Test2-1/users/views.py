# Create your views here.
from django.contrib.auth.decorators import login_required
from django.contrib.sessions.models import Session
from django.utils import timezone
from django.db.models import Q
from django.db import models
from django.contrib.auth.models import User
from django.contrib import auth
from django.views.generic.base import View
from django.db.models import Max
from .form import RegisterForm, LoginForm
from django.shortcuts import render, redirect
from django.contrib.auth.hashers import make_password, check_password
from .models import Student, Teacher,Course,Question,Paper,Grade,Sdept,Sclass
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render,redirect,HttpResponse
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

#注册账户
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
                sclass,f = Sclass.objects.get_or_create(cid = stu_sclass,defaults={'sdept_id':sdept.id})
                stu_email = request.POST.get("email")
                if len(stu_email)==0:
                    return render(request, "register.html", {'script': "alert", 'msg0': u"邮箱不能为空"})
                if re.match(r'[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$',stu_email):
                    stu_profile = Student()
                    stu_profile.sid = stu_id
                        # stu_profile.password = make_password(stu_password)  # 加密密码之后再存入表
                    stu_profile.password = md5(stu_password)
                    stu_profile.name = stu_name
                    stu_profile.sclass_id = sclass.id
                    stu_profile.sdept_id = sdept.id
                    stu_profile.email = stu_email
                    stu_profile.is_active = True  # 用户激活状态，目前不太清楚用处
                    stu_profile.save()
                    print("000000000000000000000")
                    return render(request, "register.html", {'script': "alert", 'msg0': u"注册成功"})
                else:
                    return render(request, "register.html", {'script': "alert", 'msg0': u"邮箱格式错误"})
        #else:
            #return render(request, 'register.html', {"msg":"输入不能为空！", 'register_form': register_form, "title": title})
            # 把register_form传给前端是因为 这里包含错误信息,需要在前端显示

#学生登录
class LoginView(View):
    # @staticmethod
    def get(self, request):
        login_form = LoginForm()
        return render(request, "login.html", {"login_form": login_form, "title": title})

    # @staticmethod
    def post(self, request):
        #print(1)
        login_form = LoginForm(request.POST)

        #if login_form.is_valid():  # 验证表是否为空
        #print(3)
        stu_id = request.POST.get("sid", "")
        if len(stu_id)==0:
            return render(request, "login.html", {"msg":"输入不能为空！", "login_form": login_form})
        #print(4)
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
                #print(5)
                request.session['sid'] = stu.sid
                request.session['password'] = stu.password
                request.session['name'] = stu.name
                sclass = Sclass.objects.get(id = stu.sclass_id)
                request.session['sclass'] = sclass.cid
                sdept = Sdept.objects.get(id = stu.sdept_id)
                request.session['sdept'] = sdept.name
                request.session['email'] = stu.email

                session_key = request.session.session_key
                if not session_key:
                    request.session.create()
                    session_key=request.session.session_key
                    return render(request, "studentinfo.html", {"stu": stu})
                
                else:
                    print("-------------------------------")
                    return render(request, "login.html", {"msg": "请勿重复登录！", "login_form": login_form})
                """ request.session.create()
                session_key=request.session.session_key
                print("1")
                print(session_key)
                session=Session.objects.filter(session_key=session_key)
                session_data=session[0].session_data
                print("2")
                print(session_data)

                if Session.objects.filter(~Q(session_data=session_key)):

                    for se in Session.objects.filter(~Q(session_key=session_key)):
                        se_data=se.session_data
                        print("3")
                        print(se_data)
                        if(session_data==se_data):
                            se.delete()
                            print("5")
                            return render(request, "login.html", {"msg": "请勿重复登录！", "login_form": login_form})
                        else:
                            return render(request, "studentinfo.html", {"stu": stu})
                else:
                    return render(request, "studentinfo.html", {"stu": stu}) """
            else:
                # u"用户名或密码错误"
                return render(request, "login.html", {"msg": "密码错误！", "login_form": login_form})
        else:
            return render(request, "login.html", {"msg": "用户不存在！", "login_form": login_form})
        #else:
            #return render(request, "login.html", {"msg":"输入不能为空！", "login_form": login_form})

#退出
class LogoutView(View):
    # @staticmethod
    def get(self, request):
        #logout(request)
        session_key = request.session.session_key
        print(session_key)
        session=Session.objects.filter(session_key=session_key)
        session.delete()
        print("5")
        return render(request, "index.html")

#教师登录
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

                session_key = request.session.session_key
                print("initial-tea-session-key")
                print(session_key)
                if not session_key:
                    request.session.create()
                    session_key=request.session.session_key
                    print("tea-session-key")
                    print(session_key)
                    return render(request, "teacherinfo.html", {"tea": tea})
                else:
                    return render(request, "teacherlogin.html", {"msg": "请勿重复登录！", "login_form": login_form})

            else:
                # u"密码错误"
                return render(request, "teacherlogin.html", {"msg": "密码错误！", "login_form": login_form})
        else:
            return render(request, "teacherlogin.html", {"msg": "用户不存在！", "login_form": login_form})
        #else:
        #    return render(request, "teacherlogin.html", {"msg": "输入不能为空！", "login_form": login_form})
    
#教师查看成绩
class TeaShowGradeView(View):
    def TeaShowGrade(request):
        print("----")
        print('姓名',request.session['sdept'])
        sdept = Sdept.objects.get(name = request.session['sdept'])
        grade = Grade.objects.filter(stu_id__sdept_id=sdept.id) #查询该学院中所有学生的成绩
        sclass = Sclass.objects.filter(sdept_id=sdept.id)
        paper = Paper.objects.filter()

        return render(request, "teashowgrade.html", {"grade":grade,"sclass":sclass,"paper":paper})

#教师查询
class TeaSearchGradeView(View):
    def TeaSearchGrade(request):
        #print(request)
        cid = request.GET.get('sclass')
        papername = request.GET.get('paper')
        method = request.GET.get('method')
        sdept = Sdept.objects.get(name = request.session['sdept'])
        sclass = Sclass.objects.filter(sdept_id=sdept.id)
        paper = Paper.objects.filter()
        if cid == 'all':
            cid = ""
        if method == 'all':
            flag = [0,1,2,3]
        elif method == 'high':
            flag = [2,3]
        else:
            flag = [1,3]
        grade = Grade.objects.filter(stu_id__sclass_id__cid__contains=cid,exam_name__contains=papername,stu_id__sdept_id=sdept.id,flag__in=flag)

        return render(request, "teashowgrade.html", {"grade":grade,"sclass":sclass,"paper":paper,"papername":papername})

#成绩统计
class StatisticView(View):
    def TeaStatistic(request):
        paper =Paper.objects.filter()
        return render(request, "teastatistic.html", {"paper": paper})

    def ShowSta(request):
        sdept = Sdept.objects.get(name = request.session['sdept'])
        papername = request.GET.get('papername')
        spaper = Paper.objects.get(name = papername)
        tgrade = spaper.total_score
        dataA = Grade.objects.filter(exam_name__contains=papername,stu_id__sdept_id=sdept.id,grade__gte=tgrade*0.85).count()
        dataB = Grade.objects.filter(exam_name__contains=papername,stu_id__sdept_id=sdept.id,grade__gte=tgrade*0.75,grade__lt=tgrade*0.85).count()
        dataC = Grade.objects.filter(exam_name__contains=papername,stu_id__sdept_id=sdept.id,grade__gte=tgrade*0.6,grade__lt=tgrade*0.75).count()
        dataD = Grade.objects.filter(exam_name__contains=papername,stu_id__sdept_id=sdept.id,grade__lt=tgrade*0.6).count()
        data = {'dataA':dataA,'dataB':dataB,'dataC':dataC,'dataD':dataD}
        print(data)
        return render(request, "test.html", {"data":data,"papername":papername})

#组卷
class AddPaperView(View):
    def AddPaper(request):
        course = Course.objects.filter()
        return render(request, 'addpaper.html', {"course":course})

    def ChooseQuestion(request):
        cid = request.GET.get("courseid")
        cname = request.GET.get("coursename")
        #print("llll",cid)
        question = Question.objects.filter(course_id=cid)
        return render(request, 'choose.html',{"question":question,"cname":cname})

    def GetChoose(request):
        if request.method=='POST':
            cname=request.POST.get("cname")
            pname=request.POST.get("name")
            ptime=request.POST.get("time")
            course=Course.objects.get(name=cname)
            paper=Paper.objects.create(name=pname,exam_time=ptime,course_id=course.id)
            print(paper.id)
            question = Question.objects.filter(course_id=course.id)
            totalnum=0
            totalscore=0
            snum=0
            sscore=0
            jnum=0
            jscore=0
            for i in question:
                
                if request.POST.get(str(i.id)) == "true":
                    paper.pid.add(i)
                    if i.questionType=="single_choice":
                        snum=snum+1
                        sscore=sscore+i.score
                    elif i.questionType=="true_or_false":
                        jnum=jnum+1
                        jscore=jscore+i.score
                    totalnum=totalnum+1
                    totalscore=totalscore+i.score
            paper.single_choice_num=snum
            paper.single_choice_score=sscore
            paper.judgment=jnum
            paper.judgment_score=jscore
            paper.total_num=totalnum
            paper.total_score=totalscore
            paper.save()
            return render(request, 'addsuccess.html') 

#学生个人信息
class StuInfoPersonalView(View):
    def StuInfoPersonal(request):
        if not request.session.session_key:
            return render(request, "index.html")
        else:
            print("0")
            print(request.session['sid'])
            stu_id = request.session['sid']
            print("1")
            print(stu_id)
            stu_list = Student.objects.filter(sid=stu_id)
            stu = stu_list[0]
            print("2")
            print(stu)
            if stu:
                print("3")
                sdept = Sdept.objects.get(id = stu.sdept_id)
                sdept_name = sdept.name
                ssclass=Sclass.objects.get(id = stu.sclass_id)
                sclass_cid = ssclass.cid
                return render(request, "stuinfo-personal.html",{"stu": stu, "sdept_name":sdept_name,"sclass_cid":sclass_cid,"title": title})
            return render(request, 'stuinfo-personal.html')

#个人信息修改
class EditStuInfo(View):
    def ShowEditInfo(request):
        return render(request, "editstuinfo.html")
    def Edit(request):
        if request.method=='POST':
            #stu_id = request.GET.get('sid') 
            stu_id = request.session['sid']
            stu_name = request.POST.get("name", "")
            print("stu_name",stu_name)
            stu_sclass = request.POST.get("sclass", "")  
            if stu_sclass: #修改了班级
                ssclass0 = Sclass.objects.filter(cid = stu_sclass)
                print(ssclass0)
                print("is not NULL")
                ssclass =ssclass0[0]
                print("运行到这5")
                print(ssclass)
                print("运行到这4")
                sclass_id=ssclass.id #班级对应的编号
                sclass_cid=ssclass.cid #班级对应的班号
            else: #没有修改班级
                print("is NULL")    
            stu_sdept = request.POST.get("sdept", "")
            sdept = Sdept.objects.get(name = stu_sdept)
            #print("stu_sdept",stu_sdept) 
            sdept_name=sdept.name
            sdept_id=sdept.id
            #print("sdept_name  sdept_id",sdept_name,sdept_id)
            stu_email = request.POST.get("email")
            #print("stu_email",stu_email) 
            stu_list = Student.objects.filter(sid=stu_id)
            stu = stu_list[0]
            temp = stu_list[0]
            if stu:
                stu.id=stu_id
                if stu_name:
                    stu.name = stu_name
                else:
                    stu.name =temp.name
                print("123stu.name",stu.name)
                if stu_sclass:
                    stu.sclass_id = sclass_id
                else:
                    stu.sclass_id =temp.sclass_id
                    ssclass = Sclass.objects.get(id = stu.sclass_id)
                    sclass_cid=ssclass.cid
                if sdept_id:
                    stu.sdept_id=sdept_id
                else:
                    stu.sdept_id=temp.sdept_id
                if stu_email:
                    stu.email = stu_email
                else:
                    stu.email = temp.email
                stu.save()
                #print("123:stu_email",stu_email)
                return render(request, "stuinfo-personal.html",{"stu": stu, "sdept_name":sdept_name,"stu.name":stu.name,"sclass_cid":sclass_cid,"title": title})
            else:
                return render(request, "register.html", {'script': "alert", 'msg0': u"未找到"})
    """ def get(self, request):
        # 把form传给前端,里边是验证码需要在前端显示
        register_form = RegisterForm()   # 获得注册表单，空表单等待输入
        return render(request, 'register.html', {'register_form': register_form, "title": title})  # 转到注册界面

    # @staticmethod
    def post(self, request):  # 把前端注册表单的内容传到后端
    # @staticmethod
    if request.method == 'POST' and request.POST:
    # @staticmethod
        stu_id = request.Get.get('sid') 
        # 获取前端填的表单,写进user库里    
        stu_name = request.POST.get("name", "")
        stu_sclass = request.POST.get("sclass", "")       
        stu_sdept = request.POST.get("sdept", "")
        sdept = Sdept.objects.get(name = stu_sdept)
        stu_email = request.POST.get("email")
        stu_profile = Student.objects.filter(sid=stu_id).first()
        if stu_profile:
            stu_profile.name = stu_name
            stu_profile.sclass = stu_sclass
            stu_profile.sdept_id = sdept.id
            stu_profile.email = stu_email
            stu_profile.is_active = True  # 用户激活状态，目前不太清楚用处
            stu_profile.save()
            return render(request, "stuinfo-personal.html",{"stu_profile": stu_profile, "title": title})
        else:
            return render(request, "register.html", {'script': "alert", 'msg0': u"未找到"})

 """

#教师个人信息
class TeaInfoPersonalView(View):
    def TeaInfoPersonal(request):
        if not request.session.session_key:
            return render(request, "index.html")
        else:
            return render(request, 'teainfo-personal.html')

#考试信息
class StuExamInfoView(View):
    def StuExamInfo(request):
        if not request.session.session_key:
            return render(request, "index.html")
        else:
            paper =Paper.objects.filter()
            return render(request, "stuexaminfo.html", {"paper": paper})

#学生成绩
class StuGradeInfoView(View):
    def StuGradeInfo(request):
        print('姓----名')
        #stu=request.session()
        print('姓名',request.session['name'])
        paper = Paper.objects.filter()
        grade =Grade.objects.filter(stu_id = request.session['sid'])
        return render(request, "stugradeinfo.html",{"paper":paper,"grade": grade})

#学生成绩查询
class StuSearchGradeView(View):
    def StuSearchGrade(request):
        papername = request.GET.get('paper')
        method = request.GET.get('method')
        sid = request.session['sid']
        sdept = Sdept.objects.get(name = request.session['sdept'])
        paper = Paper.objects.filter()
        if method == 'all':
            flag = [0,1,2,3]
        elif method == 'high':
            flag = [2,3]
        else:
            flag = [1,3]
        grade = Grade.objects.filter(stu_id=sid,exam_name__contains=papername,flag__in=flag)

        return render(request, "stugradeinfo.html", {"grade":grade,"paper":paper,"papername":papername})

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
            flag = 0
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
            judge0 = Grade.objects.filter(stu_id=sid,exam_name=papername)
            if judge0.exists():
                print("已存在")
                judge2 = Grade.objects.filter(stu_id=sid,exam_name=papername,flag=2)
                if judge2.exists():
                    print("第一次非最高")
                    hgrade = judge2[0].grade
                    if hgrade<exam_grade:
                        print("最高成绩变化")
                        judge2 = Grade.objects.get(stu_id=sid,exam_name=papername,flag=2)
                        judge2.flag = 0
                        judge2.save()
                        flag = 2
                else:
                    print("第一次最高")
                    judge3 = Grade.objects.filter(stu_id=sid,exam_name=papername,flag=3)
                    if judge3.exists():
                        print("第一次最高")
                        hgrade = judge3[0].grade
                        if hgrade<exam_grade:
                            print("最高成绩变化非第一次")
                            judge3 = Grade.objects.get(stu_id=sid,exam_name=papername,flag=3)
                            judge3.flag = 1
                            judge3.save()
                            flag = 2    
            else:
                flag = 3
                print("第一次")
            Grade.objects.create(stu_id=sid,exam_name=papername,grade=exam_grade,course_id=course.id,flag=flag)
            print(exam_grade)
            return render(request,"score.html",{"grade":exam_grade, "wrong_question":wrong_question_now, "wrong_num":wrong_question_count})

#收藏夹
class CollectView(View):
    def AddCollect(request):
        #print(request)
        sid = request.GET.get('sid')
        print(sid)
        qid = request.GET.get('qid')
        print(qid)
        stu = Student.objects.get(sid=sid)
        question = Question.objects.get(id=qid)
        question.collect.add(stu)
        string = '已收藏'
        print(string)
        return HttpResponse(string)

    def ShowCollect(request):
        course = Course.objects.filter()
        return render(request, 'collect.html', {"course":course})

    def CollectList(request):
        cid = request.GET.get("courseid")
        cname = request.GET.get("coursename")
        sid = request.GET.get("sid")
        print(sid)
        #stu = Student.objects.get(sid=sid)
        #question = stu.
        question = Question.objects.filter(collect__sid=sid,course_id=cid)
        print(question)
        return render(request, 'collectlist.html', {"course":cname,"question":question})

    def DeleteCollect(request):
        sid = request.GET.get('sid')
        qid = request.GET.get('qid')
        stu = Student.objects.get(sid=sid)
        question = Question.objects.get(id=qid)
        question.collect.remove(stu)
        string = '已取消'
        print(string)
        return HttpResponse(string)
