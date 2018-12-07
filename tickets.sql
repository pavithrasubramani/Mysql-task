/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.6.35-log : Database - tickets
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tickets` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tickets`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`NAME`,`is_active`) values 
(1,'ECE',1),
(2,'EEE',1),
(3,'EI',0),
(4,'CSE',1);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `position_of_employee` varchar(20) DEFAULT NULL,
  `employee_avaliabillity` tinyint(1) DEFAULT NULL,
  `other_employee` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`NAME`,`position_of_employee`,`employee_avaliabillity`,`other_employee`) values 
(1,'x','technician',1,'no');

/*Table structure for table `history_of_ticket` */

DROP TABLE IF EXISTS `history_of_ticket`;

CREATE TABLE `history_of_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL,
  `t_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `comments` tinytext,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`),
  KEY `e_id` (`e_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `history_of_ticket_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`),
  CONSTRAINT `history_of_ticket_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `history_of_ticket_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `history_of_ticket` */

insert  into `history_of_ticket`(`id`,`s_id`,`e_id`,`t_id`,`status`,`comments`,`created_on`) values 
(6,1,NULL,16,NULL,'Hai',NULL),
(7,1,NULL,17,NULL,'Hai',NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`name`,`email`,`is_active`,`password`) values 
(1,'a','a@gmail.com',1,'abcd'),
(4,'b','b@gmail.com',1,'bcde'),
(5,'c','c@gmail.com',0,'cdef'),
(6,'d','d@gmail.com',1,'defg'),
(7,'e','e@gmail.com',1,'$2a$10$xa2xkVYjg1zHoHwQVg6SIeZg63SOMjE17QEjZ9Bnz5wGIi9XSNk8a'),
(8,'f','f@gmail.com',1,'$2a$10$h45w3/B10mR.akAhQID3/ep3QIWxfnKvdKhVWUcg1dGpptcSJbecO'),
(9,'g','g@gmail.com',1,'$2a$10$YvN479wJDubFmv3iR9UhVuFvvVm/WjIGwztCqY54eqn6c9RhIx0xm');

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` tinytext,
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `ticket` */

insert  into `ticket`(`id`,`s_id`,`title`,`description`) values 
(16,1,'Problem','Problem so creating a ticket'),
(17,1,'Problem','Problem so creating a ticket');

/*Table structure for table `ticket_of_student` */

DROP TABLE IF EXISTS `ticket_of_student`;

CREATE TABLE `ticket_of_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `issue` varchar(20) DEFAULT NULL,
  `ticket_strttime` date DEFAULT NULL,
  `ticket_endtime` date DEFAULT NULL,
  `status_of_ticket` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `ticket_of_student_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ticket_of_student` */

insert  into `ticket_of_student`(`id`,`s_id`,`issue`,`ticket_strttime`,`ticket_endtime`,`status_of_ticket`) values 
(1,4,'system problem','2018-10-11','2018-11-12','close');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
