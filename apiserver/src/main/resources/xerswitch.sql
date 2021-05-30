/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : xerswitch

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 30/05/2021 11:11:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `img_src` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `visit_count` int(11) NULL DEFAULT NULL COMMENT '访问量',
  `add_userId` bigint(20) NULL DEFAULT NULL COMMENT '添加人ID',
  `add_userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人名称',
  `add_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `FK_article_category_on_categoryId`(`category_id`) USING BTREE,
  CONSTRAINT `FK_article_category_on_categoryId` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '分类排序',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES (1, '通知公告', NULL, 1, '0');
INSERT INTO `cms_category` VALUES (2, '新闻资讯', NULL, 2, '0');
INSERT INTO `cms_category` VALUES (4, '招聘信息', NULL, 3, '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'xer_switch', '物联网开关', 'Switch', 'crud', 'com.ruoyi.project.xerswitch', 'switch', 'switch', '智能开关', 'emply', '{}', 'admin', '2021-02-01 12:29:42', '', '2021-04-03 14:24:25', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'device_id', '设备ID', 'bigint(20)', 'Long', 'deviceId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (2, '1', 'device_name', '设备名称', 'varchar(32)', 'String', 'deviceName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (3, '1', 'monitor_value', '监测值', 'varchar(160)', 'String', 'monitorValue', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (5, '1', 'state', '状态', 'char(1)', 'String', 'state', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (7, '1', 'category_dict_id', '设备分类', 'bigint(20)', 'Long', 'categoryDictId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'device_category', 7, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (8, '1', 'create_time', '添加时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, '1', 'BETWEEN', 'datetime', '', 8, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (9, '1', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 9, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (10, '1', 'user_name', '用户昵称', 'varchar(64)', 'String', 'userName', '0', '0', '1', '1', NULL, '1', '1', 'LIKE', 'input', '', 10, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (11, '1', 'remark', '设备简介', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');
INSERT INTO `gen_table_column` VALUES (12, '1', 'del_flg', '删除标识', 'char(1)', 'String', 'delFlg', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-04-23 12:29:42', '', '2021-04-03 14:24:25');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'CY-20200927FYUN1622310006336', 1622310407651, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1622310010000, -1, 5, 'PAUSED', 'CRON', 1622310006000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1622310015000, -1, 5, 'PAUSED', 'CRON', 1622310006000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1622310020000, -1, 5, 'PAUSED', 'CRON', 1622310006000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '单路继电器', 'single_switch', 'device_category', NULL, NULL, 'Y', '0', 'admin', '2020-04-23 12:43:03', 'admin', '2020-04-23 12:43:25', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '双路继电器', 'double_switch', 'device_category', NULL, NULL, 'N', '0', 'admin', '2020-04-23 12:43:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '温湿度传感器', 'temperature', 'sensor', NULL, NULL, 'Y', '0', 'admin', '2020-04-23 12:47:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '土壤湿度传感器', 'soil', 'sensor', NULL, '', 'N', '0', 'admin', '2020-04-23 12:47:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '在线', '1', 'switch_state', NULL, '', 'N', '0', 'admin', '2020-04-23 12:47:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '离线', '0', 'switch_state', NULL, '', 'Y', '0', 'admin', '2020-04-23 12:47:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '设备分类', 'device_category', '0', 'admin', '2020-04-23 12:40:17', '', NULL, '设备分类列表');
INSERT INTO `sys_dict_type` VALUES (101, '传感器类型', 'sensor', '0', 'admin', '2020-04-23 12:46:19', '', NULL, '传感器列表');
INSERT INTO `sys_dict_type` VALUES (102, '开关状态', 'switch_state', '0', 'admin', '2020-04-29 00:31:22', '', '2020-04-29 00:31:29', '开关状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 479 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-23 08:59:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-23 12:28:46');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-23 14:53:46');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-24 17:11:08');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-24 17:39:22');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-24 17:39:27');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '192.168.40.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-25 04:01:56');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-27 07:40:32');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-04-27 07:40:52');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-27 07:41:07');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-04-27 07:46:14');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-27 07:46:24');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2020-04-27 14:48:54');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-27 14:49:01');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-27 15:42:56');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-28 11:33:43');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-28 21:15:55');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 05:52:02');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 07:05:37');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 07:05:37');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 08:35:41');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 09:18:14');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 12:11:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-29 15:53:58');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-30 01:39:40');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-30 03:06:39');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-05 16:31:33');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-05 16:31:44');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-06 12:52:20');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-06 17:05:25');
INSERT INTO `sys_logininfor` VALUES (130, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 02:00:09');
INSERT INTO `sys_logininfor` VALUES (131, '好了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 02:00:37');
INSERT INTO `sys_logininfor` VALUES (132, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 02:03:26');
INSERT INTO `sys_logininfor` VALUES (133, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 02:54:31');
INSERT INTO `sys_logininfor` VALUES (134, '哈哈', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 02:56:09');
INSERT INTO `sys_logininfor` VALUES (135, '图解', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 02:58:26');
INSERT INTO `sys_logininfor` VALUES (136, '看看', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:18:34');
INSERT INTO `sys_logininfor` VALUES (137, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:22:55');
INSERT INTO `sys_logininfor` VALUES (138, '裤腿裤', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:23:21');
INSERT INTO `sys_logininfor` VALUES (139, '啦啦啦啦', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:24:28');
INSERT INTO `sys_logininfor` VALUES (140, '来昆明', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:25:01');
INSERT INTO `sys_logininfor` VALUES (141, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:25:20');
INSERT INTO `sys_logininfor` VALUES (142, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:26:55');
INSERT INTO `sys_logininfor` VALUES (143, '交接了吗', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:28:05');
INSERT INTO `sys_logininfor` VALUES (144, '考虑', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:29:03');
INSERT INTO `sys_logininfor` VALUES (145, '距离', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:33:34');
INSERT INTO `sys_logininfor` VALUES (146, '啦啦啦啦', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:34:02');
INSERT INTO `sys_logininfor` VALUES (147, '看看', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:35:57');
INSERT INTO `sys_logininfor` VALUES (148, '距离', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 03:36:55');
INSERT INTO `sys_logininfor` VALUES (149, '兔兔', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 04:18:18');
INSERT INTO `sys_logininfor` VALUES (150, '具体', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 04:25:11');
INSERT INTO `sys_logininfor` VALUES (151, '啦啦啦啦', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 04:26:41');
INSERT INTO `sys_logininfor` VALUES (152, '来昆明', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 04:28:57');
INSERT INTO `sys_logininfor` VALUES (153, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 04:31:10');
INSERT INTO `sys_logininfor` VALUES (154, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-05-07 04:31:29');
INSERT INTO `sys_logininfor` VALUES (155, '老家了', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-05-07 04:37:41');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 04:37:53');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-05-07 04:38:05');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 04:38:36');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 04:38:43');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 04:48:16');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 04:48:18');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 04:48:44');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 04:48:45');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 05:28:52');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 05:28:59');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 05:29:11');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 05:31:47');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 05:32:02');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-07 05:44:10');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-07 05:44:24');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:11:48');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:13:01');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:25:13');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:40:29');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:40:55');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:41:41');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 06:44:26');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 07:45:15');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 07:50:44');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-07 08:25:40');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:26:20');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2020-05-07 08:26:32');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:26:46');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:27:14');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:29:17');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:30:32');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:31:01');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:32:32');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:32:52');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:34:00');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:36:31');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 08:36:33');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:36:47');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 08:36:54');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:37:04');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:43:07');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:45:01');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 08:46:08');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 09:14:53');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-07 09:46:52');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-07 10:53:38');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 10:58:26');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 11:09:10');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 11:48:16');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-07 12:51:55');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '192.168.0.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 13:01:33');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '192.168.0.106', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 13:35:19');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '192.168.0.107', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-07 13:39:00');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '192.168.0.106', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 13:40:04');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '192.168.0.106', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-07 13:40:07');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '192.168.0.106', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 13:40:25');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '192.168.0.106', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 13:40:45');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '192.168.0.106', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-07 13:46:20');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-13 08:13:08');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-13 08:56:56');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-13 09:08:55');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '117.136.72.71', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 16:44:50');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '117.136.72.71', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 17:05:39');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '117.136.72.71', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-16 17:12:23');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '117.136.72.71', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-16 17:24:22');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-16 18:37:19');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-17 03:30:42');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-17 04:51:23');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-17 06:47:36');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-17 12:19:17');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-17 15:35:30');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-17 15:40:28');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-17 15:46:49');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-17 15:52:20');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-17 15:52:31');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-17 16:30:01');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-17 16:52:47');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 01:37:43');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 02:00:44');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 02:08:24');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 02:58:39');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 03:00:32');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 03:06:35');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 03:55:48');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-18 03:55:56');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:09:28');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:29:37');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:30:16');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:31:05');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-18 04:31:15');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:31:25');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:32:11');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:40:30');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-18 04:40:40');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 04:40:52');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 05:01:17');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 05:02:51');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 05:07:57');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 05:08:28');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '94.190.208.72', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 07:14:17');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 07:14:48');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 07:54:41');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '39.130.57.52', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-05-18 07:58:44');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 09:31:03');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-18 09:32:43');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-18 09:32:53');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-18 09:33:03');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 09:33:11');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-18 09:33:24');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 09:33:35');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-18 11:03:18');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-18 11:03:25');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 11:03:37');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 12:25:50');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 13:17:13');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-05-18 13:39:55');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 13:40:12');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-18 13:40:26');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 13:40:49');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 14:14:08');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-18 14:14:09');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 15:52:20');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-18 18:07:20');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 02:34:53');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 02:56:17');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-19 06:23:00');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 06:49:28');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 08:08:42');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-19 08:17:21');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:15:38');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:16:38');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-19 09:18:14');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-19 09:18:23');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:39:38');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:47:39');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:49:13');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:49:36');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:50:54');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-19 09:51:10');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 09:51:23');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-19 09:52:29');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:11:02');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:11:29');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:13:34');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-19 10:13:52');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:13:56');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:14:41');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:20:08');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:22:17');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:23:18');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:25:41');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:28:47');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 10:30:21');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-19 14:35:19');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 18:55:51');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '94.190.208.72', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 19:51:25');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-19 22:42:37');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-20 07:46:33');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '39.130.57.52', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 14:51:16');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-20 15:09:29');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '39.130.57.52', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-20 18:27:48');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-21 17:59:41');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-21 18:41:29');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '117.136.72.71', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-22 17:52:51');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-22 17:57:34');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-22 19:54:44');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '39.130.57.124', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-23 04:54:33');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '94.190.208.72', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-23 06:57:46');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-23 16:35:51');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '39.130.57.124', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-24 07:20:47');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-24 07:22:47');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '39.130.57.124', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-24 08:25:24');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '39.130.57.124', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-24 09:13:45');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '39.130.57.124', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-24 09:14:00');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-24 12:32:04');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-05-24 12:32:07');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-24 12:48:26');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '39.130.57.124', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-24 17:27:43');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '117.136.72.71', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-25 19:25:37');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '117.136.72.71', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-05-28 11:09:34');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '39.130.57.155', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-30 02:54:41');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '117.136.85.158', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-06-04 14:31:26');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-06-16 07:50:04');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-06-16 07:50:19');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-16 07:50:34');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-16 07:57:01');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-16 07:57:16');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-06-17 01:54:49');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '182.242.73.170', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-17 01:55:00');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '116.249.209.67', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-19 06:31:24');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '116.52.81.62', 'XX XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-07-08 05:07:47');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '116.52.81.62', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-07-08 05:07:54');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '116.52.81.62', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-08 05:08:04');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '116.52.81.62', 'XX XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-07-08 05:08:08');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-07-09 06:07:40');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-07-09 06:07:53');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-07-09 06:08:04');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-07-09 06:08:13');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-07-09 06:08:23');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-07-09 06:08:30');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '121.32.126.234', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-07-09 06:08:45');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '39.130.57.39', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-07-13 12:30:39');
INSERT INTO `sys_logininfor` VALUES (358, 'https://github.com/Kevincoooool/KSTC_V1', '117.136.86.103', 'XX XX', 'Unknown', 'Unknown', '1', '验证码错误', '2020-07-23 15:50:01');
INSERT INTO `sys_logininfor` VALUES (359, 'https://github.com/Kevincoooool/KSTC_V1', '117.136.86.103', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-07-23 15:50:10');
INSERT INTO `sys_logininfor` VALUES (360, 'https://github.com/Kevincoooool/KSTC_V1', '117.136.86.103', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-07-23 15:50:21');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '39.130.57.241', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-07-26 16:00:21');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '116.52.38.21', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-07-29 09:51:42');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '116.52.38.21', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-07-29 09:51:48');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '116.52.38.21', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-29 09:52:01');
INSERT INTO `sys_logininfor` VALUES (365, '122', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-10 06:49:48');
INSERT INTO `sys_logininfor` VALUES (366, '122', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-10 06:49:50');
INSERT INTO `sys_logininfor` VALUES (367, '122', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-08-10 06:50:02');
INSERT INTO `sys_logininfor` VALUES (368, 'username', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-10 06:53:37');
INSERT INTO `sys_logininfor` VALUES (369, 'username', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-08-10 06:53:53');
INSERT INTO `sys_logininfor` VALUES (370, 'username', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-10 06:53:54');
INSERT INTO `sys_logininfor` VALUES (371, 'username', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-10 06:53:54');
INSERT INTO `sys_logininfor` VALUES (372, 'username', '124.160.213.53', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-10 06:53:54');
INSERT INTO `sys_logininfor` VALUES (373, 'root', '220.191.52.164', 'XX XX', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2020-08-13 16:26:40');
INSERT INTO `sys_logininfor` VALUES (374, 'root', '220.191.52.164', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-08-13 16:26:42');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-02 13:13:19');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-02 14:36:26');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-03 02:36:34');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 02:36:53');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-03 02:37:06');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 02:37:13');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-03 02:47:18');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-09-03 02:50:46');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-09-03 02:52:11');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-09-03 02:53:16');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 02:53:24');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-03 02:57:01');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 02:57:09');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-03 03:12:44');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 03:12:54');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 14:03:02');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 14:05:15');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 14:06:20');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '1', '验证码已失效', '2020-09-03 14:06:26');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 14:06:37');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 14:28:11');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-03 14:29:42');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 14:29:56');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-03 15:02:50');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-03 15:03:13');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-03 15:03:53');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-03 15:05:06');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 15:06:36');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-03 15:06:42');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 15:06:51');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-03 15:06:56');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-03 15:07:00');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 15:07:06');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-03 15:16:00');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-03 15:16:08');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 15:50:04');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 15:50:28');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 15:50:35');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 16:08:25');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 17:02:59');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 18:23:18');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-03 19:45:29');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '116.249.209.89', 'XX XX', 'Chrome Mobile', 'Android 5.x', '0', '登录成功', '2020-09-04 02:06:54');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-04 10:17:37');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-04 15:35:09');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '39.130.57.36', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2020-09-04 16:04:29');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-05 02:26:08');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-05 02:26:25');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-05 02:27:08');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '39.130.57.36', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-05 02:27:17');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-02 21:22:35');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-02 21:22:38');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 21:22:45');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 22:26:23');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-02 22:26:29');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-02 22:26:36');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-02 22:26:40');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 22:26:51');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-04-02 22:29:50');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-02 22:29:53');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-02 22:30:00');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-02 22:30:04');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 22:30:07');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-02 22:34:18');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 22:34:24');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-02 23:40:17');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-02 23:40:21');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 23:40:24');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-04-03 10:18:47');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-04-03 10:18:54');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-03 13:25:58');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 13:26:10');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-03 13:26:13');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-03 13:26:16');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 13:26:24');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 14:23:33');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-03 14:31:55');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 14:33:34');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:00:32');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-03 15:00:51');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:01:11');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:01:16');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-03 15:01:59');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:02:11');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:02:15');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:02:20');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:02:26');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-03 15:02:38');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:02:50');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:02:52');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:03:15');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:03:23');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:03:27');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:03:30');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-03 15:04:00');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:04:25');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:04:27');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-03 15:04:29');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:04:33');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:44:01');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '1.0.1.50,127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-03 15:46:02');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-13 20:14:29');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-14 10:42:34');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-30 01:43:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2007 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'xerSWITCH', 0, 4, '#', NULL, 0, 'M', '0', '1', '', 'guide', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-27 07:49:27', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '远程开关', 2006, 1, 'switch', 'switch/switch/index', 1, 'C', '0', '0', 'xerswitch:switch:list', 'switch', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-23 15:14:41', '智能开关菜单');
INSERT INTO `sys_menu` VALUES (2001, '智能开关查询', 2000, 1, '#', '', 1, 'F', '0', '0', 'xerswitch:switch:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2002, '智能开关新增', 2000, 2, '#', '', 1, 'F', '0', '0', 'xerswitch:switch:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '智能开关修改', 2000, 3, '#', '', 1, 'F', '0', '0', 'xerswitch:switch:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '智能开关删除', 2000, 4, '#', '', 1, 'F', '0', '0', 'xerswitch:switch:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2005, '智能开关导出', 2000, 5, '#', '', 1, 'F', '0', '0', 'xerswitch:switch:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2006, '物联网设备', 0, 0, 'iot', NULL, 1, 'M', '0', '0', '', 'online', 'admin', '2020-04-23 15:13:52', 'admin', '2020-04-23 15:14:12', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.40.1', '内网IP', 'xer_switch', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:29:42');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.40.1', '内网IP', '{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"APIKEY\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":false,\"columnName\":\"api_key\"},{\"usableColumn\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:39:00');
INSERT INTO `sys_oper_log` VALUES (102, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '192.168.40.1', '内网IP', '{\"params\":{},\"dictType\":\"device_category\",\"createBy\":\"admin\",\"dictName\":\"设备分类\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:40:17');
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '192.168.40.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"device_category\",\"dictLabel\":\"单路\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:43:03');
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '192.168.40.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"device_category\",\"dictLabel\":\"双路\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:43:18');
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 2, 'com.ruoyi.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '192.168.40.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"device_category\",\"dictLabel\":\"单路\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1587616983000,\"dictCode\":100,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:43:26');
INSERT INTO `sys_oper_log` VALUES (106, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '192.168.40.1', '内网IP', '{\"params\":{},\"dictType\":\"sensor\",\"createBy\":\"admin\",\"dictName\":\"传感器\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:46:19');
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '192.168.40.1', '内网IP', '{\"dictValue\":\"temperature\",\"dictSort\":1,\"params\":{},\"dictType\":\"sensor\",\"dictLabel\":\"温湿度\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:47:38');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.40.1', '内网IP', '{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587616740000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587616740000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587616740000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"APIKEY\",\"updateTime\":1587616740000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:50:29');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.40.1', '内网IP', '{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587617428000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587617428000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587617428000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"APIKEY\",\"updateTime\":1587617428000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 12:56:45');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.40.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-23 12:57:05');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:03:02');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"F\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:08:21');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:08:59');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:09:31');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"online\",\"orderNum\":\"1\",\"menuName\":\"物联网\",\"params\":{},\"path\":\"iot\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:13:52');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"online\",\"orderNum\":\"0\",\"menuName\":\"物联网\",\"params\":{},\"parentId\":0,\"path\":\"iot\",\"children\":[],\"createTime\":1587626032000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:14:12');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.40.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":2006,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:14:41');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.40.1', '内网IP', '{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587617805000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587617805000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587617805000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"APIKEY\",\"updateTime\":1587617805000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-23 15:21:22');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-04-27 07:47:01');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-27 07:47:18');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-04-27 07:47:22');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"xerSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-27 07:48:19');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-04-27 07:48:48');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"xerSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-27 07:48:57');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"xerSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-27 07:49:07');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"xerSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-27 07:49:27');
INSERT INTO `sys_oper_log` VALUES (127, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-28 11:57:20');
INSERT INTO `sys_oper_log` VALUES (128, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-28 11:57:23');
INSERT INTO `sys_oper_log` VALUES (129, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"D432594C7B234966B0CC4D24E57C22FE\",\"params\":{},\"userName\":\"admin\",\"deviceId\":8,\"deviceName\":\"卧室灯\",\"createTime\":1588143964659,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 07:06:05');
INSERT INTO `sys_oper_log` VALUES (130, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"D432594C7B234966B0CC4D24E57C22FE\",\"remark\":\"控制卧室灯的单路开关\",\"updateTime\":1588143998333,\"params\":{},\"userName\":\"admin\",\"deviceId\":8,\"deviceName\":\"卧室灯\",\"createTime\":1588143965000,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 07:06:38');
INSERT INTO `sys_oper_log` VALUES (131, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"2E15D28BADAA4CDB90244A8F3BF0AE8E\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"测试\",\"createTime\":1588144128129,\"state\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.xerSwitchMapper.insertxerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       api_key,             state,                                                    create_time,                          user_name )           values ( ?,                                       ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2020-04-29 07:08:48');
INSERT INTO `sys_oper_log` VALUES (132, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"E2E4A544ED1B4E31BBF7EF46FC1F1996\",\"remark\":\"测试\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"测试\",\"createTime\":1588144369155,\"state\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.xerSwitchMapper.insertxerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       api_key,             state,                                                    create_time,                          user_name,             remark )           values ( ?,                                       ?,             ?,                                                    ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2020-04-29 07:12:49');
INSERT INTO `sys_oper_log` VALUES (133, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"00242A6C18D5422097E6EAD3BEA0E61A\",\"remark\":\"测试\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"测试\",\"createTime\":1588144465440,\"state\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.xerSwitchMapper.insertxerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       api_key,             state,                                                    create_time,                          user_name,             remark )           values ( ?,                                       ?,             ?,                                                    ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2020-04-29 07:14:26');
INSERT INTO `sys_oper_log` VALUES (134, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"0948AEBE27224802BA66F15DC2D4A658\",\"remark\":\"测试\",\"params\":{},\"userName\":\"admin\",\"deviceId\":9,\"deviceName\":\"测试\",\"createTime\":1588144875318,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 07:21:15');
INSERT INTO `sys_oper_log` VALUES (135, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xerswitch/switch/9', '127.0.0.1', '内网IP', '{deviceIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 07:21:25');
INSERT INTO `sys_oper_log` VALUES (136, '智能开关', 5, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.export()', 'GET', 1, 'admin', NULL, '/xerswitch/switch/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"5da60f9e-c3ca-42e7-88e7-691650bbeffd_switch.xlsx\",\"code\":200}', 0, NULL, '2020-04-29 08:48:59');
INSERT INTO `sys_oper_log` VALUES (137, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"D432594C7B234966B0CC4D24E57C22FE\",\"remark\":\"控制卧室灯的单路开关0\",\"updateTime\":1588165065571,\"params\":{},\"userName\":\"admin\",\"deviceId\":3,\"deviceName\":\"卧室灯\",\"createTime\":1588115220000,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 12:57:46');
INSERT INTO `sys_oper_log` VALUES (138, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xerswitch/switch', '127.0.0.1', '内网IP', '{\"apiKey\":\"4A2AF175B85B46AFA54ADBE4BA24122E\",\"remark\":\"测色\",\"params\":{},\"userName\":\"admin\",\"deviceId\":10,\"deviceName\":\"测试\",\"createTime\":1588170684677,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 14:31:25');
INSERT INTO `sys_oper_log` VALUES (139, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.xerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xerswitch/switch/10', '127.0.0.1', '内网IP', '{deviceIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-04-29 14:34:26');
INSERT INTO `sys_oper_log` VALUES (140, '个人信息', 2, 'com.ruoyi.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/system/user/profile/updatePwd', '39.130.57.52', 'XX XX', 'admin123 cxw3513090', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-05-18 09:32:33');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '39.130.57.155', 'XX XX', '{}', 'null', 0, NULL, '2020-05-30 02:55:25');
INSERT INTO `sys_oper_log` VALUES (142, '个人信息', 2, 'com.ruoyi.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/system/user/profile/updatePwd', '39.130.57.36', 'XX XX', 'cxw3513090 admin123', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-05 02:27:03');
INSERT INTO `sys_oper_log` VALUES (143, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"双路继\",\"updateTime\":1617372256570,\"params\":{},\"userName\":\"管理员\",\"deviceId\":1,\"deviceName\":\"智能浇灌\",\"userId\":1,\"delFlg\":\"0\",\"createTime\":1589855717000,\"switchB\":\"0\",\"switchA\":\"0\",\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 22:04:16');
INSERT INTO `sys_oper_log` VALUES (144, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"浇水\",\"updateTime\":1617376207106,\"params\":{},\"userName\":\"管理员\",\"deviceId\":1,\"deviceName\":\"灌溉机\",\"userId\":1,\"delFlg\":\"0\",\"createTime\":1589855717000,\"switchB\":\"1\",\"switchA\":\"1\",\"sensor\":\"temperature\",\"state\":\"1\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 23:10:07');
INSERT INTO `sys_oper_log` VALUES (145, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"门禁\",\"updateTime\":1617376243813,\"params\":{},\"userName\":\"管理员\",\"deviceId\":2,\"deviceName\":\"门禁锁\",\"userId\":1,\"delFlg\":\"0\",\"createTime\":1589854976000,\"switchB\":\"1\",\"switchA\":\"1\",\"sensor\":\"temperature\",\"state\":\"1\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 23:10:43');
INSERT INTO `sys_oper_log` VALUES (146, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"门禁\",\"updateTime\":1617376250483,\"params\":{},\"userName\":\"管理员\",\"deviceId\":2,\"deviceName\":\"门禁锁\",\"userId\":1,\"delFlg\":\"0\",\"createTime\":1589854976000,\"switchB\":\"1\",\"switchA\":\"1\",\"sensor\":\"temperature\",\"state\":\"1\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 23:10:50');
INSERT INTO `sys_oper_log` VALUES (147, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"浇水\",\"updateTime\":1617376256815,\"params\":{},\"userName\":\"管理员\",\"deviceId\":1,\"deviceName\":\"灌溉机\",\"userId\":1,\"delFlg\":\"0\",\"createTime\":1589855717000,\"switchB\":\"1\",\"switchA\":\"1\",\"sensor\":\"temperature\",\"state\":\"1\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 23:10:56');
INSERT INTO `sys_oper_log` VALUES (148, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378483354,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:48:03');
INSERT INTO `sys_oper_log` VALUES (149, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378559084,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:49:19');
INSERT INTO `sys_oper_log` VALUES (150, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378637999,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:50:38');
INSERT INTO `sys_oper_log` VALUES (151, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378637999,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:50:38');
INSERT INTO `sys_oper_log` VALUES (152, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378638103,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:50:38');
INSERT INTO `sys_oper_log` VALUES (153, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378638311,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:50:38');
INSERT INTO `sys_oper_log` VALUES (154, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378638452,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:50:38');
INSERT INTO `sys_oper_log` VALUES (155, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"sbx\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"sbk\",\"createTime\":1617378702844,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:51:42');
INSERT INTO `sys_oper_log` VALUES (156, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"123\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"123\",\"createTime\":1617378712691,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:51:52');
INSERT INTO `sys_oper_log` VALUES (157, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"123\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"123\",\"createTime\":1617378720899,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:52:00');
INSERT INTO `sys_oper_log` VALUES (158, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"123\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"123\",\"createTime\":1617378996913,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'api_key\' doesn\'t have a default value\n; Field \'api_key\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'api_key\' doesn\'t have a default value', '2021-04-02 23:56:36');
INSERT INTO `sys_oper_log` VALUES (159, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"123\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"123\",\"createTime\":1617379150019,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2021-04-02 23:59:10');
INSERT INTO `sys_oper_log` VALUES (160, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"111\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"111\",\"createTime\":1617379172660,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2021-04-02 23:59:32');
INSERT INTO `sys_oper_log` VALUES (161, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"111\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"111\",\"createTime\":1617379240122,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2021-04-03 00:00:40');
INSERT INTO `sys_oper_log` VALUES (162, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"111\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"111\",\"createTime\":1617379240122,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2021-04-03 00:00:40');
INSERT INTO `sys_oper_log` VALUES (163, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"111\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"111\",\"createTime\":1617379240561,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2021-04-03 00:00:40');
INSERT INTO `sys_oper_log` VALUES (164, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"积分返回\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"发发发\",\"createTime\":1617379250449,\"state\":\"0\",\"category\":\"single_switch\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.xerswitch.mapper.XerSwitchMapper.insertXerSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into xer_switch          ( device_name,                                       state,                          category,                          create_time,                          user_name,             remark )           values ( ?,                                       ?,                          ?,                          ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value', '2021-04-03 00:00:50');
INSERT INTO `sys_oper_log` VALUES (165, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"积分返回\",\"params\":{},\"userName\":\"admin\",\"deviceId\":4,\"deviceName\":\"发发发\",\"createTime\":1617379306231,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 00:01:46');
INSERT INTO `sys_oper_log` VALUES (166, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"奥术大师多\",\"params\":{},\"userName\":\"admin\",\"deviceId\":5,\"deviceName\":\"阿萨德\",\"createTime\":1617379609064,\"state\":\"0\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 00:06:49');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '1.0.1.50,127.0.0.1', '内网IP', '{\"functionAuthor\":\"emply\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587626482000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587626482000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587626482000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":5,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"state\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"状态\",\"isQuery\":\"1\",\"updateTime\":1587626482000,\"sort\":5,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:24:25');
INSERT INTO `sys_oper_log` VALUES (168, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/4,5', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=4,5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:33:45');
INSERT INTO `sys_oper_log` VALUES (169, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"浇水\",\"params\":{},\"userName\":\"admin\",\"deviceId\":6,\"deviceName\":\"智能灌溉\",\"createTime\":1617431662154,\"state\":\"0\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:34:22');
INSERT INTO `sys_oper_log` VALUES (170, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"555\",\"params\":{},\"userName\":\"admin\",\"deviceId\":7,\"deviceName\":\"555\",\"createTime\":1617431869190,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:37:49');
INSERT INTO `sys_oper_log` VALUES (171, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/7', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:37:53');
INSERT INTO `sys_oper_log` VALUES (172, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"222\",\"params\":{},\"userName\":\"admin\",\"deviceId\":8,\"deviceName\":\"22\",\"createTime\":1617431880849,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:38:00');
INSERT INTO `sys_oper_log` VALUES (173, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/8', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 14:38:04');
INSERT INTO `sys_oper_log` VALUES (174, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"asd\",\"params\":{},\"userName\":\"admin\",\"deviceId\":9,\"deviceName\":\"asd\",\"createTime\":1617433725652,\"state\":\"0\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:08:45');
INSERT INTO `sys_oper_log` VALUES (175, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/6,9', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=6,9}', 'null', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'deviceId\' not found. Available parameters are [array]', '2021-04-03 15:08:51');
INSERT INTO `sys_oper_log` VALUES (176, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/6,9', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=6,9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:09:40');
INSERT INTO `sys_oper_log` VALUES (177, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"111\",\"params\":{},\"userName\":\"admin\",\"deviceId\":10,\"deviceName\":\"111\",\"createTime\":1617433786406,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:09:46');
INSERT INTO `sys_oper_log` VALUES (178, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"222\",\"params\":{},\"userName\":\"admin\",\"deviceId\":11,\"deviceName\":\"222\",\"createTime\":1617433878830,\"state\":\"0\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:11:18');
INSERT INTO `sys_oper_log` VALUES (179, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"222\",\"params\":{},\"userName\":\"admin\",\"deviceId\":12,\"deviceName\":\"111\",\"createTime\":1617433929200,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:12:09');
INSERT INTO `sys_oper_log` VALUES (180, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/10,11,12', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=10,11,12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:18:40');
INSERT INTO `sys_oper_log` VALUES (181, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"123\",\"params\":{},\"userName\":\"admin\",\"deviceId\":13,\"deviceName\":\"123\",\"createTime\":1617434326495,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:18:46');
INSERT INTO `sys_oper_log` VALUES (182, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/13', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:20:54');
INSERT INTO `sys_oper_log` VALUES (183, '智能开关', 3, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.remove()', 'DELETE', 1, 'admin', NULL, '/xersw/switch/14,16,15,17', '1.0.1.50,127.0.0.1', '内网IP', '{deviceIds=14,16,15,17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:27:24');
INSERT INTO `sys_oper_log` VALUES (184, '智能开关', 2, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.edit()', 'PUT', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"门禁\",\"updateTime\":1617434849538,\"params\":{},\"userName\":\"管理员\",\"deviceId\":2,\"deviceName\":\"门禁锁\",\"userId\":1,\"delFlg\":\"0\",\"createTime\":1589854976000,\"switchB\":\"1\",\"switchA\":\"1\",\"state\":\"1\",\"category\":\"double_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:27:29');
INSERT INTO `sys_oper_log` VALUES (185, '智能开关', 1, 'com.ruoyi.project.xerswitch.controller.XerSwitchController.add()', 'POST', 1, 'admin', NULL, '/xersw/switch', '1.0.1.50,127.0.0.1', '内网IP', '{\"remark\":\"开关\",\"params\":{},\"userName\":\"admin\",\"deviceId\":18,\"deviceName\":\"电闸\",\"createTime\":1617435985684,\"state\":\"0\",\"category\":\"single_switch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-03 15:46:25');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-28 11:57:23', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$HRHcPYQiLUrNMRRG17uR5edj/Kzm.vpkvhnlRYY./L01DAPpVV0.O', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for xer_switch
-- ----------------------------
DROP TABLE IF EXISTS `xer_switch`;
CREATE TABLE `xer_switch`  (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备分类字典ID',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备简介',
  `del_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `switch_a` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开关状态',
  `switch_b` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xer_switch
-- ----------------------------
INSERT INTO `xer_switch` VALUES (2, '门禁锁', '1', 'double_switch', '2021-04-03 15:27:30', '2020-05-19 10:22:56', 1, '管理员', '门禁', '0', '1', '1');
INSERT INTO `xer_switch` VALUES (3, '卧室灯', '1', 'single_switch', '2021-05-14 10:44:07', '2020-05-19 10:22:57', 1, 'admin', '控制卧室灯的单路开关0', '0', '1', '0');
INSERT INTO `xer_switch` VALUES (18, '电闸', '1', 'single_switch', '2021-05-13 20:07:54', '2021-05-13 20:07:54', 1, 'admin', '开关', '0', '1', '0');

SET FOREIGN_KEY_CHECKS = 1;
