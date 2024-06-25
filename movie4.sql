/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : movie4

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 01/06/2024 23:39:04
*/

DROP DATABASE IF EXISTS movie4;
CREATE DATABASE IF NOT EXISTS movie4;
USE movie4;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id` ASC) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content_type_id` int NOT NULL,
  `codename` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id` ASC) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO `auth_permission` VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO `auth_permission` VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO `auth_permission` VALUES (4, 1, 'view_logentry', 'Can view log entry');
INSERT INTO `auth_permission` VALUES (5, 2, 'add_permission', 'Can add permission');
INSERT INTO `auth_permission` VALUES (6, 2, 'change_permission', 'Can change permission');
INSERT INTO `auth_permission` VALUES (7, 2, 'delete_permission', 'Can delete permission');
INSERT INTO `auth_permission` VALUES (8, 2, 'view_permission', 'Can view permission');
INSERT INTO `auth_permission` VALUES (9, 3, 'add_group', 'Can add group');
INSERT INTO `auth_permission` VALUES (10, 3, 'change_group', 'Can change group');
INSERT INTO `auth_permission` VALUES (11, 3, 'delete_group', 'Can delete group');
INSERT INTO `auth_permission` VALUES (12, 3, 'view_group', 'Can view group');
INSERT INTO `auth_permission` VALUES (13, 4, 'add_user', 'Can add user');
INSERT INTO `auth_permission` VALUES (14, 4, 'change_user', 'Can change user');
INSERT INTO `auth_permission` VALUES (15, 4, 'delete_user', 'Can delete user');
INSERT INTO `auth_permission` VALUES (16, 4, 'view_user', 'Can view user');
INSERT INTO `auth_permission` VALUES (17, 5, 'add_contenttype', 'Can add content type');
INSERT INTO `auth_permission` VALUES (18, 5, 'change_contenttype', 'Can change content type');
INSERT INTO `auth_permission` VALUES (19, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO `auth_permission` VALUES (20, 5, 'view_contenttype', 'Can view content type');
INSERT INTO `auth_permission` VALUES (21, 6, 'add_session', 'Can add session');
INSERT INTO `auth_permission` VALUES (22, 6, 'change_session', 'Can change session');
INSERT INTO `auth_permission` VALUES (23, 6, 'delete_session', 'Can delete session');
INSERT INTO `auth_permission` VALUES (24, 6, 'view_session', 'Can view session');
INSERT INTO `auth_permission` VALUES (25, 7, 'add_comment', 'Can add 评论');
INSERT INTO `auth_permission` VALUES (26, 7, 'change_comment', 'Can change 评论');
INSERT INTO `auth_permission` VALUES (27, 7, 'delete_comment', 'Can delete 评论');
INSERT INTO `auth_permission` VALUES (28, 7, 'view_comment', 'Can view 评论');
INSERT INTO `auth_permission` VALUES (29, 8, 'add_movie', 'Can add 电影');
INSERT INTO `auth_permission` VALUES (30, 8, 'change_movie', 'Can change 电影');
INSERT INTO `auth_permission` VALUES (31, 8, 'delete_movie', 'Can delete 电影');
INSERT INTO `auth_permission` VALUES (32, 8, 'view_movie', 'Can view 电影');
INSERT INTO `auth_permission` VALUES (33, 9, 'add_tags', 'Can add 标签');
INSERT INTO `auth_permission` VALUES (34, 9, 'change_tags', 'Can change 标签');
INSERT INTO `auth_permission` VALUES (35, 9, 'delete_tags', 'Can delete 标签');
INSERT INTO `auth_permission` VALUES (36, 9, 'view_tags', 'Can view 标签');
INSERT INTO `auth_permission` VALUES (37, 10, 'add_user', 'Can add 用户');
INSERT INTO `auth_permission` VALUES (38, 10, 'change_user', 'Can change 用户');
INSERT INTO `auth_permission` VALUES (39, 10, 'delete_user', 'Can delete 用户');
INSERT INTO `auth_permission` VALUES (40, 10, 'view_user', 'Can view 用户');
INSERT INTO `auth_permission` VALUES (41, 11, 'add_usertagprefer', 'Can add 用户偏好');
INSERT INTO `auth_permission` VALUES (42, 11, 'change_usertagprefer', 'Can change 用户偏好');
INSERT INTO `auth_permission` VALUES (43, 11, 'delete_usertagprefer', 'Can delete 用户偏好');
INSERT INTO `auth_permission` VALUES (44, 11, 'view_usertagprefer', 'Can view 用户偏好');
INSERT INTO `auth_permission` VALUES (45, 12, 'add_rate', 'Can add 评分信息');
INSERT INTO `auth_permission` VALUES (46, 12, 'change_rate', 'Can change 评分信息');
INSERT INTO `auth_permission` VALUES (47, 12, 'delete_rate', 'Can delete 评分信息');
INSERT INTO `auth_permission` VALUES (48, 12, 'view_rate', 'Can view 评分信息');
INSERT INTO `auth_permission` VALUES (49, 13, 'add_likecomment', 'Can add 评论点赞');
INSERT INTO `auth_permission` VALUES (50, 13, 'change_likecomment', 'Can change 评论点赞');
INSERT INTO `auth_permission` VALUES (51, 13, 'delete_likecomment', 'Can delete 评论点赞');
INSERT INTO `auth_permission` VALUES (52, 13, 'view_likecomment', 'Can view 评论点赞');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `is_superuser` int NOT NULL,
  `username` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_staff` int NOT NULL,
  `is_active` int NOT NULL,
  `date_joined` datetime NOT NULL,
  `first_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$216000$Oe4lye8CO3kT$ZZh/5V0BKTS/oWXY7dYFrChzueOELP6CkuKDW8Vesu8=', NULL, 1, 'admins', '', 'admins@163.com', 1, 1, '2021-04-09 02:22:25', '');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$216000$kgS07d9fmPw4$Wqppl79qq5D8FPnNUHCqhi3/04Iia0dOi2WnrEIkEKI=', '2021-05-12 07:14:19', 1, 'ziluhuang', '', '123456@qq.com', 1, 1, '2021-05-12 07:13:46', '');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$216000$8suFTFpweGqf$pCc49+DaaANzQqGLIFNNsBt2yrHJo3DBIk+xErqHdCg=', '2021-05-18 11:54:24', 1, 'superman', '', 'superman@163.com', 1, 1, '2021-05-15 01:20:14', '');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$720000$Ws21dmOVpcRCFRRNlS5mlw$p02KRczYpqe81seuvxuwTCoGbbWolbpXlIhjDIx6sjo=', '2024-05-30 09:38:44', 1, 'admin', '', 'admin@qq.com', 1, 1, '2024-05-17 06:57:18', '');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `object_repr` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  `action_flag` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-05-30 09:28:40', '403', 'liyang', '[{\"added\": {}}]', 10, 4, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `model` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'comment');
INSERT INTO `django_content_type` VALUES (8, 'user', 'movie');
INSERT INTO `django_content_type` VALUES (9, 'user', 'tags');
INSERT INTO `django_content_type` VALUES (10, 'user', 'user');
INSERT INTO `django_content_type` VALUES (11, 'user', 'usertagprefer');
INSERT INTO `django_content_type` VALUES (12, 'user', 'rate');
INSERT INTO `django_content_type` VALUES (13, 'user', 'likecomment');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (19, 'user', '0001_initial', '2021-04-01 09:03:04');
INSERT INTO `django_migrations` VALUES (20, 'user', '0002_movie_douban_id', '2021-05-09 06:43:09');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `session_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `expire_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`session_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5r36xliknouo9x7u82b8z2z2j7ttbiwu', 'eyJzZWFyY2giOiJcdTZiNjVcdTVjNjVcdTRlMGRcdTUwNWMifQ:1lRuQG:oL5KgvQ9vfpEzuH_VTMCHabvq76B3opE2JqzpfMhb0E', '2021-04-15 10:19:33');
INSERT INTO `django_session` VALUES ('7sahfb3b2cr1jqsv1i1woi1xf58bzu2m', '.eJzFll1vmzAYhf8K4jofBgyGXm5Xk9qqmtarUUXGNsQLH5UNu6ny32dDtC1uGruobDfY8nt8_J4Ho-TF3-Gh3-8GycSOU__Gh_7q77UCkwNrdYH-wG3VbUjX9oIXGy3ZnKpyc9dRVn86ac8M9lju1e4wimJCAoSyGEAACU0zEIMspEWJMEgKBhDNIlLAuEwCmia0REEYUoSDkGFaAm3asHaQyuv7S-63uGG5f-Pl_qM6JfdXasZVb9NaiYVX4jXhgtRsKja6Q6nL59s_15wcvFt-YA4mg6in2hbThrdbnXBbq72ka1R3_XaSYUofbUqlOakLoRISMTTFhfYc0h1X3rxExyddZpzqagBA-Mpp6nUuGDco_wCIUwyTRmTa3I-zeSia7idnFhCTZjkMDv2bDKDp8SBYyQRryWwS-tHj6nk0shA51y5HxjmVySc2nb7inreV96UtO9GoufaZx0ng3nZhRslyVN6dxaSTmI7fcDUXh7oG0oJjlCyHw968mR-ZFldOHX6X3vxqHD6WBeNbezfTp-ZCYFrm-ZAWGI4DCdQQw5SoIYnSVA8IRq9PlPpEueespmtc99d_3JULisPRLIzQu9HrfzEW9H8kjug_JvQFlK5BjdcSgEtejMA3utAmck266gqySnTDs4XZpPnv0JyCmsgC82pnxyf_-At_towo:1sCcF9:WJoQ7ecnb4IWLgP32Ap4IO8BMNFCnV4XOnFgR9UsDfg', '2024-06-13 09:38:44');
INSERT INTO `django_session` VALUES ('9rftl8w509w62hpkqp8y2pc0jhs0btcn', 'eyJzZWFyY2giOiJcdTdmNTdcdTRmMmZcdTcyNzlcdTAwYjdcdTgyN2VcdTY4M2NcdTY1YWYifQ:1lYRl6:zI3zXZmF0UvOcvz4dNIF9aVqR58lfbLA2_PyltLOOns', '2021-05-03 11:08:05');
INSERT INTO `django_session` VALUES ('bt5tgp60idvnu5jeriv405ahg9zm7907', '.eJzFll1vmzAYhf8K4jofBgyGXm5Xk9qqmtarUUXGNsQLH5UNu6ny32dDtC1uGruobDfY8nt8_J4Ho-TF3-Gh3-8GycSOU__Gh_7q77UCkwNrdYH-wG3VbUjX9oIXGy3ZnKpyc9dRVn86ac8M9lju1e4wimJCAoSyGEAACU0zEIMspEWJMEgKBhDNIlLAuEwCmia0REEYUoSDkGFaAm3asHaQyuv7S-63uGG5f-Pl_qM6JfdXasZVb9NaiYVX4jXhgtRsKja6Q6nL59s_15wcvFt-YA4mg6in2hbThrdbnXBbq72ka1R3_XaSYUofbUqlOakLoRISMTTFhfYc0h1X3rxExyddZpzqagBA-Mpp6nUuGDco_wCIUwyTRmTa3I-zeSia7idnFhCTZjkMDv2bDKDp8SBYyQRryWwS-tHj6nk0shA51y5HxjmVySc2nb7inreV96UtO9GoufaZx0ng3nZhRslyVN6dxaSTmI7fcDUXh7oG0oJjlCyHw968mR-ZFldOHX6X3vxqHD6WBeNbezfTp-ZCYFrm-ZAWGI4DCdQQw5SoIYnSVA8IRq9PlPpEueespmtc99d_3JULisPRLIzQu9HrfzEW9H8kjug_JvQFlK5BjdcSgEtejMA3utAmck266gqySnTDs4XZpPnv0JyCmsgC82pnxyf_-At_towo:1s7rWw:7hndmUFY2xB7fRc41AUfDchrrCpAdzL1U72LqGImpzk', '2024-05-31 06:57:26');
INSERT INTO `django_session` VALUES ('e1i28bwz21n5yqgw9m0zuktfz2kz7f8i', 'eyJzZWFyY2giOiJzZCJ9:1lUhj8:_j6EDiTTnAt4nqz6Uo1eoh5ylJG2NlSfihGjaHU1APc', '2021-04-23 03:22:35');
INSERT INTO `django_session` VALUES ('glxtfavnmwmu3f5kpjmqfi2hlup24514', 'eyJzZWFyY2giOiJhZCJ9:1lShgq:3e-TC2ia2hfwFvSuRRpiaD5Xb82E0klhji8PVrCIVU8', '2021-04-17 14:55:57');
INSERT INTO `django_session` VALUES ('ho2bvja27pkzsnjijkq2dwy7emoz9634', 'eyJuZXciOiJ0cnVlIiwibG9naW5faW4iOnRydWUsInVzZXJfaWQiOjQwMiwibmFtZSI6ImFhYWFhYSJ9:1nOENy:HQvs1YktQJf03sqP6Vg-nDq3v49GlFSMUj0_iMoYPXw', '2022-03-13 07:54:30');
INSERT INTO `django_session` VALUES ('l9bwzq0inzlppd4y4hgq1ujgtkm0g34g', 'eyJzZWFyY2giOiJcdTY0MGZcdTUxZmIifQ:1lfdd7:Yr8HCptPDpy8w_dDRIVBF1brzkbUV3HoWBlBTqWIkiY', '2021-05-23 07:13:33');
INSERT INTO `django_session` VALUES ('xkzzgl2y4jcwnddk7uevf9kqkln531oo', '.eJzFllFvmzAUhf9K5GeSGDAY8rg9TdqmaVqfRhUZ2xAvYCoDk6Yq_302RF3jpsFFY3uJLd_D8T1fjPAj2JO-O-z7lqu9YGAHEPCer-WEHrk0BfaDyLLZ0EZ2SuQbI9mcq-3mU8N49e6svTA4kPagnw7CMKLUxziNIIKIsiSFEUwDlheYwDjnELM0pDmKithnScwK7AcBw8QPOGEFNKY1l32rvb4_ZkCSmmdgt8rAnd4lA56eCd3buFYQtSrImgpFKz4Wa9Nha8qXj7-vBD2uPoojdzDpVTXWtoTVQm5Nwm2ln6VNrbvrtqOMMHY3pdSaszpXOiFVfZ1fac8h3clbzUt0ujdlLpip-hAGL5zGXueCcYPyD4A4xbBphLbN52E2D0Xd_BR8AsSoWQ6DQ_82A2R7fFG84IpLOpuE-elI-TAYTRC51C5HxjmVzSeynb6STshy9UEWjar13PjM46RIN3VgBslyVN6cxaYT247fSDkXhz4G7QSOQbIcjunm7fzYtrixa_9UevWtcXhZFow_2budPrEXfNsyy_okJ2gYqK-HCCVUD3GYJGbAKHy5Y2t2bA-CV2xNqu72x1274CgYzIIQvxm9ucVMoP8jcUT_d0JfQeka1PpbfHjNi1P0ShfGpF3TpryBrFRN_zDBbNT8d2hOQW1kvn2009O9vqBWTSnkXkiw61TPPfB0qUYw9IZ99eW1Er_0PRqcfgMP45sg:1sCc5v:18P_-Eesa-_nMhecQV6HJfEpS7Lo_NyL5nVe6JGzFNU', '2024-06-13 09:29:12');


