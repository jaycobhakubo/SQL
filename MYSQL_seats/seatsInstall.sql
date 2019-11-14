-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.17-log

#Added  character set utf8 collate utf8_bin
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ftn_seats
--
drop database IF exists   ftn_seats;

CREATE DATABASE IF NOT EXISTS ftn_seats character set utf8 collate utf8_bin;
USE ftn_seats;

--
-- Definition of table `web_ch1_game_transaction`
--

DROP TABLE IF EXISTS `web_ch1_game_transaction`;
CREATE TABLE `web_ch1_game_transaction` (
  `ch1_game_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `ch1_session_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(100) DEFAULT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `game_type` varchar(100) DEFAULT NULL,
  `game_name` varchar(100) DEFAULT NULL,
  `game_number` int(11) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  `transaction_value` varchar(255) DEFAULT NULL,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed_transaction_id` int(11) DEFAULT NULL,
  `removed_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ch1_game_transaction_id`)
) ;

--
-- Dumping data for table `web_ch1_game_transaction`
--

/*!40000 ALTER TABLE `web_ch1_game_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ch1_game_transaction` ENABLE KEYS */;


--
-- Definition of table `web_ch1_session_info`
--

DROP TABLE IF EXISTS `web_ch1_session_info`;
CREATE TABLE `web_ch1_session_info` (
  `ch1_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(100) DEFAULT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `session_type` varchar(100) DEFAULT NULL,
  `session_name` varchar(100) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  `transaction_value` varchar(255) DEFAULT NULL,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ch1_session_id`)
) ;

--
-- Dumping data for table `web_ch1_session_info`
--

/*!40000 ALTER TABLE `web_ch1_session_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ch1_session_info` ENABLE KEYS */;


--
-- Definition of table `web_ch1_session_transaction`
--

DROP TABLE IF EXISTS `web_ch1_session_transaction`;
CREATE TABLE `web_ch1_session_transaction` (
  `ch1_session_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `ch1_session_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(100) DEFAULT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `session_type` varchar(100) DEFAULT NULL,
  `session_name` varchar(100) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  `transaction_value` varchar(255) DEFAULT NULL,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ch1_session_transaction_id`)
) ;

--
-- Dumping data for table `web_ch1_session_transaction`
--

/*!40000 ALTER TABLE `web_ch1_session_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ch1_session_transaction` ENABLE KEYS */;


--
-- Definition of table `web_database_version`
--

DROP TABLE IF EXISTS `web_database_version`;
CREATE TABLE `web_database_version` (
  `database_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `database_version_name` varchar(255) NOT NULL DEFAULT '',
  `database_script_number` int(11) DEFAULT '0',
  `database_update` date NOT NULL DEFAULT '0000-00-00',
  `description` text,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`database_version_id`)
) ;

--
-- Dumping data for table `web_database_version`
--

/*!40000 ALTER TABLE `web_database_version` DISABLE KEYS */;
INSERT INTO `web_database_version` (`database_version_id`,`database_version_name`,`database_script_number`,`database_update`,`description`,`transaction_datetime`) VALUES 
 (1,'1.0.0',1,'2013-08-14','Initial Database Script','2013-08-14 16:31:37'),
 (2,'2.0.0',2,'2013-08-14','Second Load','2013-08-14 16:31:37'),
 (3,'2.0.1',3,'2013-08-21','Added Interface Ledger','2013-08-21 12:09:10'),
 (4,'2.0.2',4,'2013-08-27','Modify Player and File information','2013-08-27 13:20:59'),
 (5,'2.0.3',5,'2013-09-06','Added Player company relation information','2013-09-06 15:53:57'),
 (6,'2.0.4',6,'2013-09-20','Added Ticket Confirmation Ledger','2013-09-20 11:50:10'),
 (7,'2.0.5',7,'2013-10-14','Added fields to modify scheduled events','2013-10-17 10:47:40'),
 (8,'2.0.6',8,'2013-10-17','Added event type','2013-10-17 10:47:40'),
 (9,'2.0.7',9,'2013-10-24','Added confirmation reference number','2013-10-24 14:58:14'),
 (10,'2.0.8',10,'2013-10-28','Added player interface snapshots (tickets, reservation and confirmation ledger)','2013-10-28 11:52:46'),
 (11,'2.0.9',11,'2013-11-05','Added fields to ticket interface','2013-11-05 17:11:40'),
 (12,'2.0.10',12,'2013-11-06','Added fields to ticket interface','2013-11-06 15:22:46'),
 (13,'2.0.11',13,'2013-12-06','Expanded web_usr_log_info.remote_address  to support IP6','2013-12-10 18:00:31'),
 (14,'2.0.12',14,'2013-12-06','Added user exceptions table','2013-12-10 18:00:31'),
 (15,'2.0.13',15,'2013-12-09','Added player type column, Added file public name','2013-12-10 18:02:39'),
 (16,'2.0.14',16,'2013-12-23','Added application type and order column','2014-01-23 11:08:24'),
 (17,'2.0.15',16,'2013-12-23','Added message, session, game log','2014-01-23 11:08:24'),
 (18,'2.0.16',17,'2014-01-21','Added player interface tables','2014-01-23 11:08:26'),
 (19,'2.0.17',18,'2014-01-31','Added system settings. Organized player tables','2014-02-06 10:49:57'),
 (20,'2.0.18',19,'2014-04-14','Update system settings sections','2014-07-28 15:57:19'),
 (21,'2.0.19',20,'2014-06-23','Added player notes datetime stamp','2014-07-28 15:57:19'),
 (22,'2.0.20',21,'2014-07-21','Added ticket discount module','2014-07-28 15:57:20'),
 (23,'2.0.21',22,'2014-10-02','Added ticket receipts','2014-10-03 11:30:38'),
 (24,'2.0.22',23,'2014-10-15','Added payment_type short_name','2014-10-20 13:09:51'),
 (25,'2.0.23',24,'2014-10-17','Added ticket_discount_items to assign discount by reservation','2014-10-20 13:10:30'),
 (26,'2.0.24',25,'2014-12-12','Added more space to confirmation footer and work on player info table','2015-02-18 15:44:43'),
 (27,'2.0.25',26,'2015-02-06','Added ticket remove datetime','2015-02-18 15:44:43'),
 (28,'2.0.26',27,'2015-02-27','Added Gift Certificate Company, Event and Value','2015-04-06 15:22:26'),
 (29,'2.0.27',28,'2015-03-06','Added payment interface status and identifier','2015-04-06 15:22:26'),
 (30,'2.0.28',29,'2015-04-06','Added payment and refund options configurable','2015-04-06 15:22:26'),
 (31,'2.0.29',30,'2015-04-28','Added report option and event categories','2015-04-29 15:22:26');
/*!40000 ALTER TABLE `web_database_version` ENABLE KEYS */;


--
-- Definition of table `web_database_version_log`
--

DROP TABLE IF EXISTS `web_database_version_log`;
CREATE TABLE `web_database_version_log` (
  `database_version_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `database_script_number` int(11) DEFAULT '0',
  `description` text,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`database_version_log_id`)
) ;

--
-- Dumping data for table `web_database_version_log`
--

/*!40000 ALTER TABLE `web_database_version_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_database_version_log` ENABLE KEYS */;


--
-- Definition of table `web_dsc_discount_conditions`
--

DROP TABLE IF EXISTS `web_dsc_discount_conditions`;
CREATE TABLE `web_dsc_discount_conditions` (
  `discount_condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) DEFAULT '0',
  `condition_type_id` int(11) DEFAULT '0',
  `condition_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`discount_condition_id`)
) ;

--
-- Dumping data for table `web_dsc_discount_conditions`
--

/*!40000 ALTER TABLE `web_dsc_discount_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_dsc_discount_conditions` ENABLE KEYS */;


--
-- Definition of table `web_dsc_discount_info`
--

DROP TABLE IF EXISTS `web_dsc_discount_info`;
CREATE TABLE `web_dsc_discount_info` (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_name` varchar(255) DEFAULT NULL,
  `discount_description` varchar(255) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  `discount_from` date DEFAULT NULL,
  `discount_to` date DEFAULT NULL,
  `discount_type_id` int(11) DEFAULT '1',
  `discount_value` decimal(11,2) DEFAULT '0.00',
  `discount_limit` int(11) NOT NULL DEFAULT '0',
  `retired` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`discount_id`)
) ;

--
-- Dumping data for table `web_dsc_discount_info`
--

/*!40000 ALTER TABLE `web_dsc_discount_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_dsc_discount_info` ENABLE KEYS */;


--
-- Definition of table `web_enum_condition_type`
--

DROP TABLE IF EXISTS `web_enum_condition_type`;
CREATE TABLE `web_enum_condition_type` (
  `condition_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_type_name` varchar(255) DEFAULT NULL,
  `condition_type_description` text,
  `display_order` int(11) DEFAULT '1',
  PRIMARY KEY (`condition_type_id`)
) ;

--
-- Dumping data for table `web_enum_condition_type`
--

/*!40000 ALTER TABLE `web_enum_condition_type` DISABLE KEYS */;
INSERT INTO `web_enum_condition_type` (`condition_type_id`,`condition_type_name`,`condition_type_description`,`display_order`) VALUES 
 (1,'Event Name','Event Name',1),
 (2,'Event Date','Event Date',2),
 (3,'Minimum Events','Minimum number of Events',3),
 (4,'Maximum Events','Maximum number of Events',4),
 (5,'Minimum Reservations','Minimum number of Reservations',5),
 (6,'Maximum Reservations','Maximum number of Reservations',6),
 (7,'Minimum Spend','Minimum number of Spend',7),
 (8,'Maximum Spend','Maximum number of Spend',8);
/*!40000 ALTER TABLE `web_enum_condition_type` ENABLE KEYS */;


--
-- Definition of table `web_enum_country`
--

DROP TABLE IF EXISTS `web_enum_country`;
CREATE TABLE `web_enum_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `country_name` varchar(64) DEFAULT NULL,
  `name_fr` varchar(64) DEFAULT NULL,
  `name_de` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- Dumping data for table `web_enum_country`
--

/*!40000 ALTER TABLE `web_enum_country` DISABLE KEYS */;
INSERT INTO `web_enum_country` (`id`,`iso2`,`iso3`,`country_name`,`name_fr`,`name_de`) VALUES 
 (1,'AF','AFG','Afghanistan',NULL,NULL),
 (2,'AX','ALA','Aland Islands',NULL,NULL),
 (4,'DZ','DZA','Algeria (El Djazair)',NULL,NULL),
 (3,'AL','ALB','Albania',NULL,NULL),
 (5,'AS','ASM','American Samoa',NULL,NULL),
 (6,'AD','AND','Andorra',NULL,NULL),
 (7,'AO','AGO','Angola',NULL,NULL),
 (8,'AI','AIA','Anguilla',NULL,NULL),
 (9,'AQ','ATA','Antarctica',NULL,NULL),
 (10,'AG','ATG','Antigua and/or Barbuda',NULL,NULL),
 (11,'AR','ARG','Argentina',NULL,NULL),
 (12,'AM','ARM','Armenia',NULL,NULL),
 (13,'AW','ABW','Aruba',NULL,NULL),
 (14,'AU','AUS','Australia',NULL,NULL),
 (15,'AT','AUT','Austria',NULL,NULL),
 (16,'AZ','AZE','Azerbaijan',NULL,NULL),
 (17,'BS','BHS','Bahamas',NULL,NULL),
 (18,'BH','BHR','Bahrain',NULL,NULL),
 (19,'BD','BGD','Bangladesh',NULL,NULL),
 (20,'BB','BRB','Barbados',NULL,NULL),
 (21,'BY','BLR','Belarus',NULL,NULL),
 (22,'BE','BEL','Belgium',NULL,NULL),
 (23,'BZ','BLZ','Belize',NULL,NULL),
 (24,'BJ','BEN','Benin',NULL,NULL),
 (25,'BM','BMU','Bermuda',NULL,NULL),
 (26,'BT','BTN','Bhutan',NULL,NULL),
 (27,'BO','BOL','Bolivia',NULL,NULL),
 (28,'BA','BIH','Bosnia and Herzegovina',NULL,NULL),
 (29,'BW','BWA','Botswana',NULL,NULL),
 (30,'BV','BVT','Bouvet Island',NULL,NULL),
 (31,'BR','BRA','Brazil',NULL,NULL),
 (32,'IO','IOT','British Indian Ocean Territory',NULL,NULL),
 (33,'BN','BRN','Brunei Darussalam',NULL,NULL),
 (34,'BG','BGR','Bulgaria',NULL,NULL),
 (35,'BF','BFA','Burkina Faso',NULL,NULL),
 (36,'BI','BDI','Burundi',NULL,NULL),
 (37,'KH','KHM','Cambodia',NULL,NULL),
 (38,'CM','CMR','Cameroon',NULL,NULL),
 (39,'CA','CAN','Canada',NULL,NULL),
 (40,'CV','CPV','Cape Verde',NULL,NULL),
 (41,'KY','CYM','Cayman Islands',NULL,NULL),
 (42,'CF','CAF','Central African Republic',NULL,NULL),
 (43,'TD','TCD','Chad (T\'Chad)',NULL,NULL),
 (44,'CL','CHL','Chile',NULL,NULL),
 (45,'CN','CHN','China',NULL,NULL),
 (46,'CX','CXR','Christmas Island',NULL,NULL),
 (47,'CC','CCK','Cocos (Keeling) Islands',NULL,NULL),
 (48,'CO','COL','Colombia',NULL,NULL),
 (49,'KM','COM','Comoros',NULL,NULL),
 (50,'CG','COG','Congo, Republic Of',NULL,NULL),
 (51,'CD','COD','Congo, The Democratic Republic of the (formerly Zaire)',NULL,NULL),
 (52,'CK','COK','Cook Islands',NULL,NULL),
 (53,'CR','CRI','Costa Rica',NULL,NULL),
 (54,'CI','CIV','Cote D\'Ivoire (Ivory Coast)',NULL,NULL),
 (55,'HR','HRV','Croatia (hrvatska)',NULL,NULL),
 (56,'CU','CUB','Cuba',NULL,NULL),
 (57,'CY','CYP','Cyprus',NULL,NULL),
 (58,'CZ','CZE','Czech Republic',NULL,NULL),
 (59,'DK','DNK','Denmark',NULL,NULL),
 (60,'DJ','DJI','Djibouti',NULL,NULL),
 (61,'DM','DMA','Dominica',NULL,NULL),
 (62,'DO','DOM','Dominican Republic',NULL,NULL),
 (63,'EC','ECU','Ecuador',NULL,NULL),
 (64,'EG','EGY','Egypt',NULL,NULL),
 (65,'SV','SLV','El Salvador',NULL,NULL),
 (66,'GQ','GNQ','Equatorial Guinea',NULL,NULL),
 (67,'ER','ERI','Eritrea',NULL,NULL),
 (68,'EE','EST','Estonia',NULL,NULL),
 (69,'ET','ETH','Ethiopia',NULL,NULL),
 (70,'FO','FRO','Faeroe Islands',NULL,NULL),
 (71,'FK','FLK','Falkland Islands (Malvinas)',NULL,NULL),
 (72,'FJ','FJI','Fiji',NULL,NULL),
 (73,'FI','FIN','Finland',NULL,NULL),
 (74,'FR','FRA','France',NULL,NULL),
 (75,'GF','GUF','French Guiana',NULL,NULL),
 (76,'PF','PYF','French Polynesia',NULL,NULL),
 (77,'TF','ATF','French Southern Territories',NULL,NULL),
 (78,'GA','GAB','Gabon',NULL,NULL),
 (79,'GM','GMB','Gambia',NULL,NULL),
 (80,'GE','GEO','Georgia',NULL,NULL),
 (81,'DE','DEU','Germany (Deutschland)',NULL,NULL),
 (82,'GH','GHA','Ghana',NULL,NULL),
 (83,'GI','GIB','Gibraltar',NULL,NULL),
 (84,'GB','GBR','Great Britain',NULL,NULL),
 (85,'GR','GRC','Greece',NULL,NULL),
 (86,'GL','GRL','Greenland',NULL,NULL),
 (87,'GD','GRD','Grenada',NULL,NULL),
 (88,'GP','GLP','Guadeloupe',NULL,NULL),
 (89,'GU','GUM','Guam',NULL,NULL),
 (90,'GT','GTM','Guatemala',NULL,NULL),
 (91,'GN','GIN','Guinea',NULL,NULL),
 (92,'GW','GNB','Guinea-bissau',NULL,NULL),
 (93,'GY','GUY','Guyana',NULL,NULL),
 (94,'HT','HTI','Haiti',NULL,NULL),
 (95,'HM','HMD','Heard Island and Mcdonald Islands',NULL,NULL),
 (96,'HN','HND','Honduras',NULL,NULL),
 (97,'HK','HKG','Hong Kong (Special Administrative Region of China)',NULL,NULL),
 (98,'HU','HUN','Hungary',NULL,NULL),
 (99,'IS','ISL','Iceland',NULL,NULL),
 (100,'IN','IND','India',NULL,NULL),
 (101,'ID','IDN','Indonesia',NULL,NULL),
 (102,'IR','IRN','Iran (Islamic Republic of Iran)',NULL,NULL),
 (103,'IQ','IRQ','Iraq',NULL,NULL),
 (104,'IE','IRL','Ireland',NULL,NULL),
 (105,'IL','ISR','Israel',NULL,NULL),
 (106,'IT','ITA','Italy',NULL,NULL),
 (107,'JM','JAM','Jamaica',NULL,NULL),
 (108,'JP','JPN','Japan',NULL,NULL),
 (109,'JO','JOR','Jordan (Hashemite Kingdom of Jordan)',NULL,NULL),
 (110,'KZ','KAZ','Kazakhstan',NULL,NULL),
 (111,'KE','KEN','Kenya',NULL,NULL),
 (112,'KI','KIR','Kiribati',NULL,NULL),
 (113,'KP','PRK','Korea (Democratic Peoples Republic pf [North] Korea)',NULL,NULL),
 (114,'KR','KOR','Korea (Republic of [South] Korea)',NULL,NULL),
 (115,'KW','KWT','Kuwait',NULL,NULL),
 (116,'KG','KGZ','Kyrgyzstan',NULL,NULL),
 (117,'LA','LAO','Lao People\'s Democratic Republic',NULL,NULL),
 (118,'LV','LVA','Latvia',NULL,NULL),
 (119,'LB','LBN','Lebanon',NULL,NULL),
 (120,'LS','LSO','Lesotho',NULL,NULL),
 (121,'LR','LBR','Liberia',NULL,NULL),
 (122,'LY','LBY','Libya (Libyan Arab Jamahirya)',NULL,NULL),
 (123,'LI','LIE','Liechtenstein (Furstentum Liechtenstein)',NULL,NULL),
 (124,'LT','LTU','Lithuania',NULL,NULL),
 (125,'LU','LUX','Luxembourg',NULL,NULL),
 (126,'MO','MAC','Macao (Special Administrative Region of China)',NULL,NULL),
 (127,'MK','MKD','Macedonia (Former Yugoslav Republic of Macedonia)',NULL,NULL),
 (128,'MG','MDG','Madagascar',NULL,NULL),
 (129,'MW','MWI','Malawi',NULL,NULL),
 (130,'MY','MYS','Malaysia',NULL,NULL),
 (131,'MV','MDV','Maldives',NULL,NULL),
 (132,'ML','MLI','Mali',NULL,NULL),
 (133,'MT','MLT','Malta',NULL,NULL),
 (134,'MH','MHL','Marshall Islands',NULL,NULL),
 (135,'MQ','MTQ','Martinique',NULL,NULL),
 (136,'MR','MRT','Mauritania',NULL,NULL),
 (137,'MU','MUS','Mauritius',NULL,NULL),
 (138,'YT','MYT','Mayotte',NULL,NULL),
 (139,'MX','MEX','Mexico',NULL,NULL),
 (140,'FM','FSM','Micronesia (Federated States of Micronesia)',NULL,NULL),
 (141,'MD','MDA','Moldova',NULL,NULL),
 (142,'MC','MCO','Monaco',NULL,NULL),
 (143,'MN','MNG','Mongolia',NULL,NULL),
 (144,'MS','MSR','Montserrat',NULL,NULL),
 (145,'MA','MAR','Morocco',NULL,NULL),
 (146,'MZ','MOZ','Mozambique (Mocambique)',NULL,NULL),
 (147,'MM','MMR','Myanmar (formerly Burma)',NULL,NULL),
 (148,'NA','NAM','Namibia',NULL,NULL),
 (149,'NR','NRU','Nauru',NULL,NULL),
 (150,'NP','NPL','Nepal',NULL,NULL),
 (151,'NL','NLD','Netherlands',NULL,NULL),
 (152,'AN','ANT','Netherlands Antilles',NULL,NULL),
 (153,'NC','NCL','New Caledonia',NULL,NULL),
 (154,'NZ','NZL','New Zealand',NULL,NULL),
 (155,'NI','NIC','Nicaragua',NULL,NULL),
 (156,'NE','NER','Niger',NULL,NULL),
 (157,'NG','NGA','Nigeria',NULL,NULL),
 (158,'NU','NIU','Niue',NULL,NULL),
 (159,'NF','NFK','Norfolk Island',NULL,NULL),
 (160,'MP','MNP','Northern Mariana Islands',NULL,NULL),
 (161,'NO','NOR','Norway',NULL,NULL),
 (162,'OM','OMN','Oman',NULL,NULL),
 (163,'PK','PAK','Pakistan',NULL,NULL),
 (164,'PW','PLW','Palau',NULL,NULL),
 (165,'PS','PSE','Palestinian Territories',NULL,NULL),
 (166,'PA','PAN','Panama',NULL,NULL),
 (167,'PG','PNG','Papua New Guinea',NULL,NULL),
 (168,'PY','PRY','Paraguay',NULL,NULL),
 (169,'PE','PER','Peru',NULL,NULL),
 (170,'PH','PHL','Philippines',NULL,NULL),
 (171,'PN','PCN','Pitcairn',NULL,NULL),
 (172,'PL','POL','Poland',NULL,NULL),
 (173,'PT','PRT','Portugal',NULL,NULL),
 (174,'PR','PRI','Puerto Rico',NULL,NULL),
 (175,'QA','QAT','Qatar',NULL,NULL),
 (176,'RE','REU','Reunion',NULL,NULL),
 (177,'RO','ROU','Romania',NULL,NULL),
 (178,'RU','RUS','Russian Federation',NULL,NULL),
 (179,'RW','RWA','Rwanda',NULL,NULL),
 (180,'SH','SHN','Saint Helena',NULL,NULL),
 (181,'KN','KNA','Saint Kitts and Nevis',NULL,NULL),
 (182,'LC','LCA','Saint Lucia',NULL,NULL),
 (183,'PM','SPM','Saint Pierre and Miquelon',NULL,NULL),
 (184,'VC','VCT','Saint Vincent and the Grenadines',NULL,NULL),
 (185,'WS','WSM','Samoa (formerly Western Samoa)',NULL,NULL),
 (186,'SM','SMR','San Marino',NULL,NULL),
 (187,'ST','STP','Sao Tome and Principe',NULL,NULL),
 (188,'SA','SAU','Saudi Arabia',NULL,NULL),
 (189,'SN','SEN','Senegal',NULL,NULL),
 (190,'CS','SCG','Serbia and Montenegro (formerly Yugoslavia)',NULL,NULL),
 (191,'SC','SYC','Seychelles',NULL,NULL),
 (192,'SL','SLE','Sierra Leone',NULL,NULL),
 (193,'SG','SGP','Singapore',NULL,NULL),
 (194,'SK','SVK','Slovakia (Slovak Republic)',NULL,NULL),
 (195,'SI','SVN','Slovenia',NULL,NULL),
 (196,'SB','SLB','Solomon Islands',NULL,NULL),
 (197,'SO','SOM','Somalia',NULL,NULL),
 (198,'ZA','ZAF','South Africa (zuid Afrika)',NULL,NULL),
 (199,'GS','SGS','South Georgia and the South Sandwich Islands',NULL,NULL),
 (200,'ES','ESP','Spain',NULL,NULL),
 (201,'LK','LKA','Sri Lanka',NULL,NULL),
 (202,'SD','SDN','Sudan',NULL,NULL),
 (203,'SR','SUR','Suriname',NULL,NULL),
 (204,'SJ','SJM','Svalbard and Jan Mayen',NULL,NULL),
 (205,'SZ','SWZ','Swaziland',NULL,NULL),
 (206,'SE','SWE','Sweden',NULL,NULL),
 (207,'CH','CHE','Switzerland',NULL,NULL),
 (208,'SY','SYR','Syrian Arab Republic',NULL,NULL),
 (209,'TW','TWN','Taiwan',NULL,NULL),
 (210,'TJ','TJK','Tajikistan',NULL,NULL),
 (211,'TZ','TZA','Tanzania',NULL,NULL),
 (212,'TH','THA','Thailand',NULL,NULL),
 (213,'TL','TLS','Timor-Leste (formerly East Timor)',NULL,NULL),
 (214,'TG','TGO','Togo',NULL,NULL),
 (215,'TK','TKL','Tokelau',NULL,NULL),
 (216,'TO','TON','Tonga',NULL,NULL),
 (217,'TT','TTO','Trinidad and Tobago',NULL,NULL),
 (218,'TN','TUN','Tunisia',NULL,NULL),
 (219,'TR','TUR','Turkey',NULL,NULL),
 (220,'TM','TKM','Turkmenistan',NULL,NULL),
 (221,'TC','TCA','Turks and Caicos Islands',NULL,NULL),
 (222,'TV','TUV','Tuvalu',NULL,NULL),
 (223,'UG','UGA','Uganda',NULL,NULL),
 (224,'UA','UKR','Ukraine',NULL,NULL),
 (225,'AE','ARE','United Arab Emirates',NULL,NULL),
 (226,'GB','GBR','United Kingdom (Great Britain)',NULL,NULL),
 (227,'US','USA','United States',NULL,NULL),
 (228,'UM','UMI','United States Minor Outlying Islands',NULL,NULL),
 (229,'UY','URY','Uruguay',NULL,NULL),
 (230,'UZ','UZB','Uzbekistan',NULL,NULL),
 (231,'VU','VUT','Vanuatu',NULL,NULL),
 (232,'VA','VAT','Vatican City (Holy See)',NULL,NULL),
 (233,'VE','VEN','Venezuela',NULL,NULL),
 (234,'VN','VNM','Viet Nam',NULL,NULL),
 (235,'VG','VGB','Virgin Islands, British',NULL,NULL),
 (236,'VI','VIR','Virgin Islands, U.S.',NULL,NULL),
 (237,'WF','WLF','Wallis and Futuna',NULL,NULL),
 (238,'EH','ESH','Western Sahara (formerly Spanish Sahara)',NULL,NULL),
 (239,'YE','YEM','Yemen (Arab Republic)',NULL,NULL),
 (240,'ZM','ZMB','Zambia',NULL,NULL),
 (241,'ZW','ZWE','Zimbabwe',NULL,NULL),
 (242,'DS',NULL,'American Samoa',NULL,NULL),
 (243,'TP',NULL,'East Timor',NULL,NULL),
 (244,'FX',NULL,'France, Metropolitan',NULL,NULL),
 (245,'XK',NULL,'Kosovo',NULL,NULL),
 (246,'TY',NULL,'Mayotte',NULL,NULL),
 (247,'ME',NULL,'Montenegro',NULL,NULL),
 (248,'RS',NULL,'Serbia',NULL,NULL),
 (249,'YU',NULL,'Yugoslavia',NULL,NULL),
 (250,'ZR',NULL,'Zaire',NULL,NULL);
/*!40000 ALTER TABLE `web_enum_country` ENABLE KEYS */;


--
-- Definition of table `web_enum_discount_type`
--

DROP TABLE IF EXISTS `web_enum_discount_type`;
CREATE TABLE `web_enum_discount_type` (
  `discount_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_type_name` varchar(255) DEFAULT NULL,
  `discount_type_description` text,
  `display_order` int(11) DEFAULT '1',
  PRIMARY KEY (`discount_type_id`)
) ;

--
-- Dumping data for table `web_enum_discount_type`
--

/*!40000 ALTER TABLE `web_enum_discount_type` DISABLE KEYS */;
INSERT INTO `web_enum_discount_type` (`discount_type_id`,`discount_type_name`,`discount_type_description`,`display_order`) VALUES 
 (1,'Money','Flat amount',1),
 (2,'Percentage','Percentage amount',2),
 (3,'Points','Credit/Points',3),
 (4,'Merchandise','Merchandise Item',4);
/*!40000 ALTER TABLE `web_enum_discount_type` ENABLE KEYS */;


--
-- Definition of table `web_enum_expiration_type`
--

DROP TABLE IF EXISTS `web_enum_expiration_type`;
CREATE TABLE `web_enum_expiration_type` (
  `expiration_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `expiration_type_name` varchar(255) DEFAULT NULL,
  `expiration_type_description` text,
  `expiration_type_script` text,
  PRIMARY KEY (`expiration_type_id`)
) ;

--
-- Dumping data for table `web_enum_expiration_type`
--

/*!40000 ALTER TABLE `web_enum_expiration_type` DISABLE KEYS */;
INSERT INTO `web_enum_expiration_type` (`expiration_type_id`,`expiration_type_name`,`expiration_type_description`,`expiration_type_script`) VALUES 
 (1,'1 Minute','1 Minute','1 MINUTE'),
 (2,'5 Minute','5 Minute','5 MINUTE'),
 (3,'15 Minute','15 Minute','15 MINUTE'),
 (4,'30 Minutes','30 Minutes','30 MINUTE'),
 (5,'1 Hour','1 Hour','1 HOUR'),
 (6,'2 Hours','2 Hours','2 HOUR'),
 (7,'5 Hours','5 Hours','5 HOUR'),
 (8,'1 Day','1 Day','1 DAY'),
 (9,'2 Days','2 Days','2 DAY'),
 (10,'5 Days','5 Days','5 DAY'),
 (11,'10 Days','10 Days','10 DAY');
/*!40000 ALTER TABLE `web_enum_expiration_type` ENABLE KEYS */;


--
-- Definition of table `web_enum_item_type`
--

DROP TABLE IF EXISTS `web_enum_item_type`;
CREATE TABLE `web_enum_item_type` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_name` varchar(255) DEFAULT NULL,
  `item_type_account` int(1) DEFAULT '0',
  PRIMARY KEY (`item_type_id`)
) ;

INSERT INTO `web_enum_item_type` (`item_type_id`,`item_type_name`,`item_type_account`) VALUES 
 (1,'General Item',1),
 (2,'Bingo Paper',0),
 (3,'Pull Tab',1),
 (4,'Bundle',1),
 (5,'Reservation',1),
 (6,'Hand Held',0),
 (7,'Confirmation',0),
 (8,'Discount',-1);

/*!40000 ALTER TABLE `web_enum_item_type` ENABLE KEYS */;


--
-- Definition of table `web_enum_note_type`
--

DROP TABLE IF EXISTS `web_enum_note_type`;
CREATE TABLE `web_enum_note_type` (
  `note_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_type_name` varchar(255) DEFAULT NULL,
  `note_type_description` text,
  `note_display_order` int(11) DEFAULT '1',
  `note_private` int(1) DEFAULT '0',
  `active` int(1) DEFAULT '1',
  PRIMARY KEY (`note_type_id`)
) ;

--
-- Dumping data for table `web_enum_note_type`
--

/*!40000 ALTER TABLE `web_enum_note_type` DISABLE KEYS */;
INSERT INTO `web_enum_note_type` (`note_type_id`,`note_type_name`,`note_type_description`,`note_display_order`) VALUES 
 (1,'General Note','General Note',1),
 (2,'Room Information','Room Information',2),
 (3,'Flight Information','Flight Information',3),
 (4,'Special Request','Special Request',4);
/*!40000 ALTER TABLE `web_enum_note_type` ENABLE KEYS */;


--
-- Definition of table `web_enum_payment_type`
--


DROP TABLE IF EXISTS `web_enum_payment_type`;
CREATE TABLE `web_enum_payment_type` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type_name` varchar(255) DEFAULT NULL,
  `payment_type_short_name` varchar(45) DEFAULT NULL,
  `payment_type_description` text,
  `payment_interface` varchar(50) DEFAULT '',
  `status` varchar(50) DEFAULT '',
  `payment_display_order` int(11) DEFAULT '1',
  `payment_option` tinyint(4) DEFAULT '1',
  `refund_option` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`payment_type_id`)
) ;

--
-- Dumping data for table `web_enum_payment_type`
--

/*!40000 ALTER TABLE `web_enum_payment_type` DISABLE KEYS */;
INSERT INTO `web_enum_payment_type` (`payment_type_id`,`payment_type_name`,`payment_type_short_name`,`payment_type_description`,`payment_interface`,`status`,`payment_display_order`,`payment_option`,`refund_option`) VALUES 
 (1,'Cash','CS','Cash','','Active',4,1,1),
 (2,'Check','CH','Check','','Active',2,1,0),
 (3,'Credit Card','CC','Credit','','Active',1,1,1),
 (4,'M.O.','MO','Money Order','','Active',3,1,0);
/*!40000 ALTER TABLE `web_enum_payment_type` ENABLE KEYS */;

--
-- Definition of table `web_enum_round_type`
--

DROP TABLE IF EXISTS `web_enum_round_type`;
CREATE TABLE `web_enum_round_type` (
  `round_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `round_type_name` varchar(100) NOT NULL DEFAULT '',
  `display_order` int(11) DEFAULT '1',
  PRIMARY KEY (`round_type_id`)
) ;

