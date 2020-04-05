/*
Navicat MySQL Data Transfer

Source Server         : zxy
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-04-05 11:25:03
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `auth_permission` VALUES ('29', 'Can add 教师', '8', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 教师', '8', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 教师', '8', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 教师', '8', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 题目', '9', 'add_question');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 题目', '9', 'change_question');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 题目', '9', 'delete_question');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 题目', '9', 'view_question');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 试卷', '10', 'add_paper');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 试卷', '10', 'change_paper');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 试卷', '10', 'delete_paper');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 试卷', '10', 'view_paper');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 成绩', '11', 'add_grade');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 成绩', '11', 'change_grade');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 成绩', '11', 'delete_grade');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 成绩', '11', 'view_grade');
INSERT INTO `auth_permission` VALUES ('45', 'Can add captcha store', '12', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('46', 'Can change captcha store', '12', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete captcha store', '12', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('48', 'Can view captcha store', '12', 'view_captchastore');

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
  `name` varchar(100) DEFAULT NULL,
  `decs` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '其他', '测试');
INSERT INTO `course` VALUES ('2', '软件安全', '信安');
INSERT INTO `course` VALUES ('3', '软件工程', '信安、计科');
INSERT INTO `course` VALUES ('4', '网络安全', '信安');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('12', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'course');
INSERT INTO `django_content_type` VALUES ('11', 'users', 'grade');
INSERT INTO `django_content_type` VALUES ('10', 'users', 'paper');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'question');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'student');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'teacher');

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
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-04-01 16:32:15.316236');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-04-01 16:32:15.391036');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-04-01 16:32:15.475810');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-04-01 16:32:15.692245');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-04-01 16:32:15.700209');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-04-01 16:32:15.709219');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-04-01 16:32:15.717164');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-04-01 16:32:15.722151');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-04-01 16:32:15.729132');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-04-01 16:32:15.737111');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-04-01 16:32:15.748083');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-04-01 16:32:15.765052');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-04-01 16:32:15.774012');
INSERT INTO `django_migrations` VALUES ('14', 'users', '0001_initial', '2020-04-01 16:32:16.045288');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2020-04-01 16:32:16.707552');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2020-04-01 16:32:16.880056');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2020-04-01 16:32:16.901006');
INSERT INTO `django_migrations` VALUES ('18', 'captcha', '0001_initial', '2020-04-01 16:32:16.943886');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2020-04-01 16:32:16.968818');

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
INSERT INTO `django_session` VALUES ('q4aa0h9v9tiz2fxe4ksxc69nl8bwzok8', 'NDI5NjE0ODlkNzNhNDkzYjViNmE2ZGZlYmJiMmUxM2Q3YWYzNzk1NDp7InNpZCI6Ijk1MDAyIiwicGFzc3dvcmQiOiI5NmU3OTIxODk2NWViNzJjOTJhNTQ5ZGQ1YTMzMDExMiIsIm5hbWUiOiJcdTY3NGVcdTU2ZGIiLCJzY2xhc3MiOiIxNzA1MTAxIiwic2RlcHQiOiJcdTc1MzVcdTZjMTRcdTRlMGVcdTgxZWFcdTUyYThcdTUzMTZcdTViNjZcdTk2NjIiLCJlbWFpbCI6IjExMTExMUBxcS5jb20ifQ==', '2020-04-16 13:17:12.257933');

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
INSERT INTO `grade` VALUES ('1', 'test1', '2', '2020-04-01 16:54:09.993351', '1', '95001');
INSERT INTO `grade` VALUES ('2', 'test1', '2', '2020-04-01 21:46:51.250543', '1', '95001');
INSERT INTO `grade` VALUES ('3', 'test1', '1', '2020-04-01 21:52:15.011965', '1', '95001');
INSERT INTO `grade` VALUES ('4', 'test1', '3', '2020-04-01 22:23:41.509500', '1', '95001');
INSERT INTO `grade` VALUES ('5', 'test1', '1', '2020-04-01 22:32:08.265220', '1', '95001');
INSERT INTO `grade` VALUES ('6', 'test1', '3', '2020-04-02 13:17:41.416130', '1', '95002');

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
INSERT INTO `paper` VALUES ('1', 'test1', '2020-04-01', '4', '4', '0', '0', '0', '0', '4', '4', '40', '1');
INSERT INTO `paper` VALUES ('2', 'test2', '2020-04-01', '2', '3', '0', '0', '0', '0', '2', '3', '20', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paper_pid
-- ----------------------------
INSERT INTO `paper_pid` VALUES ('1', '1', '1');
INSERT INTO `paper_pid` VALUES ('2', '1', '2');
INSERT INTO `paper_pid` VALUES ('3', '1', '3');
INSERT INTO `paper_pid` VALUES ('4', '1', '4');
INSERT INTO `paper_pid` VALUES ('5', '2', '5');
INSERT INTO `paper_pid` VALUES ('6', '2', '6');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questionType` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `choice_a` longtext,
  `choice_b` longtext,
  `choice_c` longtext,
  `choice_d` longtext,
  `choice_e` longtext,
  `choice_f` longtext,
  `boolt` longtext,
  `boolf` longtext,
  `choice_num` int NOT NULL,
  `level` varchar(10) DEFAULT NULL,
  `score` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_course_id_d8bcc122_fk_course_id` (`course_id`),
  CONSTRAINT `question_course_id_d8bcc122_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', 'single_choice', '1+1', 'A', '2', '3', '1', '0', null, null, null, null, '4', '1', '1', '1');
INSERT INTO `question` VALUES ('2', 'single_choice', '7+8', 'C', '7', '8', '15', '1', null, null, null, null, '4', '1', '1', '1');
INSERT INTO `question` VALUES ('3', 'single_choice', '5+6', 'B', '5', '11', '6', '4', null, null, null, null, '4', '1', '1', '1');
INSERT INTO `question` VALUES ('4', 'single_choice', '5+9', 'D', '5', '9', '4', '14', null, null, null, null, '4', '1', '1', '1');
INSERT INTO `question` VALUES ('5', 'single_choice', '软件安全', 'C', 'sgt', 'sbyrhytn', '答案', 'dhdrt', null, null, null, null, '4', '2', '2', '2');
INSERT INTO `question` VALUES ('6', 'single_choice', '病毒', 'A', '答案', 'bhnf', 'thyt', 'thyh', null, null, null, null, '4', '1', '1', '2');

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
  `sdept` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (null, '0', '', '', '', '0', '1', '2020-04-01 16:47:53.933968', '95001', 'e10adc3949ba59abbe56e057f20f883e', '周心怡', '1704201', '计算机科学与技术学院', '123456@qq.com');
INSERT INTO `student` VALUES (null, '0', '', '', '', '0', '1', '2020-04-02 13:14:56.003048', '95002', '96e79218965eb72c92a549dd5a330112', '李四', '1705101', '电气与自动化学院', '111111@qq.com');

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
  `sdept` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1001', '张三', '计算机科学与技术学院', '1000103@qq.com', '123456');