-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NOT NULL CHECK (`create_time` BETWEEN '2024-01-01' AND '2074-12-31'),
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_comment_movie_id`(`movie_id` ASC) USING BTREE,
  INDEX `user_comment_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
INSERT INTO `user_comment` VALUES (1, 'very good', '2024-05-15 01:19:04', 1, 401);
INSERT INTO `user_comment` VALUES (2, 'nice movie', '2024-05-27 07:55:27', 1, 402);
INSERT INTO `user_comment` VALUES (3, '阿打发打发', '2024-05-30 09:29:01', 1, 403);

-- ----------------------------
-- Table structure for user_likecomment
-- ----------------------------
DROP TABLE IF EXISTS `user_likecomment`;
CREATE TABLE `user_likecomment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_likecomment_comment_id`(`comment_id` ASC) USING BTREE,
  INDEX `user_likecomment_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_likecomment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `user_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_likecomment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for user_rate
-- ----------------------------
DROP TABLE IF EXISTS `user_rate`;
CREATE TABLE `user_rate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mark` tinyint NOT NULL,
  `create_time` datetime NOT NULL CHECK(`create_time` BETWEEN '2024-01-01' AND '2074-12-31'),
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_rate_movie_id_6ccfed0c`(`movie_id` ASC) USING BTREE,
  INDEX `user_rate_user_id_b85a90b9`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_rate_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_rate_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;


DELIMITER //
CREATE TRIGGER update_movie_rating AFTER INSERT ON user_rate
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3,1);
    
    -- 计算该电影的新平均评分
    SELECT ROUND(AVG(mark), 1) INTO avg_rating
    FROM user_rate
    WHERE movie_id = NEW.movie_id;
    
    -- 更新user_movie表中的d_rate字段
    UPDATE user_movie
    SET d_rate = avg_rating
    WHERE id = NEW.movie_id;
END //

DELIMITER ;


-- ----------------------------
-- Table structure for user_movie
-- ----------------------------
DROP TABLE IF EXISTS `user_movie`;
CREATE TABLE `user_movie`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `country` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `years` date NOT NULL CHECK (`years` BETWEEN '1900-01-01' AND '2074-12-31'),			-- 这里应该是YEAR类型，但是DATE也没有问题
  `d_rate` decimal(3,1) NULL,
  `intro` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `num` int NOT NULL,
  `image_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,

  `duration` smallint NOT NULL,
  `company_id` smallint NOT NULL,
  `state` enum("在映","下线","重映") CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `language` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `user_movie_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `user_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_movie