--
-- Dumping data for table `web_enum_round_type`
--

/*!40000 ALTER TABLE `web_enum_round_type` DISABLE KEYS */;
INSERT INTO `web_enum_round_type` (`round_type_id`,`round_type_name`,`display_order`) VALUES 
 (1,'None',1),
 (2,'Up',2),
 (3,'Down',3),
 (4,'Standard',4),
 (5,'2 Decimals',5);
/*!40000 ALTER TABLE `web_enum_round_type` ENABLE KEYS */;


--
-- Definition of table `web_enum_transaction_status`
--

DROP TABLE IF EXISTS `web_enum_transaction_status`;
CREATE TABLE `web_enum_transaction_status` (
  `transaction_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_status_id`)
) ;

--
-- Dumping data for table `web_enum_transaction_status`
--

/*!40000 ALTER TABLE `web_enum_transaction_status` DISABLE KEYS */;
INSERT INTO `web_enum_transaction_status` (`transaction_status_id`,`transaction_status_name`) VALUES 
 (1,'Entered'),
 (2,'Processed'),
 (3,'Cancelled');
/*!40000 ALTER TABLE `web_enum_transaction_status` ENABLE KEYS */;


--
-- Definition of table `web_enum_transaction_type`
--

DROP TABLE IF EXISTS `web_enum_transaction_type`;
CREATE TABLE `web_enum_transaction_type` (
  `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_type_id`)
) ;

--
-- Dumping data for table `web_enum_transaction_type`
--

/*!40000 ALTER TABLE `web_enum_transaction_type` DISABLE KEYS */;
INSERT INTO `web_enum_transaction_type` (`transaction_type_id`,`transaction_type_name`) VALUES 
 (1,'Current'),
 (2,'Description');
/*!40000 ALTER TABLE `web_enum_transaction_type` ENABLE KEYS */;


--
-- Definition of table `web_fls_file_info`
--

DROP TABLE IF EXISTS `web_fls_file_info`;
CREATE TABLE `web_fls_file_info` (
  `user_upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `section_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `public_name` varchar(50) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_log_id` int(2) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `datetime_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_upload_id`)
) ;

--
-- Dumping data for table `web_fls_file_info`
--

/*!40000 ALTER TABLE `web_fls_file_info` DISABLE KEYS */;
INSERT INTO `web_fls_file_info` (`user_upload_id`,`user_name`,`user_id`,`company_name`,`company_id`,`section_name`,`file_type`,`file_name`,`public_name`,`file_size`,`file_log_id`,`comments`,`datetime_stamp`) VALUES 
 (1,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateRoom1.jpg','Demo Room 1',0,0,'','2013-12-05 10:32:55'),
 (2,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateRoom2.jpg','Demo Room 2',0,0,'','2013-12-05 10:57:40'),
 (3,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateRoom3.jpg','Demo Room 3',0,0,'','2013-12-05 10:57:43'),
 (4,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateRoom4.jpg','Demo Room 4',0,0,'','2013-12-05 10:57:47'),
 (5,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateRoom5.jpg','Demo Room 5',0,0,'','2013-12-05 10:57:49'),
 (6,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateChristmas.jpg','Demo Room Christmas',0,0,'','2013-12-05 11:48:30'),
 (7,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplateHalloween.jpg','Demo Room Halloween',0,0,'','2013-12-05 11:48:33'),
 (8,'FortuNetManager',1,'FortuNet Master',3,'Upload reservation_images','Room','TemplatePatricks.jpg','Demo Room Patricks',0,0,'','2013-12-05 11:48:38'),
 (9,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','ChristmasTree_Icon.png','Christmas Tree 1',0,0,'','2013-12-05 12:01:46'),
 (10,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','HalloweenIcon.png','Hallowen 1',0,0,'','2013-12-05 12:11:38'),
 (11,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','PatricksIcon.png','Saint Patricks 1',0,0,'','2013-12-05 12:11:56'),
 (12,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','NewYear3.png','New Year 3',0,0,'','2013-12-10 18:40:38'),
 (13,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','AlienSmile1.png','Alien Smile 1',0,0,'','2013-12-10 18:53:20'),
 (14,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','AngryBirds1.png','Angry Birds 1',0,0,'','2013-12-10 18:53:31'),
 (15,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','BallonsHearts.png','Ballons Hearts',0,0,'','2013-12-10 18:53:42'),
 (16,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Balloons1.png','Balloons 1',0,0,'','2013-12-10 18:53:51'),
 (17,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Cats1.png','Cats 1',0,0,'','2013-12-10 18:54:00'),
 (18,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','ChristmasTree.png','Christmas Tree 2',0,0,'','2013-12-10 18:54:10'),
 (19,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Ghost1.png','Ghost 1',0,0,'','2013-12-10 18:54:47'),
 (20,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Gift.png','Gift 1',0,0,'','2013-12-10 18:54:59'),
 (21,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Hallowen2.png','Hallowen 2',0,0,'','2013-12-10 18:55:12'),
 (22,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','HarlequinRed.png','Harlequin',0,0,'','2013-12-10 18:55:34'),
 (23,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Linked1.png','Linked 1',0,0,'','2013-12-10 18:55:43'),
 (24,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','NewYear1.png','New Year 1',0,0,'','2013-12-10 18:56:00'),
 (25,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','NewYear2.png','New Year 2',0,0,'','2013-12-10 18:56:16'),
 (26,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','NewYearParty.png','New Year Party',0,0,'','2013-12-10 18:56:31'),
 (27,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Plane1.png','Plane 1',0,0,'','2013-12-10 18:56:41'),
 (28,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','SaintPatrick.png','Saint Patrick 2',0,0,'','2013-12-10 18:57:02'),
 (29,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','SmileBall1.png','Smile Ball 1',0,0,'','2013-12-10 18:57:25'),
 (30,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','SmileBall2.png','Smile Ball 2',0,0,'','2013-12-10 18:57:38'),
 (31,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','SmileBall3.png','Smile Ball 3',0,0,'','2013-12-10 18:57:49'),
 (32,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','SpecialEvent.png','Special Event 1',0,0,'','2013-12-10 18:58:02'),
 (33,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Star1.png','Star 1',0,0,'','2013-12-10 18:58:12'),
 (34,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Theater1.png','Theater 1',0,0,'','2013-12-10 18:58:29'),
 (35,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Tournament.png','Tournament',0,0,'','2013-12-10 18:58:38'),
 (36,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Treasure1.png','Treasure 1',0,0,'','2013-12-10 18:58:49'),
 (37,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Trumpet.png','Trumpet',0,0,'','2013-12-10 18:58:58'),
 (38,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','Witch1.png','Witch 1',0,0,'','2013-12-10 18:59:13'),
 (39,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','WonderBall1.png','Wonder Ball 1',0,0,'','2013-12-10 18:59:24'),
 (40,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','fileManagementIcon.png','File Management',0,0,'','2014-01-23 11:17:29'),
 (41,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','calendar.png','Calendar',0,0,'','2014-01-23 11:17:42'),
 (42,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','calendarioIcon.png','Calendario Icon',0,0,'','2014-01-23 11:17:54'),
 (43,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Chat1.png','Chat 1',0,0,'','2014-01-23 11:18:04'),
 (44,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Chat2.png','Chat 2',0,0,'','2014-01-23 11:30:42'),
 (45,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Chat3.png','Chat 3',0,0,'','2014-01-23 11:30:50'),
 (46,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','company_1.png','Company 1',0,0,'','2014-01-23 11:31:02'),
 (47,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','company_2.png','Company 2',0,0,'','2014-01-23 11:31:12'),
 (48,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','company_3.png','Company 3',0,0,'','2014-01-23 11:31:23'),
 (49,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','distributor_1.png','Distributor',0,0,'','2014-01-23 11:31:34'),
 (50,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','enduser.png','User',0,0,'','2014-01-23 11:31:50'),
 (51,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','errorSmile.jpg','Error',0,0,'','2014-01-23 11:32:13'),
 (52,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','MoneyFace.png','Money Face',0,0,'','2014-01-23 11:32:50'),
 (53,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','newUser.png','New User',0,0,'','2014-01-23 11:33:02'),
 (54,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','Event','paperIcon.png','Bingo Paper',0,0,'','2014-01-23 11:33:17'),
 (55,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','tickInterface.png','Interface',0,0,'','2014-01-23 11:33:29'),
 (56,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Transactions.png','Transactions',0,0,'','2014-01-23 11:33:37'),
 (57,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','www.png','Display',0,0,'','2014-01-23 11:33:45'),
 (58,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','PlayerMgtIcon.png','Players',0,0,'','2014-01-23 11:33:58'),
 (59,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','POS.png','POS',0,0,'','2014-01-23 11:34:06'),
 (60,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Reporting.png','Reporting',0,0,'','2014-01-23 11:34:14'),
 (61,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','ResIcons.png','Reservations',0,0,'','2014-01-23 11:34:27'),
 (62,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','resvReport.png','Report',0,0,'','2014-01-23 11:34:48'),
 (63,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','securityIcon.png','Security Icon',0,0,'','2014-01-23 11:35:05'),
 (64,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Settings1.png','Settings1',0,0,'','2014-02-06 10:52:50'),
 (65,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Settings2.png','Settings2',0,0,'','2014-02-06 10:52:57'),
 (66,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','discount_icon.png','Discounts',0,0,'','2014-07-28 16:01:48'),
 (67,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','EventManagement.png','EventManagement',0,0,'','2014-09-29 15:57:54'),
 (68,'FortuNetManager',1,'FortuNet Master',1,'Upload reservation_images','System','Linked1.png','Linked 1',0,0,' Duplicated',NULL);
/*!40000 ALTER TABLE `web_fls_file_info` ENABLE KEYS */;


--
-- Definition of table `web_ply_interface_ledger`
--

DROP TABLE IF EXISTS `web_ply_interface_ledger`;
CREATE TABLE `web_ply_interface_ledger` (
  `interface_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_interface_id` int(11) DEFAULT NULL,
  `interface_player_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT '-1',
  `user_id` int(11) DEFAULT NULL,
  `note_description` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remove_user_id` int(11) DEFAULT NULL,
  `remove_datetime` datetime DEFAULT NULL,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`interface_ledger_id`)
) ;

--
-- Dumping data for table `web_ply_interface_ledger`
--

/*!40000 ALTER TABLE `web_ply_interface_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ply_interface_ledger` ENABLE KEYS */;


--
-- Definition of table `web_ply_player_addresses`
--

DROP TABLE IF EXISTS `web_ply_player_addresses`;
CREATE TABLE `web_ply_player_addresses` (
  `player_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT '1',
  `status` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `address_1` varchar(100) DEFAULT NULL,
  `address_2` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(15) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `remove_datetime` datetime DEFAULT NULL,
  `remove_login_id` varchar(50) DEFAULT '',
  PRIMARY KEY (`player_address_id`)
) ;

--
-- Dumping data for table `web_ply_player_addresses`
--

/*!40000 ALTER TABLE `web_ply_player_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ply_player_addresses` ENABLE KEYS */;


--
-- Definition of table `web_ply_player_company`
--

DROP TABLE IF EXISTS `web_ply_player_company`;
CREATE TABLE `web_ply_player_company` (
  `player_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `player_type` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remove_user_id` int(11) DEFAULT NULL,
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`player_company_id`)
) ;

--
-- Dumping data for table `web_ply_player_company`
--

/*!40000 ALTER TABLE `web_ply_player_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ply_player_company` ENABLE KEYS */;


--
-- Definition of table `web_ply_player_info`
--

