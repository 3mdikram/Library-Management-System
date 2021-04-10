/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.23 : Database - saide_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`saide_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `saide_db`;

/*Table structure for table `book_issue` */

DROP TABLE IF EXISTS `book_issue`;

CREATE TABLE `book_issue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Member` int unsigned DEFAULT NULL,
  `Number` int unsigned DEFAULT NULL,
  `Book_Number` int unsigned DEFAULT NULL,
  `Book_Title` int unsigned DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Status` varchar(40) DEFAULT NULL,
  `issue_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Member` (`Member`),
  KEY `Book_Number` (`Book_Number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `book_issue` */

insert  into `book_issue`(`id`,`Member`,`Number`,`Book_Number`,`Book_Title`,`Issue_Date`,`Return_Date`,`Status`,`issue_id`) values 
(1,1,1,1,1,'2018-02-24','2018-02-24','returned','1'),
(2,2,2,2,2,'2018-02-24','2018-03-01','issued','2');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ISBN_NO` varchar(100) DEFAULT NULL,
  `Book_Title` varchar(200) DEFAULT NULL,
  `Book_Type` int unsigned DEFAULT NULL,
  `Author_Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Edition` varchar(40) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Pages` int DEFAULT NULL,
  `Publisher` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Book_Type` (`Book_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`id`,`ISBN_NO`,`Book_Title`,`Book_Type`,`Author_Name`,`Quantity`,`Purchase_Date`,`Edition`,`Price`,`Pages`,`Publisher`) values 
(1,'62781733','River  Between',1,'Ngugi wa Thiongo',33,'2018-02-24','1',300.00,120,'Longhorn'),
(2,'978-9966-111-32-6','Who is Jesus',2,'Greg Gilbert',1,'2018-02-24',NULL,800.00,138,'ekklesia afrika'),
(3,'978-0-8308-5810-1','Pauls Prison Letters',1,'Smith',23,'2018-02-24',NULL,450.00,133,'IVP cONNECT'),
(4,'978-0-8308-5810-1','Pauls Prison Letters',2,'Md Ikram',44,'2021-04-11',NULL,450.00,600,'Md Ikram');

/*Table structure for table `magazines` */

DROP TABLE IF EXISTS `magazines`;

CREATE TABLE `magazines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(40) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date_Of_Receipt` date DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Pages` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Publisher` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `magazines` */

insert  into `magazines`(`id`,`Type`,`Name`,`Date_Of_Receipt`,`Date_Published`,`Pages`,`Price`,`Publisher`) values 
(1,'simple','simple','2021-04-11','2021-04-11',600,100.00,'Md Ikram'),
(2,'simpe1','simple1','2021-04-11','2021-04-11',700,600.00,'Md Ikram');

/*Table structure for table `membership_grouppermissions` */

DROP TABLE IF EXISTS `membership_grouppermissions`;

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint DEFAULT NULL,
  `allowView` tinyint NOT NULL DEFAULT '0',
  `allowEdit` tinyint NOT NULL DEFAULT '0',
  `allowDelete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `membership_grouppermissions` */

insert  into `membership_grouppermissions`(`permissionID`,`groupID`,`tableName`,`allowInsert`,`allowView`,`allowEdit`,`allowDelete`) values 
(1,2,'books',1,3,3,3),
(2,2,'NewsPapers',1,3,3,3),
(3,2,'Magazines',1,3,3,3),
(4,2,'Users',1,3,3,3),
(5,2,'Book_Issue',1,3,3,3),
(6,2,'Return_Book',1,3,3,3),
(7,2,'Types',1,3,3,3),
(8,2,'Return',1,3,3,3),
(30,3,'books',0,3,0,0),
(31,3,'NewsPapers',0,3,0,0),
(32,3,'Magazines',0,3,0,0),
(33,3,'Users',0,3,0,0),
(34,3,'Book_Issue',0,3,0,0),
(35,3,'Return_Book',0,3,0,0),
(36,3,'Types',0,3,0,0);

/*Table structure for table `membership_groups` */

DROP TABLE IF EXISTS `membership_groups`;

CREATE TABLE `membership_groups` (
  `groupID` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint DEFAULT NULL,
  `needsApproval` tinyint DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `membership_groups` */

insert  into `membership_groups`(`groupID`,`name`,`description`,`allowSignup`,`needsApproval`) values 
(1,'anonymous','Anonymous group created automatically on 2018-02-24',0,0),
(2,'Admins','Admin group created automatically on 2018-02-24',0,1),
(3,'demo','demo users',0,1);

/*Table structure for table `membership_userpermissions` */

DROP TABLE IF EXISTS `membership_userpermissions`;

CREATE TABLE `membership_userpermissions` (
  `permissionID` int unsigned NOT NULL AUTO_INCREMENT,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint DEFAULT NULL,
  `allowView` tinyint NOT NULL DEFAULT '0',
  `allowEdit` tinyint NOT NULL DEFAULT '0',
  `allowDelete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `membership_userpermissions` */

/*Table structure for table `membership_userrecords` */

DROP TABLE IF EXISTS `membership_userrecords`;

CREATE TABLE `membership_userrecords` (
  `recID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint unsigned DEFAULT NULL,
  `dateUpdated` bigint unsigned DEFAULT NULL,
  `groupID` int DEFAULT NULL,
  PRIMARY KEY (`recID`),
  UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  KEY `pkValue` (`pkValue`),
  KEY `tableName` (`tableName`),
  KEY `memberID` (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `membership_userrecords` */

insert  into `membership_userrecords`(`recID`,`tableName`,`pkValue`,`memberID`,`dateAdded`,`dateUpdated`,`groupID`) values 
(1,'Types','1','admin',1519466337,1519466337,2),
(2,'Types','2','admin',1519466356,1519466356,2),
(3,'Types','3','admin',1519466381,1519466381,2),
(4,'books','1','admin',1519466456,1519466456,2),
(5,'Users','1','admin',1519466500,1519466500,2),
(6,'Book_Issue','1','admin',1519466549,1519478053,2),
(7,'Return_Book','1','admin',1519466780,1519466780,2),
(8,'Users','2','admin',1519468487,1519468487,2),
(9,'books','2','admin',1519468656,1519468656,2),
(10,'Book_Issue','2','admin',1519468715,1519468715,2),
(11,'books','3','admin',1519479901,1519479901,2),
(12,'NewsPapers','1','admin',1519479996,1519479996,2);

/*Table structure for table `membership_users` */

DROP TABLE IF EXISTS `membership_users`;

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int unsigned DEFAULT NULL,
  `isBanned` tinyint DEFAULT NULL,
  `isApproved` tinyint DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int unsigned DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `membership_users` */

insert  into `membership_users`(`memberID`,`passMD5`,`email`,`signupDate`,`groupID`,`isBanned`,`isApproved`,`custom1`,`custom2`,`custom3`,`custom4`,`comments`,`pass_reset_key`,`pass_reset_expiry`) values 
('admin','21232f297a57a5a743894a0e4a801fc3','admin@admin.com','2018-02-24',2,0,1,NULL,NULL,NULL,NULL,'Admin member created automatically on 2018-02-24',NULL,NULL),
('demo','fe01ce2a7fbac8fafaed7c982a04e229','demo@demo.com','2018-02-25',3,0,1,'demo user','demo','demo','demo','demo',NULL,NULL),
('guest',NULL,NULL,'2018-02-24',1,0,1,NULL,NULL,NULL,NULL,'Anonymous member created automatically on 2018-02-24',NULL,NULL),
('ronald','02d62574863469f4f1ef99d8fc453a31','admin@admin.com','2021-04-10',2,0,1,NULL,NULL,NULL,NULL,'Admin member created automatically on 2021-04-10',NULL,NULL);

/*Table structure for table `newspapers` */

DROP TABLE IF EXISTS `newspapers`;

CREATE TABLE `newspapers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Language` varchar(40) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date_Of_Receipt` date DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Pages` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Type` varchar(40) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `newspapers` */

insert  into `newspapers`(`id`,`Language`,`Name`,`Date_Of_Receipt`,`Date_Published`,`Pages`,`Price`,`Type`,`Publisher`) values 
(1,'English','The Standard','2018-02-24','2018-02-24',35,100.00,'newspaper','Standard Group Media');

/*Table structure for table `return_book` */

DROP TABLE IF EXISTS `return_book`;

CREATE TABLE `return_book` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Book_Number` int unsigned DEFAULT NULL,
  `Book_Title` int unsigned DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Due_Date` int unsigned DEFAULT '1',
  `Return_Date` date DEFAULT NULL,
  `Member` int unsigned DEFAULT NULL,
  `Number` int unsigned DEFAULT NULL,
  `Fine` decimal(10,2) DEFAULT '0.00',
  `Status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Book_Number` (`Book_Number`),
  KEY `Member` (`Member`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `return_book` */

insert  into `return_book`(`id`,`Book_Number`,`Book_Title`,`Issue_Date`,`Due_Date`,`Return_Date`,`Member`,`Number`,`Fine`,`Status`) values 
(1,1,1,'0000-00-00',1,'2018-03-04',1,1,50.00,'cleared');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `types` */

insert  into `types`(`id`,`Name`) values 
(1,'novel'),
(2,'short stories'),
(3,'science fiction');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Membership_Number` varchar(40) DEFAULT NULL,
  `Name` varchar(140) DEFAULT NULL,
  `Contact` varchar(40) DEFAULT NULL,
  `ID_Number` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`Membership_Number`,`Name`,`Contact`,`ID_Number`) values 
(1,'1231','Kelvin Guma','0708344101',99239183),
(2,'2000','Dennis Amadi','079822271',33432113);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