-- ----------------------------
  INSERT INTO `user_movie` VALUES (1, '疯狂动物城 Zootopia', '美国', '2016-03-04', NULL, 
  '故事发生在一个所有哺乳类动物和谐共存的美好世界中，兔子朱迪（金妮弗·古德温 Ginnifer Goodwin 配音）从小就梦想着能够成为一名惩恶扬善的刑警，凭借着智慧和努力，朱迪成功的从警校中毕业进入了疯狂动物城警察局，殊不知这里是大型肉食类动物的领地，作为第一只，也是唯一的小型食草类动物，朱迪会遇到怎样的故事呢？', 
  0, 'movie_cover/p2315672647.jpg', 109, 1,'下线','英语');
  INSERT INTO `user_movie` VALUES (2, '头脑特工队 Inside Out ', '美国', '2015-10-06', NULL, 
  '可爱的小女孩莱莉（凯特林·迪亚斯 Kaitlyn Dias 配音）出生在明尼苏达州一个平凡的家庭中，从小她在父母的呵护下长大，脑海中保存着无数美好甜蜜的回忆。当然这些记忆还与几个莱莉未曾谋面的伙伴息息相关，他们就是人类的五种主要情绪：乐乐（艾米·波勒 Amy Poehl er 配音）、忧忧（菲利丝·史密斯 Phyllis Smith 配音）、怕怕（比尔·哈德尔 Bill Hader 配音）、厌厌（敏迪·卡灵 Mindy Kaling 配音）和怒怒（刘易斯·布莱克 Lewis Black 配音）。乐乐作为团队的领导，她协同其他伙伴致力于为小主人营造更多美好的珍贵回忆。某天，莱莉随同父母搬到了旧金山，肮脏逼仄的公寓、陌生的校园环境、逐渐失落的友情都让莱莉无所适从，她的负面情绪逐渐累积，内心美好的世界渐次崩塌。', 
  0, 'movie_cover/p2266293606.jpg', 95, 1,'下线','英语');
  INSERT INTO `user_movie` VALUES (3, '玩具总动员4 Toy Story 4 ', '美国', '2019-06-21', NULL, 
  '自从与小主人安迪告别后，胡迪（汤姆·汉克斯 Tom Hanks 配音）和他的伙伴们在小女孩邦妮家安顿下来，不仅成为了邦妮（玛德琳·麦格劳 Madeleine McGraw 配音）的心爱之物，还结识了一批新伙伴。转眼之间，邦妮也要进入幼儿园啦，她用灵巧的小手把一个餐叉做成了玩具带了回来，并且热爱有加。胡迪虽然稍感失落，却还能欣然接受。只不过叉叉（托尼·海尔 Tony Hale 配音）似乎认定自己只是垃圾，一次次逃走跳进垃圾桶里，这可给胡迪找了不少麻烦。不久，邦妮一家外出旅行。叉叉故技重施，想方设法逃走，结果在追逐他的过程中，胡迪和叉叉便与邦妮家失散了。在流浪途中，胡迪意外重逢久未谋面的牧羊女（安妮·波茨 Annie Potts 配音），与此同时，新的冒险也就此展开……', 
  0, 'movie_cover/p2557284230.jpg', 100, 1,'下线','英语');
  INSERT INTO `user_movie` VALUES (4, '神偷奶爸3 Despicable Me 3 ', '美国', '2017-07-07', NULL, 
  '洗心革面之后，格鲁（史蒂夫·卡瑞尔 Steve Carell 配音）作为特工成绩斐然，却因未能打败坏小子巴萨扎·布莱德（崔·帕克Trey Parker 配音）而被新局长扫地出门。就在此时，他收到一封远方来信，这才得知自己原来还有一个双胞胎兄弟德鲁（史蒂夫·卡瑞尔 Steve Carell 配音）。在德鲁盛情邀请下，格鲁带着妻子露西•王尔德（克里斯汀·韦格 Kristen Wiig 配音）以及玛戈（米兰达·卡斯格拉夫 Miranda Cosgrove 配音）、伊迪丝（达娜·盖伊 Dana Gaier 配音）和阿格蕾丝（埃尔希·费舍 Elsie Fisher 配音）来到了他亲生父亲所居住的地方探亲。德鲁天真烂漫，却一心想和哥哥搭档成为坏蛋二人组。格鲁虽然暂时回归狂野，可正义之心并未泯灭。尤其当巴萨扎邪恶的计划和三个可爱的孩子牵扯到一起时，他再也无法坐视不理……', 
  0, 'movie_cover/p2469070974.jpg', 90, 2,'下线','英语');
  INSERT INTO `user_movie` VALUES (5, '小黄人大眼萌：神偷奶爸前传 Minions: The Rise of Gru', '美国', '2022-08-19', NULL, 
  '影片是2015年推出的小黄人独立电影《小黄人大眼萌》的直接前传。作为《神偷奶爸》的衍生作品，讲述了小黄人们在“前格鲁”时代为其他主人服务的经历，不过少年格鲁曾经出现在这部衍生电影里，续集将围绕他与小黄人们结缘的过程展开。', 
  0, 'movie_cover/p2877522569.jpg', 87, 2,'下线','英语');
  INSERT INTO `user_movie` VALUES (6, '春娇与志明 春嬌與志明', '中国香港 / 中国大陆', '2012-03-30', NULL, 
  '张志明（余文乐 饰）与余春娇（杨千嬅 饰）在一起后，恋情也不可避免由热烈转向平淡，几番龃龉过后，二人平平淡淡、不知不觉地分手了。在此之后，志明接受前老板的邀请，和公公前往北京发展，他很快结识了美丽温柔的空姐尚优优（杨幂 饰），一段新的恋情由此展开。另一方面，春娇的化妆品牌决定关掉香港分店，于是她也和娥姐转战北京。曾经的恋人相见自是几多尴尬，而原以为早已平淡和忘却的情感竟在见面的一刻复萌。虽然志明有优优陪伴，春娇也意外邂逅了体贴稳重的SAM（徐峥 饰），但是他们仍然瞒着另一半偷偷见面，他们小心地保持着距离，心又不由自主地向对方靠近。已是从香港转战北京的爱情，将如何收场……', 
  0, 'movie_cover/p1461642128.jpg', 111, 3,'下线','粤语/普通话');
  INSERT INTO `user_movie` VALUES (7, '泰坦尼克号 Titanic', '美国', '1998-04-03', NULL, 
  '1912年4月10日，号称 “世界工业史上的奇迹”的豪华客轮泰坦尼克号开始了自己的处女航，从英国的南安普顿出发驶往美国纽约。富家少女罗丝（凯特•温丝莱特）与母亲及未婚夫卡尔坐上了头等舱；另一边，放荡不羁的少年画家杰克（莱昂纳多·迪卡普里奥）也在码头的一场赌博中赢得了下等舱的船票。罗丝厌倦了上流社会虚伪的生活，不愿嫁给卡尔，打算投海自尽，被杰克救起。很快，美丽活泼的罗丝与英俊开朗的杰克相爱，杰克带罗丝参加下等舱的舞会、为她画像，二人的感情逐渐升温。1912年4月14日，星期天晚上，一个风平浪静的夜晚。泰坦尼克号撞上了冰山，“永不沉没的”泰坦尼克号面临沉船的命运，罗丝和杰克刚萌芽的爱情也将经历生死的考验。', 
  0, 'movie_cover/p457760035.jpg', 194, 4,'下线','英语');
  INSERT INTO `user_movie` VALUES (8, '爱乐之城 La La Land', '美国', '2017-02-14', NULL, 
  '米娅（艾玛·斯通 Emma Stone 饰）渴望成为一名演员，但至今她仍旧只是片场咖啡厅里的一名平凡的咖啡师，尽管不停的参加着大大小小的试镜，但米娅收获的只有失败。某日，在一场派对之中，米娅邂逅了名为塞巴斯汀（瑞恩·高斯林 Ryan Gosling 饰）的男子，起初两人之间产生了小小的矛盾，但很快，米娅便被塞巴斯汀身上闪耀的才华以及他对爵士乐的纯粹追求所吸引，最终两人走到了一起。在塞巴斯汀的鼓励下，米娅辞掉了咖啡厅的工作，专心为自己写起了剧本，与此同时，塞巴斯汀为了获得一份稳定的收入，加入了一支流行爵士乐队，开始演奏自己并不喜欢的现代爵士乐，没想到一炮而红。随着时间的推移，努力追求梦想的两人，彼此之间的距离却越来越远，在理想和感情之间，他们必须做出选择。', 
  0, 'movie_cover/p2565101499.jpg', 128, 5,'下线','英语');
  INSERT INTO `user_movie` VALUES (9, '爱在午夜降临前 Before Midnight', '美国/希腊', '2013-06-14', NULL, 
  '被影迷奉为爱情圭臬的《爱在黎明破晓前》、《爱在日落黄昏时》终于迎来了第三部《爱在午夜降临前》。第一部中美国青年杰西（伊桑·霍克 Ethan Hawke 饰）坐火车邂逅法国女孩赛琳（朱莉·德尔佩 Julie Delpy 饰），两人在维也纳度过难忘一晚；9 年后的第二部，杰西已成为作家，他的小说让他和赛琳在巴黎重逢，两人于日落前再续前缘。如今又一个 9 年过去了，杰西与赛琳已经一起生活并有了一对双胞胎女儿，对人生和爱情也有了更多感悟。《爱在午夜降临前》就是撷取他们在希腊伯罗奔尼撒南部小岛度假的最后一天。导演理查德·林克莱特和两位主演就像与影迷在赴一个每 9 年的约会，尽管三部曲的制作跨度长达 18 年，但故事情节几乎可以写在一张纸的背面。电影惯于只用人与人的对话讲述故事，两位主人公或行走在静谧的村落，或悠然坐在露台和餐桌前，不断的讨论着文学、爱情、生活、两性等话题...', 
  0, 'movie_cover/p2074715729.jpg', 109, 6,'下线','英语');
  INSERT INTO `user_movie` VALUES (10, '爱在日落黄昏时 Before Sunset', '美国/法国', '2004-02-10', NULL, 
  '九年前，杰西（伊桑·霍克 Ethan Hawke 饰）与席琳（朱莉·德尔佩 Julie Delpy 饰）在火车上不期而遇，怦然心动。在维也纳渡过疯狂而又浪漫的一夜后，他们在日出前分手，并相约在维也纳重逢。九年之后，杰西已成为畅销书作家，而席琳则是法国环保组织成员。杰西在新书里娓娓道来的，正是九年前的浪漫夜晚。在巴黎促销新书时，杰西与席琳在书店相遇，然而他们只有一下午的时光相处，日落之前，杰西要乘飞机赶回美国。两人在午后的巴黎街头散步，在美丽的护城河上泛舟，无所不谈，兴致勃勃。可是就像命运的捉弄，快乐的时光像烟花一样醉人却短暂。杰西对席琳一送再送，难以忘情；席琳用吉他和歌声，怀念着内心深处的爱恋。太阳就快落下去了，杰西就要误了飞机，又或许他更不想错过的，是命里注定的缘分.', 
  0, 'movie_cover/p2561542458.jpg', 80, 6,'下线','英语');
  INSERT INTO `user_movie` VALUES (11, '加菲猫家族 The Garfield Movie', '美国', '2024-06-01', NULL, 
  '加菲猫（克里斯·帕拉特 Chris Pratt 配音），这只全球闻名、厌恶星期一、对千层面情有独钟的宅猫，正准备开启一段疯狂的户外奇遇！在与他失散多年的亲生猫爸——不羁的流浪猫维克（塞缪尔·杰克逊 Samuel L. Jackson 配音）意外重聚后，加菲猫和他的狗狗伙伴欧迪被迫告别了安逸舒适的生活，卷入了一场搞笑又充满刺激的大冒险，而一直娇生惯养的加菲猫，将在这次冒险之旅中蜕变成为上天入地的“猫猫特工”，带着家族直面挑战、化解危机。', 
  0, 'movie_cover/p2908686677.jpg', 101, 7,'在映','英语');
  INSERT INTO `user_movie` VALUES (12, '哆啦 A 梦：大雄的地球交响乐 映画ドラえもん のび太の地球交響楽', '日本', '2024-05-31', NULL, 
  '为了准备学校音乐会的演出，大雄埋头苦练他并不擅长的竖笛。这时，他的面前出现了一位神秘的外星少女米佳，她格外中意大雄吹出来的跑调的笛声，于是米佳引领哆啦 A 梦和伙伴们来到了以音乐为能量的外星球上的一座音乐殿堂。就在这时，一种能够令音乐从世界上消失的神秘生命体突然降临，地球陷入危机……！哆啦 A 梦和伙伴们究竟能否拯救音乐的未来和地球危机呢？', 
  0, 'movie_cover/p2906817350.jpg', 115, 8,'在映','日语');
  INSERT INTO `user_movie` VALUES (13, '当幸福来敲门 The Pursuit of Happyness', '美国', '2008-01-17', NULL, 
  '克里斯•加纳（威尔·史密斯 Will Smith 饰）用尽全部积蓄买下了高科技治疗仪，到处向医院推销，可是价格高昂，接受的人不多。就算他多努力都无法提供一个良好的生活环境给妻儿，妻子（桑迪·牛顿 Thandie Newton 饰）最终选择离开家。从此他带着儿子克里斯托夫（贾登·史密斯 Jaden Smith 饰）相依为命。克里斯好不容易争取回来一个股票投资公司实习的机会，就算没有报酬，成功机会只有百分之五，他仍努力奋斗，儿子是他的力量。他看尽白眼，与儿子躲在地铁站里的公共厕所里，住在教堂的收容所里…… 他坚信，幸福明天就会来临。', 
  0, 'movie_cover/p1312700628.jpg', 117, 7,'下线','英语');
  INSERT INTO `user_movie` VALUES (14, '楚门的世界 The Truman Show ', '美国', '1998-06-05', NULL, 
  '楚门（金•凯瑞 Jim Carrey 饰）是一个平凡得不能再平凡的人，除了一些有些稀奇的经历之外——初恋女友突然失踪、溺水身亡的父亲忽然似乎又出现在眼前，他和绝大多数 30 多岁的美国男人绝无异样。这令他倍感失落。他也曾试过离开自己生活了多年的地方，但总因种种理由而不能成行。直到有一天，他忽然发觉自己似乎一直在被人跟踪，无论他走到哪里，干什么事情。这种感觉愈来愈强烈。楚门决定不惜一切代价逃离这个他生活了 30 多年的地方，去寻找他的初恋女友。但他却发现自己怎样也逃不出去。真相其实很残忍。', 
  0, 'movie_cover/p479682972.jpg', 103, 4,'下线','英语');