DROP TABLE IF EXISTS `web_ply_player_info`;
CREATE TABLE `web_ply_player_info` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_type` varchar(50) DEFAULT NULL,
  `player_interface_id` int(11) DEFAULT NULL,
  `interface_type` varchar(50) DEFAULT NULL,
  `interface_player_id` int(11) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT '0',
  `card` varchar(50) DEFAULT NULL,
  `player_type_id` varchar(5) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `ssn` varchar(13) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `annivers` date DEFAULT NULL,
  `enroll` datetime DEFAULT NULL,
  `status` varchar(15) DEFAULT '',
  `middle_initial` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `Index_PlayerName` (`first_name`,`last_name`)
) ;

--
-- Dumping data for table `web_ply_player_info`
--

/*!40000 ALTER TABLE `web_ply_player_info` DISABLE KEYS */;
INSERT INTO `web_ply_player_info` (`player_id`,`player_type`,`player_interface_id`,`interface_type`,`interface_player_id`,`account_number`,`card`,`player_type_id`,`last_name`,`first_name`,`ssn`,`gender`,`email`,`birthdate`,`annivers`,`enroll`,`status`,`middle_initial`) VALUES 
 (2,NULL,NULL,NULL,NULL,'4444','4444','','Usma','Jose','','4','jose@bingostar.com',NULL,NULL,NULL,'Active','Martin'),
 (3,NULL,NULL,NULL,NULL,'7777','7','','Smith','John','','6','john@gmail.com','2010-11-02','2010-11-03',NULL,'Active','6'),
 (4,NULL,NULL,NULL,NULL,'33333','3','','Brown','Michael','','3','3',NULL,NULL,NULL,'Active','3'),
 (5,NULL,NULL,NULL,NULL,'908541','67908541',NULL,'CN67908541','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (6,NULL,NULL,NULL,NULL,'908601','67908601',NULL,'CN67908601','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (7,NULL,NULL,NULL,NULL,'908542','67908542',NULL,'CN67908542','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (8,NULL,NULL,NULL,NULL,'908525','67908525',NULL,'CN67908525','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (9,NULL,NULL,NULL,NULL,'908520','67908520',NULL,'CN67908520','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (10,NULL,NULL,NULL,NULL,'908527','67908527',NULL,'CN67908527','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (11,NULL,NULL,NULL,NULL,'908512','67908512',NULL,'CN67908512','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (12,NULL,NULL,NULL,NULL,'908510','67908510',NULL,'CN67908510','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (13,NULL,NULL,NULL,NULL,'908509','67908509',NULL,'CN67908509','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (14,NULL,NULL,NULL,NULL,'908523','67908523',NULL,'CN67908523','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (15,NULL,NULL,NULL,NULL,'908508','67908508',NULL,'CN67908508','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (16,NULL,NULL,NULL,NULL,'908583','67908583',NULL,'CN67908583','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (17,NULL,NULL,NULL,NULL,'908588','67908588',NULL,'CN67908588','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (18,NULL,NULL,NULL,NULL,'908594','67908594',NULL,'CN67908594','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (19,NULL,NULL,NULL,NULL,'908593','67908593',NULL,'CN67908593','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (20,NULL,NULL,NULL,NULL,'908568','67908568',NULL,'CN67908568','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (21,NULL,NULL,NULL,NULL,'908566','67908566',NULL,'CN67908566','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (22,NULL,NULL,NULL,NULL,'908567','67908567',NULL,'CN67908567','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (23,NULL,NULL,NULL,NULL,'908565','67908565',NULL,'CN67908565','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (24,NULL,NULL,NULL,NULL,'908564','67908564',NULL,'CN67908564','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (25,NULL,NULL,NULL,NULL,'908561','67908561',NULL,'CN67908561','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (26,NULL,NULL,NULL,NULL,'908562','67908562',NULL,'CN67908562','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (27,NULL,NULL,NULL,NULL,'908591','67908591',NULL,'CN67908591','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (28,NULL,NULL,NULL,NULL,'908585','67908585',NULL,'CN67908585','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (29,NULL,NULL,NULL,NULL,'908584','67908584',NULL,'CN67908584','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (30,NULL,NULL,NULL,NULL,'908589','67908589',NULL,'CN67908589','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (31,NULL,NULL,NULL,NULL,'908590','67908590',NULL,'CN67908590','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (32,NULL,NULL,NULL,NULL,'908578','67908578',NULL,'CN67908578','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (33,NULL,NULL,NULL,NULL,'908538','67908538',NULL,'CN67908538','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (34,NULL,NULL,NULL,NULL,'908539','67908539',NULL,'CN67908539','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (35,NULL,NULL,NULL,NULL,'908535','67908535',NULL,'CN67908535','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (36,NULL,NULL,NULL,NULL,'908536','67908536',NULL,'CN67908536','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (37,NULL,NULL,NULL,NULL,'908537','67908537',NULL,'CN67908537','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (38,NULL,NULL,NULL,NULL,'908540','67908540',NULL,'CN67908540','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (39,NULL,NULL,NULL,NULL,'908543','67908543',NULL,'CN67908543','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (40,NULL,NULL,NULL,NULL,'908544','67908544',NULL,'CN67908544','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (41,NULL,NULL,NULL,NULL,'908545','67908545',NULL,'CN67908545','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (42,NULL,NULL,NULL,NULL,'908546','67908546',NULL,'CN67908546','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (43,NULL,NULL,NULL,NULL,'908548','67908548',NULL,'CN67908548','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (44,NULL,NULL,NULL,NULL,'908547','67908547',NULL,'CN67908547','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (45,NULL,NULL,NULL,NULL,'908603','67908603',NULL,'CN67908603','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (46,NULL,NULL,NULL,NULL,'908602','67908602',NULL,'CN67908602','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (47,NULL,NULL,NULL,NULL,'908582','67908582',NULL,'CN67908582','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (48,NULL,NULL,NULL,NULL,'908570','67908570',NULL,'CN67908570','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (49,NULL,NULL,NULL,NULL,'908569','67908569',NULL,'CN67908569','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (50,NULL,NULL,NULL,NULL,'908563','67908563',NULL,'CN67908563','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (51,NULL,NULL,NULL,NULL,'908549','67908549',NULL,'CN67908549','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (52,NULL,NULL,NULL,NULL,'908572','67908572',NULL,'CN67908572','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (53,NULL,NULL,NULL,NULL,'908571','67908571',NULL,'CN67908571','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (54,NULL,NULL,NULL,NULL,'908521','67908521',NULL,'CN67908521','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (55,NULL,NULL,NULL,NULL,'908504','67908504',NULL,'CN67908504','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (56,NULL,NULL,NULL,NULL,'908503','67908503',NULL,'CN67908503','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (57,NULL,NULL,NULL,NULL,'908502','67908502',NULL,'CN67908502','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (58,NULL,NULL,NULL,NULL,'908501','67908501',NULL,'CN67908501','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (59,NULL,NULL,NULL,NULL,'908528','67908528',NULL,'CN67908528','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (60,NULL,NULL,NULL,NULL,'908529','67908529',NULL,'CN67908529','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (61,NULL,NULL,NULL,NULL,'908530','67908530',NULL,'CN67908530','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (62,NULL,NULL,NULL,NULL,'908531','67908531',NULL,'CN67908531','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (63,NULL,NULL,NULL,NULL,'908532','67908532',NULL,'CN67908532','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (64,NULL,NULL,NULL,NULL,'908533','67908533',NULL,'CN67908533','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (65,NULL,NULL,NULL,NULL,'908505','67908505',NULL,'CN67908505','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (66,NULL,NULL,NULL,NULL,'908534','67908534',NULL,'CN67908534','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (67,NULL,NULL,NULL,NULL,'908555','67908555',NULL,'CN67908555','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (68,NULL,NULL,NULL,NULL,'908556','67908556',NULL,'CN67908556','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (69,NULL,NULL,NULL,NULL,'908557','67908557',NULL,'CN67908557','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (70,NULL,NULL,NULL,NULL,'908558','67908558',NULL,'CN67908558','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (71,NULL,NULL,NULL,NULL,'908559','67908559',NULL,'CN67908559','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (72,NULL,NULL,NULL,NULL,'908560','67908560',NULL,'CN67908560','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (73,NULL,NULL,NULL,NULL,'908511','67908511',NULL,'CN67908511','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (74,NULL,NULL,NULL,NULL,'908518','67908518',NULL,'CN67908518','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (75,NULL,NULL,NULL,NULL,'908519','67908519',NULL,'CN67908519','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (76,NULL,NULL,NULL,NULL,'908522','67908522',NULL,'CN67908522','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (77,NULL,NULL,NULL,NULL,'908524','67908524',NULL,'CN67908524','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (78,NULL,NULL,NULL,NULL,'908526','67908526',NULL,'CN67908526','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (79,NULL,NULL,NULL,NULL,'908554','67908554',NULL,'CN67908554','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (80,NULL,NULL,NULL,NULL,'908553','67908553',NULL,'CN67908553','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (81,NULL,NULL,NULL,NULL,'908552','67908552',NULL,'CN67908552','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (82,NULL,NULL,NULL,NULL,'908551','67908551',NULL,'CN67908551','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (83,NULL,NULL,NULL,NULL,'908550','67908550',NULL,'CN67908550','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (84,NULL,NULL,NULL,NULL,'908579','67908579',NULL,'CN67908579','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (85,NULL,NULL,NULL,NULL,'908580','67908580',NULL,'CN67908580','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (86,NULL,NULL,NULL,NULL,'908581','67908581',NULL,'CN67908581','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (87,NULL,NULL,NULL,NULL,'908507','67908507',NULL,'CN67908507','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (88,NULL,NULL,NULL,NULL,'908506','67908506',NULL,'CN67908506','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (89,NULL,NULL,NULL,NULL,'1111122  ','122      ',NULL,'CN122','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (90,NULL,NULL,NULL,NULL,'1111123  ','123      ',NULL,'CN123','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (91,NULL,NULL,NULL,NULL,'908599','67908599',NULL,'CN67908599','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (92,NULL,NULL,NULL,NULL,'908598','67908598',NULL,'CN67908598','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (93,NULL,NULL,NULL,NULL,'908597','67908597',NULL,'CN67908597','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (94,NULL,NULL,NULL,NULL,'908596','67908596',NULL,'CN67908596','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (95,NULL,NULL,NULL,NULL,'908595','67908595',NULL,'CN67908595','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (96,NULL,NULL,NULL,NULL,'908592','67908592',NULL,'CN67908592','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (97,NULL,NULL,NULL,NULL,'908586','67908586',NULL,'CN67908586','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (98,NULL,NULL,NULL,NULL,'908600','67908600',NULL,'CN67908600','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (99,NULL,NULL,NULL,NULL,'908587','67908587',NULL,'CN67908587','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (100,NULL,NULL,NULL,NULL,'1111112  ','12       ',NULL,'CN12','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (101,NULL,NULL,NULL,NULL,'1123456  ','123456   ',NULL,'CN123456','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (102,NULL,NULL,NULL,NULL,'9085097  ','679085097',NULL,'CN679085097','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (103,NULL,NULL,NULL,NULL,'PN6790851','67908517',NULL,'CN67908517','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (104,NULL,NULL,NULL,NULL,'PN6790851','67908516',NULL,'CN67908516','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (105,NULL,NULL,NULL,NULL,'PN6790851','67908515',NULL,'CN67908515','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (106,NULL,NULL,NULL,NULL,'PN6790851','67908514',NULL,'CN67908514','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (107,NULL,NULL,NULL,NULL,'PN6790851','67908513',NULL,'CN67908513','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (108,NULL,NULL,NULL,NULL,'PN9324079','932407957',NULL,'CN932407957','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (109,NULL,NULL,NULL,NULL,'PN9324060','932406018',NULL,'CN932406018','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (110,NULL,NULL,NULL,NULL,'PN4007876','40078763 ',NULL,'CN40078763','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (111,NULL,NULL,NULL,NULL,'PN9324979','932497972',NULL,'CN932497972','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (112,NULL,NULL,NULL,NULL,'PN9324048','932404849',NULL,'CN932404849','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (113,NULL,NULL,NULL,NULL,'PN9324720','932472083',NULL,'CN932472083','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (114,NULL,NULL,NULL,NULL,'PN5108681','51086817 ',NULL,'CN51086817','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (115,NULL,NULL,NULL,NULL,'PN9324062','932406224',NULL,'CN932406224','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (116,NULL,NULL,NULL,NULL,'PN9324075','932407501',NULL,'CN932407501','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (117,NULL,NULL,NULL,NULL,'PN9324913','932491388',NULL,'CN932491388','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (118,NULL,NULL,NULL,NULL,'PN9324070','932407026',NULL,'CN932407026','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (119,NULL,NULL,NULL,NULL,'PN9126148','912614896',NULL,'CN912614896','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (120,NULL,NULL,NULL,NULL,'PN9324101','932410191',NULL,'CN932410191','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (121,NULL,NULL,NULL,NULL,'PN9324333','932433339',NULL,'CN932433339','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (122,NULL,NULL,NULL,NULL,'PN9324139','932413918',NULL,'CN932413918','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (123,NULL,NULL,NULL,NULL,'PN9324285','932428563',NULL,'CN932428563','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (124,NULL,NULL,NULL,NULL,'PN9324474','932447420',NULL,'CN932447420','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (125,NULL,NULL,NULL,NULL,'PN9324089','932408953',NULL,'CN932408953','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (126,NULL,NULL,NULL,NULL,'PN9226029','922602988',NULL,'CN922602988','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (127,NULL,NULL,NULL,NULL,'PN9126056','912605621',NULL,'CN912605621','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (128,NULL,NULL,NULL,NULL,'PN9324391','932439112',NULL,'CN932439112','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (129,NULL,NULL,NULL,NULL,'PN9324067','932406724',NULL,'CN932406724','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (130,NULL,NULL,NULL,NULL,'PN9324391','932439114',NULL,'CN932439114','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (131,NULL,NULL,NULL,NULL,'PN9324048','932404857',NULL,'CN932404857','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (132,NULL,NULL,NULL,NULL,'PN9324774','932477422',NULL,'CN932477422','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (133,NULL,NULL,NULL,NULL,'PN1706813','170681314',NULL,'CN170681314','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (134,NULL,NULL,NULL,NULL,'PN9127664','912766471',NULL,'CN912766471','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (135,NULL,NULL,NULL,NULL,'PN9327023','932702396',NULL,'CN932702396','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (136,NULL,NULL,NULL,NULL,'PN9324474','932447422',NULL,'CN932447422','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (137,NULL,NULL,NULL,NULL,'PN9324979','932497982',NULL,'CN932497982','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (138,NULL,NULL,NULL,NULL,'PN9127688','912768873',NULL,'CN912768873','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (139,NULL,NULL,NULL,NULL,'PN9127688','912768874',NULL,'CN912768874','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (140,NULL,NULL,NULL,NULL,'PN5186817','5186817  ',NULL,'CN5186817','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (141,NULL,NULL,NULL,NULL,'PN9324061','932406178',NULL,'CN932406178','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (142,NULL,NULL,NULL,NULL,'PN3234075','323407501',NULL,'CN323407501','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (143,NULL,NULL,NULL,NULL,'PN9126013','912601368',NULL,'CN912601368','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (144,NULL,NULL,NULL,NULL,'PN9327060','932706079',NULL,'CN932706079','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (145,NULL,NULL,NULL,NULL,'PN9326246','932624615',NULL,'CN932624615','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (146,NULL,NULL,NULL,NULL,'PN9226220','922622072',NULL,'CN922622072','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (147,NULL,NULL,NULL,NULL,'PN9226220','922622071',NULL,'CN922622071','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (148,NULL,NULL,NULL,NULL,'PN9327608','932760804',NULL,'CN932760804','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (149,NULL,NULL,NULL,NULL,'PN5281047','52810477 ',NULL,'CN52810477','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (150,NULL,NULL,NULL,NULL,'PN9327558','932755825',NULL,'CN932755825','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (151,NULL,NULL,NULL,NULL,'PN9324542','932454200',NULL,'CN932454200','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (152,NULL,NULL,NULL,NULL,'PN9327310','932731011',NULL,'CN932731011','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (153,NULL,NULL,NULL,NULL,'PN9326098','932609834',NULL,'CN932609834','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (154,NULL,NULL,NULL,NULL,'PN9127886','912788695',NULL,'CN912788695','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (155,NULL,NULL,NULL,NULL,'PN9324109','932410998',NULL,'CN932410998','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (156,NULL,NULL,NULL,NULL,'PN9324089','932408922',NULL,'CN932408922','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (157,NULL,NULL,NULL,NULL,'PN9325622','932562236',NULL,'CN932562236','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (158,NULL,NULL,NULL,NULL,'PN9326956','932695692',NULL,'CN932695692','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (159,NULL,NULL,NULL,NULL,'PN9327331','932733180',NULL,'CN932733180','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (160,NULL,NULL,NULL,NULL,'PN9325623','932562361',NULL,'CN932562361','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (161,NULL,NULL,NULL,NULL,'PN9327688','932768874',NULL,'CN932768874','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (162,NULL,NULL,NULL,NULL,'PN9327072','932707265',NULL,'CN932707265','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (163,NULL,NULL,NULL,NULL,'PN9126074','912607471',NULL,'CN912607471','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (164,NULL,NULL,NULL,NULL,'PN9226052','9226052  ',NULL,'CN9226052','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (165,NULL,NULL,NULL,NULL,'PN9324117','932411736',NULL,'CN932411736','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (166,NULL,NULL,NULL,NULL,'PN9325804','932580476',NULL,'CN932580476','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (167,NULL,NULL,NULL,NULL,'PN9324102','932410222',NULL,'CN932410222','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (168,NULL,NULL,NULL,NULL,'PN9325443','932544344',NULL,'CN932544344','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (169,NULL,NULL,NULL,NULL,'PN123455 ','123455   ',NULL,'CN123455','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (170,NULL,NULL,NULL,NULL,'PN111    ','111      ',NULL,'CN111','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (171,NULL,NULL,NULL,NULL,'PN1234   ','1234     ',NULL,'CN1234','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (172,NULL,NULL,NULL,NULL,'PNPN12345','PN123456 ',NULL,'CNPN123456','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL),
 (173,NULL,NULL,NULL,NULL,'PN123456 ','PNPN12345',NULL,'CNPN123456','Patron',NULL,NULL,NULL,'1964-01-15',NULL,NULL,'Active',NULL);
/*!40000 ALTER TABLE `web_ply_player_info` ENABLE KEYS */;


--
-- Definition of table `web_ply_player_notes`
--

DROP TABLE IF EXISTS `web_ply_player_notes`;
CREATE TABLE `web_ply_player_notes` (
  `player_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note_description` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remove_user_id` int(11) DEFAULT NULL,
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`player_note_id`)
) ;

--
-- Dumping data for table `web_ply_player_notes`
--

/*!40000 ALTER TABLE `web_ply_player_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ply_player_notes` ENABLE KEYS */;


--
-- Definition of table `web_ply_player_phones`
--

DROP TABLE IF EXISTS `web_ply_player_phones`;
CREATE TABLE `web_ply_player_phones` (
  `player_phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT '1',
  `status` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `remove_login_id` varchar(50) DEFAULT '',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`player_phone_id`)
) ;

--
-- Dumping data for table `web_ply_player_phones`
--

/*!40000 ALTER TABLE `web_ply_player_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_ply_player_phones` ENABLE KEYS */;

--
-- Definition of table `web_rsv_component_info`
--

DROP TABLE IF EXISTS `web_rsv_component_info`;
CREATE TABLE `web_rsv_component_info` (
  `component_id` int(11) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(255) DEFAULT NULL,
  `component_description` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `display_position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT '1.00',
  `height` int(11) DEFAULT '1',
  `width` int(11) DEFAULT '1',
  `rotation` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`component_id`)
);

--
-- Dumping data for table `web_rsv_component_info`
--

/*!40000 ALTER TABLE `web_rsv_component_info` DISABLE KEYS */;
INSERT INTO `web_rsv_component_info` (`component_id`,`component_name`,`component_description`,`company_id`,`display_position`,`image`,`color`,`price`,`height`,`width`,`rotation`,`created_by`,`created_on`,`status`) VALUES 
 (16,'Seat','Small',3,1,'','white','20.00',20,20,0,'FortuNetManager','2013-12-04 14:43:10',''),
 (17,'Seat','Wide',0,2,'','white','20.00',20,30,0,'1','2013-12-04 14:43:19',''),
 (18,'Seat','Tall',0,3,'','white','20.00',30,20,0,'1','2013-12-04 14:43:45',''),
 (19,'Seat','Small Diamond',3,1,'','white','20.00',15,15,-45,'1','2013-12-04 14:43:49',''),
 (20,'Stationary','Small',3,11,'','orange','30.00',20,20,0,'FortuNetManager','2013-12-04 14:44:57',''),
 (21,'Stationary','Wide',0,12,'','orange','30.00',20,30,0,'1','2013-12-04 14:45:03',''),
 (22,'Stationary','Tall',0,13,'','orange','30.00',30,20,0,'1','2013-12-04 14:45:06',''),
 (23,'Stationary','Small Diamond',3,14,'','orange','30.00',15,15,-45,'1','2013-12-04 14:45:09',''),
 (28,'Seat','Regular',0,0,'','white','20.00',30,30,0,'FortuNetManager','2013-12-05 09:32:40',''),
 (24,'Special','Small',3,21,'','#99CCFF','20.00',20,20,0,'FortuNetManager','2013-12-04 14:48:18',''),
 (25,'Special','Wide',0,22,'','#99CCFF','20.00',20,30,0,'1','2013-12-04 14:48:28',''),
 (26,'Special','Tall',0,23,'','#99CCFF','20.00',30,20,0,'1','2013-12-04 14:48:31',''),
 (27,'Special','Small Diamond',3,24,'','#99CCFF','20.00',15,15,-45,'1','2013-12-04 14:48:36',''),
 (29,'Special','Regular',0,0,'','#99CCFF','20.00',30,30,0,'FortuNetManager','2013-12-05 09:33:07',''),
 (30,'Stationary','Regular',0,0,'','orange','30.00',30,30,0,'FortuNetManager','2013-12-05 09:33:34',''),
 (31,'Seat','Diamond',0,0,'','white','20.00',30,30,-45,'FortuNetManager','2013-12-05 09:40:24',''),
 (32,'Special','Diamond',0,0,'','#99CCFF','20.00',30,30,-45,'FortuNetManager','2013-12-05 09:40:41',''),
 (33,'Stationary','Diamond',0,0,'','orange','30.00',30,30,-45,'FortuNetManager','2013-12-05 09:41:04','');
/*!40000 ALTER TABLE `web_rsv_component_info` ENABLE KEYS */;


--
-- Definition of table `web_rsv_event_components`
--

DROP TABLE IF EXISTS `web_rsv_event_components`;
CREATE TABLE `web_rsv_event_components` (
  `event_component_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT '0000-00-00',
  `event_id` int(11) DEFAULT '1',
  `component_id` int(11) DEFAULT '1',
  `event_component_identifier` varchar(255) DEFAULT '1',
  `price` decimal(11,2) DEFAULT '1.00',
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_component_id`)
) ;

--
-- Dumping data for table `web_rsv_event_components`
--

/*!40000 ALTER TABLE `web_rsv_event_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_rsv_event_components` ENABLE KEYS */;


--
-- Definition of table `web_rsv_event_dates`
--

DROP TABLE IF EXISTS `web_rsv_event_dates`;
CREATE TABLE `web_rsv_event_dates` (
  `event_date_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT '1',
  `event_date` date DEFAULT '0000-00-00',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_date_id`)
) ;

--
-- Dumping data for table `web_rsv_event_dates`
--

/*!40000 ALTER TABLE `web_rsv_event_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_rsv_event_dates` ENABLE KEYS */;


--
-- Definition of table `web_rsv_event_description`
--

DROP TABLE IF EXISTS `web_rsv_event_description`;
CREATE TABLE `web_rsv_event_description` (
  `event_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT '1',
  `event_code` varchar(255) DEFAULT '',
  `confirmation_format` varchar(100) DEFAULT '',
  `confirmation_header1` varchar(100) DEFAULT NULL,
  `confirmation_header2` varchar(100) DEFAULT NULL,
  `confirmation_footer` varchar(255) DEFAULT NULL,
  `seat_format` varchar(100) DEFAULT '',
  `seat_header1` varchar(100) DEFAULT NULL,
  `seat_header2` varchar(100) DEFAULT NULL,
  `seat_footer1` varchar(100) DEFAULT NULL,
  `seat_footer2` varchar(100) DEFAULT NULL,
  `seat_footer3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`event_description_id`)
) ;

--
-- Dumping data for table `web_rsv_event_description`
--

/*!40000 ALTER TABLE `web_rsv_event_description` DISABLE KEYS */;
INSERT INTO `web_rsv_event_description` (`event_description_id`,`event_id`,`event_code`,`confirmation_format`,`confirmation_header1`,`confirmation_header2`,`confirmation_footer`,`seat_format`,`seat_header1`,`seat_header2`,`seat_footer1`,`seat_footer2`,`seat_footer3`) VALUES 
 (29,73,'','','','Happy Christmas','','','','','','Happy Christmas','Good Luck'),
 (31,75,'','','','Happy Halloween','','','','','','Happy Halloween','Good Luck');
/*!40000 ALTER TABLE `web_rsv_event_description` ENABLE KEYS */;


--
-- Definition of table `web_rsv_event_info`
--

DROP TABLE IF EXISTS `web_rsv_event_info`;
CREATE TABLE `web_rsv_event_info` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_event_id` int(11) DEFAULT '0',
  `event_name` varchar(255) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT '',
  `event_description` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1',
  `display_position` int(11) NOT NULL DEFAULT '0',
  `large_image` varchar(255) DEFAULT NULL,
  `small_image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`event_id`)
) ;

--
-- Dumping data for table `web_rsv_event_info`
--

/*!40000 ALTER TABLE `web_rsv_event_info` DISABLE KEYS */;
INSERT INTO `web_rsv_event_info` (`event_id`,`parent_event_id`,`event_name`,`event_type`,`event_description`,`company_id`,`display_position`,`large_image`,`small_image`,`color`,`created_by`,`created_on`,`status`,`date`) VALUES 
 (60,0,'Template D','Template','',3,0,'None','None','','FortuNetManager','2013-12-04 15:17:26','Active','0000-00-00'),
 (73,0,'Christmas Template','Template','',3,0,'None','ChristmasTree_Icon.png','','FortuNetManager','2013-12-05 11:58:28','Active','0000-00-00'),
 (63,0,'Template A','Template','',3,0,'','None','','FortuNetManager','2013-12-04 17:32:25','Active','0000-00-00'),
 (64,0,'Template B','Template','',3,0,'None','None','','FortuNetManager','2013-12-04 17:32:33','Active','0000-00-00'),
 (65,0,'Template C','Template','',3,0,'None','None','','FortuNetManager','2013-12-04 17:32:49','Active','0000-00-00'),
 (66,0,'Big Event Template','Template','',3,0,'None','None','','FortuNetManager','2013-12-04 17:34:32','Active','0000-00-00'),
 (71,0,'Template E','Template','',3,0,'None','None','','FortuNetManager','2013-12-05 09:53:09','Active','0000-00-00'),
 (75,0,'Halloween Template','Template','',3,0,'None','HalloweenIcon.png','','FortuNetManager','2013-12-05 12:05:29','Active','0000-00-00'),
 (77,0,'Saint Patricks Template','Template','',3,0,'None','PatricksIcon.png','','FortuNetManager','2013-12-05 12:13:09','Active','0000-00-00');
/*!40000 ALTER TABLE `web_rsv_event_info` ENABLE KEYS */;


--
-- Definition of table `web_rsv_event_rooms`
--

DROP TABLE IF EXISTS `web_rsv_event_rooms`;
CREATE TABLE `web_rsv_event_rooms` (
  `event_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT '1',
  `room_id` int(11) DEFAULT '1',
  `event_room_identifier` varchar(255) DEFAULT '1',
  `top` int(11) DEFAULT '1',
  `left` int(11) DEFAULT '1',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_room_id`)
) ;

--
-- Dumping data for table `web_rsv_event_rooms`
--

/*!40000 ALTER TABLE `web_rsv_event_rooms` DISABLE KEYS */;
INSERT INTO `web_rsv_event_rooms` (`event_room_id`,`event_id`,`room_id`,`event_room_identifier`,`top`,`left`,`status`) VALUES 
 (70,60,14,'1',1,1,NULL),
 (103,63,15,'1',1,1,NULL),
 (74,64,16,'1',1,1,NULL),
 (75,65,17,'1',1,1,NULL),
 (76,66,15,'1',1,1,NULL),
 (77,66,16,'1',1,1,NULL),
 (78,66,17,'1',1,1,NULL),
 (79,66,14,'1',1,1,NULL),
 (108,77,20,'1',1,1,NULL),
 (106,75,19,'1',1,1,NULL),
 (104,73,21,'1',1,1,NULL),
 (97,66,18,'1',1,1,NULL),
 (96,71,18,'1',1,1,NULL);
/*!40000 ALTER TABLE `web_rsv_event_rooms` ENABLE KEYS */;


--
-- Definition of table `web_rsv_event_sessions`
--

DROP TABLE IF EXISTS `web_rsv_event_sessions`;
CREATE TABLE `web_rsv_event_sessions` (
  `event_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `session_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_session_id`)
) ;

--
-- Dumping data for table `web_rsv_event_sessions`
--

/*!40000 ALTER TABLE `web_rsv_event_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_rsv_event_sessions` ENABLE KEYS */;


--
-- Definition of table `web_rsv_room_components`
--

DROP TABLE IF EXISTS `web_rsv_room_components`;
CREATE TABLE `web_rsv_room_components` (
  `room_component_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT '1',
  `component_id` int(11) DEFAULT '1',
  `component_category_id` int(11) DEFAULT '1',
  `identifier` varchar(255) DEFAULT '1',
  `section` varchar(255) DEFAULT '1',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `top` int(11) DEFAULT '1',
  `left` int(11) DEFAULT '1',
  `height` int(11) DEFAULT '1',
  `width` int(11) DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`room_component_id`)
) ;

--
-- Dumping data for table `web_rsv_room_components`
--

