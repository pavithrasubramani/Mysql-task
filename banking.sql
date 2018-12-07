/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.6.35-log : Database - banking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`banking` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `banking`;

/*Table structure for table `customer_details` */

DROP TABLE IF EXISTS `customer_details`;

CREATE TABLE `customer_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_no` bigint(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(80) DEFAULT NULL,
  `current_balance` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customer_details` */

insert  into `customer_details`(`id`,`account_no`,`name`,`address`,`current_balance`) values 
(1,11111,'abcd','chennai',100000),
(2,12121,'wxyz','madurai',300000);

/*Table structure for table `transcation` */

DROP TABLE IF EXISTS `transcation`;

CREATE TABLE `transcation` (
  `id` int(10) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `date_of_transcation` date DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `transcation_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `transcation` */

/* Function  structure for function  `fn_is_order_placed` */

/*!50003 DROP FUNCTION IF EXISTS `fn_is_order_placed` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `fn_is_order_placed`(in_order_id INT) RETURNS tinyint(1)
BEGIN
RETURN(EXISTS(SELECT order_id FROM order_transaction WHERE order_id=in_order_id));
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
