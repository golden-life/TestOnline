from django import forms
from captcha.fields import CaptchaField

# Django在内部集成了一个表单功能，以面向对象的方式，直接使用Python代码生成HTML表单代码，用于数据的传输。


class LoginForm(forms.Form):  # 登录表单
    # 与前台表格的name相同
    sid = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)
    # captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class RegisterForm(forms.Form):  # 注册表单

    DEPT = (
        ('计算机科学与技术学院', '计算机科学与技术学院'),
        ('电气与自动化学院', '电气与自动化学院'),
        ('外国语学院', '外国语学院'),
        ('理学院', '理学院'),
    )

    sid = forms.CharField(max_length=20, required=True)
    password = forms.CharField(required=True, max_length=40)
    name = forms.CharField(required=True, max_length=20)
    sclass = forms.CharField(required=True, max_length=20)
    sdept = forms.ChoiceField(label='学院', choices=DEPT, required=True)
    email = forms.EmailField(required=True)
    # captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})