/*!40000 ALTER TABLE `web_rsv_room_components` DISABLE KEYS */;
INSERT INTO `web_rsv_room_components` (`room_component_id`,`room_id`,`component_id`,`component_category_id`,`identifier`,`section`,`price`,`top`,`left`,`height`,`width`,`created_by`,`created_on`,`status`) VALUES 
 (5399,14,27,1,'1','D','0.00',110,40,15,15,NULL,'2013-12-04 14:56:42',NULL),
 (5400,14,27,1,'2','D','0.00',100,50,15,15,NULL,'2013-12-04 14:56:45',NULL),
 (5401,14,27,1,'3','D','0.00',120,50,15,15,NULL,'2013-12-04 14:56:45',NULL),
 (5402,14,27,1,'4','D','0.00',110,60,15,15,NULL,'2013-12-04 14:56:49',NULL),
 (5403,14,24,1,'5','D','0.00',150,90,20,20,NULL,'2013-12-04 14:57:12',NULL),
 (5404,14,24,1,'6','D','0.00',150,110,20,20,NULL,'2013-12-04 14:57:13',NULL),
 (5405,14,24,1,'7','D','0.00',150,130,20,20,NULL,'2013-12-04 14:57:13',NULL),
 (5406,14,24,1,'8','D','0.00',150,150,20,20,NULL,'2013-12-04 14:57:13',NULL),
 (5407,14,24,1,'11','D','0.00',150,210,20,20,NULL,'2013-12-04 14:57:14',NULL),
 (5408,14,24,1,'12','D','0.00',170,90,20,20,NULL,'2013-12-04 14:57:14',NULL),
 (5409,14,24,1,'18','D','0.00',170,210,20,20,NULL,'2013-12-04 14:57:14',NULL),
 (5410,14,24,1,'17','D','0.00',170,190,20,20,NULL,'2013-12-04 14:57:38',NULL),
 (5411,14,24,1,'15','D','0.00',170,150,20,20,NULL,'2013-12-04 14:57:38',NULL),
 (5412,14,24,1,'16','D','0.00',170,170,20,20,NULL,'2013-12-04 14:57:39',NULL),
 (5413,14,24,1,'13','D','0.00',170,110,20,20,NULL,'2013-12-04 14:58:16',NULL),
 (5414,14,24,1,'14','D','0.00',170,130,20,20,NULL,'2013-12-04 14:58:17',NULL),
 (5415,14,24,1,'9','D','0.00',150,170,20,20,NULL,'2013-12-04 14:58:17',NULL),
 (5416,14,24,1,'10','D','0.00',150,190,20,20,NULL,'2013-12-04 14:58:18',NULL),
 (5422,14,24,1,'24','D','0.00',150,360,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5421,14,24,1,'21','D','0.00',150,300,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5420,14,24,1,'19','D','0.00',150,260,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5423,14,24,1,'20','D','0.00',150,280,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5424,14,24,1,'22','D','0.00',150,320,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5425,14,24,1,'23','D','0.00',150,340,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5426,14,24,1,'25','D','0.00',150,380,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5427,14,24,1,'26','D','0.00',170,260,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5428,14,24,1,'27','D','0.00',170,280,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5429,14,24,1,'28','D','0.00',170,300,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5430,14,24,1,'29','D','0.00',170,320,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5431,14,24,1,'30','D','0.00',170,340,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5432,14,24,1,'31','D','0.00',170,360,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5433,14,24,1,'32','D','0.00',170,380,20,20,NULL,'2013-12-04 15:00:06',NULL),
 (5434,14,27,1,'34','D','0.00',100,430,15,15,NULL,'2013-12-04 15:00:24',NULL),
 (5435,14,27,1,'35','D','0.00',120,430,15,15,NULL,'2013-12-04 15:00:24',NULL),
 (5436,14,27,1,'36','D','0.00',110,440,15,15,NULL,'2013-12-04 15:00:24',NULL),
 (5437,14,27,1,'33','D','0.00',110,420,15,15,NULL,'2013-12-04 15:00:24',NULL),
 (5438,14,19,1,'38','D','0.00',210,50,15,15,NULL,'2013-12-04 15:00:40',NULL),
 (5439,14,19,1,'69','D','0.00',220,420,15,15,NULL,'2013-12-04 15:00:40',NULL),
 (5440,14,19,1,'70','D','0.00',210,430,15,15,NULL,'2013-12-04 15:00:40',NULL),
 (5994,18,32,1,'12','E','0.00',270,50,30,30,NULL,'2013-12-05 09:42:57',NULL),
 (5995,18,32,1,'11','E','0.00',290,30,30,30,NULL,'2013-12-05 09:42:58',NULL),
 (5443,14,19,1,'37','D','0.00',220,40,15,15,NULL,'2013-12-04 15:00:40',NULL),
 (5444,14,19,1,'39','D','0.00',230,50,15,15,NULL,'2013-12-04 15:00:40',NULL),
 (5445,14,19,1,'71','D','0.00',230,430,15,15,NULL,'2013-12-04 15:00:40',NULL),
 (5446,14,16,1,'41','D','0.00',260,90,20,20,NULL,'2013-12-04 15:00:40',NULL),
 (5447,14,16,1,'42','D','0.00',260,110,20,20,NULL,'2013-12-04 15:00:40',NULL),
 (5448,14,16,1,'43','D','0.00',260,130,20,20,NULL,'2013-12-04 15:00:40',NULL),
 (5449,14,16,1,'44','D','0.00',260,150,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5450,14,20,1,'45','D','0.00',260,170,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5451,14,20,1,'46','D','0.00',260,190,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5452,14,16,1,'47','D','0.00',260,210,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5453,14,16,1,'55','D','0.00',260,260,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5454,14,16,1,'56','D','0.00',260,280,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5455,14,16,1,'57','D','0.00',260,300,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5456,14,16,1,'58','D','0.00',260,320,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5457,14,20,1,'59','D','0.00',260,340,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5458,14,20,1,'60','D','0.00',260,360,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5459,14,16,1,'61','D','0.00',260,380,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5460,14,16,1,'48','D','0.00',280,90,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5461,14,20,1,'49','D','0.00',280,110,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5462,14,20,1,'50','D','0.00',280,130,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5463,14,16,1,'51','D','0.00',280,150,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5464,14,16,1,'52','D','0.00',280,170,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5465,14,16,1,'53','D','0.00',280,190,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5466,14,16,1,'54','D','0.00',280,210,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5467,14,16,1,'62','D','0.00',280,260,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5468,14,20,1,'63','D','0.00',280,280,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5469,14,20,1,'64','D','0.00',280,300,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5470,14,16,1,'65','D','0.00',280,320,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5471,14,16,1,'66','D','0.00',280,340,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5472,14,16,1,'67','D','0.00',280,360,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5473,14,16,1,'68','D','0.00',280,380,20,20,NULL,'2013-12-04 15:00:41',NULL),
 (5942,18,30,1,'29','E','0.00',190,390,30,30,NULL,'2013-12-05 09:35:10',NULL),
 (5941,18,28,1,'28','E','0.00',160,390,30,30,NULL,'2013-12-05 09:35:10',NULL),
 (5938,18,29,1,'9','E','0.00',200,210,30,30,NULL,'2013-12-05 09:34:52',NULL),
 (5939,18,29,1,'10','E','0.00',200,240,30,30,NULL,'2013-12-05 09:34:52',NULL),
 (5940,18,30,1,'23','E','0.00',160,360,30,30,NULL,'2013-12-05 09:35:10',NULL),
 (5937,18,29,1,'8','E','0.00',200,180,30,30,NULL,'2013-12-05 09:34:52',NULL),
 (5482,14,16,1,'72','D','0.00',370,90,20,20,NULL,'2013-12-04 15:01:11',NULL),
 (5483,14,16,1,'73','D','0.00',370,110,20,20,NULL,'2013-12-04 15:01:11',NULL),
 (5484,14,16,1,'74','D','0.00',370,130,20,20,NULL,'2013-12-04 15:01:11',NULL),
 (5485,14,16,1,'75','D','0.00',370,150,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5486,14,20,1,'76','D','0.00',370,170,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5487,14,20,1,'77','D','0.00',370,190,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5488,14,16,1,'78','D','0.00',370,210,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5489,14,16,1,'86','D','0.00',370,260,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5490,14,16,1,'87','D','0.00',370,280,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5491,14,16,1,'88','D','0.00',370,300,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5492,14,16,1,'89','D','0.00',370,320,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5493,14,20,1,'90','D','0.00',370,340,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5494,14,20,1,'91','D','0.00',370,360,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5495,14,16,1,'92','D','0.00',370,380,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5496,14,16,1,'79','D','0.00',390,90,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5497,14,20,1,'80','D','0.00',390,110,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5498,14,20,1,'81','D','0.00',390,130,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5499,14,16,1,'82','D','0.00',390,150,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5500,14,16,1,'83','D','0.00',390,170,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5501,14,16,1,'84','D','0.00',390,190,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5502,14,16,1,'85','D','0.00',390,210,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5503,14,16,1,'93','D','0.00',390,260,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5504,14,20,1,'94','D','0.00',390,280,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5505,14,20,1,'95','D','0.00',390,300,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5506,14,16,1,'96','D','0.00',390,320,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5507,14,16,1,'97','D','0.00',390,340,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5508,14,16,1,'98','D','0.00',390,360,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5509,14,16,1,'99','D','0.00',390,380,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5935,18,29,1,'6','E','0.00',200,120,30,30,NULL,'2013-12-05 09:34:52',NULL),
 (5936,18,29,1,'7','E','0.00',200,150,30,30,NULL,'2013-12-05 09:34:52',NULL),
 (5934,18,29,1,'5','E','0.00',170,240,30,30,NULL,'2013-12-05 09:34:36',NULL),
 (5932,18,29,1,'3','E','0.00',170,180,30,30,NULL,'2013-12-05 09:34:35',NULL),
 (5933,18,29,1,'4','E','0.00',170,210,30,30,NULL,'2013-12-05 09:34:36',NULL),
 (5930,18,29,1,'2','E','0.00',170,150,30,30,NULL,'2013-12-05 09:34:35',NULL),
 (5931,18,29,1,'1','E','0.00',170,120,30,30,NULL,'2013-12-05 09:34:35',NULL),
 (5518,14,16,1,'100','D','0.00',480,90,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5519,14,16,1,'101','D','0.00',480,110,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5520,14,16,1,'102','D','0.00',480,130,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5521,14,16,1,'103','D','0.00',480,150,20,20,NULL,'2013-12-04 15:01:12',NULL),
 (5522,14,20,1,'104','D','0.00',480,170,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5523,14,20,1,'105','D','0.00',480,190,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5524,14,16,1,'106','D','0.00',480,210,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5525,14,16,1,'114','D','0.00',480,260,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5526,14,16,1,'115','D','0.00',480,280,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5527,14,16,1,'116','D','0.00',480,300,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5528,14,16,1,'117','D','0.00',480,320,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5529,14,20,1,'118','D','0.00',480,340,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5530,14,20,1,'119','D','0.00',480,360,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5531,14,16,1,'120','D','0.00',480,380,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5532,14,16,1,'107','D','0.00',500,90,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5533,14,20,1,'108','D','0.00',500,110,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5534,14,20,1,'109','D','0.00',500,130,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5535,14,16,1,'110','D','0.00',500,150,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5536,14,16,1,'111','D','0.00',500,170,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5537,14,16,1,'112','D','0.00',500,190,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5538,14,16,1,'113','D','0.00',500,210,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5539,14,16,1,'121','D','0.00',500,260,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5540,14,20,1,'122','D','0.00',500,280,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5541,14,20,1,'123','D','0.00',500,300,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5542,14,16,1,'124','D','0.00',500,320,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5543,14,16,1,'125','D','0.00',500,340,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5544,14,16,1,'126','D','0.00',500,360,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5545,14,16,1,'127','D','0.00',500,380,20,20,NULL,'2013-12-04 15:01:13',NULL),
 (5546,15,17,1,'1','A','0.00',140,40,20,30,NULL,'2013-12-04 16:44:09',NULL),
 (5547,15,17,1,'2','A','0.00',160,40,20,30,NULL,'2013-12-04 16:44:11',NULL),
 (5548,15,17,1,'3','A','0.00',180,40,20,30,NULL,'2013-12-04 16:44:11',NULL),
 (5549,15,17,1,'4','A','0.00',200,40,20,30,NULL,'2013-12-04 16:44:11',NULL),
 (5550,15,17,1,'5','A','0.00',220,40,20,30,NULL,'2013-12-04 16:44:12',NULL),
 (5554,15,17,1,'8','A','0.00',180,70,20,30,NULL,'2013-12-04 16:47:11',NULL),
 (5553,15,17,1,'6','A','0.00',140,70,20,30,NULL,'2013-12-04 16:47:11',NULL),
 (5555,15,17,1,'7','A','0.00',160,70,20,30,NULL,'2013-12-04 16:47:11',NULL),
 (5556,15,17,1,'9','A','0.00',200,70,20,30,NULL,'2013-12-04 16:47:11',NULL),
 (5557,15,17,1,'10','A','0.00',220,70,20,30,NULL,'2013-12-04 16:47:11',NULL),
 (5601,15,17,1,'29','A','0.00',200,310,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5602,15,17,1,'34','A','0.00',200,390,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5603,15,17,1,'39','A','0.00',200,420,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5600,15,17,1,'24','A','0.00',200,280,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5588,15,17,1,'21','A','0.00',140,280,20,30,NULL,'2013-12-04 16:48:33',NULL),
 (5589,15,17,1,'26','A','0.00',140,310,20,30,NULL,'2013-12-04 16:48:33',NULL),
 (5590,15,17,1,'31','A','0.00',140,390,20,30,NULL,'2013-12-04 16:48:33',NULL),
 (5591,15,17,1,'36','A','0.00',140,420,20,30,NULL,'2013-12-04 16:48:33',NULL),
 (5592,15,17,1,'27','A','0.00',160,310,20,30,NULL,'2013-12-04 16:48:33',NULL),
 (5593,15,17,1,'22','A','0.00',160,280,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5594,15,17,1,'32','A','0.00',160,390,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5595,15,17,1,'37','A','0.00',160,420,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5596,15,21,1,'23','A','0.00',180,280,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5597,15,21,1,'28','A','0.00',180,310,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5598,15,17,1,'33','A','0.00',180,390,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5599,15,17,1,'38','A','0.00',180,420,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5578,15,17,1,'17','A','0.00',160,180,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5579,15,17,1,'16','A','0.00',140,180,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5580,15,17,1,'11','A','0.00',140,150,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5581,15,21,1,'18','A','0.00',180,180,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5582,15,17,1,'12','A','0.00',160,150,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5583,15,21,1,'13','A','0.00',180,150,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5584,15,17,1,'14','A','0.00',200,150,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5585,15,17,1,'19','A','0.00',200,180,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5586,15,17,1,'15','A','0.00',220,150,20,30,NULL,'2013-12-04 16:47:28',NULL),
 (5587,15,17,1,'20','A','0.00',220,180,20,30,NULL,'2013-12-04 16:47:29',NULL),
 (5604,15,17,1,'25','A','0.00',220,280,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5605,15,17,1,'30','A','0.00',220,310,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5606,15,17,1,'35','A','0.00',220,390,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5607,15,17,1,'40','A','0.00',220,420,20,30,NULL,'2013-12-04 16:48:34',NULL),
 (5608,15,17,1,'46','A','0.00',290,70,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5609,15,17,1,'51','A','0.00',290,150,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5610,15,17,1,'41','A','0.00',290,40,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5611,15,17,1,'56','A','0.00',290,180,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5612,15,17,1,'42','A','0.00',310,40,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5613,15,17,1,'47','A','0.00',310,70,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5614,15,17,1,'52','A','0.00',310,150,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5615,15,17,1,'57','A','0.00',310,180,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5616,15,21,1,'43','A','0.00',330,40,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5617,15,21,1,'48','A','0.00',330,70,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5618,15,21,1,'53','A','0.00',330,150,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5619,15,21,1,'58','A','0.00',330,180,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5620,15,17,1,'44','A','0.00',350,40,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5621,15,17,1,'49','A','0.00',350,70,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5622,15,21,1,'54','A','0.00',350,150,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5623,15,21,1,'59','A','0.00',350,180,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5624,15,17,1,'45','A','0.00',370,40,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5625,15,17,1,'50','A','0.00',370,70,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5626,15,17,1,'55','A','0.00',370,150,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5627,15,17,1,'60','A','0.00',370,180,20,30,NULL,'2013-12-04 16:48:43',NULL),
 (5628,15,17,1,'66','A','0.00',290,310,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5629,15,17,1,'76','A','0.00',290,420,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5630,15,17,1,'71','A','0.00',290,390,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5631,15,17,1,'61','A','0.00',290,280,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5632,15,17,1,'62','A','0.00',310,280,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5633,15,17,1,'67','A','0.00',310,310,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5634,15,17,1,'72','A','0.00',310,390,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5635,15,17,1,'77','A','0.00',310,420,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5636,15,21,1,'63','A','0.00',330,280,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5637,15,21,1,'68','A','0.00',330,310,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5638,15,21,1,'73','A','0.00',330,390,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5639,15,21,1,'78','A','0.00',330,420,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5640,15,21,1,'64','A','0.00',350,280,20,30,NULL,'2013-12-04 16:48:50',NULL),
 (5641,15,21,1,'69','A','0.00',350,310,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5642,15,17,1,'74','A','0.00',350,390,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5643,15,17,1,'79','A','0.00',350,420,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5644,15,17,1,'65','A','0.00',370,280,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5645,15,17,1,'70','A','0.00',370,310,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5646,15,17,1,'75','A','0.00',370,390,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5647,15,17,1,'80','A','0.00',370,420,20,30,NULL,'2013-12-04 16:48:51',NULL),
 (5648,15,17,1,'81','A','0.00',450,40,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5649,15,17,1,'86','A','0.00',450,70,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5650,15,17,1,'91','A','0.00',450,150,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5651,15,17,1,'87','A','0.00',470,70,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5652,15,17,1,'82','A','0.00',470,40,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5653,15,17,1,'96','A','0.00',450,180,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5654,15,17,1,'92','A','0.00',470,150,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5655,15,17,1,'97','A','0.00',470,180,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5656,15,17,1,'83','A','0.00',490,40,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5657,15,17,1,'88','A','0.00',490,70,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5658,15,21,1,'93','A','0.00',490,150,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5659,15,21,1,'98','A','0.00',490,180,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5660,15,17,1,'84','A','0.00',510,40,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5661,15,17,1,'89','A','0.00',510,70,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5662,15,17,1,'94','A','0.00',510,150,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5663,15,17,1,'99','A','0.00',510,180,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5664,15,17,1,'85','A','0.00',530,40,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5665,15,17,1,'90','A','0.00',530,70,20,30,NULL,'2013-12-04 16:49:24',NULL),
 (5666,15,17,1,'95','A','0.00',530,150,20,30,NULL,'2013-12-04 16:49:25',NULL),
 (5667,15,17,1,'100','A','0.00',530,180,20,30,NULL,'2013-12-04 16:49:25',NULL),
 (5668,15,17,1,'106','A','0.00',450,310,20,30,NULL,'2013-12-04 16:55:53',NULL),
 (5669,15,17,1,'101','A','0.00',450,280,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5670,15,17,1,'102','A','0.00',470,280,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5671,15,17,1,'107','A','0.00',470,310,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5672,15,21,1,'103','A','0.00',490,280,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5673,15,21,1,'108','A','0.00',490,310,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5674,15,17,1,'104','A','0.00',510,280,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5675,15,17,1,'109','A','0.00',510,310,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5676,15,17,1,'105','A','0.00',530,280,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5677,15,17,1,'110','A','0.00',530,310,20,30,NULL,'2013-12-04 16:55:54',NULL),
 (5678,15,17,1,'111','A','0.00',450,390,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5679,15,17,1,'116','A','0.00',450,420,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5680,15,17,1,'113','A','0.00',490,390,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5681,15,17,1,'118','A','0.00',490,420,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5682,15,17,1,'112','A','0.00',470,390,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5683,15,17,1,'117','A','0.00',470,420,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5684,15,17,1,'114','A','0.00',510,390,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5685,15,17,1,'119','A','0.00',510,420,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5686,15,17,1,'115','A','0.00',530,390,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5687,15,17,1,'120','A','0.00',530,420,20,30,NULL,'2013-12-04 16:56:36',NULL),
 (5688,16,18,1,'1','B','0.00',170,40,30,20,NULL,'2013-12-04 17:02:09',NULL),
 (5689,16,18,1,'6','B','0.00',200,40,30,20,NULL,'2013-12-04 17:02:13',NULL),
 (5690,16,22,1,'2','B','0.00',170,60,30,20,NULL,'2013-12-04 17:02:27',NULL),
 (5691,16,18,1,'7','B','0.00',200,60,30,20,NULL,'2013-12-04 17:02:27',NULL),
 (5692,16,22,1,'3','B','0.00',170,80,30,20,NULL,'2013-12-04 17:02:33',NULL),
 (5693,16,18,1,'8','B','0.00',200,80,30,20,NULL,'2013-12-04 17:02:33',NULL),
 (5694,16,18,1,'9','B','0.00',200,100,30,20,NULL,'2013-12-04 17:02:38',NULL),
 (5695,16,22,1,'4','B','0.00',170,100,30,20,NULL,'2013-12-04 17:02:38',NULL),
 (5696,16,18,1,'5','B','0.00',170,120,30,20,NULL,'2013-12-04 17:02:52',NULL),
 (5697,16,18,1,'10','B','0.00',200,120,30,20,NULL,'2013-12-04 17:02:52',NULL),
 (5699,16,18,1,'11','B','0.00',170,180,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5700,16,18,1,'12','B','0.00',170,200,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5701,16,18,1,'13','B','0.00',170,220,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5702,16,18,1,'15','B','0.00',170,260,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5703,16,18,1,'14','B','0.00',170,240,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5704,16,18,1,'16','B','0.00',200,180,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5705,16,18,1,'17','B','0.00',200,200,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5706,16,18,1,'18','B','0.00',200,220,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5707,16,18,1,'19','B','0.00',200,240,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5708,16,18,1,'20','B','0.00',200,260,30,20,NULL,'2013-12-04 17:05:06',NULL),
 (5709,16,18,1,'21','B','0.00',170,320,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5710,16,22,1,'22','B','0.00',170,340,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5711,16,22,1,'23','B','0.00',170,360,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5712,16,18,1,'25','B','0.00',170,400,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5713,16,22,1,'24','B','0.00',170,380,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5714,16,18,1,'26','B','0.00',200,320,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5715,16,18,1,'27','B','0.00',200,340,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5716,16,18,1,'28','B','0.00',200,360,30,20,NULL,'2013-12-04 17:05:14',NULL),
 (5717,16,18,1,'29','B','0.00',200,380,30,20,NULL,'2013-12-04 17:05:15',NULL),
 (5718,16,18,1,'30','B','0.00',200,400,30,20,NULL,'2013-12-04 17:05:15',NULL),
 (5719,16,18,1,'31','B','0.00',270,40,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5720,16,18,1,'32','B','0.00',270,60,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5721,16,18,1,'34','B','0.00',270,100,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5722,16,18,1,'35','B','0.00',270,120,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5723,16,18,1,'41','B','0.00',270,180,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5724,16,18,1,'33','B','0.00',270,80,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5725,16,22,1,'42','B','0.00',270,200,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5726,16,22,1,'43','B','0.00',270,220,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5727,16,22,1,'44','B','0.00',270,240,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5728,16,18,1,'45','B','0.00',270,260,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5729,16,18,1,'51','B','0.00',270,320,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5730,16,18,1,'52','B','0.00',270,340,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5731,16,18,1,'53','B','0.00',270,360,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5732,16,18,1,'54','B','0.00',270,380,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5733,16,18,1,'55','B','0.00',270,400,30,20,NULL,'2013-12-04 17:05:42',NULL),
 (5734,16,18,1,'36','B','0.00',300,40,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5735,16,18,1,'37','B','0.00',300,60,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5736,16,18,1,'38','B','0.00',300,80,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5737,16,18,1,'39','B','0.00',300,100,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5738,16,18,1,'40','B','0.00',300,120,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5739,16,18,1,'46','B','0.00',300,180,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5740,16,22,1,'47','B','0.00',300,200,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5741,16,22,1,'48','B','0.00',300,220,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5742,16,22,1,'49','B','0.00',300,240,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5743,16,18,1,'50','B','0.00',300,260,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5744,16,18,1,'56','B','0.00',300,320,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5745,16,18,1,'57','B','0.00',300,340,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5746,16,18,1,'58','B','0.00',300,360,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5747,16,18,1,'59','B','0.00',300,380,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5748,16,18,1,'60','B','0.00',300,400,30,20,NULL,'2013-12-04 17:05:43',NULL),
 (5749,16,18,1,'61','B','0.00',390,40,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5750,16,18,1,'62','B','0.00',390,60,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5751,16,18,1,'63','B','0.00',390,80,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5752,16,18,1,'64','B','0.00',390,100,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5753,16,18,1,'65','B','0.00',390,120,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5754,16,18,1,'71','B','0.00',390,180,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5755,16,22,1,'72','B','0.00',390,200,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5756,16,22,1,'73','B','0.00',390,220,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5757,16,22,1,'74','B','0.00',390,240,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5758,16,18,1,'75','B','0.00',390,260,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5759,16,18,1,'81','B','0.00',390,320,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5760,16,18,1,'82','B','0.00',390,340,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5761,16,18,1,'83','B','0.00',390,360,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5762,16,18,1,'84','B','0.00',390,380,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5763,16,18,1,'85','B','0.00',390,400,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5764,16,18,1,'66','B','0.00',420,40,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5765,16,18,1,'67','B','0.00',420,60,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5766,16,18,1,'68','B','0.00',420,80,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5767,16,18,1,'69','B','0.00',420,100,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5768,16,18,1,'70','B','0.00',420,120,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5769,16,18,1,'76','B','0.00',420,180,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5770,16,22,1,'77','B','0.00',420,200,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5771,16,22,1,'78','B','0.00',420,220,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5772,16,22,1,'79','B','0.00',420,240,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5773,16,18,1,'80','B','0.00',420,260,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5774,16,18,1,'86','B','0.00',420,320,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5775,16,18,1,'87','B','0.00',420,340,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5776,16,18,1,'88','B','0.00',420,360,30,20,NULL,'2013-12-04 17:06:07',NULL),
 (5777,16,18,1,'89','B','0.00',420,380,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5778,16,18,1,'90','B','0.00',420,400,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5779,16,18,1,'91','B','0.00',490,40,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5780,16,18,1,'92','B','0.00',490,60,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5781,16,18,1,'93','B','0.00',490,80,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5782,16,18,1,'94','B','0.00',490,100,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5783,16,18,1,'95','B','0.00',490,120,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5784,16,18,1,'101','B','0.00',490,180,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5785,16,18,1,'102','B','0.00',490,200,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5786,16,18,1,'103','B','0.00',490,220,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5787,16,18,1,'104','B','0.00',490,240,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5788,16,18,1,'105','B','0.00',490,260,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5789,16,18,1,'111','B','0.00',490,320,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5790,16,18,1,'112','B','0.00',490,340,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5791,16,18,1,'113','B','0.00',490,360,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5792,16,18,1,'114','B','0.00',490,380,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5793,16,18,1,'115','B','0.00',490,400,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5794,16,18,1,'96','B','0.00',520,40,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5795,16,22,1,'97','B','0.00',520,60,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5796,16,22,1,'98','B','0.00',520,80,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5797,16,22,1,'99','B','0.00',520,100,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5798,16,18,1,'100','B','0.00',520,120,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5799,16,18,1,'106','B','0.00',520,180,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5800,16,18,1,'107','B','0.00',520,200,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5801,16,18,1,'108','B','0.00',520,220,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5802,16,18,1,'109','B','0.00',520,240,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5803,16,18,1,'110','B','0.00',520,260,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5804,16,18,1,'116','B','0.00',520,320,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5805,16,22,1,'117','B','0.00',520,340,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5806,16,22,1,'118','B','0.00',520,360,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5807,16,22,1,'119','B','0.00',520,380,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5808,16,18,1,'120','B','0.00',520,400,30,20,NULL,'2013-12-04 17:06:08',NULL),
 (5809,17,25,1,'9','C','0.00',120,150,20,30,NULL,'2013-12-04 17:09:17',NULL),
 (5810,17,26,1,'1','C','0.00',120,50,30,20,NULL,'2013-12-04 17:09:18',NULL),
 (5811,17,26,1,'7','C','0.00',180,70,30,20,NULL,'2013-12-04 17:09:28',NULL),
 (5812,17,26,1,'2','C','0.00',150,50,30,20,NULL,'2013-12-04 17:09:29',NULL),
 (5813,17,26,1,'6','C','0.00',150,70,30,20,NULL,'2013-12-04 17:09:29',NULL),
 (5814,17,26,1,'5','C','0.00',120,70,30,20,NULL,'2013-12-04 17:09:29',NULL),
 (5815,17,26,1,'3','C','0.00',180,50,30,20,NULL,'2013-12-04 17:09:36',NULL),
 (5816,17,25,1,'10','C','0.00',120,180,20,30,NULL,'2013-12-04 17:09:41',NULL),
 (5817,17,25,1,'11','C','0.00',120,210,20,30,NULL,'2013-12-04 17:09:41',NULL),
 (5818,17,25,1,'12','C','0.00',120,240,20,30,NULL,'2013-12-04 17:09:42',NULL),
 (5819,17,25,1,'15','C','0.00',140,150,20,30,NULL,'2013-12-04 17:09:42',NULL),
 (5820,17,25,1,'16','C','0.00',140,180,20,30,NULL,'2013-12-04 17:09:42',NULL),
 (5821,17,25,1,'17','C','0.00',140,210,20,30,NULL,'2013-12-04 17:09:52',NULL),
 (5822,17,25,1,'18','C','0.00',140,240,20,30,NULL,'2013-12-04 17:09:53',NULL),
 (5823,17,25,1,'13','C','0.00',120,270,20,30,NULL,'2013-12-04 17:10:05',NULL),
 (5824,17,25,1,'19','C','0.00',140,270,20,30,NULL,'2013-12-04 17:10:06',NULL),
 (5825,17,25,1,'14','C','0.00',120,300,20,30,NULL,'2013-12-04 17:10:06',NULL),
 (5826,17,25,1,'20','C','0.00',140,300,20,30,NULL,'2013-12-04 17:10:06',NULL),
 (5828,17,26,1,'33','C','0.00',120,390,30,20,NULL,'2013-12-04 17:10:19',NULL),
 (5829,17,26,1,'37','C','0.00',120,410,30,20,NULL,'2013-12-04 17:10:19',NULL),
 (5830,17,26,1,'34','C','0.00',150,390,30,20,NULL,'2013-12-04 17:10:19',NULL),
 (5831,17,26,1,'38','C','0.00',150,410,30,20,NULL,'2013-12-04 17:10:19',NULL),
 (5832,17,26,1,'35','C','0.00',180,390,30,20,NULL,'2013-12-04 17:10:20',NULL),
 (5833,17,26,1,'39','C','0.00',180,410,30,20,NULL,'2013-12-04 17:10:20',NULL),
 (5834,17,25,1,'21','C','0.00',200,150,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5835,17,25,1,'22','C','0.00',200,180,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5836,17,25,1,'23','C','0.00',200,210,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5837,17,25,1,'26','C','0.00',200,300,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5838,17,25,1,'24','C','0.00',200,240,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5839,17,25,1,'27','C','0.00',220,150,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5840,17,25,1,'25','C','0.00',200,270,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5841,17,25,1,'28','C','0.00',220,180,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5842,17,25,1,'29','C','0.00',220,210,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5843,17,25,1,'30','C','0.00',220,240,20,30,NULL,'2013-12-04 17:10:52',NULL),
 (5844,17,25,1,'31','C','0.00',220,270,20,30,NULL,'2013-12-04 17:10:53',NULL),
 (5845,17,25,1,'32','C','0.00',220,300,20,30,NULL,'2013-12-04 17:10:53',NULL),
 (5846,17,26,1,'4','C','0.00',210,50,30,20,NULL,'2013-12-04 17:11:13',NULL),
 (5847,17,26,1,'8','C','0.00',210,70,30,20,NULL,'2013-12-04 17:11:13',NULL),
 (5848,17,26,1,'36','C','0.00',210,390,30,20,NULL,'2013-12-04 17:11:17',NULL),
 (5849,17,26,1,'40','C','0.00',210,410,30,20,NULL,'2013-12-04 17:11:17',NULL),
 (5850,17,22,1,'41','C','0.00',290,50,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5851,17,18,1,'45','C','0.00',290,70,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5852,17,17,1,'49','C','0.00',290,150,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5853,17,17,1,'50','C','0.00',290,180,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5854,17,21,1,'51','C','0.00',290,210,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5855,17,21,1,'52','C','0.00',290,240,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5856,17,17,1,'53','C','0.00',290,270,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5857,17,17,1,'54','C','0.00',290,300,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5858,17,18,1,'73','C','0.00',290,390,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5859,17,22,1,'77','C','0.00',290,410,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5860,17,17,1,'55','C','0.00',310,150,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5861,17,17,1,'56','C','0.00',310,180,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5862,17,21,1,'57','C','0.00',310,210,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5863,17,21,1,'58','C','0.00',310,240,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5864,17,17,1,'59','C','0.00',310,270,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5865,17,17,1,'60','C','0.00',310,300,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5866,17,22,1,'42','C','0.00',320,50,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5867,17,18,1,'46','C','0.00',320,70,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5868,17,18,1,'74','C','0.00',320,390,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5869,17,22,1,'78','C','0.00',320,410,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5870,17,22,1,'43','C','0.00',350,50,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5871,17,18,1,'47','C','0.00',350,70,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5872,17,18,1,'75','C','0.00',350,390,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5873,17,22,1,'79','C','0.00',350,410,30,20,NULL,'2013-12-04 17:11:54',NULL),
 (5874,17,17,1,'61','C','0.00',370,150,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5875,17,17,1,'62','C','0.00',370,180,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5876,17,21,1,'63','C','0.00',370,210,20,30,NULL,'2013-12-04 17:11:54',NULL),
 (5877,17,21,1,'64','C','0.00',370,240,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5878,17,17,1,'65','C','0.00',370,270,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5879,17,17,1,'66','C','0.00',370,300,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5880,17,22,1,'44','C','0.00',380,50,30,20,NULL,'2013-12-04 17:11:55',NULL),
 (5881,17,18,1,'48','C','0.00',380,70,30,20,NULL,'2013-12-04 17:11:55',NULL),
 (5882,17,18,1,'76','C','0.00',380,390,30,20,NULL,'2013-12-04 17:11:55',NULL),
 (5883,17,17,1,'67','C','0.00',390,150,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5884,17,17,1,'68','C','0.00',390,180,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5885,17,21,1,'69','C','0.00',390,210,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5886,17,21,1,'70','C','0.00',390,240,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5887,17,17,1,'71','C','0.00',390,270,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5888,17,17,1,'72','C','0.00',390,300,20,30,NULL,'2013-12-04 17:11:55',NULL),
 (5889,17,22,1,'80','C','0.00',380,410,30,20,NULL,'2013-12-04 17:11:55',NULL),
 (5890,17,22,1,'81','C','0.00',460,50,30,20,NULL,'2013-12-04 17:12:06',NULL),
 (5891,17,17,1,'90','C','0.00',460,180,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5892,17,21,1,'91','C','0.00',460,210,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5893,17,18,1,'85','C','0.00',460,70,30,20,NULL,'2013-12-04 17:12:06',NULL),
 (5894,17,17,1,'89','C','0.00',460,150,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5895,17,21,1,'92','C','0.00',460,240,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5896,17,17,1,'93','C','0.00',460,270,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5897,17,17,1,'94','C','0.00',460,300,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5898,17,18,1,'113','C','0.00',460,390,30,20,NULL,'2013-12-04 17:12:06',NULL),
 (5899,17,22,1,'117','C','0.00',460,410,30,20,NULL,'2013-12-04 17:12:06',NULL),
 (5900,17,17,1,'95','C','0.00',480,150,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5901,17,17,1,'96','C','0.00',480,180,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5902,17,21,1,'97','C','0.00',480,210,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5903,17,21,1,'98','C','0.00',480,240,20,30,NULL,'2013-12-04 17:12:06',NULL),
 (5904,17,17,1,'99','C','0.00',480,270,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5905,17,17,1,'100','C','0.00',480,300,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5906,17,22,1,'82','C','0.00',490,50,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5907,17,18,1,'86','C','0.00',490,70,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5908,17,18,1,'114','C','0.00',490,390,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5909,17,22,1,'118','C','0.00',490,410,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5910,17,22,1,'83','C','0.00',520,50,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5911,17,18,1,'87','C','0.00',520,70,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5912,17,18,1,'115','C','0.00',520,390,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5913,17,22,1,'119','C','0.00',520,410,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5914,17,17,1,'101','C','0.00',540,150,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5915,17,17,1,'102','C','0.00',540,180,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5916,17,21,1,'103','C','0.00',540,210,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5917,17,21,1,'104','C','0.00',540,240,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5918,17,17,1,'105','C','0.00',540,270,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5919,17,17,1,'106','C','0.00',540,300,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5920,17,22,1,'84','C','0.00',550,50,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5921,17,18,1,'88','C','0.00',550,70,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5922,17,18,1,'116','C','0.00',550,390,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5923,17,17,1,'107','C','0.00',560,150,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5924,17,17,1,'108','C','0.00',560,180,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5925,17,21,1,'109','C','0.00',560,210,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5926,17,21,1,'110','C','0.00',560,240,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5927,17,17,1,'111','C','0.00',560,270,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5928,17,17,1,'112','C','0.00',560,300,20,30,NULL,'2013-12-04 17:12:07',NULL),
 (5929,17,22,1,'120','C','0.00',550,410,30,20,NULL,'2013-12-04 17:12:07',NULL),
 (5943,18,28,1,'30','E','0.00',220,390,30,30,NULL,'2013-12-05 09:35:10',NULL),
 (5944,18,30,1,'31','E','0.00',250,390,30,30,NULL,'2013-12-05 09:35:11',NULL),
 (5945,18,28,1,'32','E','0.00',280,390,30,30,NULL,'2013-12-05 09:35:11',NULL),
 (5946,18,28,1,'24','E','0.00',190,360,30,30,NULL,'2013-12-05 09:35:31',NULL),
 (5947,18,30,1,'27','E','0.00',280,360,30,30,NULL,'2013-12-05 09:35:31',NULL),
 (5948,18,30,1,'25','E','0.00',220,360,30,30,NULL,'2013-12-05 09:35:31',NULL),
 (5949,18,28,1,'26','E','0.00',250,360,30,30,NULL,'2013-12-05 09:35:32',NULL),
 (5950,18,28,1,'33','E','0.00',410,60,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5951,18,28,1,'34','E','0.00',440,60,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5952,18,28,1,'39','E','0.00',440,90,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5953,18,28,1,'35','E','0.00',470,60,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5954,18,28,1,'38','E','0.00',410,90,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5955,18,28,1,'40','E','0.00',470,90,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5956,18,28,1,'36','E','0.00',500,60,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5957,18,28,1,'41','E','0.00',500,90,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5958,18,28,1,'37','E','0.00',530,60,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5959,18,28,1,'42','E','0.00',530,90,30,30,NULL,'2013-12-05 09:36:35',NULL),
 (5960,18,30,1,'43','E','0.00',410,160,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5961,18,28,1,'50','E','0.00',470,190,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5962,18,28,1,'46','E','0.00',500,160,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5963,18,30,1,'49','E','0.00',440,190,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5964,18,30,1,'45','E','0.00',470,160,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5965,18,28,1,'44','E','0.00',440,160,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5966,18,28,1,'48','E','0.00',410,190,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5967,18,30,1,'51','E','0.00',500,190,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5968,18,30,1,'47','E','0.00',530,160,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5969,18,28,1,'52','E','0.00',530,190,30,30,NULL,'2013-12-05 09:36:47',NULL),
 (5970,18,28,1,'53','E','0.00',410,260,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5971,18,30,1,'60','E','0.00',470,290,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5972,18,28,1,'55','E','0.00',470,260,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5973,18,30,1,'54','E','0.00',440,260,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5974,18,30,1,'56','E','0.00',500,260,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5975,18,28,1,'59','E','0.00',440,290,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5976,18,30,1,'58','E','0.00',410,290,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5977,18,28,1,'61','E','0.00',500,290,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5978,18,28,1,'57','E','0.00',530,260,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5979,18,30,1,'62','E','0.00',530,290,30,30,NULL,'2013-12-05 09:36:59',NULL),
 (5980,18,28,1,'63','E','0.00',410,360,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5981,18,28,1,'70','E','0.00',470,390,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5982,18,28,1,'65','E','0.00',470,360,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5983,18,28,1,'64','E','0.00',440,360,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5984,18,28,1,'66','E','0.00',500,360,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5985,18,28,1,'69','E','0.00',440,390,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5986,18,28,1,'68','E','0.00',410,390,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5987,18,28,1,'71','E','0.00',500,390,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5988,18,28,1,'67','E','0.00',530,360,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5989,18,28,1,'72','E','0.00',530,390,30,30,NULL,'2013-12-05 09:37:07',NULL),
 (5996,18,32,1,'14','E','0.00',290,70,30,30,NULL,'2013-12-05 09:43:17',NULL),
 (5997,18,32,1,'13','E','0.00',310,50,30,30,NULL,'2013-12-05 09:43:18',NULL),
 (5998,18,33,1,'16','E','0.00',270,160,30,30,NULL,'2013-12-05 09:44:04',NULL),
 (5999,18,33,1,'17','E','0.00',310,160,30,30,NULL,'2013-12-05 09:44:05',NULL),
 (6000,18,31,1,'18','E','0.00',290,180,30,30,NULL,'2013-12-05 09:44:16',NULL),
 (6001,18,31,1,'15','E','0.00',290,140,30,30,NULL,'2013-12-05 09:44:16',NULL),
 (6002,18,33,1,'20','E','0.00',270,270,30,30,NULL,'2013-12-05 09:45:11',NULL),
 (6003,18,33,1,'21','E','0.00',310,270,30,30,NULL,'2013-12-05 09:45:11',NULL),
 (6004,18,31,1,'19','E','0.00',290,250,30,30,NULL,'2013-12-05 09:45:11',NULL),
 (6005,18,31,1,'22','E','0.00',290,290,30,30,NULL,'2013-12-05 09:45:11',NULL),
 (6006,14,23,1,'72','D','0.00',220,440,15,15,NULL,'2013-12-05 10:48:09',NULL),
 (6007,14,23,1,'40','D','0.00',220,60,15,15,NULL,'2013-12-05 10:48:10',NULL),
 (6008,19,17,1,'1','A','0.00',140,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6009,19,17,1,'2','A','0.00',160,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6010,19,17,1,'3','A','0.00',180,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6011,19,17,1,'4','A','0.00',200,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6012,19,17,1,'5','A','0.00',220,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6013,19,17,1,'8','A','0.00',180,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6014,19,17,1,'6','A','0.00',140,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6015,19,17,1,'7','A','0.00',160,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6016,19,17,1,'9','A','0.00',200,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6017,19,17,1,'10','A','0.00',220,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6018,19,17,1,'29','A','0.00',200,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6019,19,17,1,'34','A','0.00',200,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6020,19,17,1,'39','A','0.00',200,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6021,19,17,1,'24','A','0.00',200,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6022,19,17,1,'21','A','0.00',140,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6023,19,17,1,'26','A','0.00',140,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6024,19,17,1,'31','A','0.00',140,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6025,19,17,1,'36','A','0.00',140,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6026,19,17,1,'27','A','0.00',160,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6027,19,17,1,'22','A','0.00',160,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6028,19,17,1,'32','A','0.00',160,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6029,19,17,1,'37','A','0.00',160,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6030,19,21,1,'23','A','0.00',180,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6031,19,21,1,'28','A','0.00',180,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6032,19,17,1,'33','A','0.00',180,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6033,19,17,1,'38','A','0.00',180,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6034,19,17,1,'17','A','0.00',160,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6035,19,17,1,'16','A','0.00',140,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6036,19,17,1,'11','A','0.00',140,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6037,19,21,1,'18','A','0.00',180,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6038,19,17,1,'12','A','0.00',160,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6039,19,21,1,'13','A','0.00',180,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6040,19,17,1,'14','A','0.00',200,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6041,19,17,1,'19','A','0.00',200,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6042,19,17,1,'15','A','0.00',220,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6043,19,17,1,'20','A','0.00',220,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6044,19,17,1,'25','A','0.00',220,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6045,19,17,1,'30','A','0.00',220,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6046,19,17,1,'35','A','0.00',220,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6047,19,17,1,'40','A','0.00',220,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6048,19,17,1,'46','A','0.00',290,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6049,19,17,1,'51','A','0.00',290,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6050,19,17,1,'41','A','0.00',290,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6051,19,17,1,'56','A','0.00',290,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6052,19,17,1,'42','A','0.00',310,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6053,19,17,1,'47','A','0.00',310,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6054,19,17,1,'52','A','0.00',310,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6055,19,17,1,'57','A','0.00',310,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6056,19,21,1,'43','A','0.00',330,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6057,19,21,1,'48','A','0.00',330,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6058,19,21,1,'53','A','0.00',330,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6059,19,21,1,'58','A','0.00',330,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6060,19,17,1,'44','A','0.00',350,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6061,19,17,1,'49','A','0.00',350,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6062,19,21,1,'54','A','0.00',350,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6063,19,21,1,'59','A','0.00',350,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6064,19,17,1,'45','A','0.00',370,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6065,19,17,1,'50','A','0.00',370,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6066,19,17,1,'55','A','0.00',370,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6067,19,17,1,'60','A','0.00',370,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6068,19,17,1,'66','A','0.00',290,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6069,19,17,1,'76','A','0.00',290,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6070,19,17,1,'71','A','0.00',290,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6071,19,17,1,'61','A','0.00',290,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6072,19,17,1,'62','A','0.00',310,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6073,19,17,1,'67','A','0.00',310,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6074,19,17,1,'72','A','0.00',310,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6075,19,17,1,'77','A','0.00',310,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6076,19,21,1,'63','A','0.00',330,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6077,19,21,1,'68','A','0.00',330,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6078,19,21,1,'73','A','0.00',330,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6079,19,21,1,'78','A','0.00',330,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6080,19,21,1,'64','A','0.00',350,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6081,19,21,1,'69','A','0.00',350,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6082,19,17,1,'74','A','0.00',350,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6083,19,17,1,'79','A','0.00',350,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6084,19,17,1,'65','A','0.00',370,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6085,19,17,1,'70','A','0.00',370,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6086,19,17,1,'75','A','0.00',370,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6087,19,17,1,'80','A','0.00',370,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6088,19,17,1,'81','A','0.00',450,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6089,19,17,1,'86','A','0.00',450,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6090,19,17,1,'91','A','0.00',450,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6091,19,17,1,'87','A','0.00',470,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6092,19,17,1,'82','A','0.00',470,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6093,19,17,1,'96','A','0.00',450,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6094,19,17,1,'92','A','0.00',470,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6095,19,17,1,'97','A','0.00',470,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6096,19,17,1,'83','A','0.00',490,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6097,19,17,1,'88','A','0.00',490,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6098,19,21,1,'93','A','0.00',490,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6099,19,21,1,'98','A','0.00',490,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6100,19,17,1,'84','A','0.00',510,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6101,19,17,1,'89','A','0.00',510,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6102,19,17,1,'94','A','0.00',510,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6103,19,17,1,'99','A','0.00',510,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6104,19,17,1,'85','A','0.00',530,40,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6105,19,17,1,'90','A','0.00',530,70,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6106,19,17,1,'95','A','0.00',530,150,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6107,19,17,1,'100','A','0.00',530,180,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6108,19,17,1,'106','A','0.00',450,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6109,19,17,1,'101','A','0.00',450,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6110,19,17,1,'102','A','0.00',470,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6111,19,17,1,'107','A','0.00',470,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6112,19,21,1,'103','A','0.00',490,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6113,19,21,1,'108','A','0.00',490,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6114,19,17,1,'104','A','0.00',510,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6115,19,17,1,'109','A','0.00',510,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6116,19,17,1,'105','A','0.00',530,280,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6117,19,17,1,'110','A','0.00',530,310,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6118,19,17,1,'111','A','0.00',450,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6119,19,17,1,'116','A','0.00',450,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6120,19,17,1,'113','A','0.00',490,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6121,19,17,1,'118','A','0.00',490,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6122,19,17,1,'112','A','0.00',470,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6123,19,17,1,'117','A','0.00',470,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6124,19,17,1,'114','A','0.00',510,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6125,19,17,1,'119','A','0.00',510,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6126,19,17,1,'115','A','0.00',530,390,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6127,19,17,1,'120','A','0.00',530,420,20,30,'1','2013-12-05 11:35:48','Duplicated'),
 (6128,20,25,1,'9','C','0.00',120,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6129,20,26,1,'1','C','0.00',120,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6130,20,26,1,'7','C','0.00',180,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6131,20,26,1,'2','C','0.00',150,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6132,20,26,1,'6','C','0.00',150,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6133,20,26,1,'5','C','0.00',120,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6134,20,26,1,'3','C','0.00',180,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6135,20,25,1,'10','C','0.00',120,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6136,20,25,1,'11','C','0.00',120,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6137,20,25,1,'12','C','0.00',120,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6138,20,25,1,'15','C','0.00',140,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6139,20,25,1,'16','C','0.00',140,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6140,20,25,1,'17','C','0.00',140,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6141,20,25,1,'18','C','0.00',140,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6142,20,25,1,'13','C','0.00',120,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6143,20,25,1,'19','C','0.00',140,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6144,20,25,1,'14','C','0.00',120,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6145,20,25,1,'20','C','0.00',140,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6146,20,26,1,'33','C','0.00',120,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6147,20,26,1,'37','C','0.00',120,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6148,20,26,1,'34','C','0.00',150,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6149,20,26,1,'38','C','0.00',150,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6150,20,26,1,'35','C','0.00',180,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6151,20,26,1,'39','C','0.00',180,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6152,20,25,1,'21','C','0.00',200,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6153,20,25,1,'22','C','0.00',200,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6154,20,25,1,'23','C','0.00',200,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6155,20,25,1,'26','C','0.00',200,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6156,20,25,1,'24','C','0.00',200,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6157,20,25,1,'27','C','0.00',220,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6158,20,25,1,'25','C','0.00',200,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6159,20,25,1,'28','C','0.00',220,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6160,20,25,1,'29','C','0.00',220,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6161,20,25,1,'30','C','0.00',220,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6162,20,25,1,'31','C','0.00',220,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6163,20,25,1,'32','C','0.00',220,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6164,20,26,1,'4','C','0.00',210,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6165,20,26,1,'8','C','0.00',210,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6166,20,26,1,'36','C','0.00',210,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6167,20,26,1,'40','C','0.00',210,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6168,20,22,1,'41','C','0.00',290,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6169,20,18,1,'45','C','0.00',290,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6170,20,17,1,'49','C','0.00',290,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6171,20,17,1,'50','C','0.00',290,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6172,20,21,1,'51','C','0.00',290,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6173,20,21,1,'52','C','0.00',290,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6174,20,17,1,'53','C','0.00',290,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6175,20,17,1,'54','C','0.00',290,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6176,20,18,1,'73','C','0.00',290,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6177,20,22,1,'77','C','0.00',290,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6178,20,17,1,'55','C','0.00',310,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6179,20,17,1,'56','C','0.00',310,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6180,20,21,1,'57','C','0.00',310,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6181,20,21,1,'58','C','0.00',310,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6182,20,17,1,'59','C','0.00',310,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6183,20,17,1,'60','C','0.00',310,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6184,20,22,1,'42','C','0.00',320,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6185,20,18,1,'46','C','0.00',320,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6186,20,18,1,'74','C','0.00',320,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6187,20,22,1,'78','C','0.00',320,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6188,20,22,1,'43','C','0.00',350,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6189,20,18,1,'47','C','0.00',350,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6190,20,18,1,'75','C','0.00',350,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6191,20,22,1,'79','C','0.00',350,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6192,20,17,1,'61','C','0.00',370,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6193,20,17,1,'62','C','0.00',370,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6194,20,21,1,'63','C','0.00',370,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6195,20,21,1,'64','C','0.00',370,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6196,20,17,1,'65','C','0.00',370,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6197,20,17,1,'66','C','0.00',370,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6198,20,22,1,'44','C','0.00',380,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6199,20,18,1,'48','C','0.00',380,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6200,20,18,1,'76','C','0.00',380,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6201,20,17,1,'67','C','0.00',390,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6202,20,17,1,'68','C','0.00',390,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6203,20,21,1,'69','C','0.00',390,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6204,20,21,1,'70','C','0.00',390,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6205,20,17,1,'71','C','0.00',390,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6206,20,17,1,'72','C','0.00',390,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6207,20,22,1,'80','C','0.00',380,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6208,20,22,1,'81','C','0.00',460,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6209,20,17,1,'90','C','0.00',460,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6210,20,21,1,'91','C','0.00',460,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6211,20,18,1,'85','C','0.00',460,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6212,20,17,1,'89','C','0.00',460,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6213,20,21,1,'92','C','0.00',460,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6214,20,17,1,'93','C','0.00',460,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6215,20,17,1,'94','C','0.00',460,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6216,20,18,1,'113','C','0.00',460,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6217,20,22,1,'117','C','0.00',460,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6218,20,17,1,'95','C','0.00',480,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6219,20,17,1,'96','C','0.00',480,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6220,20,21,1,'97','C','0.00',480,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6221,20,21,1,'98','C','0.00',480,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6222,20,17,1,'99','C','0.00',480,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6223,20,17,1,'100','C','0.00',480,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6224,20,22,1,'82','C','0.00',490,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6225,20,18,1,'86','C','0.00',490,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6226,20,18,1,'114','C','0.00',490,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6227,20,22,1,'118','C','0.00',490,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6228,20,22,1,'83','C','0.00',520,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6229,20,18,1,'87','C','0.00',520,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6230,20,18,1,'115','C','0.00',520,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6231,20,22,1,'119','C','0.00',520,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6232,20,17,1,'101','C','0.00',540,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6233,20,17,1,'102','C','0.00',540,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6234,20,21,1,'103','C','0.00',540,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6235,20,21,1,'104','C','0.00',540,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6236,20,17,1,'105','C','0.00',540,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6237,20,17,1,'106','C','0.00',540,300,20,30,'1','2013-12-05 11:39:54','Duplicated');
