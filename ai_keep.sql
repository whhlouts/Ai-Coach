/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306_2
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : ai_keep

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 11/10/2024 06:55:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for body_data
-- ----------------------------
DROP TABLE IF EXISTS `body_data`;
CREATE TABLE `body_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `age` bigint NULL DEFAULT NULL,
  `bmi` double NULL DEFAULT NULL,
  `user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of body_data
-- ----------------------------
INSERT INTO `body_data` VALUES (1, 1, 74.7, 185, '111', 18, 3.1, '111');

-- ----------------------------
-- Table structure for fitness_report
-- ----------------------------
DROP TABLE IF EXISTS `fitness_report`;
CREATE TABLE `fitness_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `grade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `max_heart_rate` bigint NULL DEFAULT NULL,
  `user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fitness_report
-- ----------------------------

-- ----------------------------
-- Table structure for motion
-- ----------------------------
DROP TABLE IF EXISTS `motion`;
CREATE TABLE `motion`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `standard_video_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_upload_video_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of motion
-- ----------------------------

-- ----------------------------
-- Table structure for recommendation_list
-- ----------------------------
DROP TABLE IF EXISTS `recommendation_list`;
CREATE TABLE `recommendation_list`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `keywords` varbinary(255) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommendation_list
-- ----------------------------

-- ----------------------------
-- Table structure for sport_report
-- ----------------------------
DROP TABLE IF EXISTS `sport_report`;
CREATE TABLE `sport_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `calorie` double NULL DEFAULT NULL,
  `image_list` varbinary(255) NULL DEFAULT NULL,
  `max_days` bigint NULL DEFAULT NULL,
  `problem_list` varbinary(255) NULL DEFAULT NULL,
  `suggestion_list` varbinary(255) NULL DEFAULT NULL,
  `sum_days` bigint NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sport_report
-- ----------------------------

-- ----------------------------
-- Table structure for training_plan
-- ----------------------------
DROP TABLE IF EXISTS `training_plan`;
CREATE TABLE `training_plan`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `end_time` double NULL DEFAULT NULL,
  `start_time` double NULL DEFAULT NULL,
  `user_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_plan
-- ----------------------------

-- ----------------------------
-- Table structure for training_plan_motion
-- ----------------------------
DROP TABLE IF EXISTS `training_plan_motion`;
CREATE TABLE `training_plan_motion`  (
  `training_plan_id` bigint NOT NULL,
  `motion_id` bigint NOT NULL,
  INDEX `FKousf3dfoepmhjjff9b4h9xxnh`(`motion_id` ASC) USING BTREE,
  INDEX `FKri39p3muv8hbmbx8ce7l97baa`(`training_plan_id` ASC) USING BTREE,
  CONSTRAINT `FKousf3dfoepmhjjff9b4h9xxnh` FOREIGN KEY (`motion_id`) REFERENCES `motion` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKri39p3muv8hbmbx8ce7l97baa` FOREIGN KEY (`training_plan_id`) REFERENCES `training_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_plan_motion
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `age` float NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fan_num` bigint NULL DEFAULT NULL,
  `follower_num` bigint NULL DEFAULT NULL,
  `like_num` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, NULL, '111', '111', NULL, '111', 0, 0, 0);
INSERT INTO `user` VALUES (3, NULL, NULL, NULL, '111', NULL, '159', 0, 0, 0);
INSERT INTO `user` VALUES (4, NULL, NULL, NULL, '456', NULL, '2222', 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
