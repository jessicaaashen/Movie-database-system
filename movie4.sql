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
  `create_time` datetime NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_comment_movie_id_655977b7`(`movie_id` ASC) USING BTREE,
  INDEX `user_comment_user_id_d9d51f62`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
INSERT INTO `user_comment` VALUES (1, 'very good', '2021-05-15 01:19:04', 18151, 401);
INSERT INTO `user_comment` VALUES (2, 'nice movie', '2022-02-27 07:55:27', 18151, 402);
INSERT INTO `user_comment` VALUES (3, '阿打发打发', '2024-05-30 09:29:01', 18151, 403);

-- ----------------------------
-- Table structure for user_likecomment
-- ----------------------------
DROP TABLE IF EXISTS `user_likecomment`;
CREATE TABLE `user_likecomment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_likecomment_comment_id_4c38348f`(`comment_id` ASC) USING BTREE,
  INDEX `user_likecomment_user_id_aa40dcf2`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_likecomment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `user_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_likecomment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_likecomment
-- ----------------------------

-- ----------------------------
-- Table structure for user_movie
-- ----------------------------
DROP TABLE IF EXISTS `user_movie`;
CREATE TABLE `user_movie`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  -- `director` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `country` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `years` date NOT NULL,															-- 这里应该是YEAR类型，但是DATE也没有问题
  -- `leader` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  -- `d_rate_nums` int NOT NULL,
  `d_rate` decimal(3,1) NOT NULL,
  `intro` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `num` int NOT NULL,
  `image_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,

  -- 以下字段是我新加入的
  `duration` smallint NOT NULL,
  `company_id` smallint NULL,
  `state` enum("在映","下线","重映") CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `language` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `user_movie_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `user_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20332 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_movie
-- ----------------------------
  -- INSERT INTO `user_movie` VALUES (18151, '肖申克的救赎 The Shawshank Redemption', '弗兰克·德拉邦特', ' 美国', '1994-09-10', '蒂姆·罗宾斯/摩根·弗里曼/鲍勃·冈顿/威廉姆·赛德勒/克兰西·布朗/吉尔·贝罗斯/马克·罗斯顿/詹姆斯·惠特摩/杰弗里·德曼/拉里·布兰登伯格/尼尔·吉恩托利/布赖恩·利比/大卫·普罗瓦尔/约瑟夫·劳格诺/祖德·塞克利拉/保罗·麦克兰尼/芮妮·布莱恩/阿方索·弗里曼/V·J·福斯特/弗兰克·梅德拉诺/马克·迈尔斯/尼尔·萨默斯/耐德·巴拉米/布赖恩·戴拉特/唐·麦克马纳斯', 9, '9.7', '\n                                    　　20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德（摩根·弗里曼 Morgan Freeman 饰），请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步……\n                                        \n                                    　　本片根据著名作家斯蒂芬·金（Stephen Edwin King）的...\n                            ', 35, 'image_link', 'movie_cover/p480747492.jpg', 'https://www.imdb.com/title/tt0111161', 'https://movie.douban.com/subject/1292052/', '1292052',100,1,'下线','英语');
  INSERT INTO `user_movie` VALUES (18152, '霸王别姬', ' 中国大陆 / 中国香港', '1993-01-01', 9.6, '\n                                　　段小楼（张丰毅）与程蝶衣（张国荣）是一对打小一起长大的师兄弟，两人一个演生，一个饰旦，一向配合天衣无缝，尤其一出《霸王别姬》，更是誉满京城，为此，两人约定合演一辈子《霸王别姬》。但两人对戏剧与人生关系的理解有本质不同，段小楼深知戏非人生，程蝶衣则是人戏不分。\n                                    \n                                　　段小楼在认为该成家立业之时迎娶了名妓菊仙（巩俐），致使程蝶衣认定菊仙是可耻的第三者，使段小楼做了叛徒，自此，三人围绕一出《霸王别姬》生出的爱恨情仇战开始随着时代风云的变迁不断升级，终酿成悲剧。\n                        ', 2, 'movie_cover/p2561716440.jpg', 180 ,2,'下线','英语');
-- INSERT INTO `user_movie` VALUES (18153, '阿甘正传 Forrest Gump', '罗伯特·泽米吉斯', ' 美国', '1994-06-23', '汤姆·汉克斯/罗宾·怀特/加里·西尼斯/麦凯尔泰·威廉逊/莎莉·菲尔德/海利·乔·奥斯蒙/迈克尔·康纳·亨弗里斯/哈罗德·G·赫瑟姆/山姆·安德森/伊俄涅·M·特雷奇/彼得·道博森/希芳·法隆/伊丽莎白·汉克斯/汉娜·豪尔/克里斯托弗·琼斯/罗布·兰德里/杰森·麦克奎尔/桑尼·施罗耶/艾德·戴维斯/丹尼尔C.斯瑞派克/大卫·布里斯宾/德博拉·麦克蒂尔/艾尔·哈林顿/阿非莫·奥米拉/约翰·沃德斯塔德/迈克尔·伯吉斯/埃里克·安德伍德/拜伦·明斯/斯蒂芬·布吉格沃特/约翰·威廉·高尔特/希拉里·沙普兰/伊莎贝尔·罗斯/理查德·达历山德罗/迪克·史迪威/迈克尔-杰斯/杰弗里·布莱克/瓦妮莎·罗斯/迪克·卡维特/马拉·苏查雷特扎/乔·阿拉斯奇/W·本森·泰瑞', 9, '9.5', '\n                                　　阿甘（汤姆·汉克斯 饰）于二战结束后不久出生在美国南方阿拉巴马州一个闭塞的小镇，他先天弱智，智商只有75，然而他的妈妈是一个性格坚强的女性，她常常鼓励阿甘“傻人有傻福”，要他自强不息。\n                                    \n                                　　阿甘像普通孩子一样上学，并且认识了一生的朋友和至爱珍妮（罗宾·莱特·潘 饰），在珍妮和妈妈的爱护下，阿甘凭着上帝赐予的“飞毛腿”开始了一生不停的奔跑。\n                                    \n                                　　阿甘成为橄榄球巨星、越战英雄、乒乓球外交使者、亿万富翁，但是，他始终忘不了珍妮，几次匆匆的相聚和离别，更是加深了阿甘的思念。\n                                    \n                                　　有一天，阿甘收到珍妮的信，他们终于又要见面……\n                        ', 0, 'image_link', 'movie_cover/p1484728154.jpg', 'https://www.imdb.com/title/tt0109830', 'https://movie.douban.com/subject/1292720/', '1292720',144,2,'下线','意大利语');
-- INSERT INTO `user_movie` VALUES (18154, '这个杀手不太冷 Léon', '吕克·贝松', ' 法国', '1994-09-14', '让·雷诺/娜塔莉·波特曼/加里·奥德曼/丹尼·爱罗/彼得·阿佩尔/迈克尔·巴达鲁科/艾伦·格里尼/伊丽莎白·瑞根/卡尔·马图斯维奇/弗兰克·赛格/麦温/乔治·马丁/罗伯特·拉萨多/亚当·布斯奇/马里奥·托迪斯科/萨米·纳塞利', 9, '9.4', '\n                                　　里昂（让·雷诺饰）是名孤独的职业杀手，受人雇佣。一天，邻居家小姑娘马蒂尔达（纳塔丽·波特曼饰)敲开他的房门，要求在他那里暂避杀身之祸。原来邻居家的主人是警方缉毒组的眼线，只因贪污了一小包毒品而遭恶警（加里·奥德曼饰）杀害全家的惩罚。马蒂尔达得到里昂的留救，幸免于难，并留在里昂那里。里昂教小女孩使枪，她教里昂法文，两人关系日趋亲密，相处融洽。\n                                    \n                                　　女孩想着去报仇，反倒被抓，里昂及时赶到，将女孩救回。混杂着哀怨情仇的正邪之战渐次升级，更大的冲突在所难免……\n                        ', 2, 'image_link', 'movie_cover/p511118051.jpg', 'https://www.imdb.com/title/tt0110413', 'https://movie.douban.com/subject/1295644/', '1295644',180,1,'在映','中文');
-- INSERT INTO `user_movie` VALUES (18155, '美丽人生 La vita è bella', '罗伯托·贝尼尼', ' 意大利', '2020-01-03', '罗伯托·贝尼尼/尼可莱塔·布拉斯基/乔治·坎塔里尼/朱斯蒂诺·杜拉诺/赛尔乔·比尼·布斯特里克/玛丽萨·帕雷德斯/霍斯特·布赫霍尔茨/利迪娅·阿方西/朱利亚娜·洛约迪切/亚美利哥·丰塔尼/彼得·德·席尔瓦/弗朗西斯·古佐/拉法埃拉·莱博罗尼/克劳迪奥·阿方西/吉尔·巴罗尼/马西莫·比安奇/恩尼奥·孔萨尔维/吉安卡尔洛·科森蒂诺/阿伦·克雷格/汉尼斯·赫尔曼/弗兰科·梅斯科利尼/安东尼奥·普雷斯特/吉娜·诺维勒/理查德·塞梅尔/安德烈提多娜/迪尔克·范登贝格/奥梅罗·安东努蒂', 9, '9.5', '\n                                　　犹太青年圭多（罗伯托·贝尼尼）邂逅美丽的女教师多拉（尼可莱塔·布拉斯基），他彬彬有礼的向多拉鞠躬：“早安！公主！”。历经诸多令人啼笑皆非的周折后，天遂人愿，两人幸福美满的生活在一起。\n                                    \n                                　　然而好景不长，法西斯政权下，圭多和儿子被强行送往犹太人集中营。多拉虽没有犹太血统，毅然同行，与丈夫儿子分开关押在一个集中营里。聪明乐天的圭多哄骗儿子这只是一场游戏，奖品就是一辆大坦克，儿子快乐、天真的生活在纳粹的阴霾之中。尽管集中营的生活艰苦寂寞，圭多仍然带给他人很多快乐，他还趁机在纳粹的广播里问候妻子：“早安！公主！”\n                                    \n                                　　法西斯政权即将倾覆，纳粹的集中营很快就要接受最后的清理，圭多编给儿子的游戏该怎么结束？他们一家能否平安的度过这黑暗的年代呢？\n                        ', 0, 'image_link', 'movie_cover/p2578474613.jpg', 'https://www.imdb.com/title/tt0118799', 'https://movie.douban.com/subject/1292063/', '1292063',134,1,'下线','中文');
-- INSERT INTO `user_movie` VALUES (18156, '泰坦尼克号 Titanic', '詹姆斯·卡梅隆', ' 美国', '1998-04-03', '莱昂纳多·迪卡普里奥/凯特·温丝莱特/比利·赞恩/凯西·贝茨/弗兰西丝·费舍/格劳瑞亚·斯图尔特/比尔·帕克斯顿/伯纳德·希尔/大卫·沃纳/维克多·加博/乔纳森·海德/苏茜·爱米斯/刘易斯·阿伯内西/尼古拉斯·卡斯柯恩/阿那托利·萨加洛维奇/丹尼·努齐/杰森·贝瑞/伊万·斯图尔特/艾恩·格拉法德/乔纳森·菲利普斯/马克·林赛·查普曼/理查德·格拉翰/保罗·布赖特威尔/艾瑞克·布里登/夏洛特·查顿/博纳德·福克斯/迈克尔·英塞恩/法妮·布雷特/马丁·贾维斯/罗莎琳·艾尔斯/罗切尔·罗斯/乔纳森·伊万斯-琼斯/西蒙·克雷恩/爱德华德·弗莱彻/斯科特·安德森/马丁·伊斯特/克雷格·凯利/格雷戈里·库克/利亚姆·图伊/詹姆斯·兰开斯特/艾尔莎·瑞雯/卢·帕尔特/泰瑞·佛瑞斯塔/凯文·德·拉·诺伊', 9, '9.4', '\n                                　　1912年4月10日，号称 “世界工业史上的奇迹”的豪华客轮泰坦尼克号开始了自己的处女航，从英国的南安普顿出发驶往美国纽约。富家少女罗丝（凯特•温丝莱特）与母亲及未婚夫卡尔坐上了头等舱；另一边，放荡不羁的少年画家杰克（莱昂纳多·迪卡普里奥）也在码头的一场赌博中赢得了下等舱的船票。\n                                    \n                                　　罗丝厌倦了上流社会虚伪的生活，不愿嫁给卡尔，打算投海自尽，被杰克救起。很快，美丽活泼的罗丝与英俊开朗的杰克相爱，杰克带罗丝参加下等舱的舞会、为她画像，二人的感情逐渐升温。\n                                    \n                                　　1912年4月14日，星期天晚上，一个风平浪静的夜晚。泰坦尼克号撞上了冰山，“永不沉没的”泰坦尼克号面临沉船的命运，罗丝和杰克刚萌芽的爱情也将经历生死的考验。\n                        ', 0, 'image_link', 'movie_cover/p457760035.jpg', 'https://www.imdb.com/title/tt0120338', 'https://movie.douban.com/subject/1292722/', '1292722');
-- INSERT INTO `user_movie` VALUES (18157, '千与千寻 千と千尋の神隠し', '宫崎骏', ' 日本', '2019-06-21', '柊瑠美/入野自由/夏木真理/菅原文太/中村彰男/玉井夕海/神木隆之介/内藤刚志/泽口靖子/我修院达也/大泉洋/小林郁夫/上条恒彦/小野武彦', 9, '9.4', '\n                                　　千寻和爸爸妈妈一同驱车前往新家，在郊外的小路上不慎进入了神秘的隧道——他们去到了另外一个诡异世界—一个中世纪的小镇。远处飘来食物的香味，爸爸妈妈大快朵颐，孰料之后变成了猪！这时小镇上渐渐来了许多样子古怪、半透明的人。\n                                    \n                                　　千寻仓皇逃出，一个叫小白的人救了他，喂了她阻止身体消 失的药，并且告诉她怎样去找锅炉爷爷以及汤婆婆，而且必须获得一份工作才能不被魔法变成别的东西。\n                                    \n                                　　千寻在小白的帮助下幸运地获得了一份在浴池打杂的工作。渐渐她不再被那些怪模怪样的人吓倒，并从小玲那儿知道了小白是凶恶的汤婆婆的弟子。\n                                    \n                                　　一次，千寻发现小白被一群白色飞舞的纸人打伤，为了救受伤的小白，她用河神送给她的药丸驱出了小白身体内的封印以及守封印的小妖精，但小白还是没有醒过来。\n                                    \n                                　　为了救小白，千寻又踏上了她的冒险之旅。\n                        ', 0, 'image_link', 'movie_cover/p2557573348.jpg', 'https://www.imdb.com/title/tt0245429', 'https://movie.douban.com/subject/1291561/', '1291561');
-- INSERT INTO `user_movie` VALUES (18158, '辛德勒的名单 Schindler\'s List', '史蒂文·斯皮尔伯格', ' 美国', '1993-11-30', '连姆·尼森/本·金斯利/拉尔夫·费因斯/卡罗琳·古多尔/乔纳森·萨加尔/艾伯丝·戴维兹/马尔戈萨·格贝尔/马克·伊瓦涅/碧翠斯·马科拉/安德烈·瑟韦林/弗里德里希·冯·图恩/克齐斯茨托夫·拉夫特/诺伯特·魏塞尔', 9, '9.5', '\n                                　　1939年，波兰在纳粹德国的统治下，党卫军对犹太人进行了隔离统治。德国商人奥斯卡·辛德勒（连姆·尼森 Liam Neeson 饰）来到德军统治下的克拉科夫，开设了一间搪瓷厂，生产军需用品。凭着出众的社交能力和大量的金钱，辛德勒和德军建立了良好的关系，他的工厂雇用犹太人工作，大发战争财。\n                                    \n                                　　1943年，克拉科夫的犹太人遭到了惨绝人寰的大屠杀，辛德勒目睹这一切，受到了极大的震撼，他贿赂军官，让自己的工厂成为集中营的附属劳役营，在那些疯狂屠杀的日子里，他的工厂也成为了犹太人的避难所。\n                                    \n                                　　1944年，德国战败前夕，屠杀犹太人的行动越发疯狂，辛德勒向德军军官开出了1200人的名单，倾家荡产买下了这些犹太人的生命。在那些暗无天日的岁月里，拯救一个人，就是拯救全世界。\n                        ', 0, 'image_link', 'movie_cover/p492406163.jpg', 'https://www.imdb.com/title/tt0108052', 'https://movie.douban.com/subject/1295124/', '1295124');
-- INSERT INTO `user_movie` VALUES (18159, '盗梦空间 Inception', '克里斯托弗·诺兰', ' 美国 / 英国', '2010-09-01', '莱昂纳多·迪卡普里奥/约瑟夫·高登-莱维特/艾伦·佩吉/汤姆·哈迪/渡边谦/迪利普·劳/基里安·墨菲/汤姆·贝伦杰/玛丽昂·歌迪亚/皮特·波斯尔思韦特/迈克尔·凯恩/卢卡斯·哈斯/李太力/克莱尔·吉尔蕾/马格努斯·诺兰/泰勒·吉蕾/乔纳森·吉尔/水源士郎/冈本玉二/厄尔·卡梅伦/瑞恩·海沃德/米兰达·诺兰/拉什·费加/蒂姆·科勒赫/妲露拉·莱莉', 9, '9.3', '\n                                    　　道姆·柯布（莱昂纳多·迪卡普里奥 Leonardo DiCaprio 饰）与同事阿瑟（约瑟夫·戈登-莱维特 Joseph Gordon-Levitt 饰）和纳什（卢卡斯·哈斯 Lukas Haas 饰）在一次针对日本能源大亨齐藤（渡边谦 饰）的盗梦行动中失败，反被齐藤利用。齐藤威逼利诱因遭通缉而流亡海外的柯布帮他拆分他竞争对手的公司，采取极端措施在其唯一继承人罗伯特·费希尔（希里安·墨菲 Cillian Murphy 饰）的深层潜意识中种下放弃家族公司、自立门户的想法。为了重返美国，柯布偷偷求助于岳父迈尔斯（迈克尔·凯恩 Michael Caine 饰），吸收了年轻的梦境设计师艾里阿德妮（艾伦·佩吉 Ellen Page 饰）、梦境演员艾姆斯（汤姆·哈迪 Tom Hardy 饰）和药剂师约瑟夫（迪利普·劳 Dileep Rao 饰）加入行动。在一层层...\n                            ', 0, 'image_link', 'movie_cover/p513344864.jpg', 'https://www.imdb.com/title/tt1375666', 'https://movie.douban.com/subject/3541415/', '3541415');
-- INSERT INTO `user_movie` VALUES (18160, '忠犬八公的故事 Hachi: A Dog\'s Tale', '拉斯·霍尔斯道姆', ' 美国 / 英国', '2009-06-13', '理查·基尔/萨拉·罗默尔/琼·艾伦/罗比·萨布莱特/艾瑞克·阿瓦利/田川洋行/杰森·亚历山大/罗伯特·卡普荣', 9, '9.4', '\n                                    　　八公（Forest 饰）是一条谜一样的犬，因为没有人知道它从哪里来。教授帕克（理查·基尔 Richard Gere 饰）在小镇的火车站拣到一只走失的小狗，冥冥中似乎注定小狗和帕克教授有着某种缘分，帕克一抱起这只小狗就再也放不下来，最终，帕克对小狗八公的疼爱感化了起初极力反对养狗的妻子卡特（琼·艾伦 Joan Allen 饰）。八公在帕克的呵护下慢慢长大，帕克上班时八公会一直把他送到车站，下班时八公也会早早便爬在车站等候，八公的忠诚让小镇的人家对它更加疼爱。有一天，八公在帕克要上班时表现异常，居然玩起了以往从来不会的捡球游戏，八公的表现让帕克非常满意，可是就是在那天，帕克因病去世。帕克的妻子、女儿安迪（萨拉·罗默尔 Sarah Roemer 饰）及女婿迈克尔（罗比·萨布莱特 Robbie Sublett 饰）怀着无比沉痛的心情埋葬了帕克，可是不明就里的...\n                            ', 0, 'image_link', 'movie_cover/p524964016.jpg', 'https://www.imdb.com/title/tt1028532', 'https://movie.douban.com/subject/3011091/', '3011091');
-- INSERT INTO `user_movie` VALUES (18161, '海上钢琴师 La leggenda del pianista sull\'oceano', '朱塞佩·托纳多雷', ' 意大利', '2019-11-15', '蒂姆·罗斯/普路特·泰勒·文斯/比尔·努恩/克兰伦斯·威廉姆斯三世/梅兰尼·蒂埃里/皮特·沃恩/尼尔·奥布赖恩/阿尔贝托·巴斯克斯/加布里埃莱·拉维亚/科里·巴克/西德尼·科尔/Luigi De Luca/尼古拉·迪·平托/费米·依鲁福祖/伊斯顿·盖奇/凯文·麦克纳利/布莱恩·普林格/沙拉·鲁宾/希思科特·威廉姆斯/阿妮妲·扎格利亚/安吉洛·迪洛雷塔', 9, '9.3', '\n                                　　本片讲述了一个钢琴天才传奇的一生。\n                                    \n                                　　1900年，Virginian号豪华邮轮上，一个孤儿被遗弃在头等舱，由船上的水手抚养长大，取名1900（蒂姆•罗斯 饰）。1900慢慢长大，显示出了无师自通的非凡钢琴天赋，在船上的乐队表演钢琴，每个听过他演奏的人，都被深深打动。爵士乐鼻祖杰尼听说了1900的高超技艺，专门上船和他比赛，最后自叹弗如，黯然离去。\n                                    \n                                　　可惜，这一切的事情都发生在海上，1900从来不愿踏上陆地，直到有一天，他爱上了一个女孩，情愫在琴键上流淌。他会不会为了爱情，踏上陆地开始新的生活，用他的琴声惊艳世界？他将怎样谱写自己非凡的人生。\n                        ', 0, 'image_link', 'movie_cover/p2574551676.jpg', 'https://www.imdb.com/title/tt0120731', 'https://movie.douban.com/subject/1292001/', '1292001');
-- INSERT INTO `user_movie` VALUES (18162, '楚门的世界 The Truman Show', '彼得·威尔', ' 美国', '1998-06-05', '金·凯瑞/劳拉·琳妮/艾德·哈里斯/诺亚·艾默里奇/娜塔莎·麦克艾霍恩', 9, '9.3', '\n                                　　楚门（金•凯瑞 Jim Carrey 饰）是一个平凡得不能再平凡的人，除了一些有些稀奇的经历之外——初恋女友突然失踪、溺水身亡的父亲忽然似乎又出现在眼前，他和绝大多数30多岁的美国男人绝无异样。这令他倍感失落。他也曾试过离开自己生活了多年的地方，但总因种种理由而不能成行。\n                                    \n                                　　直到有一天，他忽然发觉自己似乎一直在被人跟踪，无论他走到哪里，干什么事情。这种感觉愈来愈强烈。楚门决定不惜一切代价逃离这个他生活了30多年的地方，去寻找他的初恋女友。\n                                    \n                                　　但他却发现自己怎样也逃不出去。真相其实很残忍。\n                        ', 0, 'image_link', 'movie_cover/p479682972.jpg', 'https://www.imdb.com/title/tt0120382', 'https://movie.douban.com/subject/1292064/', '1292064');
-- INSERT INTO `user_movie` VALUES (18163, '三傻大闹宝莱坞 3 Idiots', '拉吉库马尔·希拉尼', ' 印度', '2011-12-08', '阿米尔·汗/卡琳娜·卡普尔/马达范/沙尔曼·乔希/奥米·瓦依达/博曼·伊拉尼/莫娜·辛格/拉杰夫·拉宾德拉纳特安', 9, '9.2', '\n                                    　　本片根据印度畅销书作家奇坦·巴哈特（Chetan Bhagat）的处女作小说《五点人》（Five Point Someone）改编而成。法兰（马德哈万 R Madhavan 饰）、拉杜（沙曼·乔希 Sharman Joshi 饰）与兰乔（阿米尔·汗 Aamir Khan 饰）是皇家工程学院的学生，三人共居一室，结为好友。在以严格著称的学院里，兰乔是个非常与众不同的学生，他不死记硬背，甚至还公然顶撞校长“病毒”（波曼·伊拉尼 Boman Irani 饰），质疑他的教学方法。他不仅鼓动法兰与拉杜去勇敢追寻理想，还劝说校长的二女儿碧雅（卡琳娜·卡普 Kareena Kapoor 饰）离开满眼铜臭的未婚夫。兰乔的特立独行引起了模范学生“消音器”（奥米·维嘉 Omi Vaidya 饰）的不满，他约定十年后再与兰乔一决高下，看哪种生活方式更能取得成功。\n                                        \n                                    　　本片获孟...\n                            ', 0, 'image_link', 'movie_cover/p579729551.jpg', 'https://www.imdb.com/title/tt1187043', 'https://movie.douban.com/subject/3793023/', '3793023');
-- INSERT INTO `user_movie` VALUES (18164, '机器人总动员 WALL·E', '安德鲁·斯坦顿', ' 美国', '2008-06-27', '本·贝尔特/艾丽莎·奈特/杰夫·格尔林/佛莱德·威拉特/西格妮·韦弗/MacInTalk/约翰·拉岑贝格/凯茜·纳基麦/泰迪·牛顿/鲍伯·伯根/洛丽·理查德森/吉姆·瓦德/彼特·道格特/安德鲁·斯坦顿/杰夫·皮金/约翰·齐甘/米凯·麦高万/雪莉·琳恩/克莱特·惠特克/唐纳德·富利洛夫/罗里·艾伦/杰斯·哈梅尔/拉瑞恩·纽曼/扬·拉布森/保罗·伊丁', 9, '9.3', '\n                                　　公元2805年，人类文明高度发展，却因污染和生活垃圾大量增加使得地球不再适于人类居住。地球人被迫乘坐飞船离开故乡，进行一次漫长无边的宇宙之旅。临行前他们委托Buynlarge的公司对地球垃圾进行清理，该公司开发了名为WALL·E（Waste Allocation Loa d Lifters – Earth 地球废品分装员）的机器人担当此重任。\n                                    \n                                　　这些机器人按照程序日复一日、年复一年辛勤工作，但随着时间的流逝和恶劣环境的侵蚀，WALL·E们接连损坏、停止运动。最后只有一个仍在进行这项似乎永无止境的工作。经历了漫长的岁月，它开始拥有了自己的意识。它喜欢将收集来的宝贝小心翼翼藏起，喜欢收工后看看几百年前的歌舞片，此外还有一只蟑螂朋友作伴。直到有一天，一艘来自宇宙的飞船打破了它一成不变的生活……\n                                    \n                                　　本片荣获2009年第81届奥斯卡最佳动画长片奖。\n                        ', 0, 'image_link', 'movie_cover/p1461851991.jpg', 'https://www.imdb.com/title/tt0910970', 'https://movie.douban.com/subject/2131459/', '2131459');
-- INSERT INTO `user_movie` VALUES (18165, '放牛班的春天 Les choristes', '克里斯托夫·巴拉蒂', ' 法国 / 瑞士 / 德国', '2004-10-16', '热拉尔·朱尼奥/弗朗索瓦·贝莱昂/凯德·麦拉德/让-保罗·博奈雷/玛丽·布奈尔/让-巴蒂斯特·莫尼耶/马科森斯·珀林/格雷戈里·加迪诺尔/托马斯·布伦门塔尔/西里尔·伯尔尼科特/西蒙·法戈特/泰奥杜尔·卡雷-卡赛尼/菲利普·杜·詹纳兰德/埃里克·德斯玛莱茨/狄迪尔·弗拉蒙/雅克·贝汉', 9, '9.3', '\n                                　　1949年的法国乡村，音乐家克莱门特（杰勒德•尊诺 饰）到了一间外号叫“塘低”的男子寄宿学校当助理教师。学校里的学生大部分都是难缠的问题儿童，体罚在这里司空见惯，学校的校长（弗朗西斯•贝尔兰德 饰）只顾自己的前途，残暴高压。\n                                    \n                                　　性格沉静的克莱门特尝试用自己的方法改善这种状况，他重新创作音乐作品，组织合唱团，决定用音乐的方法来打开学生们封闭的心灵。\n                                    \n                                　　然而，事情并不顺利，克莱门特发现学生皮埃尔•莫安琦（尚•巴堤•莫里耶 饰）拥有非同一般的音乐天赋，但是单亲家庭长大的他，性格异常敏感孤僻，怎样释放皮埃尔的音乐才能，让克莱门特头痛不已；同时，他与皮埃尔母亲的感情也渐渐微妙起来。\n                        ', 0, 'image_link', 'movie_cover/p1910824951.jpg', 'https://www.imdb.com/title/tt0372824', 'https://movie.douban.com/subject/1291549/', '1291549');
-- INSERT INTO `user_movie` VALUES (18166, '星际穿越 Interstellar', '克里斯托弗·诺兰', ' 美国 / 英国 / 加拿大 / 冰岛', '2014-11-12', '马修·麦康纳/安妮·海瑟薇/杰西卡·查斯坦/卡西·阿弗莱克/迈克尔·凯恩/马特·达蒙/麦肯吉·弗依/蒂莫西·柴勒梅德/艾伦·伯斯汀/约翰·利思戈/韦斯·本特利/大卫·吉亚西/比尔·欧文/托弗·戈瑞斯/科莱特·沃夫/弗朗西斯·X·麦卡蒂/安德鲁·博尔巴/乔什·斯图沃特/莱雅·卡里恩斯/利亚姆·迪金森/杰夫·赫普内尔/伊莱耶斯·加贝尔/布鲁克·史密斯/大卫·奥伊罗/威廉姆·德瓦内/拉什·费加/格里芬·弗雷泽/弗洛拉·诺兰', 9, '9.3', '\n                                    　　近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 Matthew McConaughey 饰）接连在女儿墨菲（麦肯吉·弗依 Mackenzie Foy 饰）的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 Michael Caine 饰）的劝说下，库珀忍痛告别了女儿，和其他三名专家教授女儿艾米莉亚·布兰德（安妮·海瑟薇 Anne Hathaway 饰）、罗米利（大卫·吉雅西 David Gyasi 饰）、多伊尔（韦斯·本特利 Wes B...\n                            ', 0, 'image_link', 'movie_cover/p2206088801.jpg', 'https://www.imdb.com/title/tt0816692', 'https://movie.douban.com/subject/1889243/', '1889243');


-- ----------------------------
-- Table structure for user_movie_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_collect`;
CREATE TABLE `user_movie_collect`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_movie_collect_movie_id_user_id_0bd82515_uniq`(`movie_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `user_movie_collect_movie_id_531f3e35`(`movie_id` ASC) USING BTREE,
  INDEX `user_movie_collect_user_id_c27a6ff3`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_movie_collect_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_collect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_movie_collect
