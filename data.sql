-- --------------------------------------------------------
-- Host:                         149.28.146.86
-- Server version:               8.0.22 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for life_stories
CREATE DATABASE IF NOT EXISTS `life_stories` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `life_stories`;

-- Dumping structure for function life_stories.fnStripTags
DELIMITER //
CREATE FUNCTION `fnStripTags`( Dirty varchar(4000) ) RETURNS varchar(4000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
    DETERMINISTIC
BEGIN
  DECLARE iStart, iEnd, iLength int;
    WHILE Locate( '<', Dirty ) > 0 And Locate( '>', Dirty, Locate( '<', Dirty )) > 0 DO
      BEGIN
        SET iStart = Locate( '<', Dirty ), iEnd = Locate( '>', Dirty, Locate('<', Dirty ));
        SET iLength = ( iEnd - iStart) + 1;
        IF iLength > 0 THEN
          BEGIN
            SET Dirty = Insert( Dirty, iStart, iLength, '');
          END;
        END IF;
      END;
    END WHILE;
    RETURN Dirty;
END//
DELIMITER ;

-- Dumping structure for table life_stories.tb_categories
CREATE TABLE IF NOT EXISTS `tb_categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_img_path` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_user` bigint NOT NULL,
  `updated_user` bigint DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_categories: ~4 rows (approximately)
/*!40000 ALTER TABLE `tb_categories` DISABLE KEYS */;
INSERT INTO `tb_categories` (`category_id`, `category_name`, `category_img_path`, `created_at`, `updated_at`, `created_user`, `updated_user`) VALUES
	(1, 'Life', NULL, '2020-12-10 11:16:15', NULL, 1, NULL),
	(2, 'Photography', NULL, '2020-12-10 11:16:51', NULL, 1, NULL),
	(3, 'Stories', NULL, '2020-12-10 11:17:06', NULL, 1, NULL),
	(4, 'Travel', NULL, '2020-12-10 11:17:19', NULL, 1, NULL);
/*!40000 ALTER TABLE `tb_categories` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_comments
CREATE TABLE IF NOT EXISTS `tb_comments` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `comment_parent_id` bigint DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_tbPosts_tbComment` (`post_id`),
  CONSTRAINT `FK_tbPosts_tbComment` FOREIGN KEY (`post_id`) REFERENCES `tb_posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_comments: ~185 rows (approximately)
/*!40000 ALTER TABLE `tb_comments` DISABLE KEYS */;
INSERT INTO `tb_comments` (`comment_id`, `post_id`, `comment_parent_id`, `name`, `email`, `comment`, `created_at`, `updated_at`) VALUES
	(23, 60, 0, 'vcl', 'adsa123', 'Bài viết như cc', '2021-01-05 15:02:15', NULL),
	(24, 60, 0, 'vcl', 'adsa123', 'đasad1123', '2021-01-05 15:02:19', NULL),
	(25, 60, 0, 'vcl', 'adsa123', 'sss123', '2021-01-05 15:02:29', NULL),
	(26, 60, 24, 'Cái quần què', 'adsa123', 'sads', '2021-01-05 15:02:39', NULL),
	(27, 60, 23, 'Cái quần què', 'adsa123', 'Hấydsad', '2021-01-05 15:02:52', NULL),
	(28, 60, 27, 'Cái quần què', 'adsa123', 'Csadsadsa', '2021-01-05 15:10:06', NULL),
	(29, 60, 0, 'Test', 'adsa123', 'sdasdsad', '2021-01-05 15:10:21', NULL),
	(30, 60, 29, 'TestSDSADSAD', 'adsa123SADSAD', 'DSADSAD', '2021-01-05 15:10:27', NULL),
	(31, 60, 30, 'TestSDSADSAD', 'adsa123SADSAD', 'đasadsadsa', '2021-01-05 15:10:52', NULL),
	(32, 60, 31, 'TestSDSADSAD', 'adsa123SADSAD', 'dsadsads', '2021-01-05 15:10:57', NULL),
	(33, 60, 32, 'TestSDSADSAD', 'adsa123SADSAD', 'sadsadsad', '2021-01-05 15:11:01', NULL),
	(34, 60, 0, 'FFFFFFFF', 'adsa123SADSAD', 'ádsadsa', '2021-01-05 15:11:09', NULL),
	(35, 60, 0, 'FFFFFFFF', 'adsa123SADSAD', 'sdsadsad', '2021-01-05 15:11:12', NULL),
	(36, 60, 0, 'FFFFFFFF', 'adsa123SADSAD', 'sdsadsad', '2021-01-05 15:11:20', NULL),
	(37, 60, 0, 'CCCC', 'FFFF', 'dsadsadsada', '2021-01-05 15:12:29', NULL),
	(38, 60, 0, 'CCCCsa2132', 'FFFF123213', 'đụ má tụi bây', '2021-01-05 15:12:40', NULL),
	(39, 60, 0, 'CCCCsa2132', 'FFFF123213', 'sadsadsa', '2021-01-05 15:12:47', NULL),
	(40, 60, 38, 'sdsa11111', '', 'dasdas123 12sda sdasd sad', '2021-01-05 15:12:56', NULL),
	(41, 60, 33, 'sdsa11111sadsa', '', 'sdsadsad', '2021-01-05 15:13:06', NULL),
	(42, 60, 41, 'CCCCC', 's123123', '123123213', '2021-01-05 15:13:23', NULL),
	(43, 60, 42, 'CCCCC', 's123123sđa123213', '@123213', '2021-01-05 15:13:43', NULL),
	(44, 60, 41, 'CCCCC', 's123123sđa123213', 'sa123123 sadsa123213', '2021-01-05 15:13:55', NULL),
	(45, 60, 24, 'CCCCC', 's123123sđa123213', 'dsadsadsadasd', '2021-01-05 15:14:21', NULL),
	(46, 60, 28, 'CCCCC', 's123123sđa123213', 'ádsadsadas', '2021-01-05 15:14:26', NULL),
	(47, 60, 23, 'CCCCC', 's123123sđa123213', 'sadsadsad', '2021-01-05 15:14:32', NULL),
	(48, 60, 23, 'CCCCC', 's123123sđa123213', 'sdsadsdsa', '2021-01-05 15:15:29', NULL),
	(49, 60, 27, 'CCCCC', 's123123sđa123213', 'dsadsadsad', '2021-01-05 15:15:35', NULL),
	(50, 60, 28, 'CCCCC', 's123123sđa123213', 'sadsadsada', '2021-01-05 15:15:39', NULL),
	(51, 60, 45, 'CCCCC', 's123123sđa123213', 'a212321321321313', '2021-01-05 15:15:45', NULL),
	(52, 60, 33, 'CCCCC', 's123123sđa123213', 'sad123123213', '2021-01-05 15:15:51', NULL),
	(53, 60, 44, 'CCCCC', 's123123sđa123213', 'sdsaasdsada', '2021-01-05 15:15:59', NULL),
	(54, 60, 50, 'CCCCC', 's123123sđa123213', '1111123123213sssada', '2021-01-05 15:16:14', NULL),
	(55, 60, 52, 'CCCCC', 's123123sđa123213', 'fffds12312321321', '2021-01-05 15:16:22', NULL),
	(56, 60, 55, 'chịch', 's123123sđa123213', 'chịch', '2021-01-05 15:16:39', NULL),
	(57, 60, 0, 'FFFFFFFFF', 's123123sđa123213', 'SSSSSSS', '2021-01-05 15:17:07', NULL),
	(58, 60, 0, 'FFFFFFFFF', 's123123sđa123213', 'ssssssss12312321321', '2021-01-05 15:17:18', NULL),
	(59, 60, 41, 'FFFFFFFFF', 's123123sđa123213', 'AAAAAAAAAAAdsad123213', '2021-01-05 15:17:53', NULL),
	(60, 60, 46, 'FFFFFFFFF', 's123123sđa123213', 'sá1213213213', '2021-01-05 15:18:23', NULL),
	(61, 60, 60, 'FFFFFFFFF', 's123123sđa123213', 'trang web rất đẹp', '2021-01-05 15:18:36', NULL),
	(62, 60, 61, 'FFFFFFFFF', 's123123sđa123213', 'Đẹp vl', '2021-01-05 15:18:43', NULL),
	(63, 60, 62, 'AXXXX', 's123123sđa123213', 'nói hay vc', '2021-01-05 15:18:55', NULL),
	(64, 61, 0, 'ccc', 'sdasdsada', 'trang web như cc', '2021-01-05 15:19:27', NULL),
	(65, 61, 0, 'cccquất ', 'quất ', 'quất ', '2021-01-05 15:19:36', NULL),
	(66, 61, 64, 'cccquất ', 'quất ', 'quất sád123123', '2021-01-05 15:19:41', NULL),
	(67, 61, 0, 'cccquất ', 'quất ', 'dsa1123123', '2021-01-05 15:20:02', NULL),
	(68, 61, 0, 'cccquất ', 'quất 12321321', 'AAAAAdsadsda123', '2021-01-05 15:20:11', NULL),
	(69, 61, 0, 'cccquất ', 'quất 12321321', 'SS12323', '2021-01-05 15:20:27', NULL),
	(70, 61, 0, 'cccquất ', 'quất 12321321', 'sad123213 sadsad123213 ', '2021-01-05 15:20:34', NULL),
	(71, 61, 65, 'cccquất ', 'quất 12321321', 'sdsadsa12321', '2021-01-05 15:20:45', NULL),
	(72, 61, 67, 'FFFFFFFFFFF', 'quất 12321321', 'sáds123213', '2021-01-05 15:20:52', NULL),
	(73, 61, 0, 'FFFFFFFFFFFsad 12321321', 'quất 12321321', 'AAAAAAAA123123 ', '2021-01-05 15:21:03', NULL),
	(74, 61, 69, 'XXXXXXXXXXXXX', 'quất 12321321', 'FFFFFF', '2021-01-05 15:21:10', NULL),
	(75, 61, 74, 'XXXXXXXXXXXXX', 'quất 12321321', 'sád12321321321', '2021-01-05 15:21:15', NULL),
	(76, 61, 75, 'FDFFFFFFFFF', 'quất 12321321', 'sdasdsa12321', '2021-01-05 15:21:20', NULL),
	(77, 61, 76, 'CCCCCCCC', 'quất 12321321', 'ssssss', '2021-01-05 15:21:27', NULL),
	(78, 61, 77, 'CCCCCCCC', 'quất 12321321', 'hay vcl', '2021-01-05 15:23:20', NULL),
	(79, 61, 78, 'CCCCCCCC', 'quất 12321321', 'sadsadsadsa', '2021-01-05 15:23:25', NULL),
	(80, 61, 79, 'CCCCCCCC', 'quất 12321321', 'sad12321321adada1321321', '2021-01-05 15:23:30', NULL),
	(81, 61, 80, 'FFFFFFFFFFF', 'quất 12321321', 'vlcádsad', '2021-01-05 15:23:44', NULL),
	(82, 60, 0, 'đâsdas', 'đâsdasdas', 'ewesadasdasd', '2021-01-06 19:17:54', NULL),
	(83, 60, 0, 'ádasdsada', '12312321', 'sdasdasdasd', '2021-01-06 19:17:59', NULL),
	(84, 60, 39, 'ádasdasd', 'ádasdasdasda', 'dsasdadas', '2021-01-06 19:18:05', NULL),
	(85, 60, 84, '12312', 'sadasdasdasdas', 'COn cặc', '2021-01-06 19:18:29', NULL),
	(86, 60, 57, '12312', 'sadasdasdasdas', 'dsadasd132esadsad', '2021-01-06 19:18:38', NULL),
	(87, 60, 58, '12312', 'sadasdasdasdas', 'đâsdasdasdas', '2021-01-06 19:18:43', NULL),
	(88, 60, 82, '12312', 'sadasdasdasdas', 'đâsdasd123 sadas asda ', '2021-01-06 19:18:49', NULL),
	(89, 60, 49, '12312SDDĐ', 'sadasdasdasdassad123 21312 2312321', 'AAAAAAAAAAAA', '2021-01-06 19:19:16', NULL),
	(90, 60, 51, '12312SDDĐ', 'sadasdasdasdassad123 21312 2312321', 'ádasdasdasdas', '2021-01-06 19:19:21', NULL),
	(91, 60, 90, '12312SDDĐ', 'sadasdasdasdassad123 21312 2312321', 'asdasda123 13213 ', '2021-01-06 19:19:26', NULL),
	(92, 60, 91, '12312SDDĐ', 'sadasdasdasdassad123 21312 2312321', 'sadasd 123 asd 1213 2', '2021-01-06 19:19:31', NULL),
	(93, 60, 92, '12312SDDĐ', 'sadasdasdasdassad123 21312 2312321', 'sad 123 asd qasad 123 12 213sad 13213 ', '2021-01-06 19:19:38', NULL),
	(94, 60, 51, '12312SDDĐ', 'sadasdasdasdassad123 21312 2312321', 'kjhjkhjkhkhkjjk', '2021-01-06 19:20:08', NULL),
	(95, 60, 61, 'shit', '', 'NHư cc á', '2021-01-06 21:01:50', NULL),
	(96, 60, 39, 'shit', '', 'sdsadasdsa', '2021-01-06 21:02:26', NULL),
	(97, 60, 56, 'shit', '', 'sadasdasd', '2021-01-06 21:02:47', NULL),
	(98, 60, 97, 'shit', '', 'sdadasdasdasd', '2021-01-06 21:02:52', NULL),
	(99, 60, 98, 'shitd1231313', '', 'đâsdasdấds', '2021-01-06 21:02:57', NULL),
	(100, 60, 99, 'shitd1231313', '', 'sa1`2`12`21', '2021-01-06 21:03:03', NULL),
	(101, 60, 58, 'hhh', '', 'hhhh', '2021-01-06 21:03:28', NULL),
	(102, 60, 35, 'sadasd', '', 'Hay vc', '2021-01-06 21:03:41', NULL),
	(103, 60, 60, 'kkk', 'jkh', 'hhhhhhhhhhhhjk', '2021-01-07 17:06:00', NULL),
	(104, 60, 48, 'cẹc', '', 's', '2021-01-07 17:06:17', NULL),
	(105, 60, 57, 'cẹc', '', 'SADASDSADAD', '2021-01-07 17:06:30', NULL),
	(106, 60, 105, 'cẹc', 'SADASDASD', 'dddddS1231', '2021-01-07 17:06:50', NULL),
	(107, 60, 86, 'cẹc', 'SADASDASD', 'ÁDASDSADASDAS', '2021-01-07 17:06:56', NULL),
	(108, 60, 107, 'cẹc', 'SADASDASD', 'DẤDADASD', '2021-01-07 17:07:01', NULL),
	(109, 60, 108, 'cẹc', 'SADASDASD', 'aaaaa', '2021-01-07 17:07:07', NULL),
	(110, 60, 109, 'cẹc', 'SADASDASD', 'fffffffffd sđfdsfdsfds', '2021-01-07 17:07:14', NULL),
	(111, 60, 110, 'cẹc', 'SADASDASD', 'dsfdsfdsfs dsfsfsd dfsdfs', '2021-01-07 17:07:19', NULL),
	(112, 60, 54, 'lm,m.m,.', '', 'kjjjkhjk', '2021-01-07 20:07:44', NULL),
	(113, 60, 48, 'lm,m.m,.', '', 'nm,nm,m', '2021-01-07 20:08:05', NULL),
	(114, 60, 26, 'lm,m.m,.', '', 'hhhhhhhhhhhhh', '2021-01-07 20:08:16', NULL),
	(115, 60, 0, 'sadasdasd', 'đâsda', 'dấdasdas', '2021-01-07 21:45:10', NULL),
	(116, 60, 60, 'đasadas', 'ssss', 'sdsadsadsad', '2021-01-08 14:04:32', NULL),
	(117, 82, 0, 'sssss', 'dsadsad', 'sdsadasdsa', '2021-01-11 10:39:11', NULL),
	(118, 82, 117, 'aaa', 'vvvv', 'sdsadsad', '2021-01-11 10:39:19', NULL),
	(119, 82, 0, 'aaa', 'vvvv', 'sadsadasd', '2021-01-11 10:39:22', NULL),
	(120, 82, 0, 'aaa', 'vvvv', 'AAAAAAAAAAA', '2021-01-11 10:39:28', NULL),
	(121, 82, 0, 'aaa', 'vvvv', 'sadasdad', '2021-01-11 10:39:37', NULL),
	(122, 82, 121, 'aaa', 'vvvv', 'sad12312312321321', '2021-01-11 10:39:45', NULL),
	(123, 82, 0, 'aaa', 'vvvv', 'sadsadsad', '2021-01-11 10:39:48', NULL),
	(124, 82, 0, '1232321', 'vvvv', 'ssadada', '2021-01-11 10:39:54', NULL),
	(125, 73, 0, 'dsadsa', 'sdsadsad', 'sadsadsdasa', '2021-01-11 15:37:15', NULL),
	(126, 60, 0, 'dsadsa', 'sdsadsad', 'AAAAAAAAAAAAAAA', '2021-01-11 17:07:12', NULL),
	(127, 60, 0, 'dsadsa', 'sdsadsad', 'dsadasdasdsa', '2021-01-11 17:07:21', NULL),
	(128, 60, 0, 'dsadsa', 'sdsadsad', 'CCCCCCCC', '2021-01-11 17:07:28', NULL),
	(129, 60, 0, 'AAAAAAAAAAAAAAAAAAAAAAA', 'sdsadsad', 'sadsad', '2021-01-11 17:07:39', NULL),
	(130, 60, 61, 'dsfdsfdfs', 'fdsdfsf', 'dsdfsdf', '2021-01-12 09:56:29', NULL),
	(131, 60, 26, 'dsfdsfdfs', 'fdsdfsf', 'sdfdsfdsf', '2021-01-12 09:56:36', NULL),
	(132, 60, 82, 'dsfdsfdfs', 'fdsdfsf', 'dsadasdad', '2021-01-12 09:56:43', NULL),
	(133, 60, 88, 'dsfdsfdfs', 'fdsdfsf', 'sadsadada', '2021-01-12 09:56:47', NULL),
	(134, 60, 128, 'dsfdsfdfs', 'fdsdfsf', 'sadadad', '2021-01-12 09:56:51', NULL),
	(135, 60, 91, 'dsfdsfdfs', 'fdsdfsf', 'fdsfdsfsdfds', '2021-01-12 09:57:18', NULL),
	(136, 75, 0, 'sadsadsa', '123213213', 'AAAAAAAAAAAAAAAAAAA', '2021-01-12 10:27:47', NULL),
	(137, 75, 0, 'dfdsfdsf', 'fdsdfdsf', 'dfdsfsdfds', '2021-01-12 10:27:55', NULL),
	(138, 75, 137, 'dfdsfdsf', 'fdsdfdsf', 'dsadasdas', '2021-01-12 10:27:59', NULL),
	(139, 75, 0, 'dfdsfdsf', 'fdsdfdsf', 'sdsadsadas', '2021-01-12 10:28:01', NULL),
	(140, 75, 138, 'dfdsfdsf', 'fdsdfdsf', 'dsadasdsa', '2021-01-12 10:28:05', NULL),
	(141, 75, 140, 'dfdsfdsf', 'fdsdfdsf', 'sadsadsadsa', '2021-01-12 10:28:08', NULL),
	(142, 75, 141, 'dfdsfdsf', 'fdsdfdsf', 'dsadsadas', '2021-01-12 10:28:11', NULL),
	(143, 75, 142, 'dfdsfdsf', 'fdsdfdsf', 'dsasdsasadsa', '2021-01-12 10:28:15', NULL),
	(144, 75, 143, 'dfdsfdsf', 'fdsdfdsf', 'sấdsdasdasdasdasad', '2021-01-12 10:28:19', NULL),
	(145, 75, 139, 'dfdsfdsf', 'fdsdfdsf', 'fdsfsdfdsdf', '2021-01-12 10:28:26', NULL),
	(146, 75, 136, 'dfdsfdsf', 'fdsdfdsf', 'AAAAAAAAAAAAA', '2021-01-12 10:28:33', NULL),
	(147, 75, 146, 'dfdsfdsf', 'fdsdfdsf', 'sdsadsadsa', '2021-01-12 10:28:37', NULL),
	(148, 75, 147, 'dfdsfdsf', 'fdsdfdsf', 'dsasadsadsasa', '2021-01-12 10:28:44', NULL),
	(149, 75, 148, 'dfdsfdsf', 'fdsdfdsf', 'dsadsadsa', '2021-01-12 10:28:50', NULL),
	(150, 61, 0, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'test test test test test test test test test test test \ntest test test test test test test test test test test', '2021-01-12 11:07:08', NULL),
	(151, 61, 150, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'test test test test test test test test test\ntest test test test test test test test test\ntest test test test test test test test test', '2021-01-12 11:07:27', NULL),
	(152, 61, 151, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'fsadsadsadsadsaasd123 sad 213 213 sada 123 sad 3123 ', '2021-01-12 11:07:38', NULL),
	(153, 61, 0, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'FBI cảnh báo các cuộc biểu tình vũ trang đang được lên kế hoạch tại 50 tòa nghị viện bang và tòa nhà quốc hội Mỹ trước thềm 20/1.\n\nCác cuộc biểu tình này được lên kế hoạch diễn ra từ ngày 16/1 đến ít nhất là ngày 20/1 tại 50 tòa nghị viện bang và từ ngày 17/1-20/1 tại tòa nhà quốc hội Mỹ, FBI ra tuyên bố hôm 11/1, cảnh báo thêm nguy cơ xảy ra "cuộc nổi dậy" nếu Tổng thống Mỹ Donald Trump bị phế truất theo Tu chính án thứ 25 trước Ngày nhậm chức 20/1 của Joe Biden.\n\nFBI cho biết ngay từ ngày 8/1, họ đã nhận được thông tin về một nhóm đang kêu gọi mọi người biểu tình ở các tòa án, trụ sở chính quyền bang và liên bang trong trường hợp Tổng thống bị bãi nhiệm trước ngày 20/1. Nhóm này cũng có kế hoạch "gây bão" Đồi Capitol và các tòa nghị viện 50 bang', '2021-01-12 11:08:12', NULL),
	(154, 61, 153, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'sadsadasdas', '2021-01-12 11:08:20', NULL),
	(155, 61, 0, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'FBI cho biết ngay từ ngày 8/1, họ đã nhận được thông tin về một nhóm đang kêu gọi mọi người biểu tình ở các tòa án, trụ sở chính quyền bang và liên bang trong trường hợp Tổng thống bị bãi nhiệm trước ngày 20/1. Nhóm này cũng có kế hoạch "gây bão" Đồi Capitol và các tòa nghị viện 50 bang.', '2021-01-12 11:08:31', NULL),
	(156, 61, 155, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'Trước lời kêu gọi về các cuộc biểu tình mới ở khắp các bang và thủ đô Washington, lực lượng thực thi pháp luật và các quan chức địa phương đang gấp rút chuẩn bị cho nguy cơ có thể xảy ra bạo lực trong những ngày tới.\n\n', '2021-01-12 11:08:41', NULL),
	(157, 61, 156, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'Trước lời kêu gọi về các cuộc biểu tình mới ở khắp các bang và thủ đô Washington, lực lượng thực thi pháp luật và các quan chức địa phương đang gấp rút chuẩn bị cho nguy cơ có thể xảy ra bạo lực trong những ngày tới.\n\n', '2021-01-12 11:08:46', NULL),
	(158, 61, 157, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'Trước lời kêu gọi về các cuộc biểu tình mới ở khắp các bang và thủ đô Washington, lực lượng thực thi pháp luật và các quan chức địa phương đang gấp rút chuẩn bị cho nguy cơ có thể xảy ra bạo lực trong những ngày tới.\n\n', '2021-01-12 11:08:51', NULL),
	(159, 61, 158, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'Trước lời kêu gọi về các cuộc biểu tình mới ở khắp các bang và thủ đô Washington, lực lượng thực thi pháp luật và các quan chức địa phương đang gấp rút chuẩn bị cho nguy cơ có thể xảy ra bạo lực trong những ngày tới.\n\ndsadsadsadsad', '2021-01-12 11:08:56', NULL),
	(160, 75, 136, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'hggfhfhfgh', '2021-01-12 11:10:56', NULL),
	(161, 75, 149, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'aaaaaaaaaaaaaaaaaaaaaaagfdgdf\ndfdffdfdfd', '2021-01-12 11:11:05', NULL),
	(162, 75, 161, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'fdsfdsf\nfsdfsdf\nfdsfsdf\ndsfsdfsd\nfsdfdsf\nsdfsdf', '2021-01-12 11:11:16', NULL),
	(163, 75, 136, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'FFFFFFFFFFFFF', '2021-01-12 11:12:05', NULL),
	(164, 75, 136, 'Tran Phuc Vinh AAAAAAAAAAA', 'vinhtranphuc@gmail.com', 'Tran Phuc Vinh AAAAAAAAAAA', '2021-01-12 11:12:17', NULL),
	(165, 75, 160, 'Tran Phuc Vinh AAAAAAAAAAA', 'vinhtranphuc@gmail.com', 'dsasadsa\ndsadsadsa\ndsadsadsad\nádasdsadsadsa\ndsadsadsa\n', '2021-01-12 11:19:27', NULL),
	(166, 75, 165, 'Tran Phuc Vinh AAAAAAAAAAA', 'vinhtranphuc@gmail.com', 'AAA\nBBB\nCCC', '2021-01-12 11:19:43', NULL),
	(167, 75, 166, 'Tran Phuc Vinh AAA', 'vinhtranphuc@gmail.com', 'sdsasa', '2021-01-12 11:20:00', NULL),
	(168, 75, 167, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'aa', '2021-01-12 11:20:17', NULL),
	(169, 75, 168, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'dssdsad\n2132132\nsadsadsad\ndsadsad', '2021-01-12 11:20:25', NULL),
	(170, 63, 0, 'AAA', 'VVV', 'S123', '2021-01-12 11:22:45', NULL),
	(171, 63, 0, 'AAABBBBB', 'VVV', '123sd sdsad', '2021-01-12 11:23:02', NULL),
	(172, 63, 170, 'AAABBBBB', 'VVV', 'đ2123123', '2021-01-12 11:23:07', NULL),
	(173, 63, 172, 'AAABBBBB', 'VVV', 'AAAAAAAAAAA23 dsfdsf3 213132', '2021-01-12 11:23:15', NULL),
	(174, 60, 129, 'dsasdsad', 'asdsadas', 'dsadsadasd', '2021-01-13 10:25:14', NULL),
	(175, 60, 115, 'dsasdsad', 'asdsadas', 'sdsadasdas', '2021-01-13 10:25:18', NULL),
	(176, 61, 71, 'dsasdsad', 'asdsadas', 'ddsadasdas', '2021-01-13 10:26:11', NULL),
	(177, 61, 64, 'dsasdsad', 'asdsadas', 'dsadasda', '2021-01-13 10:26:17', NULL),
	(178, 61, 66, 'dsasdsad', 'asdsadas', 'dsadasdsa', '2021-01-13 10:26:21', NULL),
	(179, 60, 130, 'dsasdsad', 'asdsadas', 'dsadsadsad', '2021-01-13 10:29:02', NULL),
	(180, 80, 0, 'asdsad', '', 'ccc', '2021-01-19 09:27:22', NULL),
	(181, 80, 0, 'dsadsad', '', 'sdasdsad', '2021-01-19 09:27:27', NULL),
	(182, 60, 134, 'dsfdsfdsfsd', 'fsdfsfsfdsfds', 'dfsfsfsdfs', '2021-01-20 15:18:42', NULL),
	(183, 60, 182, 'dsfdsfdsfsd', 'fsdfsfsfdsfds', 'reqewqewqewq', '2021-01-20 15:18:47', NULL),
	(184, 60, 0, 'dsfdsfdsfsd', 'fsdfsfsfdsfds', 'dsadasdas', '2021-01-20 15:18:57', NULL),
	(185, 60, 0, 'sdadasd', '', 'dsadsa', '2021-01-20 15:19:02', NULL),
	(186, 66, 0, 'sadsadsad', 'ádsadsa', 'dsdsadsa', '2021-01-21 07:03:23', NULL),
	(187, 66, 0, 'sadsadsad', 'ádsadsa', 'sadsadsad', '2021-01-21 07:03:26', NULL),
	(188, 66, 0, 'sadsadsad', 'ádsadsa', 'saddsadsa', '2021-01-21 07:03:31', NULL),
	(189, 66, 0, 'aaaaa', '1232321', '1232132', '2021-01-21 07:03:41', NULL),
	(190, 84, 0, 'Tran Phuc Vinh', '', 'Bbb', '2021-01-21 23:34:06', NULL),
	(191, 84, 190, 'Hh', '', 'Ggg', '2021-01-21 23:34:32', NULL),
	(192, 84, 0, 'Tran Phuc Vinh', '', 'Hhhh', '2021-01-21 23:34:41', NULL),
	(193, 84, 0, 'Tran Phuc Vinh', '', 'Jhhjj', '2021-01-21 23:35:03', NULL),
	(194, 84, 0, 'Tran Phuc Vinh', '', 'Gggg', '2021-01-21 23:35:24', NULL),
	(195, 84, 193, 'Tran Phuc Vinh', '', 'Jjj', '2021-01-21 23:35:33', NULL),
	(196, 84, 195, 'Tran Phuc Vinh', '', 'Kkkkkk', '2021-01-21 23:35:42', NULL),
	(197, 84, 196, 'Tran Phuc Vinh', '', 'Hhhh', '2021-01-21 23:35:59', NULL),
	(198, 75, 0, 'sadasdasdsa', 'đáas', 'đâsd', '2021-01-23 04:44:50', NULL),
	(199, 75, 0, 'sadasdasdsa', 'đáas', 'sadasdsad', '2021-01-23 04:44:58', NULL),
	(200, 80, 0, 'Ffffc', '', 'Vncncncncnc', '2021-01-23 11:59:35', NULL),
	(201, 80, 0, 'Ffffc', '', 'Vncncncncnc', '2021-01-23 11:59:36', NULL),
	(202, 80, 0, 'Ffffc', '', 'Vncncncncnc', '2021-01-23 11:59:38', NULL),
	(203, 84, 197, 'Tran Phuc Vinh', 'tpvinh.2212@gmail.com', 'xcvcxv', '2021-01-24 05:22:46', NULL),
	(204, 66, 189, 'ghfghfgh', '', 'hgfghfhgg', '2021-01-24 05:32:08', NULL),
	(205, 61, 77, 'AAAAAAAAAAAA', '', 'AAAAAAAAAAAA', '2021-01-26 03:08:10', NULL),
	(206, 61, 72, 'fsdfsdfsd', 'fsdfsdfsd', 'fdsfdsf', '2021-01-26 07:34:53', NULL),
	(207, 61, 66, 'fsdfsdfsd', 'fsdfsdfsd', 'dsadsadsa', '2021-01-26 07:34:58', NULL),
	(208, 66, 0, '21323213', '123123213', 'AAAAAAAAAAAAAAA', '2021-01-27 02:15:09', NULL),
	(209, 66, 204, '21323213', '123123213', 'dsadada', '2021-01-27 02:15:15', NULL);
/*!40000 ALTER TABLE `tb_comments` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_contact
CREATE TABLE IF NOT EXISTS `tb_contact` (
  `contact_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table life_stories.tb_contact: ~3 rows (approximately)
/*!40000 ALTER TABLE `tb_contact` DISABLE KEYS */;
INSERT INTO `tb_contact` (`contact_id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
	(7, 'AAAAAAAAAA', 'B', 's', '123123', '2021-01-12 10:27:29', NULL),
	(8, 'Tran Phuc Vinh', 'vinhtranphuc@gmail.com', 'test', 'test test test test test test test test \ntest test test test test test test test', '2021-01-12 11:06:34', NULL),
	(10, 'dsadasd', 'ádsadas', 'dsadad', 'ssssss', '2021-01-22 02:01:10', NULL);
/*!40000 ALTER TABLE `tb_contact` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_page_info
CREATE TABLE IF NOT EXISTS `tb_page_info` (
  `restriction` enum('') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_us` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_us` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_actived` tinyint(1) DEFAULT NULL,
  `pinterest_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest_actived` tinyint(1) DEFAULT NULL,
  `youtube_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_actived` tinyint(1) DEFAULT NULL,
  `instagram_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_actived` tinyint(1) DEFAULT NULL,
  `twitter_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_actived` tinyint(1) DEFAULT NULL,
  `flickr_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flickr_actived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`restriction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_page_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_page_info` DISABLE KEYS */;
INSERT INTO `tb_page_info` (`restriction`, `about_us`, `contact_us`, `facebook_url`, `facebook_actived`, `pinterest_url`, `pinterest_actived`, `youtube_url`, `youtube_actived`, `instagram_url`, `instagram_actived`, `twitter_url`, `twitter_actived`, `flickr_url`, `flickr_actived`) VALUES
	('', NULL, NULL, 'https://www.facebook.com/tranphucvinh2212', 1, 'https://www.pinterest.com/tranphucvinh2212', 1, 'https://www.youtube.com/user/tpvinh', 1, 'https://www.instagram.com/vinhtranphucqwe', 1, 'Twitter', 0, 'https://www.flickr.com/photos/191849641@N02', 1);
/*!40000 ALTER TABLE `tb_page_info` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_posts
CREATE TABLE IF NOT EXISTS `tb_posts` (
  `post_id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `times_of_view` int NOT NULL,
  `like_cnt` int NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `published_at` datetime DEFAULT NULL,
  `has_images_ontop` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_user` bigint NOT NULL DEFAULT '0',
  `updated_user` bigint DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `FKijnwr3brs8vaosl80jg9rp7uc` (`category_id`),
  CONSTRAINT `FK_tbCategories_tbPosts` FOREIGN KEY (`category_id`) REFERENCES `tb_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_posts: ~23 rows (approximately)
/*!40000 ALTER TABLE `tb_posts` DISABLE KEYS */;
INSERT INTO `tb_posts` (`post_id`, `category_id`, `content`, `level`, `summary`, `times_of_view`, `like_cnt`, `title`, `published_at`, `has_images_ontop`, `created_at`, `updated_at`, `created_user`, `updated_user`) VALUES
	(60, 1, '<p style="margin-left:0px;"><span style="color:rgb(117,117,117)!important;">TP HCM </span>Để chuẩn bị cho cuộc bầu cử Quốc gia vào tháng 5, bộ máy hành chính nhà nước của TP Thủ Đức chính thức hoạt động vào ngày 7/2.</p>\n<p style="margin-left:0px;">Quyết định điều chỉnh kế hoạch thực hiện Nghị quyết số 1111/2020 của Ủy ban Thường vụ Quốc hội về thành lập<i> TP Thủ Đức thuộc TP HCM - </i>sớm hơn gần một tháng so với <a href="https://vnexpress.net/tp-thu-duc-hoat-dong-tu-ngay-1-3-2021-4211393.html">kế hoạch</a> trước đây, vừa được Phó chủ tịch UBND thành phố Võ Văn Hoan ký.</p>\n<p style="margin-left:0px;">Trước ngày 8/1, Ban Tổ chức Thành ủy tham mưu Ban Thường vụ Thành ủy TP HCM sáp nhập bộ máy các tổ chức Đảng, chính trị - xã hội của quận 2, 9 và Thủ Đức. Từ đó, chỉ định Ban Chấp hành, Ban Thường vụ, Bí thư, Phó bí thư Thành ủy Thủ Đức và thành ủy viên.</p>\n<p style="margin-left:0px;">Muộn nhất ngày 17/1, HĐND TP Thủ Đức bầu các chức danh thuộc thẩm quyền, bao gồm: Chủ tịch và Phó chủ tịch HĐND, Trưởng ban và Phó trưởng ban của các ban thuộc HĐND, Chủ tịch, các Phó chủ tịch và ủy viên UBND TP Thủ Đức.</p>\n<figure class="image image_resized" style="width:670px;">\n <img src="https://i1-vnexpress.vnecdn.net/2021/01/02/thanh-pho-thu-duc-1446-1605090-1504-2656-1609589444.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=O0SrHAmWnmrSNU2quxzTuQ" alt="TP Thủ Đức thành lập trên cơ sở sáp nhập 3 quận 2, 9 và Thủ Đức. Đồ hoạ: Thanh Huyền.">\n <figcaption>\n  đụ má\n </figcaption>\n</figure>\n<p style="margin-left:0px;text-align:center;">TP Thủ Đức thành lập trên cơ sở sáp nhập 3 quận 2, 9 và Thủ Đức. Đồ hoạ: <i>Thanh Huyền.</i></p>\n<p style="margin-left:0px;">Đối với các cơ quan ngành dọc trực thuộc Trung ương, TP HCM đề nghị các ngành Tòa án, Viện Kiểm sát, Công an, Ban Chỉ huy Quân sự, Chi cục Thi hành án dân sự, Bảo hiểm xã hội, Kho bạc, Ngân hàng Chính sách, Chi cục thuế, Chi cục Thống kê... sắp xếp tổ chức bộ máy; tài sản; biên chế, công chức, viên chức và người lao động trước ngày 25/1.</p>\n<p style="margin-left:0px;">Chính quyền TP HCM cũng đề nghị người đứng đầu các sở ngành sắp xếp, tổ chức bộ máy; tài sản; biên chế các đơn vị trực thuộc phù hợp với đơn vị hành chính mới. Đồng thời, hướng dẫn các thủ tục liên quan đến người dân và doanh nghiệp trong giai đoạn chuyển tiếp trước ngày 25/1.</p>\n<p style="margin-left:0px;">Các cơ quan, đơn vị và địa phương phải hoàn tất việc thay đổi bảng tên và biển hiệu trước ngày 1/2. Ngoài ra, trước ngày 7/2 phải thành lập Ủy ban bầu cử ở TP Thủ Đức và ở các phường nơi sắp xếp đơn vị hành chính.</p>\n<p style="margin-left:0px;">Từ ngày 7/2 đến ngày bầu cử 23/5, các cơ quan, đơn vị hoàn thiện tổ chức bộ máy và đội ngũ cán bộ sau khi sắp xếp, chuẩn bị các điều kiện để tổ chức bầu cử đại biểu Quốc hội khóa XV và đại biểu HĐND các cấp nhiệm kỳ 2021-2026.</p>\n<p style="margin-left:0px;">Tại quyết định này, UBND TP HCM cũng lập Tổ công tác xử lý những vấn đề phát sinh do Sở Nội vụ làm tổ trưởng, các thành viên là đại diện các cơ quan: Ban Tổ chức Thành ủy, các sở Tư pháp, Tài chính, Kế hoạch và Đầu tư, Tài nguyên và Môi trường, Xây dựng, Văn phòng UBND TP HCM.</p>', 1, 'sumary sumary sumary sumary sumary sumary sumary sumary Test 1', 0, 7, 'Test 1', '2020-12-30 00:00:00', 1, '2020-12-30 08:43:49', '2021-01-14 02:11:05', 7, 1),
	(61, 1, '<p>Test xxx</p>\n<p>dsadsadsadsa</p>', 1, 'Test xxxx', 0, 1, 'Test 2', '2020-12-30 00:00:00', 0, '2020-12-30 08:48:32', '2021-01-27 04:09:00', 1, 1),
	(63, 1, '<p>Test 4</p>\n<figure class="image">\n <img src="/store/upload/post/63/content_images/20201230084923217233352020123008492321723335.png">\n</figure>', 1, 'Test 4', 0, 1, 'Test 4', '2020-12-30 00:00:00', NULL, '2020-12-30 08:49:23', NULL, 1, 0),
	(64, 1, '<p>Test 5</p>\n<figure class="image">\n <img src="/store/upload/post/64/content_images/20201230085126356650712020123008512635665071.png">\n <figcaption>\n  ưdasdsad\n </figcaption>\n</figure>', 1, 'Test 5', 0, 0, 'Test 5', '2020-12-30 00:00:00', 0, '2020-12-30 08:51:26', '2021-01-27 09:08:42', 1, 1),
	(66, 2, '<p>Test 7</p>\n<figure class="image">\n <img src="/store/upload/post/66/content_images/20201230085243883172612020123008524388317261.png">\n</figure>', 1, 'Test 7', 0, 1, 'Test 7', '2021-01-21 00:00:00', 1, '2020-12-30 08:52:43', '2021-01-03 08:51:19', 1, 1),
	(67, 2, '<p>Test 8</p>\n<figure class="image">\n <img src="/store/upload/post/67/content_images/20201230085322769997172020123008532276999717.png">\n</figure>', 1, 'Test 8', 0, 1, 'Test 8', '2020-12-30 00:00:00', NULL, '2020-12-30 08:53:22', NULL, 1, 0),
	(68, 1, '<p>Test 9</p>', 1, 'Test 9', 0, 0, 'Test 9', '2020-12-30 00:00:00', NULL, '2020-12-30 08:54:07', NULL, 1, 0),
	(69, 3, '<p>Test 9</p>\n<figure class="image image_resized" style="width:29.65%;">\n <img src="/store/upload/post/69/content_images/20201230091512803985682020123009151280398568.png">\n</figure>', 1, 'Test 9', 0, 0, 'Test 9', '2020-12-30 00:00:00', NULL, '2020-12-30 09:15:12', NULL, 1, 0),
	(70, 3, '<p>Test 10</p>\n<figure class="image">\n <img src="/store/upload/post/70/content_images/20201230091543477237642020123009154347723764.png">\n</figure>', 1, 'Test 10', 0, 0, 'Test 10', '2020-12-30 00:00:00', NULL, '2020-12-30 09:15:43', NULL, 1, 0),
	(71, 3, '<p>Test 11</p>', 2, 'Test 11', 0, 0, 'Test 11', '2020-12-30 00:00:00', NULL, '2020-12-30 09:16:37', NULL, 1, 0),
	(72, 3, '<p>Test 12</p>', 1, 'Test 12', 0, 0, 'Test 12', '2020-12-30 00:00:00', NULL, '2020-12-30 09:17:35', NULL, 1, 0),
	(73, 4, '<p>Test 14</p>', 1, 'Test 14', 0, 0, 'Test 14', '2020-12-30 00:00:00', NULL, '2020-12-30 09:40:15', NULL, 1, 0),
	(74, 4, '<p>Test 15</p>\n<figure class="image image_resized" style="width:52.38%;">\n <img src="/store/upload/post/74/content_images/20201230101945337305802020123010194533730580.png">\n</figure>', 1, 'Test 15', 0, 0, 'Test 15', '2020-12-30 00:00:00', NULL, '2020-12-30 10:19:44', NULL, 1, 0),
	(75, 4, '<p>Test 16</p>', 1, 'Test 16', 0, 1, 'Test 16', '2020-12-30 00:00:00', NULL, '2020-12-30 10:20:59', NULL, 1, 0),
	(76, 4, '<p>Test 17</p>', 1, 'Test 17', 0, 0, 'Test 17', '2020-12-30 00:00:00', NULL, '2020-12-30 10:22:00', NULL, 1, 0),
	(77, 4, '<p>Test 18</p>', 1, 'Test 18', 0, 0, 'Test 18', '2020-12-30 00:00:00', NULL, '2020-12-30 10:22:39', NULL, 1, 0),
	(78, 4, '<p>Test 19</p>', 1, 'Test 19', 0, 0, 'Test 19', '2020-12-30 00:00:00', NULL, '2020-12-30 10:23:06', NULL, 1, 0),
	(79, 4, '<p>Test 20</p>', 1, 'Test 20', 0, 0, 'Test 20', '2020-12-30 00:00:00', NULL, '2020-12-30 10:23:39', NULL, 1, 0),
	(80, 4, '<p>Test 21</p>', 1, 'Test 21', 0, 1, 'Test 21', '2020-12-30 00:00:00', NULL, '2020-12-30 10:24:03', NULL, 1, 0),
	(81, 4, '<p>Test 22</p>', 1, 'Test 22', 0, 0, 'Test 22', '2020-12-30 00:00:00', 0, '2020-12-30 10:24:27', '2021-01-19 08:34:57', 1, 1),
	(82, 3, '<p>Test xxxx</p>\n<figure class="image image_resized" style="width:64.75%;">\n <img src="/store/upload/post/82/content_images/20210111103739161569612021011110373916156961.png">\n <figcaption>\n  sdasdsadsa\n </figcaption>\n</figure>', 1, 'Test xxxx', 0, 0, 'Test xxxx', '2020-12-31 00:00:00', 1, '2020-12-31 08:59:54', '2021-01-11 10:38:37', 1, 1),
	(83, 3, '<p>dfsdfdsf</p>', 1, 'title', 0, 0, 'title', '2020-12-31 00:00:00', 1, '2020-12-31 13:44:35', '2021-01-11 10:36:46', 1, 1),
	(84, 2, '<p style="margin-left:0px;">Lommodo ligula eget dolor. Aenean massa. Cum sociis que penatibus et magnis dis parturient montes lorem, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla onsequat massa quis enim. Donec pede justo fringilla vel aliquet nec vulputate eget. Lorem ispum dolore siamet ipsum dolor.</p>\n<p style="margin-left:0px;">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumquer nihil impedit quo minus id quod maxime placeat facere.</p>\n<figure class="image image_resized" style="width:59.48%;">\n <img src="/store/upload/post/84/content_images/20210102214609608167162021010221460960816716.png">\n</figure>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p style="margin-left:0px;"><br>&nbsp;</p>\n<blockquote>\n <p style="margin-left:0px;"><i>You will never be happy if you continue to search for what happiness consists of. You will never live if you are looking for the meaning of life.</i></p>\n <p style="margin-left:0px;"><i>ALBERT CAMUS</i></p>\n</blockquote>\n<p style="margin-left:0px;">Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.&nbsp;Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>\n<h2 style="margin-left:0px;">LOVE WHAT YOU DO. DO WHAT YOU LOVE</h2>\n<p style="margin-left:0px;">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit.&nbsp;Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.</p>\n<p style="margin-left:0px;">Rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer cidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.</p>', 1, 'l;kllk;', 0, 3, 'jjkjhjhkj', '2021-01-02 00:00:00', 1, '2021-01-02 18:09:44', '2021-01-02 22:21:52', 1, 1),
	(85, 1, '<p>SADSADSADA</p>', 1, 'ASDASDSAD', 0, 0, 'aaaaaaaaaa', '2021-01-27 00:00:00', 0, '2021-01-27 08:30:33', '2021-01-27 08:32:08', 1, 1);
/*!40000 ALTER TABLE `tb_posts` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_posts_authors
CREATE TABLE IF NOT EXISTS `tb_posts_authors` (
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `FKet0txk8jynytashy09ehfbpp3` (`user_id`),
  CONSTRAINT `FK_tbPosts_tbPostsAurhors` FOREIGN KEY (`post_id`) REFERENCES `tb_posts` (`post_id`),
  CONSTRAINT `FK_tbUsers_tbPostsAurhors` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_posts_authors: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_posts_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_posts_authors` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_posts_tags
CREATE TABLE IF NOT EXISTS `tb_posts_tags` (
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `FK4svsmj4juqu2l8yaw6whr1v4v` (`tag_id`),
  CONSTRAINT `FK_tbPosts_tbPostsTags` FOREIGN KEY (`post_id`) REFERENCES `tb_posts` (`post_id`),
  CONSTRAINT `FK_tbTags_tbPostsTags` FOREIGN KEY (`tag_id`) REFERENCES `tb_tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_posts_tags: ~22 rows (approximately)
/*!40000 ALTER TABLE `tb_posts_tags` DISABLE KEYS */;
INSERT INTO `tb_posts_tags` (`post_id`, `tag_id`) VALUES
	(60, 367),
	(64, 373),
	(66, 374),
	(67, 375),
	(68, 376),
	(69, 376),
	(72, 378),
	(73, 379),
	(84, 380),
	(66, 383),
	(82, 383),
	(85, 386),
	(84, 387),
	(66, 389),
	(69, 389),
	(74, 389),
	(75, 389),
	(81, 389),
	(82, 389),
	(83, 389),
	(84, 389),
	(66, 456),
	(66, 457),
	(85, 471),
	(85, 474);
/*!40000 ALTER TABLE `tb_posts_tags` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_post_images
CREATE TABLE IF NOT EXISTS `tb_post_images` (
  `image_id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `image_path` varchar(1000) DEFAULT NULL,
  `standard_image_path` varchar(1000) DEFAULT NULL,
  `small_image_path` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FK_tbPosts_tbPostImages` (`post_id`),
  CONSTRAINT `FK_tbPosts_tbPostImages` FOREIGN KEY (`post_id`) REFERENCES `tb_posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

-- Dumping data for table life_stories.tb_post_images: ~32 rows (approximately)
/*!40000 ALTER TABLE `tb_post_images` DISABLE KEYS */;
INSERT INTO `tb_post_images` (`image_id`, `post_id`, `image_path`, `standard_image_path`, `small_image_path`) VALUES
	(81, 60, '/store/upload/post/60/thumbnail/20201230084434336244752020123008443433624475.png', '/store/upload/post/60/thumbnail/585x390-20201230084434336244752020123008443433624475.png', '/store/upload/post/60/thumbnail/263x175-20201230084434336244752020123008443433624475.png'),
	(83, 60, '/store/upload/post/60/thumbnail/20201230084621443344652020123008462144334465.png', '/store/upload/post/60/thumbnail/585x390-20201230084621443344652020123008462144334465.png', '/store/upload/post/60/thumbnail/263x175-20201230084621443344652020123008462144334465.png'),
	(84, 61, '/store/upload/post/61/thumbnail/20201230084832275691652020123008483227569165.png', '/store/upload/post/61/thumbnail/585x390-20201230084832275691652020123008483227569165.png', '/store/upload/post/61/thumbnail/263x175-20201230084832275691652020123008483227569165.png'),
	(85, 61, '/store/upload/post/61/thumbnail/20201230084836606523682020123008483660652368.png', '/store/upload/post/61/thumbnail/585x390-20201230084836606523682020123008483660652368.png', '/store/upload/post/61/thumbnail/263x175-20201230084836606523682020123008483660652368.png'),
	(87, 63, '/store/upload/post/63/thumbnail/20201230084923379955902020123008492337995590.png', '/store/upload/post/63/thumbnail/585x390-20201230084923379955902020123008492337995590.png', '/store/upload/post/63/thumbnail/263x175-20201230084923379955902020123008492337995590.png'),
	(88, 64, '/store/upload/post/64/thumbnail/20201230085126564179422020123008512656417942.png', '/store/upload/post/64/thumbnail/585x390-20201230085126564179422020123008512656417942.png', '/store/upload/post/64/thumbnail/263x175-20201230085126564179422020123008512656417942.png'),
	(90, 66, '/store/upload/post/66/thumbnail/20201230085244059503032020123008524405950303.png', '/store/upload/post/66/thumbnail/585x390-20201230085244059503032020123008524405950303.png', '/store/upload/post/66/thumbnail/263x175-20201230085244059503032020123008524405950303.png'),
	(91, 67, '/store/upload/post/67/thumbnail/20201230085322959480292020123008532295948029.png', '/store/upload/post/67/thumbnail/585x390-20201230085322959480292020123008532295948029.png', '/store/upload/post/67/thumbnail/263x175-20201230085322959480292020123008532295948029.png'),
	(92, 68, '/store/upload/post/68/thumbnail/20201230085407374877282020123008540737487728.png', '/store/upload/post/68/thumbnail/585x390-20201230085407374877282020123008540737487728.png', '/store/upload/post/68/thumbnail/263x175-20201230085407374877282020123008540737487728.png'),
	(93, 69, '/store/upload/post/69/thumbnail/20201230091513349881602020123009151334988160.png', '/store/upload/post/69/thumbnail/585x390-20201230091513349881602020123009151334988160.png', '/store/upload/post/69/thumbnail/263x175-20201230091513349881602020123009151334988160.png'),
	(94, 70, '/store/upload/post/70/thumbnail/20201230091543901353912020123009154390135391.png', '/store/upload/post/70/thumbnail/585x390-20201230091543901353912020123009154390135391.png', '/store/upload/post/70/thumbnail/263x175-20201230091543901353912020123009154390135391.png'),
	(95, 70, '/store/upload/post/70/thumbnail/20201230091545213982742020123009154521398274.png', '/store/upload/post/70/thumbnail/585x390-20201230091545213982742020123009154521398274.png', '/store/upload/post/70/thumbnail/263x175-20201230091545213982742020123009154521398274.png'),
	(96, 71, '/store/upload/post/71/thumbnail/20201230091637235183992020123009163723518399.png', '/store/upload/post/71/thumbnail/585x390-20201230091637235183992020123009163723518399.png', '/store/upload/post/71/thumbnail/263x175-20201230091637235183992020123009163723518399.png'),
	(97, 71, '/store/upload/post/71/thumbnail/20201230091638490151362020123009163849015136.png', '/store/upload/post/71/thumbnail/585x390-20201230091638490151362020123009163849015136.png', '/store/upload/post/71/thumbnail/263x175-20201230091638490151362020123009163849015136.png'),
	(98, 72, '/store/upload/post/72/thumbnail/20201230091735181970962020123009173518197096.png', '/store/upload/post/72/thumbnail/585x390-20201230091735181970962020123009173518197096.png', '/store/upload/post/72/thumbnail/263x175-20201230091735181970962020123009173518197096.png'),
	(99, 73, '/store/upload/post/73/thumbnail/20201230094015214729502020123009401521472950.png', '/store/upload/post/73/thumbnail/585x390-20201230094015214729502020123009401521472950.png', '/store/upload/post/73/thumbnail/263x175-20201230094015214729502020123009401521472950.png'),
	(100, 74, '/store/upload/post/74/thumbnail/20201230101946451835642020123010194645183564.png', '/store/upload/post/74/thumbnail/585x390-20201230101946451835642020123010194645183564.png', '/store/upload/post/74/thumbnail/263x175-20201230101946451835642020123010194645183564.png'),
	(101, 75, '/store/upload/post/75/thumbnail/20201230102059903983462020123010205990398346.png', '/store/upload/post/75/thumbnail/585x390-20201230102059903983462020123010205990398346.png', '/store/upload/post/75/thumbnail/263x175-20201230102059903983462020123010205990398346.png'),
	(102, 76, '/store/upload/post/76/thumbnail/20201230102200533616172020123010220053361617.png', '/store/upload/post/76/thumbnail/585x390-20201230102200533616172020123010220053361617.png', '/store/upload/post/76/thumbnail/263x175-20201230102200533616172020123010220053361617.png'),
	(103, 77, '/store/upload/post/77/thumbnail/20201230102239647946572020123010223964794657.png', '/store/upload/post/77/thumbnail/585x390-20201230102239647946572020123010223964794657.png', '/store/upload/post/77/thumbnail/263x175-20201230102239647946572020123010223964794657.png'),
	(104, 78, '/store/upload/post/78/thumbnail/20201230102306383749772020123010230638374977.png', '/store/upload/post/78/thumbnail/585x390-20201230102306383749772020123010230638374977.png', '/store/upload/post/78/thumbnail/263x175-20201230102306383749772020123010230638374977.png'),
	(105, 79, '/store/upload/post/79/thumbnail/20201230102339011836652020123010233901183665.png', '/store/upload/post/79/thumbnail/585x390-20201230102339011836652020123010233901183665.png', '/store/upload/post/79/thumbnail/263x175-20201230102339011836652020123010233901183665.png'),
	(106, 80, '/store/upload/post/80/thumbnail/20201230102403596369222020123010240359636922.png', '/store/upload/post/80/thumbnail/585x390-20201230102403596369222020123010240359636922.png', '/store/upload/post/80/thumbnail/263x175-20201230102403596369222020123010240359636922.png'),
	(107, 81, '/store/upload/post/81/thumbnail/20201230102427182421252020123010242718242125.png', '/store/upload/post/81/thumbnail/585x390-20201230102427182421252020123010242718242125.png', '/store/upload/post/81/thumbnail/263x175-20201230102427182421252020123010242718242125.png'),
	(108, 82, '/store/upload/post/82/thumbnail/20201231085954941988142020123108595494198814.png', '/store/upload/post/82/thumbnail/585x390-20201231085954941988142020123108595494198814.png', '/store/upload/post/82/thumbnail/263x175-20201231085954941988142020123108595494198814.png'),
	(109, 83, '/store/upload/post/83/thumbnail/20201231134435603285182020123113443560328518.png', '/store/upload/post/83/thumbnail/585x390-20201231134435603285182020123113443560328518.png', '/store/upload/post/83/thumbnail/263x175-20201231134435603285182020123113443560328518.png'),
	(110, 83, '/store/upload/post/83/thumbnail/20201231134446468564562020123113444646856456.png', '/store/upload/post/83/thumbnail/585x390-20201231134446468564562020123113444646856456.png', '/store/upload/post/83/thumbnail/263x175-20201231134446468564562020123113444646856456.png'),
	(111, 83, '/store/upload/post/83/thumbnail/20201231134449682167992020123113444968216799.png', '/store/upload/post/83/thumbnail/585x390-20201231134449682167992020123113444968216799.png', '/store/upload/post/83/thumbnail/263x175-20201231134449682167992020123113444968216799.png'),
	(114, 84, '/store/upload/post/84/thumbnail/20210102215127621922102021010221512762192210.png', '/store/upload/post/84/thumbnail/585x390-20210102215127621922102021010221512762192210.png', '/store/upload/post/84/thumbnail/263x175-20210102215127621922102021010221512762192210.png'),
	(115, 84, '/store/upload/post/84/thumbnail/20210102215130769267972021010221513076926797.png', '/store/upload/post/84/thumbnail/585x390-20210102215130769267972021010221513076926797.png', '/store/upload/post/84/thumbnail/263x175-20210102215130769267972021010221513076926797.png'),
	(116, 82, '/store/upload/post/82/thumbnail/20210111103837693221482021011110383769322148.png', '/store/upload/post/82/thumbnail/585x390-20210111103837693221482021011110383769322148.png', '/store/upload/post/82/thumbnail/263x175-20210111103837693221482021011110383769322148.png'),
	(117, 81, '/store/upload/post/81/thumbnail/20210119153458065653692021011915345806565369.png', '/store/upload/post/81/thumbnail/585x390-20210119153458065653692021011915345806565369.png', '/store/upload/post/81/thumbnail/263x175-20210119153458065653692021011915345806565369.png'),
	(118, 85, '/store/upload/post/85/thumbnail/20210127153034909959232021012715303490995923.png', '/store/upload/post/85/thumbnail/585x390-20210127153034909959232021012715303490995923.png', '/store/upload/post/85/thumbnail/263x175-20210127153034909959232021012715303490995923.png');
/*!40000 ALTER TABLE `tb_post_images` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_roles
CREATE TABLE IF NOT EXISTS `tb_roles` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UK_3mgeodec2ykm307478v8u0352` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `tb_roles` DISABLE KEYS */;
INSERT INTO `tb_roles` (`role_id`, `name`) VALUES
	(2, 'ROLE_ADMIN'),
	(1, 'ROLE_SUPPER_ADMIN'),
	(3, 'ROLE_USER');
/*!40000 ALTER TABLE `tb_roles` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_tags
CREATE TABLE IF NOT EXISTS `tb_tags` (
  `tag_id` bigint NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_tags: ~19 rows (approximately)
/*!40000 ALTER TABLE `tb_tags` DISABLE KEYS */;
INSERT INTO `tb_tags` (`tag_id`, `tag`) VALUES
	(386, 'AAA'),
	(457, 'âsdasdasd'),
	(471, 'GGG'),
	(389, 'hhhhhh'),
	(456, 'sadasdsadas'),
	(474, 'sss'),
	(367, 'Test 1'),
	(378, 'Test 12'),
	(379, 'Test 14'),
	(380, 'Test 15'),
	(373, 'Test 5'),
	(374, 'Test 6'),
	(375, 'Test 8'),
	(376, 'Test 9'),
	(383, 'Test xxxx'),
	(387, 'xxx');
/*!40000 ALTER TABLE `tb_tags` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_users
CREATE TABLE IF NOT EXISTS `tb_users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK8n82lwp7lflhwda2v2v3wckc9` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`user_id`, `created_at`, `updated_at`, `address`, `avatar_img`, `city`, `company_name`, `country`, `email`, `enabled`, `full_name`, `join_date`, `note`, `occupation`, `password`, `phone`, `provider`, `provider_id`, `social_avatar_url`, `summary`, `type`, `username`) VALUES
	(1, '2020-12-04 15:14:06', '2020-12-04 15:14:07', 'Duy Xuyên, Quảng Nam', '/store/upload/user/tranphucvinh/avatar/2021012412354008327150_87177420_2593437000891830_1889369513808363520_n.jpg', NULL, 'Softone', 'Viet Nam', 'vinhtranphuc@gmail.com', b'1', 'Trần Phúc Vinh', '2020-12-04 15:14:45', NULL, NULL, '$2a$10$A7F8CntAh5lojQCnWil6wOEIF4SRDxVcamp.aMB5uR.a0icZ/BtYa', '0382607172', 'local', NULL, NULL, 'FFFFFFSadasdas\ndsadasdsadas', NULL, 'tranphucvinh'),
	(4, '2020-12-21 09:46:47', '2020-12-21 09:46:47', NULL, NULL, NULL, NULL, NULL, NULL, b'1', 'testadmin', '2020-12-21 09:46:47', NULL, NULL, '$2a$10$Fr0bEf46RU676YJ9BkuyvO3c.Qc92YL2sKsJN47hJHzxC4BlwfdwC', NULL, 'local', NULL, NULL, NULL, NULL, 'testadmin');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

-- Dumping structure for table life_stories.tb_user_roles
CREATE TABLE IF NOT EXISTS `tb_user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK3mxrxqo67aefq0yaufnn84v3e` (`role_id`),
  CONSTRAINT `FK3mxrxqo67aefq0yaufnn84v3e` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`),
  CONSTRAINT `FKugolgxur3og4u4y8od79ubp6` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table life_stories.tb_user_roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `tb_user_roles` DISABLE KEYS */;
INSERT INTO `tb_user_roles` (`user_id`, `role_id`) VALUES
	(1, 1),
	(4, 2);
/*!40000 ALTER TABLE `tb_user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
