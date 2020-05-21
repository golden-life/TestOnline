# TestOnline
TestOnline在线做题系统
在如今互联网飞速发展的今天，人们的沟通交流、日常出行都已经与互联网信息服务密切相关，我们生活、学习的效率都得到了极大的提高。
对于我们大学生来说，日常的上课签到、选课、gpa的计算在线上进行已经是习以为常了。
所以我们得到一个启发，能否将传统的纸质做题考试进行改进呢，这次我们小组便基于如今社会信息化水平的提高，开发一个在线做题考试系统。
----------------------------------------------------------------------------------------------------------------
开发环境：
IDE使用PyCharm和VSCode
Python：3.6
Django：3.0.4
数据库:关系数据库Mysql 5.7

后台管理：
使用了Django架构，有丰富的接口功能，提高了系统实现和运行效率

使用方法：
压缩包解压后的文件夹,使用MySQL还原数据库，Apache服务器部署监听8090端口
管理员用户名wwq 密码wwq123456

后端管理：
使用了Django架构，有丰富的接口功能，提高了系统实现和运行效率

入口地址：
127.0.0.1:8090/index

功能介绍：
本在线做题考试系统分为学生、教师和管理员三大部分
1. 学生部分
    * 学生登录
    * 学生注册
    * 个人信息查看功能
    * 答题功能
    * 答案显示功能
    * 成绩查看功能
    * 收藏夹功能
    
2. 教师部分
    * 教师登录
    * 个人信息查看功能
    * 成绩统计功能
    * 成绩查看功能
    * 组卷功能
    
3. 管理员部分
    * 对整个系统的运行进行管理与保障
    * 浏览学生、教师等用户的部分信息，对系统用户进行管理
    * 浏览院系、科目、试卷、题目等数据信息，并可对其进行增删改查等操作

分工情况
* Wangwenqi（组长）：登陆注册前后端、学生模块前端、数据爬取
* Zhaoweijie：管理员模块前端、管理员模块后端
* Zhouxinyi：学生模块后端、教师模块前后端

安全性：个人密码明文信息仅自己可见，自己的成绩非本院系教师无法查看。
可靠性：保证系统随时可使用且能稳定运行。
易使用性：系统使用的学习成本低、功能直观易懂,管理系统操作简单，交互逻辑符合用户基本操作习惯。
可扩充性：留出可扩充的接口使得未来能够增加新的功能需求。
容错性：可以查看修改历史。


致谢：
致谢以下提到或本项目中用到但未提及的工具及开源框架
* Django
* Pycharm
* VScode
* javascript
* css
* Bootstrap
* MySQL
