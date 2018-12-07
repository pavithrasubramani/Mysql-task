/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.6.35-log : Database - task
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`task` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `task`;

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(45) NOT NULL,
  `LAST_NAME` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `USER_NAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`FIRST_NAME`,`LAST_NAME`,`EMAIL`,`USER_NAME`,`PASSWORD`) values 
(1,'XXX','s.s','abcd@gmail.com','ABCD','pass');

/*Table structure for table `scratch_pad` */

DROP TABLE IF EXISTS `scratch_pad`;

CREATE TABLE `scratch_pad` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(30) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_scratch_pad_user_user_id` (`USER_ID`),
  CONSTRAINT `fk_scratch_pad_user_user_id` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `scratch_pad` */

insert  into `scratch_pad`(`ID`,`TITLE`,`DESCRIPTION`,`USER_ID`) values 
(1,'title',NULL,1),
(2,'Comics',NULL,1),
(3,'ASDF',NULL,1),
(4,'Horror','ssbvnh gjhrfv fghtg dfgnbvn fghnv hgjhm',1),
(5,'Film','ggdgdh dgtertg dfhgvf ggfbfdhgj',1),
(6,'abcd','dsgfhg mh  gfgf dfgfv hgg',1),
(7,'write','vfhghb dfdfygf dgug strh sth',1),
(8,'hjn','jkj',1),
(9,'vb','vcvgvh',1),
(10,'bb','vbn',1),
(11,'sfg','bghgm',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(30) NOT NULL,
  `EMAIL_ID` varchar(30) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`ID`,`USER_NAME`,`EMAIL_ID`,`PASSWORD`) values 
(1,'Pavithra','pavithra@yopmail.com','Pass123$');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
