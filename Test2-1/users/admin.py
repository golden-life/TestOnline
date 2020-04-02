# Register your models here.
from django.contrib import admin
from .models import Student,Teacher,Course,Question,Paper
# Register your models here.
# 修改名称
admin.site.site_header='在线考试系统后台'
admin.site.site_title='在线考试系统'

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ('sid','password','name','sclass','sdept','email')# 要显示哪些信息
    list_display_links = ('sid','name')#点击哪些信息可以进入编辑页面
    search_fields = ['name','sdept']   #指定要搜索的字段，将会出现一个搜索框让管理员搜索关键词
    list_filter =['name','sdept','sclass']#指定列表过滤器，右边将会出现一个快捷的过滤选项

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_display = ('sid', 'name', 'sdept', 'email', 'password')
    list_display_links = ('sid', 'name')
    search_fields = ['name', 'sdept']
    list_filter = ['name','sdept']

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ('name','decs')


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id','questionType','course','content','answer','choice_a','choice_b','choice_c','choice_d','choice_e','choice_f','boolt','boolf','choice_num','level','score')

# @admin.register(Paper)
# class PaperAdmin(admin.ModelAdmin):
    # list_display = ('course','pid','name','start_time','single_choice_num','single_choice_score','judgment','judgment_score','multiple_choice_num','multiple_choice_score','total_score','exam_time')
    #
# list_display_links = ('course','pid','name','start_time','single_choice_num','single_choice_score','judgment','judgment_score','multiple_choice_num','multiple_choice_score','total_score','exam_time')
    # fk_fields = ['sid']