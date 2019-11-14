
#Added DETERMINISTIC
DROP FUNCTION IF EXISTS `ftn_database_version`;
DROP PROCEDURE IF EXISTS `ftn_database_update`;
DROP PROCEDURE IF EXISTS `ftn_database_update_process`;

DELIMITER $$

CREATE FUNCTION `ftn_database_version` ()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ScriptNumber int DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET ScriptNumber = 0;
    SELECT database_script_number INTO ScriptNumber
    FROM web_database_version
    ORDER BY database_script_number DESC
    LIMIT 1;
	RETURN ScriptNumber;
END$$

CREATE PROCEDURE `ftn_database_update`(
    out po_ScriptNumber int(11))

BEGIN
	DECLARE ScriptNumber int DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		INSERT INTO `web_database_version_log` (`database_script_number`,`description`) VALUES
			(ScriptNumber,'Script Error');
		SET po_ScriptNumber = -1;
	END;

	SET ScriptNumber = ftn_database_version();

	IF ScriptNumber=0 THEN
		CREATE TABLE IF NOT EXISTS `web_database_version` (
			`database_version_id` int(11) NOT NULL AUTO_INCREMENT,
			`database_version_name` varchar(255) NOT NULL DEFAULT '',
			`database_script_number` int(11) DEFAULT '0',
			`database_update` date NOT NULL DEFAULT '0000-00-00',
			`description` text,
			`transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			PRIMARY KEY (`database_version_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		CREATE TABLE IF NOT EXISTS `web_database_version_log` (
			`database_version_log_id` int(11) NOT NULL AUTO_INCREMENT,
			`database_script_number` int(11) DEFAULT '0',
			`description` text,
			`transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			PRIMARY KEY (`database_version_log_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('1.0.0',1,20130814,'Initial Database Script');
		SET po_ScriptNumber = 1;
	ELSEIF ScriptNumber=1 THEN
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.0',2,20130814,'Second Load');
		SET po_ScriptNumber = 2;
	ELSEIF ScriptNumber=2 THEN
		DROP TABLE IF EXISTS `web_trn_interface_ledger`;
		CREATE TABLE  `web_trn_interface_ledger` (
		  `interface_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
		  `barcode` varchar(255) NOT NULL DEFAULT '0',
		  `usr_log_id` int(11) NOT NULL DEFAULT '0',
		  `user_id` int(11) NOT NULL DEFAULT '0',
		  `player_id` int(11) NOT NULL DEFAULT '0',
		  `mode` varchar(255) NOT NULL DEFAULT '',
		  `reponse` varchar(255) NOT NULL DEFAULT '',
		  `transaction_type_id` int(11) DEFAULT '0',
		  `transaction_status_id` int(11) DEFAULT '1',
		  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  PRIMARY KEY (`interface_ledger_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.1',3,20130821,'Added Interface Ledger');
		SET po_ScriptNumber = 3;
	ELSEIF ScriptNumber=3 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_fls_file_info ADD COLUMN file_type	varchar(50) NULL DEFAULT NULL AFTER section_name;
		ALTER TABLE web_ply_players_info MODIFY COLUMN account_number varchar(50) NULL DEFAULT '0';
		ALTER TABLE web_ply_players_info MODIFY COLUMN card varchar(50) DEFAULT NULL;
		ALTER TABLE web_ply_players_info MODIFY COLUMN address_1 varchar(50) DEFAULT NULL;
		ALTER TABLE web_ply_players_info MODIFY COLUMN address_2 varchar(50) DEFAULT NULL;
		ALTER TABLE web_ply_players_info MODIFY COLUMN city varchar(50) DEFAULT NULL;
		ALTER TABLE web_ply_players_info MODIFY COLUMN home_phone varchar(50) DEFAULT NULL;
		ALTER TABLE web_ply_players_info MODIFY COLUMN work_phone varchar(50) DEFAULT NULL;
		ALTER TABLE web_ply_players_info ADD COLUMN extra_phone varchar(50) DEFAULT NULL AFTER work_phone;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.2',ScriptNumber,20130827,'Modify Player and File information');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=4 THEN
		SET ScriptNumber=ScriptNumber+1;
		CREATE TABLE IF NOT EXISTS `web_ply_player_company` (
		  `player_company_id` int(11) NOT NULL AUTO_INCREMENT,
		  `player_id` int(11) DEFAULT NULL,
		  `company_id` int(11) DEFAULT NULL,
		  `status` varchar(50) DEFAULT NULL,
		  `remove_user_id` int(11) DEFAULT NULL,
		  `remove_datetime` datetime DEFAULT NULL,
		  PRIMARY KEY (`player_company_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;				
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.3',ScriptNumber,20130906,'Added Player company relation information');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=5 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_trn_confirmation_ledger ADD COLUMN `ticket_id` INT(11) NOT NULL DEFAULT '0' AFTER reservation_ledger_id;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.4',ScriptNumber,20130920,'Added Ticket ID to Confirmation Ledger table');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=6 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_trn_event_ledger ADD COLUMN `section` varchar(255) DEFAULT '1' AFTER price;
		ALTER TABLE web_trn_event_ledger ADD COLUMN `identifier` varchar(255) DEFAULT '1' AFTER section;
		ALTER TABLE web_trn_event_ledger ADD COLUMN `top` int(11) DEFAULT '1' AFTER identifier;
		ALTER TABLE web_trn_event_ledger ADD COLUMN `left` int(11) DEFAULT '1' AFTER top;
		ALTER TABLE web_trn_event_ledger ADD COLUMN `height` int(11) DEFAULT '1' AFTER `left`;
		ALTER TABLE web_trn_event_ledger ADD COLUMN `width` int(11) DEFAULT '1' AFTER height;
		UPDATE web_trn_event_ledger wtel, web_rsv_room_components wrrc
		SET wtel.section = wrrc.section,
		wtel.identifier = wrrc.identifier,
		wtel.top = wrrc.top,
		wtel.left = wrrc.left,
		wtel.width = wrrc.width,
		wtel.height = wrrc.height
		WHERE wtel.room_component_id = wrrc.room_component_id;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.5',ScriptNumber,20131014,'Added fields to modify scheduled events');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=7 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_rsv_event_info ADD COLUMN `event_type` varchar(255) DEFAULT '' AFTER event_description;
		UPDATE web_rsv_event_info SET `event_type`  = `status`;
		UPDATE web_rsv_event_info SET `status`  = 'active';
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.6',ScriptNumber,20131017,'Added event type');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=8 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_trn_confirmation_ledger ADD reference_type VARCHAR(50) DEFAULT NULL AFTER description;
		ALTER TABLE web_trn_confirmation_ledger ADD reference_number VARCHAR(50) DEFAULT NULL AFTER reference_type;

		ALTER TABLE web_trn_interface_ledger ADD reference_type VARCHAR(50) DEFAULT NULL AFTER barcode;
		ALTER TABLE web_trn_interface_ledger ADD reference_number VARCHAR(50) DEFAULT NULL AFTER reference_type;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.7',ScriptNumber,20131024,'Added confirmation reference number');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=9 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_trn_confirmation_ledger ADD player_name VARCHAR(255) DEFAULT NULL AFTER player_id;
		ALTER TABLE web_trn_confirmation_ledger ADD player_card VARCHAR(50) DEFAULT NULL AFTER player_name;
		ALTER TABLE web_trn_confirmation_ledger ADD player_account VARCHAR(50) DEFAULT NULL AFTER player_card;

		ALTER TABLE web_trn_reservation_ledger ADD player_name VARCHAR(255) DEFAULT NULL AFTER player_id;
		ALTER TABLE web_trn_reservation_ledger ADD player_card VARCHAR(50) DEFAULT NULL AFTER player_name;
		ALTER TABLE web_trn_reservation_ledger ADD player_account VARCHAR(50) DEFAULT NULL AFTER player_card;

		ALTER TABLE web_rsv_ticket_info ADD player_name VARCHAR(255) DEFAULT NULL AFTER player_id;
		ALTER TABLE web_rsv_ticket_info ADD player_card VARCHAR(50) DEFAULT NULL AFTER player_name;
		ALTER TABLE web_rsv_ticket_info ADD player_account VARCHAR(50) DEFAULT NULL AFTER player_card;
		
		UPDATE web_trn_reservation_ledger wtrl, web_ply_players_info wppi
		SET wtrl.player_name = CONCAT(first_name, ' ' , last_name),
		wtrl.player_card = card,
		wtrl.player_account = account_number
		WHERE wtrl.player_id = wppi.player_id;

		UPDATE web_rsv_ticket_info wrti, web_ply_players_info wppi
		SET wrti.player_name = CONCAT(first_name, ' ' , last_name),
		wrti.player_card = card,
		wrti.player_account = account_number
		WHERE wrti.player_id = wppi.player_id;

		UPDATE web_trn_confirmation_ledger wrci, web_ply_players_info wppi
		SET wrci.player_name = CONCAT(first_name, ' ' , last_name),
		wrci.player_card = card,
		wrci.player_account = account_number
		WHERE wrci.player_id = wppi.player_id;

		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.8',ScriptNumber,20131028,'Added player interface snapshots (tickets, reservation and confirmation ledger)');		
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=10 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE web_trn_interface_ledger ADD player_card VARCHAR(255) DEFAULT NULL AFTER reference_number;
		ALTER TABLE web_trn_interface_ledger ADD `format` VARCHAR(50) DEFAULT NULL AFTER `mode`;
		ALTER TABLE web_trn_interface_ledger ADD `remote_address` VARCHAR(50) DEFAULT NULL AFTER `player_card`;
		ALTER TABLE web_trn_interface_ledger ADD description VARCHAR(255) DEFAULT NULL AFTER reponse;
		ALTER TABLE web_trn_interface_ledger CHANGE reponse response varchar (255) DEFAULT NULL;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.9',ScriptNumber,20131105,'Added fields to ticket interface');		
		SET po_ScriptNumber = ScriptNumber;	
	ELSEIF ScriptNumber=11 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		CREATE TABLE IF NOT EXISTS `web_usr_user_remote_address` (
		  `user_remote_address_id` int(11) NOT NULL AUTO_INCREMENT,
		  `user_id` int(11) DEFAULT NULL,
		  `remote_address` varchar(50) DEFAULT NULL,		  
		  PRIMARY KEY (`user_remote_address_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;	
		
		CREATE TABLE IF NOT EXISTS `web_rsv_event_sessions` (
		  `event_session_id` int(11) NOT NULL AUTO_INCREMENT,
		  `event_id` int(11) DEFAULT NULL,
		  `session_number` varchar(50) DEFAULT NULL,		  
		  PRIMARY KEY (`event_session_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;	
		
		ALTER TABLE web_trn_interface_ledger ADD `hall` VARCHAR(255) DEFAULT NULL AFTER `player_card`;
		ALTER TABLE web_trn_interface_ledger ADD `session` VARCHAR(50) DEFAULT NULL AFTER `hall`;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.10',ScriptNumber,20131106,'Added remote address connection and session # for events');		
		SET po_ScriptNumber = ScriptNumber;	
	ELSEIF ScriptNumber=12 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		ALTER TABLE `web_usr_log_info` MODIFY COLUMN `remote_address` VARCHAR(50) DEFAULT NULL;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.11',ScriptNumber,20131206,'Expanded web_usr_log_info.remote_address  to support IP6');		
		SET po_ScriptNumber = ScriptNumber;	
	ELSEIF ScriptNumber=13 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		CREATE TABLE  `web_usr_log_exceptions` (
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
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.12',ScriptNumber,20131206,'Added user exceptions table');		
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=14 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		ALTER TABLE `web_fls_file_info` ADD COLUMN `public_name` VARCHAR(50) DEFAULT NULL AFTER `file_name`;
		ALTER TABLE `web_ply_players_info` ADD COLUMN `player_type` VARCHAR(50) DEFAULT NULL AFTER `player_id`;
		ALTER TABLE `web_ply_player_company` ADD COLUMN `player_type` VARCHAR(50) DEFAULT NULL AFTER `player_id`;
		
		UPDATE `web_usr_permission_info` SET `permission_name` = 'WEB_RSV_SPECIAL_RESERVATIONS' WHERE `permission_name` = 'WEB_RSV_SPECIAL_EVENTS';   
		UPDATE `web_usr_permission_info` SET `permission_name` = 'WEB_RSV_DAILY_RESERVATIONS' WHERE `permission_name` = 'WEB_RSV_DAILY_SESSIONS';   
						
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.13',ScriptNumber,20131209,'Added player type column, Added file public name');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=15 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		ALTER TABLE `web_usr_application_info` ADD COLUMN `application_type` VARCHAR(50) DEFAULT NULL AFTER `application_friendly_name`;
		ALTER TABLE `web_usr_application_info` ADD COLUMN `application_order` INT(11) DEFAULT '0' AFTER `application_type`;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.14',ScriptNumber,20131223,'Added application type and order column');
		
		DROP TABLE IF EXISTS `web_usr_log_connection`;
		CREATE TABLE  `web_usr_log_connection` (
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
		  `removed_transaction_id` int(11) NULL DEFAULT NULL,
		  PRIMARY KEY (`usr_log_connection_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
		  `removed_transaction_id` int(11) NULL DEFAULT NULL,
		  PRIMARY KEY (`usr_log_message_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_ch1_session_info`;
		CREATE TABLE  `web_ch1_session_info` (
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
		  `removed_transaction_id` int(11) NULL DEFAULT NULL,
		  PRIMARY KEY (`ch1_session_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_usr_log_session_transaction`;
		DROP TABLE IF EXISTS `web_ch1_session_transaction`;
		CREATE TABLE  `web_ch1_session_transaction` (
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
		  `removed_transaction_id` int(11) NULL DEFAULT NULL,
		  PRIMARY KEY (`ch1_session_transaction_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_usr_log_game_transaction`;
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
		  `game_number` INT(11) DEFAULT NULL,
		  `transaction_type` varchar(255) DEFAULT NULL,
		  `transaction_status` varchar(255) DEFAULT NULL,
		  `transaction_value` varchar(255) DEFAULT NULL,
		  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  `closed_transaction_id` int(11) NULL DEFAULT NULL,
		  `removed_transaction_id` int(11) NULL DEFAULT NULL,
		  PRIMARY KEY (`ch1_game_transaction_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
		`database_update`,`description`) VALUES
		('2.0.15',ScriptNumber,20131223,'Added message, session, game log');		
		
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=16 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `update`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `age_rng_id`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `group_id`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `spouse_id`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `level_id`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `hall_id`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `address_1`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `address_2`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `city`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `zip_code`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `country`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `state`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `home_phone`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `work_phone`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `extra_phone`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `oasis_customer_id`;
		ALTER TABLE `web_ply_players_info` DROP COLUMN `pin`;

		ALTER TABLE `web_ply_players_info` ADD COLUMN `player_interface_id` INT(11) DEFAULT NULL AFTER `player_type`;
		ALTER TABLE `web_ply_players_info` ADD COLUMN `interface_player_id` INT(11) DEFAULT NULL AFTER `player_interface_id`;

		ALTER TABLE`web_ply_players_address` MODIFY COLUMN `city` VARCHAR(50) DEFAULT NULL,
		MODIFY COLUMN `state` VARCHAR(50) DEFAULT NULL;
 
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,
				`database_update`,`description`) VALUES
				('2.0.16',ScriptNumber,20140121,'Added player interface tables');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=17 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		DROP TABLE IF EXISTS `web_sys_setting_category`;
		CREATE TABLE  `web_sys_setting_category` (
		  `setting_category_id` int(11) NOT NULL AUTO_INCREMENT,
		  `setting_category_type` varchar(255) DEFAULT '',
		  `setting_category_name` varchar(255) DEFAULT NULL,
		  `setting_category_desription` varchar(255) DEFAULT '',
		  PRIMARY KEY (`setting_category_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_sys_setting_info`;
		CREATE TABLE  `web_sys_setting_info` (
		  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
		  `setting_category_id` int(11) DEFAULT '0',
		  `setting_type` varchar(255) DEFAULT '',
		  `setting_name` varchar(255) DEFAULT NULL,
		  `setting_value` varchar(255) DEFAULT '',
		  `setting_description` varchar(255) DEFAULT '',
		  PRIMARY KEY (`setting_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_sys_player_interface_type`;
		CREATE TABLE  `web_sys_player_interface_type` (
		  `player_interface_type_id` int(11) NOT NULL AUTO_INCREMENT,
		  `player_interface_type_name` varchar(255) DEFAULT NULL,
		  `player_interface_type_description` varchar(255) DEFAULT '',
		  PRIMARY KEY (`player_interface_type_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		
		DROP TABLE IF EXISTS `web_sys_player_interface`;
		CREATE TABLE  `web_sys_player_interface` (
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
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;		
		
		RENAME TABLE web_ply_player_interface TO web_ply_interface_ledger;
		
		DROP TABLE IF EXISTS `web_ply_player_interface`;
		DROP TABLE IF EXISTS `web_ply_interface_ledger`;

		CREATE TABLE  `web_ply_interface_ledger` (
		  `interface_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
		  `player_interface_id` INT(11) DEFAULT NULL,
		  `interface_player_id` INT(11) DEFAULT NULL,
		  `player_id` INT(11) DEFAULT -1,
		  `user_id` INT(11) DEFAULT NULL,
		  `note_description` varchar(255) DEFAULT NULL,
		  `status` varchar(50) DEFAULT NULL,
		  `remove_user_id` int(11) DEFAULT NULL,
		  `remove_datetime` datetime DEFAULT NULL,
		  `transaction_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  PRIMARY KEY (`interface_ledger_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		
		RENAME TABLE web_ply_players_address TO web_ply_player_addresses;
		RENAME TABLE web_ply_players_phone TO web_ply_player_phones;
		RENAME TABLE web_ply_players_info TO web_ply_player_info;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.17',ScriptNumber,20140131,'Added system settings. Organized player tables');
		SET po_ScriptNumber = ScriptNumber;
	ELSEIF ScriptNumber=18 THEN
		SET ScriptNumber=ScriptNumber+1;
		UPDATE `web_usr_application_info`
		SET `application_type` = 'Main'
		WHERE `application_type` = '' OR `application_type` IS NULL ;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.18',ScriptNumber,20140414,'Update system settings sections');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=19 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_ply_player_notes` ADD COLUMN `note_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `user_id`;
		ALTER TABLE `web_ply_player_info` MODIFY COLUMN `gender` varchar(6) DEFAULT NULL;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.19',ScriptNumber,20140623,'Added player notes datetime stamp');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=20 THEN
		SET ScriptNumber=ScriptNumber+1;
		
		DROP TABLE IF EXISTS `web_dsc_discount_info`;
		CREATE TABLE  `web_dsc_discount_info` (
		  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
		  `discount_name` varchar(255) DEFAULT NULL,
		  `discount_description` varchar(255) DEFAULT NULL,
		  `display_order` int(11) NOT NULL DEFAULT '0',
		  `discount_from` date DEFAULT NULL,
		  `discount_to` date DEFAULT NULL,
		  `discount_type_id` int(11) DEFAULT 1,
		  `discount_value` decimal(11,2) DEFAULT 0,
		  `discount_limit` INT(11)  NOT NULL DEFAULT 0,
		  `retired` int(11) NOT NULL DEFAULT 0,
		  PRIMARY KEY (`discount_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_dsc_discount_conditions`;
		CREATE TABLE  `web_dsc_discount_conditions` (
		  `discount_condition_id` int(11) NOT NULL AUTO_INCREMENT,
		  `discount_id` int(11) DEFAULT '0',
		  `condition_type_id` int(11) DEFAULT '0',  
		  `condition_value` varchar(255) DEFAULT NULL,
		  PRIMARY KEY (`discount_condition_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


		DROP TABLE IF EXISTS `web_enum_condition_type`;
		CREATE TABLE  `web_enum_condition_type` (
		  `condition_type_id` int(11) NOT NULL AUTO_INCREMENT,
		  `condition_type_name` varchar(255) DEFAULT NULL,
		  `condition_type_description` text,
		  `display_order` int(11) DEFAULT '1',
		  PRIMARY KEY (`condition_type_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_enum_discount_type`;
		CREATE TABLE  `web_enum_discount_type` (
		  `discount_type_id` int(11) NOT NULL AUTO_INCREMENT,
		  `discount_type_name` varchar(255) DEFAULT NULL,
		  `discount_type_description` text,
		  `display_order` int(11) DEFAULT '1',
		  PRIMARY KEY (`discount_type_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

		DROP TABLE IF EXISTS `web_enum_round_type`;
		CREATE TABLE  `web_enum_round_type` (
		  `round_type_id` int(11) NOT NULL AUTO_INCREMENT,
		  `round_type_name` varchar(100) NOT NULL DEFAULT '',
		  `display_order` int(11) DEFAULT '1',
		  PRIMARY KEY (`round_type_id`)
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

		INSERT INTO `web_enum_condition_type` 
		(condition_type_id,condition_type_name,condition_type_description,display_order)
		VALUES
		(1,'Event Name','Event Name',1),
		(2,'Event Date','Event Date',2),
		(3,'Minimum Events','Minimum number of Events',3),
		(4,'Maximum Events','Maximum number of Events',4),
		(5,'Minimum Reservations','Minimum number of Reservations',5),
		(6,'Maximum Reservations','Maximum number of Reservations',6),
		(7,'Minimum Spend','Minimum number of Spend',7),
		(8,'Maximum Spend','Maximum number of Spend',8);

		INSERT INTO `web_enum_round_type`
		(round_type_id, round_type_name,display_order)
		VALUES
		(1,'None',1),
		(2,'Up',2),
		(3,'Down',3),
		(4,'Standard',4),
		(5,'2 Decimals',5);

		INSERT INTO `web_enum_discount_type`
		(discount_type_id, discount_type_name, discount_type_description, display_order)
		VALUES
		(1,'Money','Flat amount',1),
		(2,'Percentage','Percentage amount',2),
		(3,'Points','Credit/Points',3),
		(4,'Merchandise','Merchandise Item',4);

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
				) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		DROP TABLE IF EXISTS `web_rsv_ticket_discounts`;

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
		) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

		INSERT INTO `web_trn_ticket_payments`
		(`ticket_payment_id`,`ticket_id`,`user_id`,`payment_type_id`,`payment_code`,`payment_name`,`payment_description`,`payment_amount`,`status`,
		`payment_datetime`,`remove_user_id`,`remove_datetime`)
		SELECT 
		(`ticket_payment_id`,`ticket_id`,`user_id`,`payment_type_id`,`payment_code`,`payment_name`,`payment_description`,`payment_amount`,`status`,
		`payment_datetime`,`remove_user_id`,`remove_datetime`)
		FROM `web_rsv_ticket_payments`;

		DROP TABLE IF EXISTS `web_rsv_ticket_payments`;

		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.20',ScriptNumber,20140721,'Added ticket discount module');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=21 THEN
		SET ScriptNumber=ScriptNumber+1;
		CREATE TABLE  `web_trn_ticket_receipt` (
		  `ticket_receipt_id` int(11) NOT NULL AUTO_INCREMENT,
		  `ticket_id` int(11) NOT NULL DEFAULT '0',
		  `usr_log_id` int(11) NOT NULL DEFAULT '0',
		  `user_id` int(11) NOT NULL DEFAULT '0',
		  `player_id` int(11) NOT NULL DEFAULT '0',
		  `file_name` varchar(255) NOT NULL DEFAULT '',
		  `file_extension` VARCHAR(3) DEFAULT 'pdf',
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
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		
		CREATE TABLE  `web_trn_reservation_receipt` (
		  `reservation_receipt_id` int(11) NOT NULL AUTO_INCREMENT,
		  `reservation_ledger_id` int(11) NOT NULL DEFAULT '0',
		  `usr_log_id` int(11) NOT NULL DEFAULT '0',
		  `user_id` int(11) NOT NULL DEFAULT '0',
		  `player_id` int(11) NOT NULL DEFAULT '0',
		  `file_name` varchar(255) NOT NULL DEFAULT '',
		  `file_extension` VARCHAR(3) DEFAULT 'pdf',
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
		  KEY `Index_FileHash`(`file_hash`) 
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		
		CREATE TABLE  `web_trn_ticket_email` (
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
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.21',ScriptNumber,20141003,'Added ticket and reservation receipt tables');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=22 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_enum_payment_type` ADD COLUMN `payment_type_short_name` VARCHAR(45) AFTER `payment_type_name`;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.22',ScriptNumber,20141015,'Added payment_type short_name');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=23 THEN
		SET ScriptNumber=ScriptNumber+1;
		CREATE TABLE  `web_trn_ticket_discount_items` (
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
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.23',ScriptNumber,20141017,'Added ticket_discount_items to assign discount by reservation');
		SET po_ScriptNumber = ScriptNumber;			
	ELSEIF ScriptNumber=24 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_rsv_event_description` MODIFY COLUMN `confirmation_footer` VARCHAR(255) DEFAULT NULL;
		ALTER TABLE `web_ply_player_info` ADD COLUMN `interface_player_id` INT(11) DEFAULT NULL AFTER `player_interface_id`;
		ALTER TABLE `web_ply_player_info` ADD INDEX `Index_PlayerName`(`first_name`, `last_name`);
		UPDATE web_ply_player_info set `status` = 'Active';
		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.24',ScriptNumber,20141212,'Added more space to confirmation footer and work on player info table');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=25 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_rsv_ticket_info` ADD COLUMN `remove_datetime` DATETIME DEFAULT NULL AFTER `ticket_datetime`;		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.25',ScriptNumber,20150206,'Added ticket remove datetime');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=26 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_trn_ticket_reservations` ADD COLUMN `event_id` INT(11) DEFAULT '0' AFTER `ticket_id`;
		ALTER TABLE `web_trn_ticket_reservations` ADD COLUMN `company_id` INT(11) DEFAULT '0' AFTER `event_id`;
		ALTER TABLE `web_trn_ticket_reservations` ADD COLUMN `user_id` INT(11) DEFAULT '0' AFTER `company_id`;
		ALTER TABLE `web_trn_ticket_reservations` ADD COLUMN `value` INT(11) DEFAULT '0' AFTER `event_id`;
		DROP TABLE IF EXISTS `web_enum_item_type`;
		CREATE TABLE `web_enum_item_type` (
		  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
		  `item_type_name` varchar(255) DEFAULT NULL,
		  `item_type_account` int(1) DEFAULT '0',
		  PRIMARY KEY (`item_type_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=latin1;

		INSERT INTO `web_enum_item_type` (`item_type_id`,`item_type_name`,`item_type_account`) VALUES 
		 (1,'General Item',1),
		 (2,'Bingo Paper',1),
		 (3,'Pull Tab',1),
		 (4,'Bundle',1),
		 (5,'Reservation',1),
		 (6,'Hand Held',1),
		 (7,'Confirmation',0),
		 (8,'Discount',-1);

		 INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.26',ScriptNumber,20150227,'Added Gift Certificate Company, Event and Value');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=27 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_enum_payment_type` ADD COLUMN `payment_interface` VARCHAR(50) DEFAULT '' AFTER `payment_type_description`;		
		ALTER TABLE `web_enum_payment_type` ADD COLUMN `status` VARCHAR(50) DEFAULT '' AFTER `payment_interface`;		
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.27',ScriptNumber,20150306,'Added payment interface status and identifier');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=28 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_enum_payment_type` ADD COLUMN `payment_option` TINYINT DEFAULT 1 AFTER `payment_display_order`;
		ALTER TABLE `web_enum_payment_type` ADD COLUMN `refund_option` TINYINT DEFAULT 0 AFTER `payment_option`;
		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.28',ScriptNumber,20150406,'Added payment and refund options configurable');
		SET po_ScriptNumber = ScriptNumber;		
	ELSEIF ScriptNumber=29 THEN
		SET ScriptNumber=ScriptNumber+1;
		ALTER TABLE `web_rsv_event_info` ADD COLUMN `report_option` TINYINT DEFAULT 1 AFTER `status`;
		
		DROP TABLE IF EXISTS `web_rsv_component_categories`;
		DROP TABLE IF EXISTS `web_rsv_category_events`;
		DROP TABLE IF EXISTS `web_rsv_category_info`;
 
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
		
		ALTER TABLE `web_enum_note_type` ADD COLUMN `note_private` INT(1) DEFAULT 0 AFTER `note_display_order`;
		ALTER TABLE `web_enum_note_type` ADD COLUMN `active` INT(1) DEFAULT 1 AFTER `note_private`;

		INSERT INTO `web_database_version` (`database_version_name`,`database_script_number`,`database_update`,`description`) VALUES
		('2.0.29',ScriptNumber,20150428,'Added report option and event categories');
		SET po_ScriptNumber = ScriptNumber;		
	ELSE
		SET po_ScriptNumber = -1;
	END IF;
END$$

CREATE PROCEDURE `ftn_database_update_process`(
    in pi_ScriptNumber int(11))
BEGIN
    DECLARE ScriptNumberProcess int DEFAULT 0;
    WHILE ScriptNumberProcess != -1 AND ScriptNumberProcess < pi_ScriptNumber DO
      CALL ftn_database_update(ScriptNumberProcess);
    END WHILE;
END$$

DELIMITER ;

CALL ftn_database_update_process(29);

DROP FUNCTION IF EXISTS `ftn_database_version`;
DROP PROCEDURE IF EXISTS `ftn_database_update`;
DROP PROCEDURE IF EXISTS `ftn_database_update_process`;