-- ----------------------------
-- Records of user_rate
-- ----------------------------
INSERT INTO `user_rate` VALUES (1, 1, '2024-05-12 07:19:54', 1, 1);
INSERT INTO `user_rate` VALUES (2, 9, '2024-05-12 07:19:54', 2, 1);
INSERT INTO `user_rate` VALUES (3, 9, '2024-05-12 07:19:54', 3, 1);
INSERT INTO `user_rate` VALUES (4, 9, '2024-05-12 07:19:54', 4, 1);
INSERT INTO `user_rate` VALUES (5, 9, '2024-05-12 07:19:54', 5, 1);
INSERT INTO `user_rate` VALUES (6, 9, '2024-05-12 07:19:54', 6, 1);
INSERT INTO `user_rate` VALUES (7, 5, '2024-05-12 07:19:54', 7, 1);
INSERT INTO `user_rate` VALUES (8, 2, '2024-05-12 07:19:54', 1, 2);
INSERT INTO `user_rate` VALUES (9, 1, '2024-05-12 07:19:54', 2, 2);
INSERT INTO `user_rate` VALUES (10, 3, '2024-05-12 07:19:54', 3, 2);
INSERT INTO `user_rate` VALUES (11, 7, '2024-05-12 07:19:54', 4, 2);
INSERT INTO `user_rate` VALUES (12, 9, '2024-05-12 07:19:54', 5, 2);
INSERT INTO `user_rate` VALUES (13, 9, '2024-05-12 07:19:54', 6, 2);
INSERT INTO `user_rate` VALUES (14, 9, '2024-05-12 07:19:54', 7, 2);
INSERT INTO `user_rate` VALUES (15, 1, '2024-05-12 07:19:54', 1, 3);
INSERT INTO `user_rate` VALUES (16, 9, '2024-05-12 07:19:54', 2, 3);
INSERT INTO `user_rate` VALUES (17, 8, '2024-05-12 07:19:54', 3, 3);
INSERT INTO `user_rate` VALUES (18, 6, '2024-05-12 07:19:54', 4, 3);
INSERT INTO `user_rate` VALUES (19, 9, '2024-05-12 07:19:54', 5, 3);
INSERT INTO `user_rate` VALUES (20, 9, '2024-05-12 07:19:54', 6, 3);
INSERT INTO `user_rate` VALUES (21, 1, '2024-05-12 07:19:54', 7, 3);
  
  
-- ----------------------------
-- Table structure for user_movie_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_collect`;
CREATE TABLE `user_movie_collect`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  -- UNIQUE INDEX `user_movie_collect_movie_id_user_id_0bd82515_uniq`(`movie_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `user_movie_collect_movie_id`(`movie_id` ASC) USING BTREE,
  INDEX `user_movie_collect_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_movie_collect_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_collect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_movie_collect
-- ----------------------------
INSERT INTO `user_movie_collect` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for user_movie_tags
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_tags`;
CREATE TABLE `user_movie_tags`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `tags_id` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_movie_tags_movie_id_tags_id`(`movie_id` ASC, `tags_id` ASC) USING BTREE,
  INDEX `user_movie_tags_movie_id`(`movie_id` ASC) USING BTREE,
  INDEX `user_movie_tags_tags_id`(`tags_id` ASC) USING BTREE,
  CONSTRAINT `user_movie_tags_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_tags_ibfk_2` FOREIGN KEY (`tags_id`) REFERENCES `user_tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_movie_tags