INSERT INTO `web_rsv_room_components` (`room_component_id`,`room_id`,`component_id`,`component_category_id`,`identifier`,`section`,`price`,`top`,`left`,`height`,`width`,`created_by`,`created_on`,`status`) VALUES 
 (6238,20,22,1,'84','C','0.00',550,50,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6239,20,18,1,'88','C','0.00',550,70,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6240,20,18,1,'116','C','0.00',550,390,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6241,20,17,1,'107','C','0.00',560,150,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6242,20,17,1,'108','C','0.00',560,180,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6243,20,21,1,'109','C','0.00',560,210,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6244,20,21,1,'110','C','0.00',560,240,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6245,20,17,1,'111','C','0.00',560,270,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6246,20,17,1,'112','C','0.00',560,300,20,30,'1','2013-12-05 11:39:54','Duplicated'),
 (6247,20,22,1,'120','C','0.00',550,410,30,20,'1','2013-12-05 11:39:54','Duplicated'),
 (6248,21,32,1,'12','E','0.00',270,50,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6249,21,32,1,'11','E','0.00',290,30,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6250,21,30,1,'29','E','0.00',190,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6251,21,28,1,'28','E','0.00',160,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6252,21,29,1,'9','E','0.00',200,210,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6253,21,29,1,'10','E','0.00',200,240,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6254,21,30,1,'23','E','0.00',160,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6255,21,29,1,'8','E','0.00',200,180,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6256,21,29,1,'6','E','0.00',200,120,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6257,21,29,1,'7','E','0.00',200,150,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6258,21,29,1,'5','E','0.00',170,240,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6259,21,29,1,'3','E','0.00',170,180,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6260,21,29,1,'4','E','0.00',170,210,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6261,21,29,1,'2','E','0.00',170,150,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6262,21,29,1,'1','E','0.00',170,120,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6263,21,28,1,'30','E','0.00',220,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6264,21,30,1,'31','E','0.00',250,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6265,21,28,1,'32','E','0.00',280,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6266,21,28,1,'24','E','0.00',190,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6267,21,30,1,'27','E','0.00',280,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6268,21,30,1,'25','E','0.00',220,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6269,21,28,1,'26','E','0.00',250,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6270,21,28,1,'33','E','0.00',410,60,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6271,21,28,1,'34','E','0.00',440,60,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6272,21,28,1,'39','E','0.00',440,90,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6273,21,28,1,'35','E','0.00',470,60,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6274,21,28,1,'38','E','0.00',410,90,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6275,21,28,1,'40','E','0.00',470,90,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6276,21,28,1,'36','E','0.00',500,60,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6277,21,28,1,'41','E','0.00',500,90,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6278,21,28,1,'37','E','0.00',530,60,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6279,21,28,1,'42','E','0.00',530,90,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6280,21,30,1,'43','E','0.00',410,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6281,21,28,1,'50','E','0.00',470,190,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6282,21,28,1,'46','E','0.00',500,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6283,21,30,1,'49','E','0.00',440,190,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6284,21,30,1,'45','E','0.00',470,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6285,21,28,1,'44','E','0.00',440,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6286,21,28,1,'48','E','0.00',410,190,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6287,21,30,1,'51','E','0.00',500,190,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6288,21,30,1,'47','E','0.00',530,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6289,21,28,1,'52','E','0.00',530,190,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6290,21,28,1,'53','E','0.00',410,260,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6291,21,30,1,'60','E','0.00',470,290,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6292,21,28,1,'55','E','0.00',470,260,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6293,21,30,1,'54','E','0.00',440,260,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6294,21,30,1,'56','E','0.00',500,260,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6295,21,28,1,'59','E','0.00',440,290,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6296,21,30,1,'58','E','0.00',410,290,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6297,21,28,1,'61','E','0.00',500,290,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6298,21,28,1,'57','E','0.00',530,260,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6299,21,30,1,'62','E','0.00',530,290,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6300,21,28,1,'63','E','0.00',410,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6301,21,28,1,'70','E','0.00',470,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6302,21,28,1,'65','E','0.00',470,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6303,21,28,1,'64','E','0.00',440,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6304,21,28,1,'66','E','0.00',500,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6305,21,28,1,'69','E','0.00',440,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6306,21,28,1,'68','E','0.00',410,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6307,21,28,1,'71','E','0.00',500,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6308,21,28,1,'67','E','0.00',530,360,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6309,21,28,1,'72','E','0.00',530,390,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6310,21,32,1,'14','E','0.00',290,70,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6311,21,32,1,'13','E','0.00',310,50,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6312,21,33,1,'16','E','0.00',270,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6313,21,33,1,'17','E','0.00',310,160,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6314,21,31,1,'18','E','0.00',290,180,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6315,21,31,1,'15','E','0.00',290,140,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6316,21,33,1,'20','E','0.00',270,270,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6317,21,33,1,'21','E','0.00',310,270,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6318,21,31,1,'19','E','0.00',290,250,30,30,'1','2013-12-05 11:50:30','Duplicated'),
 (6319,21,31,1,'22','E','0.00',290,290,30,30,'1','2013-12-05 11:50:30','Duplicated');
