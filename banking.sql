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

CREATE PROCEDURE details(IN acnt_no INT, 
IN dte DATE, 
IN TYPE VARCHAR(30),
IN amount INT, 
IN a_acnt_no INT, 
OUT withdraw BIGINT, 
OUT deposit BIGINT) 
BEGIN 
DECLARE bal INT
IF(is_available) THEN 
IF(dis_msg)THEN
 
/*withdraw*/
IF(TYPE="withdraw") THEN 
SET bal=bal-amount; 
UPDATE customer_details SET current_balance=bal WHERE account_no=acnt_no; 
INSERT INTO transcation (TYPE,amount,date_of_transcation) VALUES ('withdraw',amount,dte);
END IF;  

/*deposit*/
ELSE IF(TYPE="deposit")THEN 
SET bal=bal+amount;
UPDATE customer_details SET current_balance=bal WHERE account_no=acnt_no; 
INSERT INTO transcation(TYPE,amount,date_of_transaction) VALUES ('deposit',amount,dte); 
END IF; 
END IF;
END IF;
END $$ 
DELIMITER ; 


/*function for availability*/
DELIMITER $$
CREATE FUNCTION is_available(acnt_no INT)
BEGIN
RETURN(EXISTS(SELECT account_no FROM customer_details WHERE account_no=acnt_no));
END $$
DELIMITER ;

/*function for display message*/
DELIMITER $$
CREATE FUNCTION dis_msg(current_balance BIGINT)
RETURN BOOLEAN
BEGIN
DECLARE a TINYINT(1);
IF (current_balance>=500)
	SET a = (EXISTS(SELECT current_balance INTO bal FROM customer_details WHERE bal>=500));
END IF;
RETURN a;
END
DELIMITER ;

CALL dis_msg(100);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
