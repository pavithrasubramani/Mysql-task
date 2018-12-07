/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.6.35-log : Database - mysqltask
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysqltask` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mysqltask`;

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`phone`,`email`,`gender`,`is_active`) values 
(1,'anitha',9876543210,'abcd@gmail.com','female',NULL),
(2,'amar',9765432190,'xyz@gmail.com','male',NULL);

/*Table structure for table `employee_leave` */

DROP TABLE IF EXISTS `employee_leave`;

CREATE TABLE `employee_leave` (
  `id` int(20) DEFAULT NULL,
  `l_id` int(20) DEFAULT NULL,
  `employee_allowed` varchar(10) DEFAULT NULL,
  `role_of_employee` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee_leave` */

/*Table structure for table `employee_organisation` */

DROP TABLE IF EXISTS `employee_organisation`;

CREATE TABLE `employee_organisation` (
  `id` int(20) DEFAULT NULL,
  `o_id` int(20) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee_organisation` */

/*Table structure for table `employee_role` */

DROP TABLE IF EXISTS `employee_role`;

CREATE TABLE `employee_role` (
  `id` int(10) DEFAULT NULL,
  `role_id` varchar(20) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `employee_role_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`id`),
  CONSTRAINT `employee_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `employee_role_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee_role` */

/*Table structure for table `leave_policy` */

DROP TABLE IF EXISTS `leave_policy`;

CREATE TABLE `leave_policy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(30) DEFAULT NULL,
  `duration` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `leave_policy` */

insert  into `leave_policy`(`id`,`leave_type`,`duration`) values 
(1,'sick leave',15),
(2,'causal leave',10),
(3,'previlege leave',5);

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(80) DEFAULT NULL,
  `starting_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

insert  into `organization`(`id`,`name`,`address`,`starting_date`,`is_active`) values 
(1,'TCS','chennai','1990-10-12',1),
(2,'INFO','madurai','1988-12-12',1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`role_id`,`name`) values 
('HR1','Human resource'),
('MK1','marketing');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