/*!40000 ALTER TABLE `web_rsv_room_components` ENABLE KEYS */;


--
-- Definition of table `web_rsv_room_info`
--

DROP TABLE IF EXISTS `web_rsv_room_info`;
CREATE TABLE `web_rsv_room_info` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) DEFAULT NULL,
  `room_description` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1',
  `display_position` int(11) NOT NULL DEFAULT '0',
  `large_image` varchar(255) DEFAULT NULL,
  `small_image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT '1',
  `width` int(11) DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ;

--
-- Dumping data for table `web_rsv_room_info`
--

/*!40000 ALTER TABLE `web_rsv_room_info` DISABLE KEYS */;
INSERT INTO `web_rsv_room_info` (`room_id`,`room_name`,`room_description`,`company_id`,`display_position`,`large_image`,`small_image`,`color`,`height`,`width`,`created_by`,`created_on`,`status`) VALUES 
 (14,'Room D','',3,0,'TemplateRoom4.jpg','None','',600,500,'FortuNetManager','2013-12-04 14:53:50',''),
 (15,'Room A','',3,0,'TemplateRoom1.jpg','None','',600,500,'FortuNetManager','2013-12-04 16:43:59',''),
 (16,'Room B','',3,0,'TemplateRoom2.jpg','None','',600,500,'FortuNetManager','2013-12-04 17:01:54',''),
 (17,'Room C','',3,0,'TemplateRoom3.jpg','None','',600,500,'FortuNetManager','2013-12-04 17:08:18',''),
 (18,'Room E','',3,0,'TemplateRoom5.jpg','None','',600,500,'FortuNetManager','2013-12-05 09:33:48',''),
 (19,'Room A Halloween','',3,0,'TemplateHalloween.jpg','None','',600,500,'1','2013-12-05 11:35:48','Duplicated'),
 (20,'Room C Saint Patricks','',3,0,'TemplatePatricks.jpg','None','',600,500,'1','2013-12-05 11:39:54','Duplicated'),
 (21,'Room E Christmas','',3,0,'TemplateChristmas.jpg','None','',600,500,'1','2013-12-05 11:50:30','Duplicated'),
 (22,'Test','',0,0,'None','None','',600,500,'Richard','2013-12-05 13:19:41','');
/*!40000 ALTER TABLE `web_rsv_room_info` ENABLE KEYS */;


--
-- Definition of table `web_rsv_ticket_info`
--

DROP TABLE IF EXISTS `web_rsv_ticket_info`;
CREATE TABLE `web_rsv_ticket_info` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_ticket_id` int(11) DEFAULT '0',
  `ticket_name` varchar(255) DEFAULT NULL,
  `ticket_description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `player_id` int(11) DEFAULT '0',
  `player_name` varchar(255) DEFAULT NULL,
  `player_card` varchar(50) DEFAULT NULL,
  `player_account` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT '0',
  `event_id` int(11) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `ticket_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ;

--
-- Dumping data for table `web_rsv_ticket_info`
--

/*!40000 ALTER TABLE `web_rsv_ticket_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_rsv_ticket_info` ENABLE KEYS */;


--
-- Definition of table `web_rsv_ticket_items`
--

DROP TABLE IF EXISTS `web_rsv_ticket_items`;
CREATE TABLE `web_rsv_ticket_items` (
  `ticket_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT '0',
  `item_type_id` int(11) DEFAULT '0',
  `type_item_id` int(11) DEFAULT '0',
  `item_name` varchar(255) DEFAULT '0',
  `item_code` varchar(255) DEFAULT '0',
  `item_description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(11,4) DEFAULT '0.0000',
  `quantity` int(11) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_user_id` int(11) DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_item_id`)
) ;

--
-- Dumping data for table `web_rsv_ticket_items`
--

/*!40000 ALTER TABLE `web_rsv_ticket_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_rsv_ticket_items` ENABLE KEYS */;


--
-- Definition of table `web_rsv_ticket_notes`
--

DROP TABLE IF EXISTS `web_rsv_ticket_notes`;
CREATE TABLE `web_rsv_ticket_notes` (
  `ticket_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `note_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note_type_id` int(11) DEFAULT '0',
  `note_description` text,
  `status` varchar(50) DEFAULT NULL,
  `remove_user_id` int(11) DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_note_id`)
) ;

--
-- Dumping data for table `web_rsv_ticket_notes`
--

/*!40000 ALTER TABLE `web_rsv_ticket_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_rsv_ticket_notes` ENABLE KEYS */;


--
-- Definition of table `web_sys_player_interface`
--

DROP TABLE IF EXISTS `web_sys_player_interface`;
CREATE TABLE `web_sys_player_interface` (
  `player_interface_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_interface_type` varchar(255) DEFAULT '',
  `player_interface_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT '',
  `database` varchar(255) DEFAULT '',
  `user` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `status` varchar(255) DEFAULT '',
  `interface_permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`player_interface_id`)
) ;

--
-- Dumping data for table `web_sys_player_interface`
--

/*!40000 ALTER TABLE `web_sys_player_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_sys_player_interface` ENABLE KEYS */;


--
-- Definition of table `web_sys_player_interface_type`
--

DROP TABLE IF EXISTS `web_sys_player_interface_type`;
CREATE TABLE `web_sys_player_interface_type` (
  `player_interface_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_interface_type_name` varchar(255) DEFAULT NULL,
  `player_interface_type_description` varchar(255) DEFAULT '',
  PRIMARY KEY (`player_interface_type_id`)
) ;

--
-- Dumping data for table `web_sys_player_interface_type`
--

/*!40000 ALTER TABLE `web_sys_player_interface_type` DISABLE KEYS */;
INSERT INTO `web_sys_player_interface_type` (`player_interface_type_id`,`player_interface_type_name`,`player_interface_type_description`) VALUES 
 (1,'BingoStar v1','Connecting to BingoStar v. 10.7.0 - MySQL 5.0 '),
 (2,'SEATS v1','Interface to SEATS v 1.0.1 - MySQL 5.0.'),
 (3,'Edge v1','Connecting to Edge v. 3.5.8. - SQL Server 2008-2012'),
 (4,'Casino v1','Interface to Casino Interface (Under Development)');
/*!40000 ALTER TABLE `web_sys_player_interface_type` ENABLE KEYS */;


--
-- Definition of table `web_sys_setting_category`
--

DROP TABLE IF EXISTS `web_sys_setting_category`;
CREATE TABLE `web_sys_setting_category` (
  `setting_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_category_type` varchar(255) DEFAULT '',
  `setting_category_name` varchar(255) DEFAULT NULL,
  `setting_category_desription` varchar(255) DEFAULT '',
  PRIMARY KEY (`setting_category_id`)
) ;

--
-- Dumping data for table `web_sys_setting_category`
--

/*!40000 ALTER TABLE `web_sys_setting_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_sys_setting_category` ENABLE KEYS */;


--
-- Definition of table `web_sys_setting_info`
--

DROP TABLE IF EXISTS `web_sys_setting_info`;
CREATE TABLE `web_sys_setting_info` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_category_id` int(11) DEFAULT '0',
  `setting_type` varchar(255) DEFAULT '',
  `setting_name` varchar(255) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT '',
  `setting_description` varchar(255) DEFAULT '',
  PRIMARY KEY (`setting_id`)
) ;

--
-- Dumping data for table `web_sys_setting_info`
--

/*!40000 ALTER TABLE `web_sys_setting_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_sys_setting_info` ENABLE KEYS */;


--
-- Definition of table `web_trn_confirmation_ledger`
--

DROP TABLE IF EXISTS `web_trn_confirmation_ledger`;
CREATE TABLE `web_trn_confirmation_ledger` (
  `confirmation_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_ledger_id` int(11) NOT NULL DEFAULT '0',
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `player_name` varchar(255) DEFAULT NULL,
  `player_card` varchar(50) DEFAULT NULL,
  `player_account` varchar(50) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`confirmation_ledger_id`)
) ;

--
-- Dumping data for table `web_trn_confirmation_ledger`
--

/*!40000 ALTER TABLE `web_trn_confirmation_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_confirmation_ledger` ENABLE KEYS */;


--
-- Definition of table `web_trn_event_ledger`
--

DROP TABLE IF EXISTS `web_trn_event_ledger`;
CREATE TABLE `web_trn_event_ledger` (
  `event_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT '0000-00-00',
  `session_number` int(11) NOT NULL DEFAULT '0',
  `event_number` int(11) NOT NULL DEFAULT '0',
  `room_number` int(11) NOT NULL DEFAULT '0',
  `room_component_identifier` varchar(255) NOT NULL DEFAULT '',
  `day_id` int(11) NOT NULL DEFAULT '0',
  `session_id` int(11) NOT NULL DEFAULT '0',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) NOT NULL DEFAULT '0',
  `component_id` int(11) NOT NULL DEFAULT '0',
  `room_component_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `section` varchar(255) DEFAULT '1',
  `identifier` varchar(255) DEFAULT '1',
  `top` int(11) DEFAULT '1',
  `left` int(11) DEFAULT '1',
  `height` int(11) DEFAULT '1',
  `width` int(11) DEFAULT '1',
  `description` varchar(255) NOT NULL DEFAULT '',
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_ledger_id`),
  KEY `Index_RoomComponentId` (`room_component_id`)
) ;

--
-- Dumping data for table `web_trn_event_ledger`
--

/*!40000 ALTER TABLE `web_trn_event_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_event_ledger` ENABLE KEYS */;


--
-- Definition of table `web_trn_interface_ledger`
--

DROP TABLE IF EXISTS `web_trn_interface_ledger`;
CREATE TABLE `web_trn_interface_ledger` (
  `interface_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL DEFAULT '0',
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `player_card` varchar(255) DEFAULT NULL,
  `hall` varchar(255) DEFAULT NULL,
  `session` varchar(50) DEFAULT NULL,
  `remote_address` varchar(50) DEFAULT NULL,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `mode` varchar(255) NOT NULL DEFAULT '',
  `format` varchar(50) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`interface_ledger_id`)
) ;

--
-- Dumping data for table `web_trn_interface_ledger`
--

/*!40000 ALTER TABLE `web_trn_interface_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_interface_ledger` ENABLE KEYS */;


--
-- Definition of table `web_trn_reservation_ledger`
--

DROP TABLE IF EXISTS `web_trn_reservation_ledger`;
CREATE TABLE `web_trn_reservation_ledger` (
  `reservation_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_ledger_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `player_name` varchar(255) DEFAULT NULL,
  `player_card` varchar(50) DEFAULT NULL,
  `player_account` varchar(50) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `reservation_name` varchar(255) DEFAULT NULL,
  `reservation_description` varchar(255) DEFAULT NULL,
  `reservation_expiration` datetime DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservation_ledger_id`),
  KEY `Index_EventLedger` (`event_ledger_id`)
) ;

--
-- Dumping data for table `web_trn_reservation_ledger`
--

/*!40000 ALTER TABLE `web_trn_reservation_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_reservation_ledger` ENABLE KEYS */;


--
-- Definition of table `web_trn_reservation_receipt`
--

DROP TABLE IF EXISTS `web_trn_reservation_receipt`;
CREATE TABLE `web_trn_reservation_receipt` (
  `reservation_receipt_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_ledger_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_extension` varchar(3) DEFAULT 'pdf',
  `file_hash` varchar(255) NOT NULL DEFAULT '',
  `file_type` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_login_id` int(11) NOT NULL DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_receipt_id`),
  KEY `Index_FileName` (`file_name`,`file_type`,`description`),
  KEY `Index_FileHash` (`file_hash`)
) ;

--
-- Dumping data for table `web_trn_reservation_receipt`
--

/*!40000 ALTER TABLE `web_trn_reservation_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_reservation_receipt` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_discount_items`
--

DROP TABLE IF EXISTS `web_trn_ticket_discount_items`;
CREATE TABLE `web_trn_ticket_discount_items` (
  `ticket_discount_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_discount_id` int(11) DEFAULT '0',
  `ticket_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `discount_id` int(11) DEFAULT '0',
  `discount_name` varchar(255) DEFAULT '0',
  `discount_code` varchar(255) DEFAULT '0',
  `discount_description` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(11,4) DEFAULT '0.0000',
  `status` varchar(50) DEFAULT NULL,
  `discount_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_user_id` int(11) DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_discount_item_id`)
) ;

--
-- Dumping data for table `web_trn_ticket_discount_items`
--

/*!40000 ALTER TABLE `web_trn_ticket_discount_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_discount_items` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_discounts`
--

DROP TABLE IF EXISTS `web_trn_ticket_discounts`;
CREATE TABLE `web_trn_ticket_discounts` (
  `ticket_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `discount_id` int(11) DEFAULT '0',
  `discount_name` varchar(255) DEFAULT '0',
  `discount_code` varchar(255) DEFAULT '0',
  `discount_description` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(11,4) DEFAULT '0.0000',
  `status` varchar(50) DEFAULT NULL,
  `discount_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_user_id` int(11) DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_discount_id`)
) ;

--
-- Dumping data for table `web_trn_ticket_discounts`
--

/*!40000 ALTER TABLE `web_trn_ticket_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_discounts` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_email`
--

DROP TABLE IF EXISTS `web_trn_ticket_email`;
CREATE TABLE `web_trn_ticket_email` (
  `ticket_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `email_player` varchar(255) NOT NULL DEFAULT '',
  `email_to` varchar(255) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_message` text,
  `email_files` varchar(255) NOT NULL DEFAULT '',
  `email_status` varchar(255) NOT NULL DEFAULT '',
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_login_id` int(11) NOT NULL DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_email_id`)
) ;

--
-- Dumping data for table `web_trn_ticket_email`
--

/*!40000 ALTER TABLE `web_trn_ticket_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_email` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_ledger`
--

DROP TABLE IF EXISTS `web_trn_ticket_ledger`;
CREATE TABLE `web_trn_ticket_ledger` (
  `ticket_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticket_ledger_id`)
) ;

--
-- Dumping data for table `web_trn_ticket_ledger`
--

/*!40000 ALTER TABLE `web_trn_ticket_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_ledger` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_payments`
--

DROP TABLE IF EXISTS `web_trn_ticket_payments`;
CREATE TABLE `web_trn_ticket_payments` (
  `ticket_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `payment_type_id` int(11) DEFAULT '0',
  `payment_code` varchar(255) DEFAULT '0',
  `payment_name` varchar(255) DEFAULT '0',
  `payment_description` varchar(255) DEFAULT NULL,
  `payment_amount` decimal(11,4) DEFAULT '0.0000',
  `status` varchar(50) DEFAULT NULL,
  `payment_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_user_id` int(11) DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_payment_id`)
) ;

--
-- Dumping data for table `web_trn_ticket_payments`
--

/*!40000 ALTER TABLE `web_trn_ticket_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_payments` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_receipt`
--

DROP TABLE IF EXISTS `web_trn_ticket_receipt`;
CREATE TABLE `web_trn_ticket_receipt` (
  `ticket_receipt_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_extension` varchar(3) DEFAULT 'pdf',
  `file_hash` varchar(255) NOT NULL DEFAULT '',
  `file_type` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `transaction_type_id` int(11) DEFAULT '0',
  `transaction_status_id` int(11) DEFAULT '1',
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_login_id` int(11) NOT NULL DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_receipt_id`),
  KEY `Index_FileName` (`file_name`,`file_type`,`description`)
) ;

--
-- Dumping data for table `web_trn_ticket_receipt`
--

/*!40000 ALTER TABLE `web_trn_ticket_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_receipt` ENABLE KEYS */;


--
-- Definition of table `web_trn_ticket_reservations`
--
 
DROP TABLE IF EXISTS `web_trn_ticket_reservations`;
CREATE TABLE `web_trn_ticket_reservations` (
  `code_name` varchar(255) NOT NULL DEFAULT '',
  `code_number` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `event_id` INT(11) DEFAULT '0',
  `company_id` INT(11) DEFAULT '0',
  `user_id` INT(11) DEFAULT '0',
  `value` INT(11) DEFAULT '0',
  `ticket_reservation_login_id` int(11) DEFAULT '0',
  `ticket_reservation_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_login_id` int(11) NOT NULL DEFAULT '0',
  `remove_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`code_name`,`code_number`)
) ENGINE=MyISAM;

--
-- Dumping data for table `web_trn_ticket_reservations`
--

/*!40000 ALTER TABLE `web_trn_ticket_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_trn_ticket_reservations` ENABLE KEYS */;


--
-- Definition of table `web_usr_application_companies`
--

DROP TABLE IF EXISTS `web_usr_application_companies`;
CREATE TABLE `web_usr_application_companies` (
  `application_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`application_company_id`)
) ;

--
-- Dumping data for table `web_usr_application_companies`
--

/*!40000 ALTER TABLE `web_usr_application_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_application_companies` ENABLE KEYS */;