-- ----------------------------
INSERT INTO `user_movie_collect` VALUES (1, 18151, 401);

-- ----------------------------
-- Table structure for user_movie_tags
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_tags`;
CREATE TABLE `user_movie_tags`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `tags_id` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_movie_tags_movie_id_tags_id_6115e825_uniq`(`movie_id` ASC, `tags_id` ASC) USING BTREE,
  INDEX `user_movie_tags_movie_id_503cfe08`(`movie_id` ASC) USING BTREE,
  INDEX `user_movie_tags_tags_id_d3315ced`(`tags_id` ASC) USING BTREE,
  CONSTRAINT `user_movie_tags_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_tags_ibfk_2` FOREIGN KEY (`tags_id`) REFERENCES `user_tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55809 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_movie_tags
-- ----------------------------
INSERT INTO `user_movie_tags` VALUES (50009, 18151, 287);
INSERT INTO `user_movie_tags` VALUES (50010, 18151, 288);
INSERT INTO `user_movie_tags` VALUES (50011, 18152, 287);
INSERT INTO `user_movie_tags` VALUES (50012, 18152, 289);
INSERT INTO `user_movie_tags` VALUES (50013, 18152, 290);
INSERT INTO `user_movie_tags` VALUES (50014, 18153, 287);
INSERT INTO `user_movie_tags` VALUES (50015, 18153, 289);
INSERT INTO `user_movie_tags` VALUES (50016, 18154, 287);
INSERT INTO `user_movie_tags` VALUES (50018, 18154, 288);
INSERT INTO `user_movie_tags` VALUES (50017, 18154, 291);
INSERT INTO `user_movie_tags` VALUES (50019, 18155, 287);
INSERT INTO `user_movie_tags` VALUES (50021, 18155, 289);
INSERT INTO `user_movie_tags` VALUES (50020, 18155, 292);
INSERT INTO `user_movie_tags` VALUES (50022, 18155, 293);


-- ----------------------------
-- Table structure for user_rate
-- ----------------------------
DROP TABLE IF EXISTS `user_rate`;
CREATE TABLE `user_rate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mark` tinyint NOT NULL,
  `create_time` datetime NOT NULL,
  `movie_id` int NULL DEFAULT NULL,			-- NOT NULL?
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_rate_movie_id_6ccfed0c`(`movie_id` ASC) USING BTREE,
  INDEX `user_rate_user_id_b85a90b9`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_rate_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_rate_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2203 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_rate
