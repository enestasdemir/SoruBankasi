/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100129
 Source Host           : localhost:3306
 Source Schema         : soru

 Target Server Type    : MySQL
 Target Server Version : 100129
 File Encoding         : 65001

 Date: 10/02/2018 16:41:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for secenekler
-- ----------------------------
DROP TABLE IF EXISTS `secenekler`;
CREATE TABLE `secenekler`  (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NULL DEFAULT NULL,
  `secenek` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `durum` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`seid`) USING BTREE,
  INDEX `soruID`(`sid`) USING BTREE,
  CONSTRAINT `soruID` FOREIGN KEY (`sid`) REFERENCES `sorular` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of secenekler
-- ----------------------------
INSERT INTO `secenekler` VALUES (1, 12, '1010', b'0');
INSERT INTO `secenekler` VALUES (2, 6, 'asd', b'0');
INSERT INTO `secenekler` VALUES (3, 6, 'asd', b'0');
INSERT INTO `secenekler` VALUES (4, 6, 'Test', b'0');
INSERT INTO `secenekler` VALUES (5, 7, 'ASD', b'1');
INSERT INTO `secenekler` VALUES (6, 7, 'test2', b'0');
INSERT INTO `secenekler` VALUES (8, 7, 'asd', b'0');
INSERT INTO `secenekler` VALUES (10, 6, 'ASD', b'0');
INSERT INTO `secenekler` VALUES (11, 9, 'falan', b'0');
INSERT INTO `secenekler` VALUES (12, 9, 'filan', b'1');

-- ----------------------------
-- Table structure for sorular
-- ----------------------------
DROP TABLE IF EXISTS `sorular`;
CREATE TABLE `sorular`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `soru` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sorular
-- ----------------------------
INSERT INTO `sorular` VALUES (6, 'Malazgirt meydan muharabesinin tarihi?');
INSERT INTO `sorular` VALUES (7, '“Sinekli Bakkal” Romanının Yazarı Aşağıdakilerden Hangisidir? ');
INSERT INTO `sorular` VALUES (8, 'Aşağıda Verilen İlk Çağ Uygarlıklarından Hangisi Yazıyı İcat Etmiştir? ');
INSERT INTO `sorular` VALUES (9, 'Böcekbilime Ne Ad Verilir? ');
INSERT INTO `sorular` VALUES (12, ' Dünyada İlk Defa Yivli-Setli Toplar Kim Zamanında Yapılmıştır?');

SET FOREIGN_KEY_CHECKS = 1;
