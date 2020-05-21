/*
Navicat MySQL Data Transfer

Source Server         : zxy
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-04-16 19:40:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 学生', '6', 'add_student');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 学生', '6', 'change_student');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 学生', '6', 'delete_student');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 学生', '6', 'view_student');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 科目', '7', 'add_course');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 科目', '7', 'change_course');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 科目', '7', 'delete_course');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 科目', '7', 'view_course');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 学院', '8', 'add_sdept');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 学院', '8', 'change_sdept');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 学院', '8', 'delete_sdept');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 学院', '8', 'view_sdept');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 教师', '9', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 教师', '9', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 教师', '9', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 教师', '9', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 题目', '10', 'add_question');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 题目', '10', 'change_question');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 题目', '10', 'delete_question');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 题目', '10', 'view_question');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 试卷', '11', 'add_paper');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 试卷', '11', 'change_paper');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 试卷', '11', 'delete_paper');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 试卷', '11', 'view_paper');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 成绩', '12', 'add_grade');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 成绩', '12', 'change_grade');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 成绩', '12', 'delete_grade');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 成绩', '12', 'view_grade');
INSERT INTO `auth_permission` VALUES ('49', 'Can add captcha store', '13', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('50', 'Can change captcha store', '13', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete captcha store', '13', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('52', 'Can view captcha store', '13', 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `decs` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '其他', '测试');
INSERT INTO `course` VALUES ('2', '软件安全', '信安');
INSERT INTO `course` VALUES ('3', '软件工程', '信安、计科');
INSERT INTO `course` VALUES ('4', '网络安全', '信安');
INSERT INTO `course` VALUES ('5', '算法', '测试');
INSERT INTO `course` VALUES ('6', '计算机组成原理', '测试');
INSERT INTO `course` VALUES ('7', '计算机网络', '测试');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_student_sid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_student_sid` FOREIGN KEY (`user_id`) REFERENCES `student` (`sid`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('13', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'users', 'grade');
INSERT INTO `django_content_type` VALUES ('11', 'users', 'paper');
INSERT INTO `django_content_type` VALUES ('10', 'users', 'question');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'sdept');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'student');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'teacher');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-04-08 18:49:35.719266');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-04-08 18:49:35.816007');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-04-08 18:49:35.913745');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-04-08 18:49:36.230895');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-04-08 18:49:36.238901');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-04-08 18:49:36.247884');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-04-08 18:49:36.257824');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-04-08 18:49:36.272811');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-04-08 18:49:36.285752');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-04-08 18:49:36.295722');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-04-08 18:49:36.305697');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-04-08 18:49:36.335616');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-04-08 18:49:36.350609');
INSERT INTO `django_migrations` VALUES ('14', 'users', '0001_initial', '2020-04-08 18:49:36.731557');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2020-04-08 18:49:37.415725');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2020-04-08 18:49:37.553357');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2020-04-08 18:49:37.566368');
INSERT INTO `django_migrations` VALUES ('18', 'captcha', '0001_initial', '2020-04-08 18:49:37.603224');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2020-04-08 18:49:37.631149');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ohb2oyzmv4wdjktkgnp7dra5iaej022r', 'OGU4MmFjOTQ4YjgyZjMzZDVmNWU4NGRmZTQ4MDE1NjM0ZTM5NGYyNDp7InNpZCI6IjEwMDEiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIm5hbWUiOiJcdTY3NGVcdTU2ZGIiLCJzY2xhc3MiOiIxNzA1MTAxIiwic2RlcHRfaWQiOjEsImVtYWlsIjoiMTAwMUBxcS5jb20iLCJzZGVwdCI6Ilx1OGJhMVx1N2I5N1x1NjczYVx1NzlkMVx1NWI2Nlx1NGUwZVx1NjI4MFx1NjcyZlx1NWI2Nlx1OTY2MiJ9', '2020-04-22 23:22:20.510552');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) NOT NULL,
  `grade` int NOT NULL,
  `exam_time` datetime(6) NOT NULL,
  `course_id` int DEFAULT NULL,
  `stu_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_course_id_57ca325c_fk_course_id` (`course_id`),
  KEY `grade_stu_id_a0080686_fk_student_sid` (`stu_id`),
  CONSTRAINT `grade_course_id_57ca325c_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `grade_stu_id_a0080686_fk_student_sid` FOREIGN KEY (`stu_id`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '算法1', '2', '2020-04-08 21:02:37.965819', '5', '95001');
INSERT INTO `grade` VALUES ('2', '算法1', '10', '2020-04-08 21:03:03.507698', '5', '95001');
INSERT INTO `grade` VALUES ('3', '算法2', '5', '2020-04-08 21:03:19.244575', '5', '95001');
INSERT INTO `grade` VALUES ('4', '算法1', '9', '2020-04-08 21:07:58.002103', '5', '95002');
INSERT INTO `grade` VALUES ('5', '算法1', '7', '2020-04-08 21:08:13.455390', '5', '95002');
INSERT INTO `grade` VALUES ('6', '算法2', '0', '2020-04-08 21:08:26.289774', '5', '95002');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start_time` date NOT NULL,
  `single_choice_num` int NOT NULL,
  `single_choice_score` int NOT NULL,
  `judgment` int NOT NULL,
  `judgment_score` int NOT NULL,
  `multiple_choice_num` int NOT NULL,
  `multiple_choice_score` int NOT NULL,
  `total_num` int NOT NULL,
  `total_score` int NOT NULL,
  `exam_time` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paper_course_id_de01caa5_fk_course_id` (`course_id`),
  CONSTRAINT `paper_course_id_de01caa5_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', '算法1', '2020-04-08', '4', '10', '0', '0', '0', '0', '4', '10', '60', '5');
INSERT INTO `paper` VALUES ('2', '算法2', '2020-04-08', '4', '10', '0', '0', '0', '0', '4', '10', '60', '5');

-- ----------------------------
-- Table structure for paper_pid
-- ----------------------------
DROP TABLE IF EXISTS `paper_pid`;
CREATE TABLE `paper_pid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paper_pid_paper_id_question_id_566d3fd0_uniq` (`paper_id`,`question_id`),
  KEY `paper_pid_question_id_066d7dbd_fk_question_id` (`question_id`),
  CONSTRAINT `paper_pid_paper_id_56658225_fk_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`),
  CONSTRAINT `paper_pid_question_id_066d7dbd_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paper_pid
-- ----------------------------
INSERT INTO `paper_pid` VALUES ('1', '1', '1');
INSERT INTO `paper_pid` VALUES ('2', '1', '2');
INSERT INTO `paper_pid` VALUES ('3', '1', '16');
INSERT INTO `paper_pid` VALUES ('4', '1', '33');
INSERT INTO `paper_pid` VALUES ('5', '2', '3');
INSERT INTO `paper_pid` VALUES ('6', '2', '4');
INSERT INTO `paper_pid` VALUES ('7', '2', '17');
INSERT INTO `paper_pid` VALUES ('8', '2', '34');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int NOT NULL,
  `questionType` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `choice_a` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choice_b` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choice_c` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choice_d` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choice_e` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choice_f` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `choice_num` int NOT NULL,
  `level` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score` int NOT NULL,
  `course_id` int NOT NULL,
  `boolt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `boolf` longtext CHARACTER SET utf32 COLLATE utf32_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', 'single_choice', '设 一组初始记录关键字序列为(50，40，95，20，15，70，60，45)，则以增量d=4的一趟希尔排序结束后前4条记录关键字为（ ）。', 'B', '40，50，20，95', '15，40，60，20', '15，20，40，45', '45，40，15，20', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('2', 'single_choice', '算法必须具备输入、输出和（    ）', 'C', '计算方法', '排序方法', '解决问题的有限运算步骤', '程序设计方法', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('3', 'single_choice', '设一组初始记录关键字序列为(13，18，24，35，47，50，62，83，90，115，134),则利用二分法查找关键字90需要比较的关键字个数为（ ）。', 'B', '1', '2', '3', '4', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('4', 'single_choice', '设一个顺序有序表A[1:14]中有14个元素，则采用二分法查找元素A[4]的过程中比较元素的顺序为(  )。', 'C', 'A[1]，A[2]，A[3]，A[4]', 'A[1]，A[14]，A[7]，A[4]', 'A[7]，A[3]，A[5]，A[4]', 'A[7]，A[5] ，A[3]，A[4]', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('5', 'single_choice', '执行一趟快速排序能够得到的序列是（ ）。', 'A', '[41，12，34，45，27] 55 [72，63]', '[45，34，12，41] 55 [72，63，27]', '[63，12，34，45，27] 55 [41，72]', '[12，27，45，41] 55 [34，63，72]', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('6', 'single_choice', '线性表如果要频繁的执行插入和删除操作，该线性表采取的存储结构应该是？', 'C', '散列', '顺序', '链式', '索引', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('7', 'single_choice', '下面哪个排序算法是不稳定的？', 'C', '冒泡排序', '基数排序', '快速排序', '直接插入排序', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('8', 'single_choice', '设一组初始记录关键字序列为（49,38,65,97,76,13,27,49），则以第一个关键字49为基准而得到的一趟快速排序结果是？', 'C', '38，13，27，49，49，65，97，76', '13，27，38，49，65，76，97，49', '27，38，13，49，76，97，65，49', '27，38，13，49，97，76，65，49', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('9', 'single_choice', '下列说法中错误的是：（）', 'C', '插入排序某些情况下复杂度为O（n）', '排序二叉树元素查找的复杂度可能为O（n）', '对于有序列表的排序最快的是快速排序', '在有序列表中通过二分查找的复杂度一定是O（log2n）', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('10', 'single_choice', '下列排序方法中，属于稳定排序的是？', 'D', '选择排序', '希尔排序', '堆排序', '归并排序', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('11', 'single_choice', '设一组初始记录关键字序列为(25，50，15，35，80，85，20，40，36，70)，其中含有5个长度为2的有序子表，则用归并排序的方法对该记录关键字序列进行一趟归并后的结果为（   ）。', 'A', '15，25，35，50，20，40，80，85，36，70', '15，25，35，50，80，20，85，40，70，36', '15，25，35，50，80，85，20，36，40，70', '15，25，35，50，80，20，36，40，70，85', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('12', 'single_choice', '快速排序算法在序列已经有序的情况下的复杂度为？', 'B', 'O(nlogn）', 'O(n^2)', 'O(n)', 'O(n^2  logn)', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('13', 'single_choice', '某种排序方法对关键字序列（33,12,44,10,6,8,17）进行排序时，前三趟排序的结果如下：', 'D', '希尔排序', '归并排序', '快速排序', '选择排序', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('14', 'single_choice', '对关键码序列28,16,32,12,60,2,5,72快速排序,从小到大一次划分结果为()', 'D', '(2,5,12,16)28(60,32,72)', '(2,16,5,12)28(60,32,72)', '(2,16,12,5)28(60,32,72)', '(5,16,2,12)28(60,32,72)', null, null, '4', '1', '1', '5', null, null);
INSERT INTO `question` VALUES ('15', 'single_choice', '对一组数据（2，12，16，88，5，10）进行排序，若前三趟排序结果如下：第一趟排序结果：2，12，16，5，10，88第二趟排序结果：2，12，5，10，16，88第三趟排序结果', 'A', '冒泡排序', '希尔排序', '归并排序', '基数排序', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('16', 'single_choice', '下列排序方法中，最坏情况下比较次数最少的是（  ）。', 'D', '冒泡排序', '简单选择排序', '直接插入排序', '堆排序', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('17', 'single_choice', '在长度为n的顺序表中查找一个元素，假设需要查找的元素一定在表中，并且元素出现在表中每个位置上的可能性是相同的，则在平均情况下需要比较的次数为（  ）。', 'A', '(n+1)/2', 'n', '3n/4', 'n/4', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('18', 'single_choice', '线性表如果要频繁的执行插入和删除操作，该线性表采取的存储结构应该是？', 'C', '散列', '顺序', '链式', '索引', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('19', 'true_or_false', '希尔排序算法的时间复杂度为 O(n2) 。 (  )', 'B', '正确', '错误', null, null, null, null, '2', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('20', 'true_or_false', '内部排序方法的稳定性是指该排序算法不允许有相同的关键字记录。', 'B', '正确', '错误', null, null, null, null, '2', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('21', 'single_choice', '顺序表含有127个元素,向其插入一个新元素并保持原来顺序不变,平均要移动', 'A', '63.5', '8', '32', '7', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('22', 'single_choice', '设顺序表的长度为 n 。下列排序方法中，最坏情况下比较次数小于 n(n-1)/2 的是（ ）。', 'A', '堆排序', '快速排序', '简单插入排序', '冒泡排序', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('23', 'single_choice', '设一组初始记录关键字序列为(345，253，674，924，627)，则用基数排序需要进行（ ）趟的分配和回收才能使得初始关键字序列变成有序序列。', 'A', '3', '4', '5', '8', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('24', 'single_choice', '直接插入排序算法适用于下列哪种情形下（ ）', 'C', '待排序数据规模较大时', '任意情况', '待排序数据大部分已排序时', '其他几项都不对', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('25', 'single_choice', '顺序查找的平均时间是多少？', 'A', 'n/2', 'n', 'n * n', 'log n', null, null, '4', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('26', 'true_or_false', '直接选择排序算法在最好情况下的时间复杂度为O(n)，这样的说法正确吗?', 'B', '正确', '不正确', null, null, null, null, '2', '2', '3', '5', null, null);
INSERT INTO `question` VALUES ('27', 'true_or_false', '判断下列说法是否正确：希尔排序是一种不稳定的排序方法。( )', 'A', '正确', '错误', null, null, null, null, '2', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('28', 'single_choice', '合并排序相对于快速排序的优点不包括（）', 'C', '是稳定的', '最坏的情况更高效', '空间复杂度低', '不会退化', null, null, '4', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('29', 'single_choice', '有序数组1 2 3 4 5 6 7 8 9查找3的二分查找序列是:', 'B', '1->2->3', '5->2->3', '9->5->3', '5->1->4->3', null, null, '4', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('30', 'single_choice', '用概率查找改进查找效率，是经过多次查找以后使得（ ）', 'D', '查找次数越少的元素查找速度越快', '查找次数越少的元素越往前存放', '查找次数越多的元素越往后存放', '查找次数越多的元素查找速度越快', null, null, '4', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('31', 'single_choice', '采用递归方式对顺序表进行快速排序，下列关于递归次数的叙述中，正确的是（）', 'D', '递归次数与初始数据的排列次序无关', '每次划分后，先处理较长的分区可以减少递归次数', '每次划分后，先处理较短的分区可以减少递归次数', '递归次数与每次划分后得到的分区处理顺序无关', null, null, '4', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('32', 'single_choice', 'DPOS是下列哪种算法？（）', 'C', '工作证明算法', '股权证明算法', '委任权益证明算法', '实用拜占庭容错算法', null, null, '4', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('33', 'true_or_false', '冒泡排序算法关键字比较的次数与记录的初始排列次序无关，这样的说法正确吗？', 'B', '正确', '不正确', null, null, null, null, '2', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('34', 'true_or_false', '抽象数据类型与计算机内部表示和实现无关()', 'A', '对', '错', null, null, null, null, '2', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('35', 'true_or_false', '基数分类只适用于以数字为关键字的情况,不适用于以字符串为关键字的情况()', 'B', '对', '错', null, null, null, null, '2', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('36', 'single_choice', '某种排序方法对关键字序列（33,12,44,10,6,8,17）进行排序时，前三趟排序的结果如下：', 'D', '希尔排序', '归并排序', '快速排序', '选择排序', null, null, '4', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('37', 'true_or_false', '采用败者树进行K路平衡归并时,总的(包括访外)归并效率与K()', 'A', '有关', '无关', null, null, null, null, '2', '3', '5', '5', null, null);
INSERT INTO `question` VALUES ('38', 'single_choice', '微处理机芯片的位数即指', 'B', '速度', '字长', '主频', '周期', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('39', 'single_choice', '字节多路通道的“数据宽度”是（  ）。', 'A', '单字节', '双字节', '定长数据块', '不定长数据块', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('40', 'single_choice', '在位运算中，操作数每右移一位，其结果相当于（）', 'B', '操作数乘以2', '操作数除以2', '操作数乘以4', '操作数除以4', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('41', 'single_choice', '系统抖动是指（）', 'B', '使用计算机的时候，屏幕闪烁的现象。', '刚被调出的页面又立刻被访问而调入所形成的频繁调入调出的现象。', '系统盘有故障，导致系统不稳定，时常死机重启的现象。', '因内存分配问题造成内存不够用的现象。', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('42', 'single_choice', '下列叙述正确的是（ ）。', 'A', '不同指令的指令周期包含的机器周期数可能不同', '可用字段译码法表示的微命令必须是相容的', '指令周期等价于微指令周期', '节拍脉冲等价于CPU周期', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('43', 'true_or_false', '利用递归子程序法只能分析LL(1)文法定义的语言。请问这句话的说法是正确的吗？', 'B', '是', '否', null, null, null, null, '2', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('44', 'true_or_false', '常对象只能调用它的常成员函数, 而不能调用普通的成员函数。', 'A', '正确', '错误', null, null, null, null, '2', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('45', 'single_choice', 'PSW寄存器中共有（  ）位条件状态位，有（  ）位控制状态位。', 'A', '6、3', '3、6', '8、4', '4、8', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('46', 'single_choice', '以下说法不正确的是（ ）。', 'D', '线性流水线是单功能流水线', '动态流水线是多功能流水线', '静态流水线是多功能流水线', '动态流水线只能是单功能流水线', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('47', 'single_choice', '以下选项中循环结构合法的是:', 'C', 'while(int i<7){i++;System.out.println(\"i is \"+i);}', 'int j=3;while(j){ System.out.println(\"j is \"+j);}', 'int j=0;for(int k=0;j+k!=10;j++,k++){System.out.println(\"j is \"+j+\"k is\" +k);}', 'int j=0; do{System.out.println(\"j is \"+j++);if(j==3){continue loop;}}while(j<10);', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('48', 'single_choice', '为获得下一条指令的地址， CPU 在取指后通常修改（  ）', 'A', '指令计数器的内容', '指令寄存器的内容', '指令译码器的内容', '操作控制逻辑的内容', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('49', 'single_choice', 'CPU发出的访问存储器的地址是（ ）。', 'A', '物理地址', '偏移地址', '逻辑地址', '段地址', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('50', 'single_choice', 'RFID 卡的读取方式（　）', 'C', 'CCD或光束扫描', '电磁转换', '无线通信', '电擦除、写入', null, null, '4', '1', '1', '6', null, null);
INSERT INTO `question` VALUES ('51', 'single_choice', '因为微程序不经常修改，所以一般存放在（）。', 'B', '主存中', '堆栈中', '只读存储器中', '磁盘中', null, null, '4', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('52', 'true_or_false', '物联网环境支撑平台：根据用户所处的环境进行业务的适配和组合。', 'A', '正确', '错误', null, null, null, null, '2', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('53', 'single_choice', '语言处理程序包括：汇编程序、编译程序和 ( )', 'D', 'C程序', 'BASIC程序', 'PASCAL程序', '解释程序', null, null, '4', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('54', 'true_or_false', '物联网共性支撑技术是不属于网络某个特定的层面，而是与网络的每层都有关系，主要包括：网络架构、标识解析、网络管理、安全、QoS等。', 'A', '正确', '错误', null, null, null, null, '2', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('56', 'true_or_false', '使用public公有继承时，基类中的私有成员在派生类中可以直接访问。', 'B', '正确', '错误', null, null, null, null, '2', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('57', 'true_or_false', '采用休眠机制T物联网会产生消息延迟。', 'A', '正确', '错误', null, null, null, null, '2', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('58', 'true_or_false', '在 SLR （ 1 ）分析法的名称中， S 的含义是简单的。 ()', 'A', '正确', '错误', null, null, null, null, '2', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('59', 'single_choice', '上述数据定义语句中，NUM1和NUM2字节单元的内容分别是（  ）。', 'D', 'NUM1=0，NUM2=0', 'NUM1=0，NUM2=0FFH', 'NUM1=0FFH，NUM2=0', 'NUM1=0FFH，NUM2=0FFH', null, null, '4', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('60', 'single_choice', '若浮点数用补码表示，则判断运算结果是否为规格化数的方法是（）', 'C', '阶符与数符相同为规格化数', '阶符与数符相异为规格化数', '数符与尾数小数点后第1位数字相异为规格化数', '数符与尾数小数点后第1位数字相同为规格化数', null, null, '4', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('61', 'single_choice', '已知X为整数，且[X] 补 = 10011011，则X的十进制数值是', 'B', '+155', '–101', '–155', '+101', null, null, '4', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('62', 'single_choice', '某计算机存储器按字节编址，主存地址空间大小为64MB，现用 4M x 8 位的 RAM 芯片组成 32MB 的主存储器，则存储器地址寄存器 MAR 的位数至少是（ ）。', 'D', '22 位', '23 位', '25 位', '26 位', null, null, '4', '2', '3', '6', null, null);
INSERT INTO `question` VALUES ('63', 'true_or_false', '计算机高级语言翻译成低级语言只有解释一种方式。（）', 'B', '正确', '错误', null, null, null, null, '2', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('64', 'true_or_false', '智能家居是物联网在个人用户的智能控制类应用', 'A', '正确', '错误', null, null, null, null, '2', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('65', 'single_choice', '构造编译程序应掌握 ', 'D', '源程序', '目标语言', '编译方法', '以上三项都是', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('66', 'true_or_false', '感知延伸层技术是保证物联网络感知和获取物理世界信息的首要环节，并将现有网络接入能力向物进行延伸。', 'A', '正确', '错误', null, null, null, null, '2', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('67', 'single_choice', '要交换变量A和B的值,应使用的语句组( ) ', 'B', 'A=B;B=C;C=A', 'C=A;A=B;B=C', 'A=B;B=A', 'C=A;B=A;B=C', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('68', 'true_or_false', '无线传输用于补充和延伸接入网络，使得网络能够把各种物体接入到网络，主要包括各种短距离无线通信技术。', 'A', '正确', '错误', null, null, null, null, '2', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('69', 'single_choice', '十进制数 60 转换成二进制数是（）。', 'C', '0111010', '0111110', '0111100', '0111101', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('70', 'single_choice', '下列功能相同的一组DOS命令是(  )', 'B', 'COPY和DISKCOPY', 'REN和RENAME', 'COMP和DISKCOMP', 'DIR和TYPE', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('71', 'single_choice', '词法分析器的输出结果是 ', 'C', '单词的种别编码', '单词在符号表中的位置', '单词的种别编码和自身值', '单词自身值', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('72', 'single_choice', '指出下列哪个方法与方法 public void change(int x, int y){} 为不合理的重载方法 。', 'D', 'public long change(long x, long y){}', 'public float change(float x, float y){}', 'public void change(int x){}', 'public int change(int a, int b){}', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('73', 'single_choice', '下列关于ASCII码和十进制的对应关系说明错误的是？', 'C', '0--48， 9--57', 'A--65 ， Z--90', 'a--98 ， z—123', 'B--66 ，F-70', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('74', 'single_choice', '分时系统又称为 ( )', 'C', '多用户系统', '单用户系统', '多用户交互式系统', '单用户交互式系统', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('75', 'single_choice', '完成同指令XCHG AX，BX相同功能的指令或指令序列是（ ）', 'D', 'MOV  AX，BX', 'MOV BX，AX', 'PUsH AX\nPOP   BX', 'MOV CX,AX\nMOV AX,BX\nMOV BX,CX', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('76', 'single_choice', 'WPS 软件允许在屏幕上模拟显示，其最小的输出显示比例是(  )', 'B', '1/1', '1/4', '1/8', '1/2', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('77', 'single_choice', '下面指令序列测试BH中的数是否为奇数，若为奇数则转移至K1处，横线处的指令应为（  ）。', 'A', 'JNE', 'JZ', 'JS', 'JC', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('78', 'single_choice', '用Af对上述字符串进行分类的结果为?', 'B', 'ω1:{a,c};ω2:{b,d}', 'ω1:{a,d};ω2:{b,c}', 'ω1:{b,d};ω2:{a,c}', 'ω1:{a,b};ω2:{c,d}', null, null, '4', '3', '5', '6', null, null);
INSERT INTO `question` VALUES ('79', 'single_choice', '国际标准化组织ISO提出的不基于特定机型，操作系统或公司的网络体系结构OSI参考模型中，第3层和第6层分别为（   ）。', 'C', '物理层和网络层', '数据链路层和传输层', '网络层和表示层', '会话层和应用曾', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('80', 'single_choice', '传输介质是通信网络中发送方和接收方之间的 ( ) 通路。', 'A', '物理', '逻辑', '虚拟', '数字', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('81', 'single_choice', '子网掩码决定子网数目和每个子网的什么数目（ ）', 'A', '主机', '路由器', '集线器', '网桥', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('82', 'single_choice', 'IP协议属于TCP/IP协议中的哪一层（    ）', 'C', '应用层', '传输层', '网络层', '网络接口层', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('83', 'single_choice', '组建计算机网络的目的是实现连网计算机系统的（ ）', 'D', '硬件共享', '软件共享', '数据共享', '资源共享', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('84', 'single_choice', 'C 类 IP 地址的最高三个比特位，从高到低依次是 （） 。', 'B', '010', '110', '100', '101', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('85', 'single_choice', '在以下几种传输媒体中，哪种传输速率最高 ( ）', 'C', '双绞线', '同轴电缆', '光纤', '通信卫星', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('86', 'single_choice', '下面关于ICMP协议的描述中，正确的是（）', 'C', 'ICMP协议根据MAC地址查找对应的IP地址', 'ICMP协议把公网的IP地址转换为私网的IP地址', 'ICMP协议用于控制数据报传送中的差错情况', 'ICMP协议集中管理网络中的IP地址分配', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('87', 'single_choice', '关于计算机网络，下列描述当中，正确的是（）', 'C', '在同一信道上同一时刻，可进行双向数据传送的通信方式是半双工', 'TCP协议是无连接的；UDP协议是面向连接的', '假设一个主机的ip地址为192.168.8.123，而子网掩码为255.255.255.248，那么该主机的网络号是192.168.8.120', '计算机网络中的OSI结构分别是：物理层，数据链路层，传输层，会话层，表示层，应用层', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('88', 'single_choice', '以集线器组建的以太网上某个主机发送一个帧到此网络上的另一主机，则', 'A', '这个网络上的所有主机都会收到这个帧', '这个网络上的所有主机都会把这个帧去掉帧首部和尾部并把数据部分交付给网络层', '仅有目的主机收到此帧', '以上都不对', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('89', 'single_choice', '下面哪一个地址不能用作某个局域网内网IP（）', 'C', '192.168.201.114', '172.16.4.25', '127.0.0.1', '10.0.0.1', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('90', 'single_choice', 'ATM信元的交换方式为？', 'C', '电路交换', '分组交换', '电路交换和分组交换的组合', '与电路交换和分组交换方式毫无关系', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('91', 'single_choice', '网络的基本分类有两种：一种是根据网络所使用的传输技术，另一种是（ ）', 'C', '网络协议', '网络的拓扑结构', '覆盖范围与规模', '网络服务的操作系统', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('92', 'single_choice', '有几栋建筑物，周围还有其他电力电缆，若需要将该几栋建筑物连接起来构成骨干型园区网，则采用的介质比较合适的是（）', 'A', '光缆', '同轴电缆', '非屏蔽双绞线', '屏蔽双绞线', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('93', 'single_choice', '下列选项中，对正确接收到的数据帧进行确认的MAC协议是（）。', 'D', 'CSMA', 'CDMA', 'CSMA/CD', 'CSMA/CA', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('94', 'single_choice', '能保证数据端到端可靠传输能力的是相应OSI的哪一层？', 'B', '网络层', '传输层', '会话层', '表示层', null, null, '4', '1', '1', '7', null, null);
INSERT INTO `question` VALUES ('95', 'true_or_false', '在OSI参考模型中，最上层是物理层这句话正确与否？', 'B', '正确', '错误', null, null, null, null, '2', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('96', 'single_choice', '局部地区通信网络简称局域网，英文缩写为（ ）。', 'B', 'WAN', 'LAN', 'SAN', 'MAN', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('97', 'single_choice', '显示当前TCP/IP网络中的所有配置信息的诊断命令是（  ）', 'A', 'ipconfig/all', 'route', 'telnet', 'ping', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('98', 'single_choice', '若网络形状是由站点和连接站点的链路组成的一个闭合环，则称这种拓扑结构为 (    )', 'C', '星形拓扑', '总线拓扑', '环形拓扑', '树形拓扑', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('99', 'single_choice', 'IP地址中的哪个类默认有最多可用的主机地址（）', 'A', 'A', 'B', 'C', 'A和B', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('100', 'true_or_false', '运输层为运行在不同主机上的进程彼此之间提供了逻辑通信，而网络层则提供了主机之间的逻辑通信。（ ）', 'A', '正确', '错误', null, null, null, null, '2', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('101', 'single_choice', '什么是子网?', 'C', '网络的一部分，是主网络的一个从属系统', '一个在较大网络中操作的小网络，它允许多种类型的设备被连入网络', '一个对较大网络的划分，使之成为较小的分片', '一个较小的网络，它维护该网络上所有MAC地址的数据库', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('102', 'single_choice', '主机甲与主机乙之间已建立一个TCP连接，主机甲向主机乙发送了两个连续的TCP段，分别包含300B和500B的有效载荷，第一个段的序列号为200，主机乙正确接收到两个段后，发送给主机甲的确认序列号是（）。', 'D', '500', '700', '800', '1000', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('103', 'single_choice', '下面不能够作为Internet主机使用的IP地址的是（）', 'C', '1.1.1.1', '5.5.5.5', '7.0.0.0', '214.33.21.78', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('104', 'single_choice', 'IP地址为140.123.0.0的地址是B类地址，若要切割为10个子网，而且都要连接上Internet，请问子网掩码应设为（）', 'D', '255.0.0.0', '255.255.0.0', '255.255.128.0', '255.255.240.0', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('105', 'single_choice', '局域网标准化工作是由（ ）来制定的。', 'B', 'OSI', 'IEEE', 'ITU-T', 'CCITT', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('106', 'single_choice', 'Internet的四层结构分别是（  ）。', 'D', '应用层、传输层、通信子网层和物理层', '应用层、表示层、传输层和网络层', '物理层、数据链路层、网络层和传输层', '网络接口层、网络层、传输层和应用层', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('107', 'true_or_false', '双绞线不仅可以传输数字信号，而且也可以传输模拟信号。（ ）', 'A', '正确', '错误', null, null, null, null, '2', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('108', 'single_choice', '下列IP地址中，只能作为IP分组的源IP地址但不能作为目的IP地址的是      。', 'A', '0.0.0.0', '127.0.0.1', '200.10.10.3', '255.255.255.255', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('109', 'single_choice', '在TCP报文段中，接收窗口（receive window）字段用于', 'C', '可靠数据传输', '延迟保证', '流量控制', '拥塞控制', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('110', 'single_choice', '下列属于最基本的服务器是（）。', 'D', '文件服务器', '异步通信服务器', '打印服务器', '数据库服务器', null, null, '4', '2', '3', '7', null, null);
INSERT INTO `question` VALUES ('111', 'single_choice', '计算机通信的规则为：（ ）', 'A', '协议', '介质', '服务', '网络操作系统', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('112', 'true_or_false', '没有一种单一的网络能够适应所有用户的需求。（  ）', 'A', '正确', '错误', null, null, null, null, '2', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('113', 'single_choice', '4个字节信息是0xEA697341，其校验和是（  ）', 'B', '0xA255', '0xA254', '0x5DAB', '0x5DAA', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('114', 'single_choice', '要发送的数据为11001001，采用CRC的生成多项式是P(X)=X3+X+1,则应添加在数据后面的余数为（ ）', 'D', '010', '101', '110', '001', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('115', 'single_choice', 'TCP/IP模型的体系结构中，ICMP协议属于（ ）。', 'B', '应用层', '网络层', '数据链路层', '传输层', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('116', 'single_choice', '在TCP/IP协议体系中，将网络结构自上而下划分为四层，即应用层、传输层、网络层、网络接口，工作时（        ）', 'C', '发送方从下层向上层传输数据，每经过一层附加协议控制信息', '接收方从下层向上层传输数据，每经过一层附加协议控制信息', '发送方从上层向下层传输数据，每经过一层附加协议控制信息', '接收方从上层向下层传输数据，每经过一层附加协议控制信息', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('117', 'single_choice', '传输速率单位“bps”代表的意义是()。', 'B', 'Bytes per Second', 'Bits per Second', 'Baud per Second', 'Billion per Second', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('118', 'single_choice', '主机乙向主机甲发送的正确的TCP段应该是?', 'B', '(SYN=1,ACK=1,seq=11220,ack=11220)', '(SYN=1,ACK=1,seq=11221,ack=11221)', '(SYN=0,ACK=0,seq=11221,ack=11221)', '(SYN=0,ACK=1,seq=11220,ack=11220)', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('119', 'single_choice', 'How should servlet developers handle the HttpServlet&rsquo;s service() methond when extending HttpServlet?', 'D', 'They should override the service()method in most cases;', 'They should call the service()method from doGet()or doPost();', 'They should call the service()method from the init()method;', 'They should override at least one doXXX()method(such as doPost())', null, null, '4', '3', '5', '7', null, null);
INSERT INTO `question` VALUES ('120', 'single_choice', '假设某网站的域名为www.zhenjiang.com.cn，可推测此网站类型为（ ）', 'B', '教育', '商业', '政府', '网络机构', null, null, '4', '3', '5', '7', null, null);

-- ----------------------------
-- Table structure for sdept
-- ----------------------------
DROP TABLE IF EXISTS `sdept`;
CREATE TABLE `sdept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `decs` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sdept
-- ----------------------------
INSERT INTO `sdept` VALUES ('1', '计算机科学与技术学院', null);
INSERT INTO `sdept` VALUES ('2', '电气与自动化学院', null);
INSERT INTO `sdept` VALUES ('3', '外国语学院', null);
INSERT INTO `sdept` VALUES ('4', '理学院', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sclass` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sdept_id` int DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `student_sdept_id_6ba476f2_fk_sdept_id` (`sdept_id`),
  CONSTRAINT `student_sdept_id_6ba476f2_fk_sdept_id` FOREIGN KEY (`sdept_id`) REFERENCES `sdept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (null, '0', '', '', '', '0', '1', '2020-04-08 19:06:45.423215', '95001', 'e10adc3949ba59abbe56e057f20f883e', 'zxy', '1704201', '123456@qq.com', '1');
INSERT INTO `student` VALUES (null, '0', '', '', '', '0', '1', '2020-04-08 21:07:31.836631', '95002', '96e79218965eb72c92a549dd5a330112', '李四', '1705101', '111111@qq.com', '2');

-- ----------------------------
-- Table structure for student_groups
-- ----------------------------
DROP TABLE IF EXISTS `student_groups`;
CREATE TABLE `student_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_groups_student_id_group_id_81addf69_uniq` (`student_id`,`group_id`),
  KEY `student_groups_group_id_0bc54d92_fk_auth_group_id` (`group_id`),
  CONSTRAINT `student_groups_group_id_0bc54d92_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `student_groups_student_id_2cd9b76d_fk_student_sid` FOREIGN KEY (`student_id`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student_groups
-- ----------------------------

-- ----------------------------
-- Table structure for student_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `student_user_permissions`;
CREATE TABLE `student_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_user_permissions_student_id_permission_id_7dbf3714_uniq` (`student_id`,`permission_id`),
  KEY `student_user_permiss_permission_id_7b58a882_fk_auth_perm` (`permission_id`),
  CONSTRAINT `student_user_permiss_permission_id_7b58a882_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `student_user_permissions_student_id_e1448ffa_fk_student_sid` FOREIGN KEY (`student_id`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `sid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(40) NOT NULL,
  `sdept_id` int NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `teacher_sdept_id_83614723_fk_sdept_id` (`sdept_id`),
  CONSTRAINT `teacher_sdept_id_83614723_fk_sdept_id` FOREIGN KEY (`sdept_id`) REFERENCES `sdept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1001', '李四', '1001@qq.com', '123456', '1');