-- ----------------------------
INSERT INTO `user_movie_tags` VALUES (1, 1, 6);
INSERT INTO `user_movie_tags` VALUES (2, 1, 9);
INSERT INTO `user_movie_tags` VALUES (3, 1, 14);
INSERT INTO `user_movie_tags` VALUES (4, 2, 1);
INSERT INTO `user_movie_tags` VALUES (5, 2, 6);
INSERT INTO `user_movie_tags` VALUES (6, 2, 9);
INSERT INTO `user_movie_tags` VALUES (7, 2, 10);
INSERT INTO `user_movie_tags` VALUES (8, 2, 14);
INSERT INTO `user_movie_tags` VALUES (9, 3, 6);
INSERT INTO `user_movie_tags` VALUES (10, 3, 9);
INSERT INTO `user_movie_tags` VALUES (11, 3, 10);
INSERT INTO `user_movie_tags` VALUES (12, 4, 6);
INSERT INTO `user_movie_tags` VALUES (13, 4, 9);
INSERT INTO `user_movie_tags` VALUES (14, 4, 14);
INSERT INTO `user_movie_tags` VALUES (15, 5, 2);
INSERT INTO `user_movie_tags` VALUES (16, 5, 6);
INSERT INTO `user_movie_tags` VALUES (17, 5, 9);
INSERT INTO `user_movie_tags` VALUES (18, 5, 12);
INSERT INTO `user_movie_tags` VALUES (19, 5, 14);
INSERT INTO `user_movie_tags` VALUES (20, 6, 1);
INSERT INTO `user_movie_tags` VALUES (21, 6, 2);
INSERT INTO `user_movie_tags` VALUES (22, 6, 6);
INSERT INTO `user_movie_tags` VALUES (23, 7, 1);
INSERT INTO `user_movie_tags` VALUES (24, 7, 3);
INSERT INTO `user_movie_tags` VALUES (25, 7, 8);
INSERT INTO `user_movie_tags` VALUES (26, 8, 1);
INSERT INTO `user_movie_tags` VALUES (27, 8, 3);
INSERT INTO `user_movie_tags` VALUES (28, 8, 16);
INSERT INTO `user_movie_tags` VALUES (29, 9, 1);
INSERT INTO `user_movie_tags` VALUES (30, 9, 3);
INSERT INTO `user_movie_tags` VALUES (31, 10, 1);
INSERT INTO `user_movie_tags` VALUES (32, 10, 3);
INSERT INTO `user_movie_tags` VALUES (33, 11, 6);
INSERT INTO `user_movie_tags` VALUES (34, 11, 9);
INSERT INTO `user_movie_tags` VALUES (35, 11, 10);
INSERT INTO `user_movie_tags` VALUES (36, 11, 14);
INSERT INTO `user_movie_tags` VALUES (37, 12, 9);
INSERT INTO `user_movie_tags` VALUES (38, 12, 10);
INSERT INTO `user_movie_tags` VALUES (39, 12, 12);
INSERT INTO `user_movie_tags` VALUES (40, 12, 14);
INSERT INTO `user_movie_tags` VALUES (41, 13, 1);
INSERT INTO `user_movie_tags` VALUES (42, 13, 18);
INSERT INTO `user_movie_tags` VALUES (43, 13, 19);
INSERT INTO `user_movie_tags` VALUES (44, 14, 1);
INSERT INTO `user_movie_tags` VALUES (45, 14, 12);
INSERT INTO `user_movie_tags` VALUES (46, 15, 1);
INSERT INTO `user_movie_tags` VALUES (47, 15, 3);
INSERT INTO `user_movie_tags` VALUES (48, 15, 6);
INSERT INTO `user_movie_tags` VALUES (49, 15, 7);