--
-- Definition of table `web_usr_application_info`
--

DROP TABLE IF EXISTS `web_usr_application_info`;
CREATE TABLE `web_usr_application_info` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_name` varchar(100) NOT NULL,
  `application_friendly_name` varchar(255) DEFAULT NULL,
  `application_type` varchar(50) DEFAULT NULL,
  `application_order` int(11) DEFAULT '0',
  `application_description` varchar(255) DEFAULT NULL,
  `application_permission_name` varchar(255) DEFAULT '',
  `web_folder` varchar(100) NOT NULL DEFAULT '',
  `application_target` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_id`)
) ;

--
-- Dumping data for table `web_usr_application_info`
--

/*!40000 ALTER TABLE `web_usr_application_info` DISABLE KEYS */;
INSERT INTO `web_usr_application_info` (`application_id`,`application_name`,`application_friendly_name`,`application_type`,`application_order`,`application_description`,`application_permission_name`,`web_folder`,`application_target`,`image`) VALUES 
 (1,'Security','','Settings',4,'','WEB_SCR_LOGIN','SecurityManagement','','securityIcon.png'),
 (2,'Players','','Main',1,'','WEB_PLY_LOGIN','PlayerManagement','','PlayerMgtIcon.png'),
 (3,'Events','','Main',3,'','WEB_EVT_LOGIN','EventManagement','','EventManagement.png'),
 (4,'Files','','Main',12,'','WEB_FLS_LOGIN','FileManagement','','fileManagementIcon.png'),
 (5,'Event Calendar','','Main',4,'','','EventCalendar','','None'),
 (6,'Reservations','','Main',2,'','WEB_RSV_LOGIN','ReservationManagement','','calendar.png'),
 (7,'Interface','','Main',11,'','WEB_TCK_LOGIN','TicketInterface','','tickInterface.png'),
 (8,'Reports','','Main',5,'','WEB_RPT_LOGIN','Reporting','','Reporting.png'),
 (11,'Transactions','','Settings',3,'','','ReservationTransactions','','Transactions.png'),
 (12,'POS','','Main',7,'','WEB_POS_LOGIN','POSReservation','','POS.png'),
 (14,'Display','','Main',8,'','WEB_DSP_LOGIN','EventDisplay','','www.png'),
 (19,'Game Chat','','Other',11,'','WEB_CH1_GAME_BOARD','DBChatRoom/game_board_login.php','','Chat1.png'),
 (17,'Game Hosting','','Other',13,'','WEB_CH1_LOGIN','DBChatRoom','','Linked1.png'),
 (15,'Users','','Settings',1,'','WEB_USR_LOGIN','UserManagement','','enduser.png'),
 (16,'Locations','','Settings',2,'','WEB_LCT_LOGIN','CompanyManagement','','company_1.png'),
 (18,'Socket Chat','','Other',14,'','WEB_CH2_LOGIN','SocketChatRoom','','Chat1.png'),
 (20,'Tickets','','Other',9,'','WEB_TICKET_LOGIN','POSReservation/daily_session_login.php','','tickInterface.png'),
 (21,'Seats','','Other',1,'','WEB_SEATS_LOGIN','SeatsReservation/daily_session_login.php','','tickInterface.png'),
 (22,'Settings','','Settings',5,'','WEB_SYS_LOGIN','SettingsManagement','','Settings2.png'),
 (23,'Discounts','','Main',4,'','WEB_DSC_LOGIN','DiscountManagement','','discount_icon.png');
/*!40000 ALTER TABLE `web_usr_application_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_application_users`
--

DROP TABLE IF EXISTS `web_usr_application_users`;
CREATE TABLE `web_usr_application_users` (
  `application_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`application_user_id`)
) ;

--
-- Dumping data for table `web_usr_application_users`
--

/*!40000 ALTER TABLE `web_usr_application_users` DISABLE KEYS */;
INSERT INTO `web_usr_application_users` (`application_user_id`,`application_id`,`user_id`) VALUES 
 (3,11,1);
/*!40000 ALTER TABLE `web_usr_application_users` ENABLE KEYS */;


--
-- Definition of table `web_usr_company_info`
--

DROP TABLE IF EXISTS `web_usr_company_info`;
CREATE TABLE `web_usr_company_info` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) NOT NULL DEFAULT '',
  `company_short_name` varchar(100) DEFAULT NULL,
  `print_name` varchar(255) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `phone` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `parent_company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ;

--
-- Dumping data for table `web_usr_company_info`
--

/*!40000 ALTER TABLE `web_usr_company_info` DISABLE KEYS */;
INSERT INTO `web_usr_company_info` (`company_id`,`hall_id`,`company_name`,`company_short_name`,`print_name`,`address1`,`address2`,`city`,`state`,`zip`,`country`,`active`,`phone`,`fax`,`parent_company_id`) VALUES 
 (1,0,'FortuNet Master','','','','','','','','',1,'','',0),
 (2,102,'FortuNet Inc.','','01','','','Henderson','NV','89015','',1,'','',1),
 (3,113,'FortuNet Demo','','02','','','Las Vegas','NV','89103','USA',1,'','',2),
 (13,312,'FortuNet Training','','03','','','Las Vegas','NV','','',1,'','',2),
 (14,114,'Operator 4','','04','','','Las Vegas','NV','89145','USA',1,'','',13),
 (15,0,'Operator 5','','05','','','','','','',1,'','',13),
 (16,0,'Operator 6','','06','','','','','','',1,'','',13),
 (17,0,'Operator 7','','07','','','','','','',1,'','',13),
 (18,0,'Operator 8','','08','','','','','','',1,'','',13),
 (19,0,'Operator 9','','09','','','','','','',1,'','',3),
 (20,0,'Operator 10','','10','','','','','','',1,'','',3);
/*!40000 ALTER TABLE `web_usr_company_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_company_invoice_settings`
--

DROP TABLE IF EXISTS `web_usr_company_invoice_settings`;
CREATE TABLE `web_usr_company_invoice_settings` (
  `company_invoice_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `setting_type_id` int(11) DEFAULT NULL,
  `first_day_of_week` int(11) DEFAULT NULL,
  `invoice_interval` int(11) DEFAULT NULL,
  `payment_interval` int(11) DEFAULT NULL,
  `payment_window` int(11) DEFAULT NULL,
  `shipping_expected` int(11) DEFAULT '5',
  PRIMARY KEY (`company_invoice_settings_id`)
) ;

--
-- Dumping data for table `web_usr_company_invoice_settings`
--

/*!40000 ALTER TABLE `web_usr_company_invoice_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_company_invoice_settings` ENABLE KEYS */;


--
-- Definition of table `web_usr_company_notifications`
--

DROP TABLE IF EXISTS `web_usr_company_notifications`;
CREATE TABLE `web_usr_company_notifications` (
  `company_notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_notification_id`)
) ;

--
-- Dumping data for table `web_usr_company_notifications`
--

/*!40000 ALTER TABLE `web_usr_company_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_company_notifications` ENABLE KEYS */;


--
-- Definition of table `web_usr_group_info`
--

DROP TABLE IF EXISTS `web_usr_group_info`;
CREATE TABLE `web_usr_group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `group_friendly_name` varchar(255) DEFAULT NULL,
  `group_description` varchar(255) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `charity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ;

--
-- Dumping data for table `web_usr_group_info`
--

/*!40000 ALTER TABLE `web_usr_group_info` DISABLE KEYS */;
INSERT INTO `web_usr_group_info` (`group_id`,`group_name`,`group_friendly_name`,`group_description`,`hall_id`,`charity_id`) VALUES 
 (1,'GP_FTN_SYS_MANAGER','','',0,0),
 (2,'GP_FTN_RSV_VIEWER','Viewer','',0,0),
 (3,'GP_FTN_RSV_AGENT','Agent','',0,0),
 (4,'GP_FTN_RSV_SUPERVISOR','Supervisor','',0,0),
 (5,'GP_FTN_RSV_MANAGER','Manager','',0,0);
/*!40000 ALTER TABLE `web_usr_group_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_log_connection`
--

DROP TABLE IF EXISTS `web_usr_log_connection`;
CREATE TABLE `web_usr_log_connection` (
  `usr_log_connection_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(100) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  `transaction_value` varchar(255) DEFAULT NULL,
  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`usr_log_connection_id`)
) ;

--
-- Dumping data for table `web_usr_log_connection`
--

/*!40000 ALTER TABLE `web_usr_log_connection` DISABLE KEYS */;
INSERT INTO `web_usr_log_connection` (`usr_log_connection_id`,`usr_log_id`,`user_id`,`user_name`,`company_id`,`company_name`,`transaction_type`,`transaction_status`,`transaction_value`,`transaction_datetime`,`removed_transaction_id`) VALUES 
 (1,1,1,'FortuNetManager',1,'FortuNet Master','Connected',NULL,'','2014-09-29 15:55:48',NULL);
/*!40000 ALTER TABLE `web_usr_log_connection` ENABLE KEYS */;


--
-- Definition of table `web_usr_log_exceptions`
--

DROP TABLE IF EXISTS `web_usr_log_exceptions`;
CREATE TABLE `web_usr_log_exceptions` (
  `usr_log_exception_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` tinytext,
  `prev_value` tinytext,
  `new_value` tinytext,
  `description` tinytext,
  `exception_type` tinytext,
  `exception_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usr_log_exception_id`)
) ;

--
-- Dumping data for table `web_usr_log_exceptions`
--

/*!40000 ALTER TABLE `web_usr_log_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_log_exceptions` ENABLE KEYS */;


--
-- Definition of table `web_usr_log_history_`
--

DROP TABLE IF EXISTS `web_usr_log_history_`;
CREATE TABLE `web_usr_log_history_` (
  `usr_log_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `requested_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_type` varchar(100) DEFAULT NULL,
  `page_name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usr_log_history_id`)
) ;

--
-- Dumping data for table `web_usr_log_history_`
--

/*!40000 ALTER TABLE `web_usr_log_history_` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_log_history_` ENABLE KEYS */;


--
-- Definition of table `web_usr_log_info`
--

DROP TABLE IF EXISTS `web_usr_log_info`;
CREATE TABLE `web_usr_log_info` (
  `usr_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `remote_address` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `requested_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expired_on` datetime NOT NULL DEFAULT '1111-11-11 11:11:11',
  `log_type` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usr_log_id`)
) ;

--
-- Dumping data for table `web_usr_log_info`
--

/*!40000 ALTER TABLE `web_usr_log_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_log_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_log_message`
--

DROP TABLE IF EXISTS `web_usr_log_message`;
CREATE TABLE `web_usr_log_message` (
  `usr_log_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_log_id` int(11) NOT NULL DEFAULT '0',
  `session_transaction_id` int(11) NOT NULL DEFAULT '0',
  `ch1_session_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(100) DEFAULT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `message_type` varchar(100) DEFAULT NULL,
  `message_name` varchar(100) DEFAULT NULL,
  `message_text` varchar(255) DEFAULT NULL,
  `message_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`usr_log_message_id`)
) ;

--
-- Dumping data for table `web_usr_log_message`
--

/*!40000 ALTER TABLE `web_usr_log_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_log_message` ENABLE KEYS */;


--
-- Definition of table `web_usr_log_sql_info`
--

DROP TABLE IF EXISTS `web_usr_log_sql_info`;
CREATE TABLE `web_usr_log_sql_info` (
  `log_sql_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `requested_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_type` varchar(100) DEFAULT '0',
  `connection` varchar(150) DEFAULT NULL,
  `query` text,
  PRIMARY KEY (`log_sql_id`)
) ;

--
-- Dumping data for table `web_usr_log_sql_info`
--

/*!40000 ALTER TABLE `web_usr_log_sql_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_log_sql_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_notification_groups`
--

DROP TABLE IF EXISTS `web_usr_notification_groups`;
CREATE TABLE `web_usr_notification_groups` (
  `notification_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`notification_group_id`)
) ;

--
-- Dumping data for table `web_usr_notification_groups`
--

/*!40000 ALTER TABLE `web_usr_notification_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_notification_groups` ENABLE KEYS */;


--
-- Definition of table `web_usr_notification_info`
--

DROP TABLE IF EXISTS `web_usr_notification_info`;
CREATE TABLE `web_usr_notification_info` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(100) DEFAULT NULL,
  `notification_friendly_name` varchar(255) DEFAULT NULL,
  `notification_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ;

--
-- Dumping data for table `web_usr_notification_info`
--

/*!40000 ALTER TABLE `web_usr_notification_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_notification_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_permission_groups`
--

DROP TABLE IF EXISTS `web_usr_permission_groups`;
CREATE TABLE `web_usr_permission_groups` (
  `permission_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`permission_group_id`)
) ;

--
-- Dumping data for table `web_usr_permission_groups`
--

/*!40000 ALTER TABLE `web_usr_permission_groups` DISABLE KEYS */;
INSERT INTO `web_usr_permission_groups` (`permission_group_id`,`group_id`,`permission_id`) VALUES 
 (1,1,1),
 (2,1,2),
 (3,1,3),
 (4,1,4),
 (5,1,5),
 (6,1,6),
 (7,1,7),
 (8,1,8),
 (9,1,9),
 (10,1,10),
 (11,1,11),
 (12,1,12),
 (13,1,13),
 (14,1,14),
 (15,1,15),
 (16,1,16),
 (17,1,17),
 (18,1,18),
 (19,1,19),
 (20,1,20),
 (21,1,21),
 (22,1,22),
 (23,1,23),
 (24,1,24),
 (25,1,25),
 (26,1,26),
 (27,1,27),
 (28,1,28),
 (29,1,29),
 (30,1,30),
 (31,1,31),
 (32,1,32),
 (33,1,33),
 (34,1,34),
 (35,1,35),
 (36,1,36),
 (37,1,37),
 (39,1,39),
 (40,1,40),
 (41,1,41),
 (42,1,42),
 (43,1,43),
 (44,1,44),
 (45,1,45),
 (46,1,46),
 (47,1,47),
 (51,1,51),
 (55,1,55),
 (59,1,59),
 (60,1,60),
 (61,1,61),
 (62,1,62),
 (63,1,63),
 (64,1,64),
 (65,1,65),
 (66,1,66),
 (67,1,67),
 (68,1,68),
 (69,1,69),
 (70,1,70),
 (71,1,71),
 (72,1,72),
 (73,1,73),
 (74,1,74),
 (75,1,75),
 (76,1,76),
 (77,1,77),
 (78,1,78),
 (79,1,79),
 (80,1,80),
 (81,1,81),
 (82,1,82),
 (83,1,83),
 (84,1,84),
 (85,1,85),
 (86,1,86),
 (87,1,87),
 (88,1,88),
 (89,1,89),
 (90,1,90),
 (91,1,91),
 (92,1,92),
 (93,1,93),
 (94,1,94),
 (95,1,95),
 (96,1,96),
 (97,1,97),
 (98,1,98),
 (99,1,99),
 (100,1,100),
 (101,1,101),
 (102,1,102),
 (103,1,103),
 (104,1,104),
 (105,1,105),
 (106,1,106),
 (107,1,107),
 (108,1,108),
 (109,1,109),
 (110,1,110),
 (111,1,111),
 (112,1,112),
 (113,1,113),
 (114,1,114),
 (115,1,115),
 (116,1,117),
 (117,1,118),
 (118,1,119),
 (119,1,120),
 (120,1,121),
 (121,1,122),
 (122,1,123),
 (123,1,124),
 (124,1,125),
 (125,1,126),
 (126,1,127),
 (127,1,128),
 (128,1,129),
 (129,1,130),
 (130,1,131),
 (131,1,132),
 (132,1,133),
 (133,1,134),
 (134,1,135),
 (135,1,136),
 (136,1,138),
 (137,1,139),
 (138,1,140),
 (139,1,141),
 (140,1,142),
 (141,1,143),
 (142,1,144),
 (143,1,145),
 (144,1,146),
 (145,1,147),
 (146,1,148),
 (147,1,149),
 (148,1,150),
 (149,1,151),
 (150,1,152),
 (151,1,153),
 (152,1,154),
 (153,1,155),
 (154,1,156),
 (155,1,157),
 (156,1,158),
 (157,1,159),
 (158,1,160),
 (159,1,161),
 (160,1,162),
 (161,1,163),
 (162,1,164),
 (163,1,165),
 (164,1,166),
 (165,1,167),
 (166,1,168),
 (167,1,169),
 (168,1,170),
 (169,1,171),
 (170,1,172),
 (171,1,173),
 (172,1,174),
 (173,1,175),
 (174,1,176),
 (175,1,177),
 (176,1,178),
 (177,1,179),
 (178,1,180),
 (179,1,181),
 (180,1,182),
 (181,1,183),
 (182,1,184),
 (183,1,185),
 (184,1,186),
 (185,1,187),
 (186,1,188),
 (187,1,189),
 (188,1,190),
 (189,1,191),
 (190,1,192),
 (191,1,193),
 (192,1,194),
 (193,1,195),
 (194,1,196),
 (195,1,197),
 (196,1,198),
 (197,1,199),
 (198,1,200),
 (199,1,201),
 (200,1,202),
 (201,1,203),
 (202,1,204),
 (203,1,205),
 (204,1,206),
 (205,1,207),
 (206,1,208),
 (207,1,209),
 (208,1,210),
 (209,1,211),
 (210,1,212),
 (211,1,213),
 (212,1,214),
 (213,1,215),
 (214,1,216),
 (215,1,217),
 (216,1,218),
 (217,1,219),
 (218,1,220),
 (219,1,221),
 (220,1,222),
 (221,1,223),
 (222,1,224),
 (223,1,225),
 (224,1,226),
 (225,1,227),
 (226,1,228),
 (227,1,229),
 (228,1,230),
 (229,1,231),
 (230,1,232),
 (231,1,233),
 (232,1,234),
 (233,1,235),
 (234,1,236),
 (235,1,237),
 (236,1,238),
 (237,1,239),
 (238,1,240),
 (239,1,241),
 (240,1,242),
 (241,1,243),
 (242,1,244),
 (243,1,245),
 (244,1,246),
 (245,1,247),
 (246,1,248),
 (247,1,249),
 (248,1,250),
 (249,1,251),
 (250,1,252),
 (251,1,253),
 (252,1,254),
 (253,1,255),
 (254,1,256),
 (255,1,257),
 (256,1,258),
 (257,1,259),
 (258,1,260),
 (259,1,261),
 (260,1,262),
 (261,1,263),
 (262,1,264),
 (263,1,265),
 (264,1,266),
 (265,1,267),
 (266,1,268),
 (267,1,269),
 (268,1,270),
 (269,1,271),
 (270,1,272),
 (271,1,273),
 (272,2,170),
 (273,2,135),
 (274,3,59),
 (430,4,22),
 (387,4,98),
 (386,4,97),
 (385,4,96),
 (384,4,95),
 (383,4,94),
 (382,3,98),
 (381,3,97),
 (283,3,68),
 (380,3,96),
 (379,3,95),
 (378,3,94),
 (287,3,72),
 (377,4,219),
 (376,4,167),
 (375,4,165),
 (371,4,149),
 (372,4,150),
 (373,4,152),
 (374,4,163),
 (295,3,103),
 (296,3,104),
 (370,4,148),
 (298,3,106),
 (299,3,107),
 (300,3,108),
 (369,4,146),
 (302,3,110),
 (303,3,111),
 (304,3,112),
 (305,3,113),
 (368,4,145),
 (367,4,144),
 (308,3,129),
 (309,3,130),
 (310,3,131),
 (366,4,143),
 (364,4,140),
 (365,4,142),
 (314,3,135),
 (315,3,136),
 (347,4,59),
 (363,4,136),
 (318,3,140),
 (362,4,135),
 (320,3,142),
 (321,3,143),
 (322,3,144),
 (323,3,145),
 (324,3,146),
 (361,4,131),
 (326,3,148),
 (327,3,149),
 (328,3,150),
 (360,4,130),
 (330,3,152),
 (359,4,129),
 (358,4,113),
 (333,3,163),
 (357,4,112),
 (335,3,165),
 (356,4,111),
 (337,3,167),
 (355,4,110),
 (354,4,108),
 (353,4,107),
 (348,4,68),
 (342,3,219),
 (349,4,72),
 (350,4,103),
 (351,4,104),
 (352,4,106),
 (389,3,10),
 (390,3,11),
 (391,3,12),
 (429,4,21),
 (393,3,14),
 (394,3,15),
 (395,3,16),
 (396,3,17),
 (397,3,18),
 (398,3,19),
 (399,3,20),
 (400,3,21),
 (401,3,22),
 (402,3,23),
 (403,3,24),
 (404,3,25),
 (569,5,155),
 (418,4,10),
 (419,4,11),
 (420,4,12),
 (421,4,13),
 (422,4,14),
 (423,4,15),
 (424,4,16),
 (425,4,17),
 (426,4,18),
 (427,4,19),
 (428,4,20),
 (431,4,23),
 (432,4,24),
 (433,4,25),
 (448,4,138),
 (449,4,147),
 (450,4,153),
 (451,4,151),
 (452,4,105),
 (568,5,153),
 (567,5,152),
 (566,5,151),
 (565,5,150),
 (564,5,149),
 (563,5,148),
 (562,5,147),
 (561,5,146),
 (560,5,145),
 (559,5,144),
 (558,5,143),
 (557,5,142),
 (555,5,140),
 (553,5,138),
 (552,5,136),
 (551,5,135),
 (549,5,133),
 (548,5,132),
 (547,5,131),
 (546,5,130),
 (545,5,129),
 (544,5,115),
 (543,5,114),
 (542,5,113),
 (541,5,112),
 (540,5,111),
 (539,5,110),
 (537,5,108),
 (536,5,107),
 (535,5,106),
 (534,5,105),
 (533,5,104),
 (532,5,103),
 (526,5,74),
 (525,5,73),
 (524,5,72),
 (522,5,70),
 (521,5,69),
 (520,5,68),
 (518,5,66),
 (517,5,65),
 (516,5,64),
 (514,5,62),
 (513,5,61),
 (512,5,60),
 (511,5,59),
 (570,5,163),
 (571,5,164),
 (572,5,165),
 (573,5,166),
 (574,5,167),
 (575,5,168),
 (576,5,172),
 (577,5,217),
 (578,5,218),
 (579,5,219),
 (584,5,94),
 (585,5,95),
 (586,5,96),
 (587,5,97),
 (588,5,98),
 (590,5,10),
 (591,5,11),
 (592,5,12),
 (593,5,13),
 (594,5,14),
 (595,5,15),
 (596,5,16),
 (597,5,17),
 (598,5,18),
 (599,5,19),
 (600,5,20),
 (601,5,21),
 (602,5,22),
 (603,5,23),
 (604,5,24),
 (605,5,25),
 (618,5,26),
 (619,5,27),
 (620,5,28),
 (621,5,29),
 (657,5,33),
 (623,5,31),
 (654,5,85),
 (655,5,87),
 (656,5,86),
 (635,5,43);
/*!40000 ALTER TABLE `web_usr_permission_groups` ENABLE KEYS */;


--
-- Definition of table `web_usr_permission_info`
--