-- ----------------------------
INSERT INTO `user_rate` VALUES (1, 3, '2021-05-12 07:19:54', 19666, 1);
-- INSERT INTO `user_rate` VALUES (2, 1, '2021-05-12 07:19:54', 19202, 1);
-- INSERT INTO `user_rate` VALUES (3, 5, '2021-05-12 07:19:54', 18313, 1);
-- INSERT INTO `user_rate` VALUES (4, 2, '2021-05-12 07:19:54', 18684, 1);
-- INSERT INTO `user_rate` VALUES (5, 5, '2021-05-12 07:19:54', 18397, 1);
-- INSERT INTO `user_rate` VALUES (6, 2, '2021-05-12 07:19:54', 18437, 2);
-- INSERT INTO `user_rate` VALUES (7, 4, '2021-05-12 07:19:54', 18595, 2);

-- ----------------------------
-- Table structure for user_tags
-- ----------------------------
DROP TABLE IF EXISTS `user_tags`;
CREATE TABLE `user_tags`  (
  `id` smallint NOT NULL AUTO_INCREMENT,												-- 这里自增的初始值为316
  `name` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 316 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_tags
-- ----------------------------
INSERT INTO `user_tags` VALUES (287, '剧情');
INSERT INTO `user_tags` VALUES (288, '犯罪');
INSERT INTO `user_tags` VALUES (289, '爱情');
INSERT INTO `user_tags` VALUES (290, '同性');
INSERT INTO `user_tags` VALUES (291, '动作');
INSERT INTO `user_tags` VALUES (292, '喜剧');
INSERT INTO `user_tags` VALUES (293, '战争');
INSERT INTO `user_tags` VALUES (294, '灾难');
INSERT INTO `user_tags` VALUES (295, '动画');
INSERT INTO `user_tags` VALUES (296, '奇幻');
INSERT INTO `user_tags` VALUES (297, '历史');
INSERT INTO `user_tags` VALUES (298, '科幻');
INSERT INTO `user_tags` VALUES (299, '悬疑');
INSERT INTO `user_tags` VALUES (300, '冒险');
INSERT INTO `user_tags` VALUES (301, '音乐');
INSERT INTO `user_tags` VALUES (302, '歌舞');
INSERT INTO `user_tags` VALUES (303, '古装');
INSERT INTO `user_tags` VALUES (304, '家庭');
INSERT INTO `user_tags` VALUES (305, '传记');
INSERT INTO `user_tags` VALUES (306, '惊悚');
INSERT INTO `user_tags` VALUES (307, '武侠');
INSERT INTO `user_tags` VALUES (308, '儿童');
INSERT INTO `user_tags` VALUES (309, '纪录片');
INSERT INTO `user_tags` VALUES (310, '恐怖');
INSERT INTO `user_tags` VALUES (311, '西部');
INSERT INTO `user_tags` VALUES (312, '情色');
INSERT INTO `user_tags` VALUES (313, '运动');
INSERT INTO `user_tags` VALUES (314, '真人秀');
INSERT INTO `user_tags` VALUES (315, '短片');

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
) ENGINE = InnoDB AUTO_INCREMENT = 404 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_user
-- ----------------------------
-- INSERT INTO `user_user` VALUES (1, 'nciae', 'nciae', 'eysny@163.com');
-- INSERT INTO `user_user` VALUES (2, 'khtof', 'khtof', 'hcgvi@163.com');
-- INSERT INTO `user_user` VALUES (3, 'devx_', 'devx_', 'xyewv@163.com');
INSERT INTO `user_user` VALUES (401, '22307140119', '111111', '12345678@qq.com');
INSERT INTO `user_user` VALUES (402, 'aaaaaa', 'aaaaaa', 'aaa@aa.com');
INSERT INTO `user_user` VALUES (403, 'liyang', '123456', 'liyang@qq.com');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_usertagprefer
-- ----------------------------
-- INSERT INTO `user_usertagprefer` VALUES (1, 7, 287, 401);
-- INSERT INTO `user_usertagprefer` VALUES (2, 5, 288, 401);
-- INSERT INTO `user_usertagprefer` VALUES (3, 5, 291, 402);
-- INSERT INTO `user_usertagprefer` VALUES (4, 5, 292, 402);
-- INSERT INTO `user_usertagprefer` VALUES (5, 5, 287, 402);
-- INSERT INTO `user_usertagprefer` VALUES (6, 5, 287, 403);
-- INSERT INTO `user_usertagprefer` VALUES (7, 5, 288, 403);




