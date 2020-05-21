# Register your models here.
from django.contrib import admin
from .models import Student,Teacher,Course,Question,Paper,Grade
# Register your models here.
# 修改名称
admin.site.site_header='在线考试系统后台'
admin.site.site_title='在线考试系统'


class MyModelAdmin(admin.ModelAdmin):
    def get_queryset(self, request):
        qs = super(MyModelAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(author=request.user)

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_per_page = 10  # 默认为100条
    # 显示顶部的选项
    actions_on_top = True
    # 显示底部的选项
    actions_on_bottom = True
    list_display = ('sid','password','name','sclass','sdept','email')# 要显示哪些信息
    list_display_links = ('sid','password','name','sclass','sdept','email')#点击哪些信息可以进入编辑页面
    search_fields = ['name','sdept']   #指定要搜索的字段，将会出现一个搜索框让管理员搜索关键词
    list_filter =['name','sdept','sclass']#指定列表过滤器，右边将会出现一个快捷的过滤选项
   #自己写的
    def get_search_results(self, request, queryset, search_term):
        queryset, use_distinct = super(StudentAdmin, self).get_search_results(request, queryset, search_term)
        try:
            search_term_as_int = int(search_term)
            queryset |= self.model.objects.filter(email=search_term_as_int)
            queryset |= self.model.objects.filter(sclass=search_term_as_int)
        except:
            pass
        return queryset, use_distinct

    def save_model(self, request, obj, form, change):
        obj.user = request.user
        obj.save()

    def save_model(self, request, obj, form, change):
            if change:  # 更改的时候
                obj_original = self.model.objects.get(pk=obj.pk)
            else:  # 新增的时候
                obj_original = None

            obj.user = request.user
            obj.save()

    def delete_model(self, request, obj):
            """
            Given a model instance delete it from the database.
            """
            # handle something here
            obj.delete()
@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_per_page = 10  # 默认为100条
    # 显示顶部的选项
    actions_on_top = True
    # 显示底部的选项
    actions_on_bottom = True
    list_display = ('sid', 'name', 'sdept', 'email', 'password')
    list_display_links = ('sid', 'name', 'sdept', 'email', 'password')
    search_fields = ['name', 'sdept']
    list_filter = ['name','sdept']

 #自己写的
    def get_search_results(self, request, queryset, search_term):
        queryset, use_distinct = super(TeacherAdmin, self).get_search_results(request, queryset, search_term)
        try:
            search_term_as_int = int(search_term)
            queryset |= self.model.objects.filter(email=search_term_as_int)
            queryset |= self.model.objects.filter(sid=search_term_as_int)
        except:
            pass
        return queryset, use_distinct

        def save_model(self, request, obj, form, change):
            obj.user = request.user
            obj.save()

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_per_page = 10  # 默认为100条
    # 显示顶部的选项
    actions_on_top = True
    # 显示底部的选项
    actions_on_bottom = True
    list_display = ('name','decs')
    list_display_links =('name','decs')
    search_fields = ['name', 'decs']
    list_filter = ['name', 'decs']
#自己写的
    def get_search_results(self, request, queryset, search_term):
        queryset, use_distinct = super(CourseAdmin, self).get_search_results(request, queryset, search_term)
        try:
            search_term_as_int = int(search_term)
            queryset |= self.model.objects.filter(name=search_term_as_int)
            queryset |= self.model.objects.filter(decs=search_term_as_int)
        except:
            pass
        return queryset, use_distinct

    def save_model(self, request, obj, form, change):
        obj.user = request.user
        obj.save()

@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_per_page = 10  # 默认为100条
    # 显示顶部的选项
    actions_on_top = True
    # 显示底部的选项
    actions_on_bottom = True
    list_display = ('id','questionType','course','content','answer','choice_a','choice_b','choice_c','choice_d','choice_e','choice_f','boolt','boolf','choice_num','level','score')
    list_display_links=('id','questionType','course','content','answer','choice_a','choice_b','choice_c','choice_d','choice_e','choice_f','boolt','boolf','choice_num','level','score')
    #search_fields = ['course', 'answer','level','score']
    search_fields = ['id']
    list_filter = ['course', 'answer','level','score']


# @admin.register(Paper)
# class PaperAdmin(admin.ModelAdmin):
    # list_display = ('course','pid','name','start_time','single_choice_num','single_choice_score','judgment','judgment_score','multiple_choice_num','multiple_choice_score','total_score','exam_time')
    #
# list_display_links = ('course','pid','name','start_time','single_choice_num','single_choice_score','judgment','judgment_score','multiple_choice_num','multiple_choice_score','total_score','exam_time')
    # fk_fields = ['sid']
@admin.register(Paper)
class PaperAdmin(admin.ModelAdmin):
    list_per_page = 10  # 默认为100条
    # 显示顶部的选项
    actions_on_top = True
    # 显示底部的选项
    actions_on_bottom = True
    list_display = ('course','name','start_time','single_choice_num','single_choice_score','judgment','judgment_score','multiple_choice_num','multiple_choice_score','total_num','total_score','exam_time')
    list_display_links = ('course','name','start_time','single_choice_num','single_choice_score','judgment','judgment_score','multiple_choice_num','multiple_choice_score','total_num','total_score','exam_time')
    #search_fields = ['course', 'name']
    search_fields = ['name']
    list_filter = ['course', 'name']



@admin.register(Grade)

class GradeAdmin(admin.ModelAdmin):
    list_per_page = 10  # 默认为100条
    # 显示顶部的选项
    actions_on_top = True
    # 显示底部的选项
    actions_on_bottom = True
    list_display = ('stu','exam_name','grade',)
    list_display_links = ('stu','exam_name','grade',)
    search_fields = ['grade']
    #search_fields = ['stu', 'exam_name','grade']
    list_filter = ['stu', 'exam_name','grade']