DROP TABLE IF EXISTS `web_usr_permission_info`;
CREATE TABLE `web_usr_permission_info` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) NOT NULL DEFAULT '',
  `permission_friendly_name` varchar(255) DEFAULT NULL,
  `permission_description` varchar(255) DEFAULT NULL,
  `log` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_namekey` (`permission_name`)
) ;

--
-- Dumping data for table `web_usr_permission_info`
--

/*!40000 ALTER TABLE `web_usr_permission_info` DISABLE KEYS */;
INSERT INTO `web_usr_permission_info` (`permission_id`,`permission_name`,`permission_friendly_name`,`permission_description`,`log`) VALUES 
 (1,'WEB_FLS_LOGIN',NULL,NULL,0),
 (2,'WEB_FLS_RESERVATION_IMAGES_UPLOAD',NULL,NULL,0),
 (3,'WEB_FLS_RESERVATION_IMAGES_VIEW',NULL,NULL,0),
 (4,'WEB_FLS_EVENT_IMAGES_UPLOAD',NULL,NULL,0),
 (5,'WEB_FLS_EVENT_IMAGES_VIEW',NULL,NULL,0),
 (6,'WEB_FLS_GENERAL_INFORMATION_VIEW',NULL,NULL,0),
 (7,'WEB_FLS_GENERAL_INFORMATION_UPDATE',NULL,NULL,0),
 (8,'WEB_FLS_TICKET_RECEIPTS_VIEW',NULL,NULL,0),
 (9,'WEB_PLY_LOGIN',NULL,NULL,0),
 (10,'WEB_PLY_PLAYER_VIEW',NULL,NULL,0),
 (11,'WEB_PLY_PLAYER_NEW',NULL,NULL,0),
 (12,'WEB_PLY_PLAYER_EDIT',NULL,NULL,0),
 (13,'WEB_PLY_PLAYER_DELETE',NULL,NULL,0),
 (14,'WEB_PLY_ADDRESS_NEW',NULL,NULL,0),
 (15,'WEB_PLY_ADDRESS_EDIT',NULL,NULL,0),
 (16,'WEB_PLY_ADDRESS_DELETE',NULL,NULL,0),
 (17,'WEB_PLY_ADDRESS_VIEW',NULL,NULL,0),
 (18,'WEB_PLY_PHONE_NUMBER_NEW',NULL,NULL,0),
 (19,'WEB_PLY_PHONE_NUMBER_EDIT',NULL,NULL,0),
 (20,'WEB_PLY_PHONE_NUMBER_DELETE',NULL,NULL,0),
 (21,'WEB_PLY_PHONE_NUMBER_VIEW',NULL,NULL,0),
 (22,'WEB_PLY_NOTES_NEW',NULL,NULL,0),
 (23,'WEB_PLY_NOTES_EDIT',NULL,NULL,0),
 (24,'WEB_PLY_NOTES_DELETE',NULL,NULL,0),
 (25,'WEB_PLY_NOTES_VIEW',NULL,NULL,0),
 (26,'WEB_USR_LOGIN',NULL,NULL,0),
 (27,'WEB_USR_USER_VIEW',NULL,NULL,0),
 (28,'WEB_USR_USER_NEW',NULL,NULL,0),
 (29,'WEB_USR_USER_EDIT',NULL,NULL,0),
 (30,'WEB_USR_USER_DELETE',NULL,NULL,0),
 (31,'WEB_USR_GROUP_VIEW',NULL,NULL,0),
 (32,'WEB_USR_GROUP_NEW',NULL,NULL,0),
 (33,'WEB_USR_GROUP_EDIT',NULL,NULL,0),
 (34,'WEB_USR_GROUP_DELETE',NULL,NULL,0),
 (35,'WEB_USR_PERMISSION_VIEW',NULL,NULL,0),
 (36,'WEB_USR_PERMISSION_NEW',NULL,NULL,0),
 (37,'WEB_USR_PERMISSION_EDIT',NULL,NULL,0),
 (38,'WEB_USR_PERMISSION_DELETE',NULL,NULL,0),
 (39,'WEB_USR_APPLICATION_VIEW',NULL,NULL,0),
 (40,'WEB_USR_APPLICATION_NEW',NULL,NULL,0),
 (41,'WEB_USR_APPLICATION_EDIT',NULL,NULL,0),
 (42,'WEB_USR_APPLICATION_DELETE',NULL,NULL,0),
 (43,'WEB_USR_COMPANY_VIEW',NULL,NULL,0),
 (44,'WEB_USR_COMPANY_NEW',NULL,NULL,0),
 (45,'WEB_USR_COMPANY_EDIT',NULL,NULL,0),
 (46,'WEB_USR_COMPANY_DELETE',NULL,NULL,0),
 (47,'WEB_USR_USR_LOG_VIEW',NULL,NULL,0),
 (48,'WEB_USR_USR_LOG_NEW','','',0),
 (49,'WEB_USR_USR_LOG_EDIT','','',0),
 (50,'WEB_USR_USR_LOG_DELETE','','',0),
 (51,'WEB_USR_LOG_SQL_VIEW',NULL,NULL,0),
 (52,'WEB_USR_LOG_SQL_NEW','','',0),
 (53,'WEB_USR_LOG_SQL_EDIT','','',0),
 (54,'WEB_USR_LOG_SQL_DELETE','','',0),
 (55,'WEB_USR_LOG_HISTORY_VIEW',NULL,NULL,0),
 (56,'WEB_USR_LOG_HISTORY_NEW','','',0),
 (57,'WEB_USR_LOG_HISTORY_EDIT','','',0),
 (58,'WEB_USR_LOG_HISTORY_DELETE','','',0),
 (59,'WEB_RSV_LOGIN',NULL,NULL,0),
 (60,'WEB_RSV_ROOM_VIEW',NULL,NULL,0),
 (61,'WEB_RSV_ROOM_NEW',NULL,NULL,0),
 (62,'WEB_RSV_ROOM_EDIT',NULL,NULL,0),
 (63,'WEB_RSV_ROOM_DELETE',NULL,NULL,0),
 (64,'WEB_RSV_COMPONENT_VIEW',NULL,NULL,0),
 (65,'WEB_RSV_COMPONENT_NEW',NULL,NULL,0),
 (66,'WEB_RSV_COMPONENT_EDIT',NULL,NULL,0),
 (67,'WEB_RSV_COMPONENT_DELETE',NULL,NULL,0),
 (68,'WEB_RSV_EVENT_VIEW',NULL,NULL,0),
 (69,'WEB_RSV_EVENT_NEW',NULL,NULL,0),
 (70,'WEB_RSV_EVENT_EDIT',NULL,NULL,0),
 (71,'WEB_RSV_EVENT_DELETE',NULL,NULL,0),
 (72,'WEB_RSV_CALENDAR_VIEW',NULL,NULL,0),
 (73,'WEB_RSV_CALENDAR_NEW',NULL,NULL,0),
 (74,'WEB_RSV_CALENDAR_EDIT',NULL,NULL,0),
 (75,'WEB_RSV_CALENDAR_DELETE',NULL,NULL,0),
 (76,'WEB_TRN_LOGIN',NULL,NULL,0),
 (77,'WEB_TRN_RESERVATION_LEDGER_VIEW',NULL,NULL,0),
 (78,'WEB_TRN_RESERVATION_LEDGER_NEW',NULL,NULL,0),
 (79,'WEB_TRN_RESERVATION_LEDGER_EDIT',NULL,NULL,0),
 (80,'WEB_TRN_RESERVATION_LEDGER_DELETE',NULL,NULL,0),
 (81,'WEB_TRN_EVENT_LEDGER_VIEW',NULL,NULL,0),
 (82,'WEB_TRN_EVENT_LEDGER_NEW',NULL,NULL,0),
 (83,'WEB_TRN_EVENT_LEDGER_EDIT',NULL,NULL,0),
 (84,'WEB_TRN_EVENT_LEDGER_DELETE',NULL,NULL,0),
 (85,'WEB_EVT_LOGIN',NULL,NULL,0),
 (86,'WEB_CLN_LOGIN',NULL,NULL,0),
 (87,'WEB_CLN_CALENDAR_VIEW',NULL,NULL,0),
 (88,'WEB_CLN_EVENT_VIEW',NULL,NULL,0),
 (89,'WEB_CLN_EVENT_RESERVE',NULL,NULL,0),
 (90,'WEB_CLN_EVENT_CANCEL',NULL,NULL,0),
 (91,'WEB_CLN_EVENT_LOCK',NULL,NULL,0),
 (92,'WEB_TCK_LOGIN',NULL,NULL,0),
 (93,'WEB_TCK_INTERFACE_VIEW',NULL,NULL,0),
 (94,'WEB_RPT_LOGIN',NULL,NULL,0),
 (95,'WEB_RPT_EVENTS_VIEW',NULL,NULL,0),
 (96,'WEB_RPT_USERS_VIEW',NULL,NULL,0),
 (97,'WEB_RPT_PLAYERS_VIEW',NULL,NULL,0),
 (98,'WEB_RPT_COMPANIES_VIEW',NULL,NULL,0),
 (99,'WEB_RSV_TICKET_VIEW',NULL,NULL,0),
 (100,'WEB_RSV_TICKET_NEW',NULL,NULL,0),
 (101,'WEB_RSV_TICKET_EDIT',NULL,NULL,0),
 (102,'WEB_RSV_TICKET_DELETE',NULL,NULL,0),
 (103,'WEB_RSV_MAIN_TICKET_ITEMS_CHANGE',NULL,NULL,0),
 (104,'WEB_RSV_MAIN_TICKET_ITEMS_REMOVE',NULL,NULL,0),
 (105,'WEB_RSV_MAIN_TICKET_VOID',NULL,NULL,0),
 (106,'WEB_RSV_MAIN_TICKET_VIEW',NULL,NULL,0),
 (107,'WEB_RSV_MAIN_TICKET_NEW',NULL,NULL,0),
 (108,'WEB_RSV_MAIN_TICKET_EDIT',NULL,NULL,0),
 (109,'WEB_RSV_MAIN_TICKET_DELETE',NULL,NULL,0),
 (110,'WEB_RSV_MAIN_TICKET_NOTE_VIEW',NULL,NULL,0),
 (111,'WEB_RSV_MAIN_TICKET_NOTE_NEW',NULL,NULL,0),
 (112,'WEB_RSV_MAIN_TICKET_NOTE_EDIT',NULL,NULL,0),
 (113,'WEB_RSV_MAIN_TICKET_NOTE_DELETE',NULL,NULL,0),
 (114,'WEB_RSV_RELEASE_SEATS',NULL,NULL,0),
 (115,'WEB_RSV_VOID_TICKETS','','',0),
 (117,'WEB_FLS_FILES_VIEW',NULL,NULL,0),
 (118,'WEB_FLS_FILES_NEW',NULL,NULL,0),
 (119,'WEB_FLS_FILES_EDIT',NULL,NULL,0),
 (120,'WEB_FLS_FILES_DELETE',NULL,NULL,0),
 (121,'WEB_FLS_FILE_VIEW',NULL,NULL,0),
 (122,'WEB_FLS_FILE_NEW','','',0),
 (123,'WEB_FLS_FILE_EDIT',NULL,NULL,0),
 (124,'WEB_FLS_FILE_DELETE',NULL,NULL,0),
 (125,'WEB_TRN_CONFIRMATION_LEDGER_VIEW',NULL,NULL,0),
 (126,'WEB_TRN_CONFIRMATION_LEDGER_NEW',NULL,NULL,0),
 (127,'WEB_TRN_CONFIRMATION_LEDGER_EDIT','','',0),
 (128,'WEB_TRN_CONFIRMATION_LEDGER_DELETE','','',0),
 (129,'WEB_RSV_PLAYER_VIEW','','',0),
 (130,'WEB_RSV_PLAYER_NEW','','',0),
 (131,'WEB_RSV_PLAYER_EDIT','','',0),
 (132,'WEB_RSV_PLAYER_DELETE','','',0),
 (133,'WEB_RSV_RESERVATION_LEDGER_VIEW','','',0),
 (134,'WEB_RSV_DAILY_RESERVATIONS','','',0),
 (135,'WEB_RSV_SPECIAL_RESERVATIONS','','',0),
 (136,'WEB_RSV_EVENT_OVERVIEW','','',0),
 (138,'WEB_RSV_MAIN_TICKET_CANCEL','','',0),
 (139,'WEB_RSV_RESERVATION_LEDGER_CANCEL',NULL,NULL,0),
 (140,'WEB_RSV_MAKE_RESERVATION','','',0),
 (141,'WEB_RSV_CREATE_TICKET',NULL,NULL,0),
 (142,'WEB_RSV_PLAYER_SECTION','','',0),
 (143,'WEB_RSV_MAIN_TICKET_RECEIPT_VIEW','','',0),
 (144,'WEB_RSV_MAIN_TICKET_PAYMENT_VIEW','','',0),
 (145,'WEB_RSV_MAIN_TICKET_PAYMENT_EDIT','','',0),
 (146,'WEB_RSV_MAIN_TICKET_PAYMENT_NEW','','',0),
 (147,'WEB_RSV_MAIN_TICKET_PAYMENT_DELETE','','',0),
 (148,'WEB_RSV_MAIN_TICKET_RESERVATION_VIEW','','',0),
 (149,'WEB_RSV_MAIN_TICKET_RESERVATION_EDIT','','',0),
 (150,'WEB_RSV_MAIN_TICKET_RESERVATION_NEW','','',0),
 (151,'WEB_RSV_MAIN_TICKET_RESERVATION_DELETE','','',0),
 (152,'WEB_RSV_MAIN_TICKET_RESERVATION_EXCHANGE','','',0),
 (153,'WEB_RSV_MAIN_TICKET_RESERVATION_REMOVE',NULL,NULL,0),
 (154,'WEB_FLS_FILE_DUPLICATE','','',0),
 (155,'WEB_RSV_EVENT_DUPLICATE','','',0),
 (156,'WEB_USR_USR_LOG_LOGOUT','','',0),
 (157,'WEB_POS_LOGIN','','',0),
 (158,'WEB_POS_CREATE_TICKET','','',0),
 (159,'WEB_POS_BACK_TO_CALENDAR','','',0),
 (160,'WEB_POS_CALENDAR_VIEW','','',0),
 (161,'WEB_USR_REMOTE_ADDRESS_VIEW','','',0),
 (162,'WEB_USR_REMOTE_ADDRESS_EDIT','','',0),
 (163,'WEB_RSV_EVENT_DESCRIPTION_VIEW','','',0),
 (164,'WEB_RSV_EVENT_DESCRIPTION_EDIT','','',0),
 (165,'WEB_RSV_EVENT_DATE_VIEW','','',0),
 (166,'WEB_RSV_EVENT_DATE_EDIT','','',0),
 (167,'WEB_RSV_EVENT_SESSION_VIEW','','',0),
 (168,'WEB_RSV_EVENT_SESSION_EDIT',NULL,NULL,0),
 (169,'WEB_PAY_LOGIN','','',0),
 (170,'WEB_DSP_LOGIN','','',0),
 (171,'WEB_DSP_REPAINT_TEST','','',0),
 (172,'WEB_RSV_COMPONENT_STATUS','','',0),
 (173,'WEB_SCR_LOGIN',NULL,NULL,0),
 (174,'WEB_LCT_LOGIN',NULL,NULL,0),
 (175,'WEB_FLS_SYSTEM_IMAGES_UPLOAD',NULL,NULL,0),
 (176,'WEB_FLS_SYSTEM_IMAGES_VIEW',NULL,NULL,0),
 (177,'WEB_FLS_SYSTEM_LOGO_UPLOAD',NULL,NULL,0),
 (178,'WEB_FLS_SYSTEM_LOGO_VIEW',NULL,NULL,0),
 (179,'WEB_CH1_LOGIN',NULL,NULL,0),
 (180,'WEB_CH1_SESSION_NEW',NULL,NULL,0),
 (181,'WEB_CH1_SESSION_VIEW',NULL,NULL,0),
 (182,'WEB_CH2_LOGIN',NULL,NULL,0),
 (183,'WEB_CH2_SESSION_NEW',NULL,NULL,0),
 (184,'WEB_CH2_SESSION_VIEW',NULL,NULL,0),
 (185,'WEB_CH1_SESSION_CANCEL',NULL,NULL,0),
 (186,'WEB_CH1_SESSION_JOIN',NULL,NULL,0),
 (187,'WEB_CH1_SESSION_EXIT',NULL,NULL,0),
 (188,'WEB_CH1_SESSION_HOST',NULL,NULL,0),
 (189,'WEB_CH1_SESSION_RELEASE_HOST',NULL,NULL,0),
 (190,'WEB_CH1_SESSION_PAUSE',NULL,NULL,0),
 (191,'WEB_CH1_SESSION_CONTINUE',NULL,NULL,0),
 (192,'WEB_CH1_GAME_NEW',NULL,NULL,0),
 (193,'WEB_CH1_GAME_UPDATE',NULL,NULL,0),
 (194,'WEB_CH1_GAME_CLOSE',NULL,NULL,0),
 (195,'WEB_CH1_GAME_PAUSE',NULL,NULL,0),
 (196,'WEB_CH1_GAME_CONTINUE',NULL,NULL,0),
 (197,'WEB_CH1_GAME_EXIT',NULL,NULL,0),
 (198,'WEB_CH1_GAME_OPEN',NULL,NULL,0),
 (199,'WEB_CH1_SESSION_MANAGE',NULL,NULL,0),
 (200,'WEB_CH1_SESSION_DISCONNECT',NULL,NULL,0),
 (201,'WEB_CH1_SESSION_IDLE_VIEW',NULL,NULL,0),
 (202,'WEB_CH1_GAME_BOARD',NULL,NULL,0),
 (203,'WEB_TICKET_LOGIN',NULL,NULL,0),
 (204,'WEB_SEATS_LOGIN',NULL,NULL,0),
 (205,'WEB_SEATS_TICKET_CREATE',NULL,NULL,0),
 (206,'WEB_SEATS_GAME_BOARD',NULL,NULL,0),
 (207,'WEB_PLY_BINGOSTAR_PLAYER_VIEW',NULL,NULL,0),
 (208,'WEB_PLY_BINGOSTAR_IMPORT',NULL,NULL,0),
 (209,'WEB_PLY_BINGOSTAR_UPDATE',NULL,NULL,0),
 (210,'WEB_PLY_EDGE_PLAYER_VIEW',NULL,NULL,0),
 (211,'WEB_PLY_EDGE_IMPORT',NULL,NULL,0),
 (212,'WEB_PLY_EDGE_UPDATE',NULL,NULL,0),
 (213,'WEB_PLY_CASINO_PLAYER_VIEW',NULL,NULL,0),
 (214,'WEB_PLY_CASINO_IMPORT',NULL,NULL,0),
 (215,'WEB_PLY_CASINO_UPDATE',NULL,NULL,0),
 (216,'WEB_POS_EVENT_ADMIN',NULL,NULL,0),
 (217,'WEB_RSV_RESERVATION_MANAGER',NULL,NULL,0),
 (218,'WEB_RSV_CONFIRMATION_MANAGER',NULL,NULL,0),
 (219,'WEB_RSV_MAIN_TICKET_MANAGER',NULL,NULL,0),
 (220,'WEB_SYS_LOGIN',NULL,NULL,0),
 (221,'WEB_SYS_SETTING_CATEGORY_VIEW',NULL,NULL,0),
 (222,'WEB_SYS_SETTING_CATEGORY_NEW',NULL,NULL,0),
 (223,'WEB_SYS_SETTING_CATEGORY_EDIT',NULL,NULL,0),
 (224,'WEB_SYS_SETTING_CATEGORY_DELETE',NULL,NULL,0),
 (225,'WEB_SYS_SETTING_VIEW',NULL,NULL,0),
 (226,'WEB_SYS_SETTING_NEW',NULL,NULL,0),
 (227,'WEB_SYS_SETTING_EDIT',NULL,NULL,0),
 (228,'WEB_SYS_SETTING_DELETE',NULL,NULL,0),
 (229,'WEB_SYS_PLAYER_INTERFACE_VIEW',NULL,NULL,0),
 (230,'WEB_SYS_PLAYER_INTERFACE_NEW',NULL,NULL,0),
 (231,'WEB_SYS_PLAYER_INTERFACE_EDIT',NULL,NULL,0),
 (232,'WEB_SYS_PLAYER_INTERFACE_DELETE',NULL,NULL,0),
 (233,'WEB_SYS_PLAYER_INTERFACE_STATUS',NULL,NULL,0),
 (234,'WEB_SYS_PLAYER_INTERFACE_TYPE_VIEW',NULL,NULL,0),
 (235,'WEB_SYS_PLAYER_INTERFACE_TYPE_NEW',NULL,NULL,0),
 (236,'WEB_SYS_PLAYER_INTERFACE_TYPE_EDIT',NULL,NULL,0),
 (237,'WEB_SYS_PLAYER_INTERFACE_TYPE_DELETE',NULL,NULL,0),
 (238,'WEB_PLY_BINGOSTAR_INTERFACE',NULL,NULL,0),
 (239,'WEB_PLY_EDGE_INTERFACE',NULL,NULL,0),
 (240,'WEB_PLY_CASINO_INTERFACE',NULL,NULL,0),
 (241,'WEB_SYS_PAYMENT_TYPE_VIEW',NULL,NULL,0),
 (242,'WEB_SYS_PAYMENT_TYPE_NEW',NULL,NULL,0),
 (243,'WEB_SYS_PAYMENT_TYPE_EDIT',NULL,NULL,0),
 (244,'WEB_SYS_PAYMENT_TYPE_DELETE',NULL,NULL,0),
 (245,'WEB_DSC_DISCOUNT_VIEW',NULL,NULL,0),
 (246,'WEB_DSC_DISCOUNT_NEW',NULL,NULL,0),
 (247,'WEB_DSC_DISCOUNT_EDIT',NULL,NULL,0),
 (248,'WEB_DSC_DISCOUNT_DELETE',NULL,NULL,0),
 (249,'WEB_DSC_LOGIN',NULL,NULL,0),
 (250,'WEB_DSC_LEVEL_VIEW',NULL,NULL,0),
 (251,'WEB_DSC_LEVEL_NEW',NULL,NULL,0),
 (252,'WEB_DSC_LEVEL_EDIT',NULL,NULL,0),
 (253,'WEB_DSC_LEVEL_DELETE',NULL,NULL,0),
 (254,'WEB_DSC_LIMIT_VIEW',NULL,NULL,0),
 (255,'WEB_DSC_LIMIT_NEW',NULL,NULL,0),
 (256,'WEB_DSC_LIMIT_EDIT',NULL,NULL,0),
 (257,'WEB_DSC_LIMIT_DELETE',NULL,NULL,0),
 (258,'WEB_DSC_CONDITION_VIEW',NULL,NULL,0),
 (259,'WEB_DSC_CONDITION_NEW',NULL,NULL,0),
 (260,'WEB_DSC_CONDITION_EDIT',NULL,NULL,0),
 (261,'WEB_DSC_CONDITION_DELETE',NULL,NULL,0),
 (262,'WEB_DSC_DISCOUNT_EVENT_VIEW',NULL,NULL,0),
 (263,'WEB_DSC_DISCOUNT_EVENT_NEW',NULL,NULL,0),
 (264,'WEB_DSC_DISCOUNT_EVENT_EDIT',NULL,NULL,0),
 (265,'WEB_DSC_DISCOUNT_EVENT_DELETE',NULL,NULL,0),
 (266,'WEB_DSC_DISCOUNT_GENERAL_VIEW',NULL,NULL,0),
 (267,'WEB_DSC_CONDITION_MANAGER',NULL,NULL,0),
 (268,'WEB_DSC_DISCOUNT_EVENT_DATE',NULL,NULL,0),
 (269,'WEB_DSC_DISCOUNT_EVENT_NAME',NULL,NULL,0),
 (270,'WEB_RSV_TICKET_DISCOUNT_VIEW','','',0),
 (271,'WEB_RSV_TICKET_DISCOUNT_EDIT',NULL,NULL,0),
 (272,'WEB_RSV_TICKET_DISCOUNT_NEW',NULL,NULL,0),
 (273,'WEB_RSV_TICKET_DISCOUNT_REMOVE','','',0),
 (274,'WEB_RSV_MAIN_TICKET_EMAIL_VIEW','','',0),
 (275,'WEB_RSV_EVENT_LINK_VIEW','','',0),
 (276,'WEB_RSV_MAIN_TICKET_PAYMENT_UPDATE',NULL,NULL,0);
/*!40000 ALTER TABLE `web_usr_permission_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_user_groups`
--

DROP TABLE IF EXISTS `web_usr_user_groups`;
CREATE TABLE `web_usr_user_groups` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_group_id`)
) ;

--
-- Dumping data for table `web_usr_user_groups`
--

/*!40000 ALTER TABLE `web_usr_user_groups` DISABLE KEYS */;
INSERT INTO `web_usr_user_groups` (`user_group_id`,`group_id`,`user_id`) VALUES 
 (1,1,1);
/*!40000 ALTER TABLE `web_usr_user_groups` ENABLE KEYS */;


--
-- Definition of table `web_usr_user_info`
--

DROP TABLE IF EXISTS `web_usr_user_info`;
CREATE TABLE `web_usr_user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `staff_id` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `password_creation_datestamp` date DEFAULT '0000-00-00',
  `company_id` int(11) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `charity_id` int(11) DEFAULT NULL,
  `terminate` int(11) NOT NULL DEFAULT '0',
  `log` int(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) NOT NULL DEFAULT '',
  `last_login` datetime DEFAULT NULL,
  `user_creation_datestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_tm_id` int(11) DEFAULT NULL,
  `a_tm_password` varchar(100) DEFAULT NULL,
  `a_department_id` int(11) DEFAULT NULL,
  `a_adm_type_id` int(11) DEFAULT NULL,
  `a_permission_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_namekey` (`user_name`),
  UNIQUE KEY `user_id` (`user_id`)
) ;

--
-- Dumping data for table `web_usr_user_info`
--

/*!40000 ALTER TABLE `web_usr_user_info` DISABLE KEYS */;
INSERT INTO `web_usr_user_info` (`user_id`,`user_name`,`first_name`,`last_name`,`staff_id`,`password`,`password_creation_datestamp`,`company_id`,`hall_id`,`charity_id`,`terminate`,`log`,`email`,`phone`,`last_login`,`user_creation_datestamp`,`a_tm_id`,`a_tm_password`,`a_department_id`,`a_adm_type_id`,`a_permission_group_id`) VALUES 
 (1,'FortuNetManager','FortuNet','Manager','','2abd55e001c524cb2cf6300a89ca6366848a77d5','2013-11-13',1,0,0,0,0,'','','2014-09-29 15:54:52','2013-08-01 16:05:08',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `web_usr_user_info` ENABLE KEYS */;


--
-- Definition of table `web_usr_user_remote_address`
--

DROP TABLE IF EXISTS `web_usr_user_remote_address`;
CREATE TABLE `web_usr_user_remote_address` (
  `user_remote_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `remote_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_remote_address_id`)
) ;

--
-- Dumping data for table `web_usr_user_remote_address`
--

/*!40000 ALTER TABLE `web_usr_user_remote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_usr_user_remote_address` ENABLE KEYS */;

DROP TABLE IF EXISTS `web_sys_event_category_info`;
CREATE TABLE  `web_sys_event_category_info` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ;

DROP TABLE IF EXISTS `web_sys_event_categories`;
CREATE TABLE  `web_sys_event_categories` (
  `event_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT '0',
  `event_id` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`event_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