-- ----------------------------
-- Tables added
-- ----------------------------

-- ----------------------------
-- Table structure for user_company
-- ----------------------------
DROP TABLE IF EXISTS `user_company`;
CREATE TABLE `user_company`  (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `city` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_company` VALUES (1,'xxx娱乐公司','上海');
INSERT INTO `user_company` VALUES (2,'yyy娱乐公司','纽约');


-- ----------------------------
-- Table structure for user_director
-- ----------------------------
DROP TABLE IF EXISTS `user_director`;
CREATE TABLE `user_director`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gender` enum("男", "女") CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nationality` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prize` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_director` VALUES(1, "导演名字1", "男", "2000-01-01", "导演介绍1", "中国", "导演获奖信息1", "");
INSERT INTO `user_director` VALUES(2, "director name2", "女", "2000-01-01", "导演介绍1", "美国", "导演获奖信息2", "");
INSERT INTO `user_director` VALUES(3, "导演名字3", "男", "2000-01-01", "导演介绍3", "中国", "导演获奖信息3", "");
INSERT INTO `user_director` VALUES(4, "director nameeeeeeeeee4", "女", "2000-01-01", "导演介绍4", "美国", "导演获奖信息4", "");


-- ----------------------------
-- Table structure for user_actor
-- ----------------------------
DROP TABLE IF EXISTS `user_actor`;
CREATE TABLE `user_actor`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gender` enum("男", "女") CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nationality` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prize` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Add some data into table
-- ----------------------------
INSERT INTO `user_actor` VALUES(1, "演员名字1", "男", "2000-01-01", "演员介绍1", "中国", "演员获奖信息1", "");
INSERT INTO `user_actor` VALUES(2, "actor name2", "女", "2000-01-01", "演员介绍1", "美国", "演员获奖信息2", "");


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
  CONSTRAINT `user_movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `user_director` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;


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
  CONSTRAINT `user_movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `user_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `user_actor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;



SET FOREIGN_KEY_CHECKS = 1;