-- ----------------------------
-- Table structure for user_tags
-- ----------------------------
DROP TABLE IF EXISTS `user_tags`;
CREATE TABLE `user_tags`  (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_tags
-- ----------------------------
INSERT INTO `user_tags` VALUES (1, '剧情');
INSERT INTO `user_tags` VALUES (2, '犯罪');
INSERT INTO `user_tags` VALUES (3, '爱情');
INSERT INTO `user_tags` VALUES (4, '同性');
INSERT INTO `user_tags` VALUES (5, '动作');
INSERT INTO `user_tags` VALUES (6, '喜剧');
INSERT INTO `user_tags` VALUES (7, '战争');
INSERT INTO `user_tags` VALUES (8, '灾难');
INSERT INTO `user_tags` VALUES (9, '动画');
INSERT INTO `user_tags` VALUES (10, '奇幻');
INSERT INTO `user_tags` VALUES (11, '历史');
INSERT INTO `user_tags` VALUES (12, '科幻');
INSERT INTO `user_tags` VALUES (13, '悬疑');
INSERT INTO `user_tags` VALUES (14, '冒险');
INSERT INTO `user_tags` VALUES (15, '音乐');
INSERT INTO `user_tags` VALUES (16, '歌舞');
INSERT INTO `user_tags` VALUES (17, '古装');
INSERT INTO `user_tags` VALUES (18, '家庭');
INSERT INTO `user_tags` VALUES (19, '传记');
INSERT INTO `user_tags` VALUES (20, '惊悚');
INSERT INTO `user_tags` VALUES (21, '武侠');
INSERT INTO `user_tags` VALUES (22, '儿童');
INSERT INTO `user_tags` VALUES (23, '纪录片');
INSERT INTO `user_tags` VALUES (24, '恐怖');
INSERT INTO `user_tags` VALUES (25, '西部');
INSERT INTO `user_tags` VALUES (26, '情色');
INSERT INTO `user_tags` VALUES (27, '运动');
INSERT INTO `user_tags` VALUES (28, '真人秀');
INSERT INTO `user_tags` VALUES (29, '短片');



-- ----------------------------
-- Table structure for user_user
-- ----------------------------
DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_user
-- ----------------------------
INSERT INTO `user_user` VALUES (1, '1111', '1111', '12345678@qq.com');
INSERT INTO `user_user` VALUES (2, 'aaaaaa', 'aaaaaa', 'aaa@aa.com');
INSERT INTO `user_user` VALUES (3, 'liyang', '123456', 'liyang@qq.com');



-- ----------------------------
-- Table structure for user_usertagprefer
-- ----------------------------
DROP TABLE IF EXISTS `user_usertagprefer`;
CREATE TABLE `user_usertagprefer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `tag_id` smallint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_usertagprefer_tag_id_5729f563`(`tag_id` ASC) USING BTREE,
  INDEX `user_usertagprefer_user_id_9e6cb135`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_usertagprefer_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `user_tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_usertagprefer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for user_company
-- ----------------------------
DROP TABLE IF EXISTS `user_company`;
CREATE TABLE `user_company`  (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `city` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_company` VALUES (1, '迪士尼影业', '伯班克');
INSERT INTO `user_company` VALUES (2, '环球影片公司', '洛杉矶');
INSERT INTO `user_company` VALUES (3, '寰亚电影制作有限公司', '杭州');
INSERT INTO `user_company` VALUES (4, '派拉蒙影业公司', '好莱坞');
INSERT INTO `user_company` VALUES (5, '顶峰娱乐', '圣莫尼卡');
INSERT INTO `user_company` VALUES (6, 'Castle Rock Entertainment', '洛杉矶');
INSERT INTO `user_company` VALUES (7, '哥伦比亚电影公司', '洛杉矶');
INSERT INTO `user_company` VALUES (8, 'SHIN-EI动画', '东京');
INSERT INTO `user_company` VALUES (9, 'Regal Films', '诺克斯维尔');



-- ----------------------------
-- Table structure for user_director
-- ----------------------------
DROP TABLE IF EXISTS `user_director`;
CREATE TABLE `user_director`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gender` enum("男", "女") CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birthday` date NOT NULL CHECK(birthday BETWEEN '1800-01-01' AND '2074-01-01'),
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nationality` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prize` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_director` VALUES(1, "拜伦·霍华德", "男", "1971-02-28", 
"拜伦·霍华德是迪士尼动画工作室的一位导演和动画师。他曾参与多部迪士尼动画电影的制作，包括《闪电狗》（Bolt）、《魔发奇缘》（Tangled）和《疯狂动物城》（Zootopia），其中《疯狂动物城》获得了广泛的赞誉和多个奖项。", 
"美国", "奥斯卡最佳动画长片奖（例如，《疯狂动物城》Zootopia）、安妮奖（Annie Awards）、英国电影学院奖（BAFTA）等。", "director_images/p2324166991.jpg");
INSERT INTO `user_director` VALUES(2, "彼特·道格特 ", "男", "1968-10-09", 
"彼特·道格特是皮克斯的首席创意官之一，也是一位多产的导演和编剧。他导演了多部成功的动画电影，包括《怪兽公司》（Monsters, Inc.）、《飞屋环游记》（Up）、《头脑特工队》（Inside Out）等。这些作品不仅在商业上取得巨大成功，也获得了观众和评论家的高度评价。", 
"美国", "奥斯卡最佳动画长片奖、安妮奖等。", "director_images/p2399395492.jpg");
INSERT INTO `user_director` VALUES(3, "乔什·库雷", "男", "1970-02-20", 
"乔什·库雷在动画行业有着丰富的经验，他在皮克斯动画工作室参与了多部动画电影的制作。他最为人熟知的作品是担任导演的《玩具总动员4》（Toy Story 4），这部电影是广受欢迎的《玩具总动员》系列电影的续集，并且获得了观众和评论家的好评。", 
"美国", "奥斯卡最佳动画长片奖、安妮奖等。", "director_images/p2493111108.jpg");
INSERT INTO `user_director` VALUES(4, "凯尔·巴尔达 ", "男", "1972-05-25", 
"凯尔·巴尔达在动画行业有着丰富的经验，尤其是在照明娱乐公司。他曾参与了多部成功的动画电影的制作，包括《神偷奶爸》（Despicable Me）系列", 
"美国", "第68届金球奖，第38届动画安妮奖", "director_images/p2500889015.jpg");
INSERT INTO `user_director` VALUES(5, "彭浩翔", "男", "1973-07-03", 
"彭浩翔电影集合黑色幽默、恐怖、离奇荒诞与警匪等元素。自幼热爱电影，14岁时曾用兄长的录像机自导自演短片《智勇三雄》，中学时为了看一场阿诺·施瓦辛格的电影而跟自己女友分手。毕业后曾经修读台大先修班，回港后曾在亚洲电视担任喜剧综艺科的节目编剧，并在报纸与杂志撰写影评及小说。2010年《志明与春娇》，电影讲述新修订禁烟条例实施后，烟民围在户外烟灰缸吸烟，因而产生的一段男女关系。彭浩翔与拍档麦曦茵凭此电影获得第30届香港电影金像奖最佳编剧奖。", 
"中国", "第30届香港电影金像奖最佳编剧奖。", "director_images/p2506333621.jpg");
INSERT INTO `user_director` VALUES(6, "詹姆斯·卡梅隆", "男", "1954-08-16", 
"詹姆斯·卡梅隆是好莱坞最具影响力的导演之一，以其对电影工业的技术贡献和开创性的电影作品而著称。他导演的作品包括《终结者》（The Terminator）、《异形2》（Aliens）、《深渊》（The Abyss）、《终结者2：审判日》（Terminator 2: Judgment Day）、《泰坦尼克号》（Titanic）和《阿凡达》（Avatar）。这些电影不仅在商业上取得了巨大成功，而且在艺术上也获得了高度评价。", 
"美国", "奥斯卡最佳导演奖、奥斯卡最佳影片奖、金球奖、英国电影学院奖等。", "director_images/p644244925.jpg");
INSERT INTO `user_director` VALUES(7, "达米恩·查泽雷", "男", "1985-01-19", 
"达米恩·查泽雷是当代电影界最令人兴奋的年轻导演之一。他执导的电影在评论界和商业上都取得了成功。他的代表作包括《爆裂鼓手》（Whiplash）、《爱乐之城》（La La Land）和《登月第一人》（First Man）。《爆裂鼓手》赢得了广泛的赞誉，并为他赢得了奥斯卡最佳改编剧本奖提名。《爱乐之城》更是获得了多项奥斯卡奖，包括最佳导演奖，使他成为奥斯卡历史上最年轻的最佳导演获奖者。", 
"美国", "奥斯卡最佳导演奖，金球奖，英国电影学院奖", "director_images/p2437536981.jpg");
INSERT INTO `user_director` VALUES(8, "理查德·林克莱特", "男", "1960-07-30", 
"林克莱特以其长篇电影系列《少年时代》（Boyhood）、《日落之前》（Before Sunset）和《日落之后》（Before Midnight）等作品而闻名。他的作品经常探讨时间、关系和个人成长等主题。", 
"美国", "奥斯卡最佳导演提名、金球奖最佳导演提名、柏林国际电影节银熊奖、独立精神奖等。", "director_images/p2905116773.jpg");
INSERT INTO `user_director` VALUES(9, "马克·汀戴尔", "男", "1960-11-23", 
"马克·汀戴尔在动画电影界有着丰富的经验，他曾担任多部动画电影的导演，其中最著名的作品是《猫儿历险记》（The Cat's Meow）和《熊的传说》（Brother Bear）。", 
"美国", "安妮奖等", "director_images/p1356764503.08.jpg");
INSERT INTO `user_director` VALUES(10, "今井一晓", "男", "1980-06-29", 
"在日本的动画工作室工作，参与了多部动画电影或系列的导演工作。代表作有：《哆啦A梦》", 
"日本", "暂无", "director_images/p1526998131.45.jpg");
INSERT INTO `user_director` VALUES(11, "加布里埃莱·穆奇诺", "男", "1967-05-20", 
"加布里尔·穆奇诺（Gabriele Muccino），1967年5月20日出生于意大利罗马，意大利导演、编剧、制片人。", 
"意大利", "第13届上海国际电影节主竞赛单元-最佳影片奖，第18届圣丹斯国际电影节观众奖-世界电影单元，	第54届意大利大卫奖大卫青年奖", "director_images/p2641779759.jpg");
INSERT INTO `user_director` VALUES(12, "彼得·威尔", "男", "1944-08-21", 
"彼得•威尔出生在澳大利亚悉尼，原名彼得•林德塞•威尔，父亲是一位房地产经纪人。曾因去欧洲旅行了一段时间，回来以后他进入了一家电影公司，并学会了电影拍摄和制作的技巧。1971年他拍摄了自己的处女作《三个要走》，随后拍摄的《悬崖下的野餐》成为其经典之作。1989年威尔又和罗宾•威廉斯合作，拍摄了影片《死亡诗社》，影片获得了奥斯卡提名。1998年，威尔和金•凯瑞合作拍摄了电影《楚门的世界》，再次获得了奥斯卡提名。通观威尔的影片，而他一手发现或捧红了包括梅尔•吉布森，哈里森•福特等巨星。", 
"澳大利亚", "第76届奥斯卡金像奖最佳影片 (提名)，第71届奥斯卡金像奖最佳导演 (提名) ，第44届柏林国际电影节主竞赛单元金熊奖 (提名)", "director_images/p4360.jpg");



-- ----------------------------
-- Table structure for user_actor
-- ----------------------------
DROP TABLE IF EXISTS `user_actor`;
CREATE TABLE `user_actor`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gender` enum("男", "女") CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birthday` date NOT NULL CHECK(birthday BETWEEN '1800-01-01' AND '2074-01-01'),
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nationality` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prize` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_actor` VALUES(1, "金妮弗·古德温", "女", "1978-05-22", 
"金妮弗·古德温因在电视剧《大城小妞》（Big Love）和《童话镇》（Once Upon a Time）中的表现而广为人知。她在《童话镇》中饰演白雪公主，这一角色让她获得了广泛的认可。", 
"美国", "第38届土星奖最佳电视女主角奖提名", "actor_images/p9652.jpg");
INSERT INTO `user_actor` VALUES(2, "杰森·贝特曼", "男", "1969-01-14", 
"杰森·贝特曼在1980年代初就开始了他的演艺生涯，最初以童星的身份出现在电视剧中。他因在电视剧《发展受阻》（Arrested Development）中饰演迈克尔·布兰查德（Michael Bluth）而获得广泛认可，并在后来的职业生涯中成功转型为成人演员。贝特曼还因在Netflix剧集《黑钱胜地》（Ozark）中的表演而获得赞誉。", 
"美国", "第70届艾美奖，第71届金球奖", "actor_images/p18772.jpg");
INSERT INTO `user_actor` VALUES(3, "艾米·波勒", "女", "1971-09-16", 
"艾米·波勒因在《周六夜现场》（Saturday Night Live）的表演和在电视剧《公园与游憩》（Parks and Recreation）中扮演莱斯利·诺普（Leslie Knope）而广受欢迎。她也是《妈妈》（Inside Out）中的声音演员，为角色“快乐”配音。", 
"美国", "第67届金球奖，第65届艾美奖", "actor_images/p48859.jpg");
INSERT INTO `user_actor` VALUES(4, "菲利丝·史密斯", "女", "1951-07-10", 
"菲利丝·史密斯最初以漫画家的身份在《The Patterson》等漫画系列中工作。她后来转行进入电视行业，最著名的角色是在电视剧《办公室》（The Office）中饰演的办公室助理琳达·波特（Linda Porter）。此外，她也因在动画电影《头脑特工队》（Inside Out）中为角色“悲伤”配音而获得广泛认可。", 
"美国", "第88届奥斯卡金像奖", "actor_images/p1436104846.51.jpg");
INSERT INTO `user_actor` VALUES(5, "汤姆·汉克斯 ", "男", "1956-07-09", 
"汤姆·汉克斯以其在多部电影中的出色表演而闻名，包括《阿甘正传》（Forrest Gump）、《费城故事》（Philadelphia）、《拯救大兵瑞恩》（Saving Private Ryan）和《美丽人生》（Cast Away）。他以其亲切的形象和多样化的角色选择而受到观众和评论家的喜爱。", 
"美国", "第66届奥斯卡金像奖，第77届奥斯卡金像奖", "actor_images/p2564490264.jpg");
INSERT INTO `user_actor` VALUES(6, "蒂姆·艾伦", "男", "1953-06-13", 
"蒂姆·艾伦最初以其在脱口秀中的表演而知名，后来因在情景喜剧《家居装饰》（Home Improvement）中饰演蒂米·泰勒（Tim \"The Tool Man\" Taylor）而成名。此外，他在迪士尼·皮克斯的动画电影《玩具总动员》（Toy Story）系列中为巴兹·光年（Buzz Lightyear）配音，也广受喜爱。", 
"美国", "第48届黄金时段艾美奖", "actor_images/p6409.jpg");
INSERT INTO `user_actor` VALUES(7, "史蒂夫·卡瑞尔", "男", "1962-08-16", 
"史蒂夫·卡瑞尔最初以喜剧演员的身份在电视节目《The Dana Carvey Show》中亮相。他因在电视剧《办公室》（The Office）中扮演迈克尔·斯科特（Michael Scott）而获得广泛认可，并因此角色获得了金球奖。此外，卡瑞尔在多部电影中也有出色表现，包括《40岁的老处男》（The 40-Year-Old Virgin）、《糊涂侦探》（Get Smart）和《狐狸猎手》（Foxcatcher）。", 
"美国", "第64届金球奖，第87届奥斯卡金像奖", "actor_images/p1898210811.jpg");
INSERT INTO `user_actor` VALUES(8, "克里斯汀·韦格", "女", "1973-08-22", 
"克里斯汀·韦格因在《周六夜现场》（Saturday Night Live）的表演而成名，她在该节目中担任演员和编剧多年。她还在多部电影中担任主角，包括《伴娘》（Bridesmaids）和《捉鬼敢死队》（Ghostbusters）的重启版。韦格以其独特的幽默感和多样化的角色而受到观众的喜爱。", 
"美国", "第69届金球奖", "actor_images/p6537.jpg");
INSERT INTO `user_actor` VALUES(9, "皮埃尔·柯芬", "男", "1967-03-26", 
"皮埃尔·柯芬最著名的身份是动画电影《神偷奶爸》（Despicable Me）系列和《小黄人大眼萌》（Minions）系列的导演和制片人。他也是这些电影中“小黄人”角色的创造者和主要动画师。柯芬以其在动画领域的创新和幽默感而受到赞誉。", 
"美国", "第28届安妮奖", "actor_images/p1389806916.36.jpg");
INSERT INTO `user_actor` VALUES(10, "杨千嬅 ", "女", "1974-02-03", 
"杨千嬅以其独特的音乐风格和感人的情歌而闻名。她在1990年代末至2000年代初的香港音乐界取得了巨大成功，发行了多张畅销专辑。除了音乐事业，杨千嬅还涉足影视行业，参与了多部电影和电视剧的演出。", 
"中国", "IFPI香港唱片销量大奖", "actor_images/p40056.jpg");
INSERT INTO `user_actor` VALUES(11, "余文乐", "男", "1981-11-13", 
"余文乐在1990年代末开始其演艺生涯，最初以模特身份进入娱乐圈。2000年代初，他开始在电影和电视剧中担任演员，逐渐积累了知名度。他在多部电影中的表现受到认可，包括《无间道II》、《春娇与志明》系列以及《一念无明》等。", 
"中国", "香港电影金像奖最佳新演员提名", "actor_images/p47724.jpg");
INSERT INTO `user_actor` VALUES(12, "莱昂纳多·迪卡普里奥", "男", "1974-11-11", 
"莱昂纳多·迪卡普里奥在青少年时期就开始了他的演艺生涯，因在电视剧《成长的烦恼》（Growing Pains）中的表现而受到关注。他后来因在电影《泰坦尼克号》（Titanic）中的杰克·道森（Jack Dawson）一角而成为国际巨星。迪卡普里奥以其在多种类型电影中的出色表演而闻名，包括《盗梦空间》（Inception）、《了不起的盖茨比》（The Great Gatsby）、《荒野猎人》（The Revenant）等。", 
"美国", "第88届奥斯卡金像奖，英国电影和电视艺术学院奖（BAFTA）", "actor_images/p643151415.jpg");
INSERT INTO `user_actor` VALUES(13, "凯特·温斯莱特", "女", "1975-10-05", 
"凯特·温斯莱特在1990年代初开始她的演艺生涯，并迅速成为国际知名的演员。她因在1997年的电影《泰坦尼克号》（Titanic）中饰演罗丝·德威特·卡特（Rose DeWitt Bukater）而成为全球巨星。此后，她在多部电影中展现了卓越的演技，包括《朗读者》（The Reader）、《革命之路》（Revolutionary Road）和《小混乱》（Little Children）。", 
"英国", "第81届奥斯卡金像奖，艾美奖和英国电影和电视艺术学院奖（BAFTA）", "actor_images/p643082696.jpg");
INSERT INTO `user_actor` VALUES(14, "瑞恩·高斯林", "男", "1980-11-12", 
"瑞恩·高斯林在2000年代初因在电视剧《家有杰克》（The Mickey Mouse Club）中的表现而开始受到关注。他后来因在多部电影中的出色表演而成为国际知名演员，包括《恋恋笔记本》（The Notebook）、《蓝色情人节》（Blue Valentine）、《驾驶我的车》（Drive）、《爱乐之城》（La La Land）和《登月第一人》（First Man）。", 
"加拿大", "奥斯卡奖提名、金球奖提名", "actor_images/p1132061191.jpg");
INSERT INTO `user_actor` VALUES(15, "艾玛·斯通", "女", "1988-11-06", 
"艾玛·斯通在青少年时期就开始了她的演艺生涯，最初在电视剧和剧场中亮相。她因在2007年的电影《太坏了》（Superbad）中的表现而开始受到关注。此后，她在多部电影中担任主演，包括《僵尸之地》（Zombieland）、《社交网络》（The Social Network）、《鸟人》（Birdman）、《爱乐之城》（La La Land）等。", 
"美国", "第89届奥斯卡金像奖，英国电影和电视艺术学院奖（BAFTA）", "actor_images/p2436044101.jpg");
INSERT INTO `user_actor` VALUES(16, "伊桑·霍克", "男", "1970-11-06", 
"伊桑·霍克在1980年代末开始了他的演艺生涯，并在1990年代初通过电影《死亡诗社》（Dead Poets Society）和《危险人物》（White Fang）等作品获得了广泛的认可。他以在理查德·林克莱特的“爱在”系列电影（《爱在黎明破晓前》、《爱在日落黄昏时》和《爱在午夜降临前》）中的表演而闻名，这些电影展示了他深厚的演技和对角色的深刻理解。", 
"美国", "奥斯卡最佳男配角提名", "actor_images/p643144270.jpg");
INSERT INTO `user_actor` VALUES(17, "朱莉·德尔佩", "女", "1971-12-21", 
"朱莉·德尔佩在法国长大，她的父亲是法国戏剧演员艾伯特·德尔佩（Albert Delpy）。她在很小的时候就开始了演艺生涯，十几岁时就成为了一名成功的演员。她因在1995年的电影《爱在黎明破晓前》（Before Sunrise）中的表演而获得国际认可，随后在续集《爱在日落黄昏时》（Before Sunset）和《爱在午夜降临前》（Before Midnight）中继续饰演同一角色。", 
"法国", "奥斯卡最佳改编剧本提名", "actor_images/p2561541784.jpg");
INSERT INTO `user_actor` VALUES(18, "克里斯·帕拉特", "男", "1979-06-21", 
"克里斯·帕拉特最初在电视剧《帕克》（Everwood）中获得知名度。他后来因在电视剧《公园与游憩》（Parks and Recreation）中饰演安迪·德怀尔（Andy Dwyer）而受到更广泛的欢迎。帕拉特在电影界也取得了巨大成功，特别是在科幻电影《银河护卫队》（Guardians of the Galaxy）中饰演彼得·奎尔/星爵（Peter Quill/Star-Lord）和在《侏罗纪世界》（Jurassic World）系列中饰演欧文·格雷迪（Owen Grady）。", "
美国", "青少年选择奖", "actor_images/p2225618346.jpg");
INSERT INTO `user_actor` VALUES(19, "塞缪尔·杰克逊", "男", "1948-12-21", 
"塞缪尔·杰克逊在1970年代开始了他的演艺生涯，并在1980年代逐渐获得认可。他因在电影《丛林热》（Jungle Fever）、《低俗小说》（Pulp Fiction）和《危险关系》（A Time to Kill）等中的表演而受到赞誉。杰克逊在漫威电影宇宙（Marvel Cinematic Universe）中饰演的尼克·弗瑞（Nick Fury）角色也使他成为全球知名的演员。", 
"美国", "奥斯卡奖提名、金球奖提名", "actor_images/p643142490.jpg");
INSERT INTO `user_actor` VALUES(20, "水田山葵", "女", "1967-11-25", 
"水田山葵以其在多个日本电视节目中的表演而知名，特别是在喜剧和脱口秀领域。她以其独特的幽默感和直言不讳的风格而受到观众的喜爱。除了在电视上的表演，水田山葵还活跃于广播和出版界。", 
"日本", "暂无", "actor_images/p2523869178.jpg");
INSERT INTO `user_actor` VALUES(21, "大原惠美", "女", "1970-11-26", 
"大原惠美以其在动画领域的声优工作而知名，尤其是在《神奇宝贝》（Pokémon）系列中为小霞（Misty）配音而广受欢迎。她的声音表现力强，能够为各种角色提供独特的声音。", 
"日本", "暂无", "actor_images/p1358580306.49,jpg");
INSERT INTO `user_actor` VALUES(22, "威尔·史密斯", "男", "1968-09-25", 
"威尔·史密斯最初以说唱歌手的身份在1980年代中期开始了他的艺术生涯，他和DJ Jazzy Jeff组成的组合\"DJ Jazzy Jeff \& The Fresh Prince\"非常成功。1990年代，他转型成为演员，因在电视剧《新鲜王子妙事多》（The Fresh Prince of Bel-Air）中的表演而成名。此后，他在电影界取得了巨大成功，主演了多部票房大片，如《独立日》（Independence Day）、《黑衣人》（Men in Black）系列、《我是传奇》（I Am Legend）和《幸福来敲门》（The Pursuit of Happyness）。", 
"美国", "奥斯卡最佳男主角提名", "actor_images/p2261641292.jpg");
INSERT INTO `user_actor` VALUES(23, "贾登·史密斯", "男", "1998-07-08", 
"贾登·史密斯是著名演员威尔·史密斯（Will Smith）和贾达·萍克特·史密斯（Jada Pinkett Smith）的儿子。他在很小的时候就开始了演艺生涯，最初在父亲的电影《当幸福来敲门》（The Pursuit of Happyness）中扮演角色。此后，他在多部电影中担任主演，包括《地球停转之日》（The Day the Earth Stood Still）和《功夫梦》（The Karate Kid）。", 
"美国", "暂无", "actor_images/p1519305434.22.jpg");
INSERT INTO `user_actor` VALUES(24, "金·凯瑞", "男", "1962-01-17", 
"金·凯瑞在1980年代开始了他的演艺生涯，最初是作为一名单口喜剧演员。1990年代，他通过一系列喜剧电影获得了国际知名度，包括《王牌天神》（Ace Ventura: Pet Detective）、《面具》（The Mask）、《阿呆与阿瓜》（Dumb and Dumber）和《楚门的世界》（The Truman Show）。他以其在喜剧和戏剧角色中的出色表演而受到赞誉。", 
"加拿大", "金球奖最佳男演员奖", "actor_images/p615.jpg");
INSERT INTO `user_actor` VALUES(25, "劳拉·琳妮", "女", "1964-02-05", 
"劳拉·琳妮在1980年代末开始她的职业生涯，她在舞台剧和电视剧中的表现使她获得了早期的认可。她因在电影《驾驶小姐》（Driving Miss Daisy）、《爱在春天来临前》（Love Actually）和《萨维奇一家》（Savage Grace）等中的表演而获得广泛赞誉。此外，她在电视剧《大西洋帝国》（Boardwalk Empire）中的表现也赢得了观众的喜爱。", 
"美国", "奥斯卡最佳女主角奖，艾美奖", "actor_images/p1283685959.jpg");



-- ----------------------------
-- Table structure for user_movie_director
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_director`;
CREATE TABLE `user_movie_director`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `director_id` mediumint NOT NULL,
  `duty` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_movie_director_movie_id`(`movie_id` ASC) USING BTREE,
  INDEX `user_movie_director_director_id`(`director_id` ASC) USING BTREE,
  CONSTRAINT `user_movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `user_director` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_movie_director` VALUES(1, 1, 1, '导演');
INSERT INTO `user_movie_director` VALUES(2, 2, 2, '导演');
INSERT INTO `user_movie_director` VALUES(3, 3, 3, '导演');
INSERT INTO `user_movie_director` VALUES(4, 4, 4, '导演');
INSERT INTO `user_movie_director` VALUES(5, 5, 4, '导演');
INSERT INTO `user_movie_director` VALUES(6, 6, 5, '导演');
INSERT INTO `user_movie_director` VALUES(7, 7, 6, '导演');
INSERT INTO `user_movie_director` VALUES(8, 8, 7, '导演');
INSERT INTO `user_movie_director` VALUES(9, 9, 8, '导演');
INSERT INTO `user_movie_director` VALUES(10, 10, 8, '导演');
INSERT INTO `user_movie_director` VALUES(11, 11, 9, '导演');
INSERT INTO `user_movie_director` VALUES(12, 12, 10, '导演');
INSERT INTO `user_movie_director` VALUES(13, 13, 11, '导演');
INSERT INTO `user_movie_director` VALUES(14, 14, 12, '导演');
INSERT INTO `user_movie_director` VALUES(15, 15, 13, '导演');

-- ----------------------------
-- Table structure for user_movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_actor`;
CREATE TABLE `user_movie_actor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `actor_id` mediumint NOT NULL,
  `duty` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_movie_actor_movie_id`(`movie_id` ASC) USING BTREE,
  INDEX `user_movie_actor_actor_id`(`actor_id` ASC) USING BTREE,
  CONSTRAINT `user_movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `user_actor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_movie_actor` VALUES(1, 1, 1, '主角');
INSERT INTO `user_movie_actor` VALUES(2, 1, 2, '主角');
INSERT INTO `user_movie_actor` VALUES(3, 2, 3, '主角');
INSERT INTO `user_movie_actor` VALUES(4, 2, 4, '主角');
INSERT INTO `user_movie_actor` VALUES(5, 3, 5, '主角');
INSERT INTO `user_movie_actor` VALUES(6, 3, 6, '主角');
INSERT INTO `user_movie_actor` VALUES(7, 4, 7, '主角');
INSERT INTO `user_movie_actor` VALUES(8, 4, 8, '主角');
INSERT INTO `user_movie_actor` VALUES(9, 5, 7, '主角');
INSERT INTO `user_movie_actor` VALUES(10, 5, 9, '主角');
INSERT INTO `user_movie_actor` VALUES(11, 6, 10, '主角');
INSERT INTO `user_movie_actor` VALUES(12, 6, 11, '主角');
INSERT INTO `user_movie_actor` VALUES(13, 7, 12, '主角');
INSERT INTO `user_movie_actor` VALUES(14, 7, 13, '主角');
INSERT INTO `user_movie_actor` VALUES(15, 8, 14, '主角');
INSERT INTO `user_movie_actor` VALUES(16, 8, 15, '主角');
INSERT INTO `user_movie_actor` VALUES(17, 9, 16, '主角');
INSERT INTO `user_movie_actor` VALUES(18, 9, 17, '主角');
INSERT INTO `user_movie_actor` VALUES(19, 10, 16, '主角');
INSERT INTO `user_movie_actor` VALUES(20, 10, 17, '主角');
INSERT INTO `user_movie_actor` VALUES(21, 11, 18, '主角');
INSERT INTO `user_movie_actor` VALUES(22, 11, 19, '主角');
INSERT INTO `user_movie_actor` VALUES(23, 12, 20, '主角');
INSERT INTO `user_movie_actor` VALUES(24, 12, 21, '主角');
INSERT INTO `user_movie_actor` VALUES(25, 13, 22, '主角');
INSERT INTO `user_movie_actor` VALUES(26, 13, 23, '主角');
INSERT INTO `user_movie_actor` VALUES(27, 14, 24, '主角');
INSERT INTO `user_movie_actor` VALUES(28, 14, 25, '主角');
INSERT INTO `user_movie_actor` VALUES(29, 15, 26, '主角');
INSERT INTO `user_movie_actor` VALUES(30, 15, 27, '主角');


SET FOREIGN_KEY_CHECKS = 1;
