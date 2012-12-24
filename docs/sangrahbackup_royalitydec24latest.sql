/*
SQLyog Community Edition- MySQL GUI v8.05 
MySQL - 5.0.27-community-nt : Database - sangrahpos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`sangrahpos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sangrahpos`;

/*Table structure for table `com_vtiger_workflow_activatedonce` */

DROP TABLE IF EXISTS `com_vtiger_workflow_activatedonce`;

CREATE TABLE `com_vtiger_workflow_activatedonce` (
  `workflow_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY  (`workflow_id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflow_activatedonce` */

/*Table structure for table `com_vtiger_workflows` */

DROP TABLE IF EXISTS `com_vtiger_workflows`;

CREATE TABLE `com_vtiger_workflows` (
  `workflow_id` int(11) NOT NULL auto_increment,
  `module_name` varchar(100) default NULL,
  `summary` varchar(400) NOT NULL,
  `test` text,
  `execution_condition` int(11) NOT NULL,
  `defaultworkflow` int(1) default NULL,
  PRIMARY KEY  (`workflow_id`),
  UNIQUE KEY `com_vtiger_workflows_idx` (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflows` */

insert  into `com_vtiger_workflows`(`workflow_id`,`module_name`,`summary`,`test`,`execution_condition`,`defaultworkflow`) values (1,'Invoice','UpdateInventoryProducts On Every Save','[{\"fieldname\":\"subject\",\"operation\":\"does not contain\",\"value\":\"`!`\"}]',3,NULL),(2,'Accounts','Send Email to user when Notifyowner is True','[{\"fieldname\":\"notify_owner\",\"operation\":\"is\",\"value\":\"true:boolean\"}]',2,1),(3,'Contacts','Send Email to user when Notifyowner is True','[{\"fieldname\":\"notify_owner\",\"operation\":\"is\",\"value\":\"true:boolean\"}]',2,1),(4,'Contacts','Send Email to user when Portal User is True','[{\"fieldname\":\"portal\",\"operation\":\"is\",\"value\":\"true:boolean\"}]',2,1),(5,'Potentials','Send Email to users on Potential creation',NULL,1,1);

/*Table structure for table `com_vtiger_workflows_seq` */

DROP TABLE IF EXISTS `com_vtiger_workflows_seq`;

CREATE TABLE `com_vtiger_workflows_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflows_seq` */

insert  into `com_vtiger_workflows_seq`(`id`) values (5);

/*Table structure for table `com_vtiger_workflowtask_queue` */

DROP TABLE IF EXISTS `com_vtiger_workflowtask_queue`;

CREATE TABLE `com_vtiger_workflowtask_queue` (
  `task_id` int(11) default NULL,
  `entity_id` varchar(100) default NULL,
  `do_after` int(11) default NULL,
  UNIQUE KEY `com_vtiger_workflowtask_queue_idx` (`task_id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflowtask_queue` */

/*Table structure for table `com_vtiger_workflowtasks` */

DROP TABLE IF EXISTS `com_vtiger_workflowtasks`;

CREATE TABLE `com_vtiger_workflowtasks` (
  `task_id` int(11) NOT NULL auto_increment,
  `workflow_id` int(11) default NULL,
  `summary` varchar(400) NOT NULL,
  `task` text,
  PRIMARY KEY  (`task_id`),
  UNIQUE KEY `com_vtiger_workflowtasks_idx` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflowtasks` */

insert  into `com_vtiger_workflowtasks`(`task_id`,`workflow_id`,`summary`,`task`) values (1,1,'','O:18:\"VTEntityMethodTask\":6:{s:18:\"executeImmediately\";b:1;s:10:\"workflowId\";i:1;s:7:\"summary\";s:0:\"\";s:6:\"active\";b:1;s:10:\"methodName\";s:15:\"UpdateInventory\";s:2:\"id\";i:1;}'),(2,2,'An account has been created ','O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";b:0;s:10:\"workflowId\";i:2;s:7:\"summary\";s:28:\"An account has been created \";s:6:\"active\";b:1;s:10:\"methodName\";s:11:\"NotifyOwner\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:26:\"Regarding Account Creation\";s:7:\"content\";s:301:\"An Account has been assigned to you on vtigerCRM<br>Details of account are :<br><br>AccountId:<b>$account_no</b><br>AccountName:<b>$accountname</b><br>Rating:<b>$rating</b><br>Industry:<b>$industry</b><br>AccountType:<b>$accounttype</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin\";s:2:\"id\";i:2;}'),(3,3,'An contact has been created ','O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";b:0;s:10:\"workflowId\";i:3;s:7:\"summary\";s:28:\"An contact has been created \";s:6:\"active\";b:1;s:10:\"methodName\";s:11:\"NotifyOwner\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:26:\"Regarding Contact Creation\";s:7:\"content\";s:305:\"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin\";s:2:\"id\";i:3;}'),(4,4,'An contact has been created ','O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";b:0;s:10:\"workflowId\";i:4;s:7:\"summary\";s:28:\"An contact has been created \";s:6:\"active\";b:1;s:10:\"methodName\";s:11:\"NotifyOwner\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:28:\"Regarding Contact Assignment\";s:7:\"content\";s:384:\"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>And <b>CustomerPortal Login Details</b> is sent to the EmailID :-$email<br><br>Thank You<br>Admin\";s:2:\"id\";i:4;}'),(5,5,'An Potential has been created ','O:11:\"VTEmailTask\":8:{s:18:\"executeImmediately\";b:0;s:10:\"workflowId\";i:5;s:7:\"summary\";s:30:\"An Potential has been created \";s:6:\"active\";b:1;s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:30:\"Regarding Potential Assignment\";s:7:\"content\";s:325:\"An Potential has been assigned to you on vtigerCRM<br>Details of Potential are :<br><br>Potential No:<b>$potential_no</b><br>Potential Name:<b>$potentialname</b><br>Amount:<b>$amount</b><br>Expected Close Date:<b>$closingdate</b><br>Type:<b>$opportunity_type</b><br><br><br>Description :$description<br><br>Thank You<br>Admin\";s:2:\"id\";i:5;}');

/*Table structure for table `com_vtiger_workflowtasks_entitymethod` */

DROP TABLE IF EXISTS `com_vtiger_workflowtasks_entitymethod`;

CREATE TABLE `com_vtiger_workflowtasks_entitymethod` (
  `workflowtasks_entitymethod_id` int(11) NOT NULL,
  `module_name` varchar(100) default NULL,
  `method_name` varchar(100) default NULL,
  `function_path` varchar(400) default NULL,
  `function_name` varchar(100) default NULL,
  PRIMARY KEY  (`workflowtasks_entitymethod_id`),
  UNIQUE KEY `com_vtiger_workflowtasks_entitymethod_idx` (`workflowtasks_entitymethod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflowtasks_entitymethod` */

insert  into `com_vtiger_workflowtasks_entitymethod`(`workflowtasks_entitymethod_id`,`module_name`,`method_name`,`function_path`,`function_name`) values (1,'SalesOrder','UpdateInventory','include/InventoryHandler.php','handleInventoryProductRel'),(2,'Invoice','UpdateInventory','include/InventoryHandler.php','handleInventoryProductRel');

/*Table structure for table `com_vtiger_workflowtasks_entitymethod_seq` */

DROP TABLE IF EXISTS `com_vtiger_workflowtasks_entitymethod_seq`;

CREATE TABLE `com_vtiger_workflowtasks_entitymethod_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflowtasks_entitymethod_seq` */

insert  into `com_vtiger_workflowtasks_entitymethod_seq`(`id`) values (2);

/*Table structure for table `com_vtiger_workflowtasks_seq` */

DROP TABLE IF EXISTS `com_vtiger_workflowtasks_seq`;

CREATE TABLE `com_vtiger_workflowtasks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflowtasks_seq` */

insert  into `com_vtiger_workflowtasks_seq`(`id`) values (5);

/*Table structure for table `com_vtiger_workflowtemplates` */

DROP TABLE IF EXISTS `com_vtiger_workflowtemplates`;

CREATE TABLE `com_vtiger_workflowtemplates` (
  `template_id` int(11) NOT NULL auto_increment,
  `module_name` varchar(100) default NULL,
  `title` varchar(400) default NULL,
  `template` text,
  PRIMARY KEY  (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `com_vtiger_workflowtemplates` */

/*Table structure for table `crmnow_pdf_fields` */

DROP TABLE IF EXISTS `crmnow_pdf_fields`;

CREATE TABLE `crmnow_pdf_fields` (
  `pdffieldid` int(2) NOT NULL default '0',
  `pdffieldname` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `pdftablename` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `quotes_g_enabled` int(1) NOT NULL default '0',
  `quotes_i_enabled` int(1) NOT NULL default '0',
  `po_g_enabled` int(1) NOT NULL default '0',
  `po_i_enabled` int(1) NOT NULL default '0',
  `so_g_enabled` int(1) NOT NULL default '0',
  `so_i_enabled` int(1) NOT NULL default '0',
  `invoice_g_enabled` int(1) NOT NULL default '0',
  `invoice_i_enabled` int(1) NOT NULL default '0',
  PRIMARY KEY  (`pdffieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `crmnow_pdf_fields` */

insert  into `crmnow_pdf_fields`(`pdffieldid`,`pdffieldname`,`pdftablename`,`quotes_g_enabled`,`quotes_i_enabled`,`po_g_enabled`,`po_i_enabled`,`so_g_enabled`,`so_i_enabled`,`invoice_g_enabled`,`invoice_i_enabled`) values (1,'Position','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(2,'OrderCode','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(3,'Description','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(4,'Qty','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(5,'Unit','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(6,'UnitPrice','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(7,'Discount','crmnow_pdfcolums',1,1,1,1,1,1,1,1),(8,'Tax','crmnow_pdfcolums',0,1,1,1,1,1,1,1),(9,'LineTotal','crmnow_pdfcolums',1,1,1,1,1,1,1,1);

/*Table structure for table `crmnow_pdfcolums_active` */

DROP TABLE IF EXISTS `crmnow_pdfcolums_active`;

CREATE TABLE `crmnow_pdfcolums_active` (
  `pdfcolumnactiveid` int(2) NOT NULL default '0',
  `pdfmodulname` varchar(13) collate utf8_unicode_ci NOT NULL default '0',
  `pdftaxmode` varchar(10) collate utf8_unicode_ci NOT NULL default '0',
  `position` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `ordercode` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `description` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `qty` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `unit` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `unitprice` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `discount` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `tax` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  `linetotal` varchar(8) collate utf8_unicode_ci NOT NULL default '0',
  PRIMARY KEY  (`pdfcolumnactiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `crmnow_pdfcolums_active` */

insert  into `crmnow_pdfcolums_active`(`pdfcolumnactiveid`,`pdfmodulname`,`pdftaxmode`,`position`,`ordercode`,`description`,`qty`,`unit`,`unitprice`,`discount`,`tax`,`linetotal`) values (1,'Quotes','group','','','disabled','disabled','','disabled','','disabled','disabled'),(2,'Quotes','individual','','','disabled','disabled','','disabled','','disabled','disabled'),(3,'PurchaseOrder','group','','','disabled','disabled','','disabled','','disabled','disabled'),(4,'PurchaseOrder','individual','','','disabled','disabled','','disabled','','disabled','disabled'),(5,'SalesOrder','group','','','disabled','disabled','','disabled','','disabled','disabled'),(6,'SalesOrder','individual','','','disabled','disabled','','disabled','','disabled','disabled'),(7,'Invoice','group','','','disabled','disabled','','disabled','','disabled','disabled'),(8,'Invoice','individual','','','disabled','disabled','','disabled','','disabled','disabled');

/*Table structure for table `crmnow_pdfcolums_sel` */

DROP TABLE IF EXISTS `crmnow_pdfcolums_sel`;

CREATE TABLE `crmnow_pdfcolums_sel` (
  `pdfcolumnselid` int(2) NOT NULL default '0',
  `pdfmodul` varchar(13) collate utf8_unicode_ci NOT NULL default '0',
  `pdftaxmode` varchar(10) collate utf8_unicode_ci NOT NULL default '0',
  `position` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `ordercode` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `description` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `qty` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `unit` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `unitprice` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `discount` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `tax` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `linetotal` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  PRIMARY KEY  (`pdfcolumnselid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `crmnow_pdfcolums_sel` */

insert  into `crmnow_pdfcolums_sel`(`pdfcolumnselid`,`pdfmodul`,`pdftaxmode`,`position`,`ordercode`,`description`,`qty`,`unit`,`unitprice`,`discount`,`tax`,`linetotal`) values (1,'Quotes','group','checked','','checked','checked','','checked','','checked','checked'),(2,'Quotes','individual','checked','','checked','checked','','checked','','checked','checked'),(3,'PurchaseOrder','group','checked','','checked','checked','','checked','','checked','checked'),(4,'PurchaseOrder','individual','checked','','checked','checked','','checked','','checked','checked'),(5,'SalesOrder','group','checked','','checked','checked','','checked','','checked','checked'),(6,'SalesOrder','individual','checked','','checked','checked','','checked','','checked','checked'),(7,'Invoice','group','checked','','checked','checked','','checked','','checked','checked'),(8,'Invoice','individual','checked','','checked','checked','','checked','','checked','checked');

/*Table structure for table `crmnow_pdfconfiguration` */

DROP TABLE IF EXISTS `crmnow_pdfconfiguration`;

CREATE TABLE `crmnow_pdfconfiguration` (
  `pdfid` int(2) NOT NULL default '0',
  `pdfmodul` varchar(13) collate utf8_unicode_ci NOT NULL default '',
  `fontid` int(5) NOT NULL default '0',
  `fontsizebody` int(2) NOT NULL default '9',
  `fontsizeheader` int(2) NOT NULL default '9',
  `fontsizefooter` int(2) NOT NULL default '9',
  `fontsizeaddress` int(2) NOT NULL default '9',
  `dateused` int(1) NOT NULL default '0',
  `spaceheadline` int(1) NOT NULL default '1',
  `summaryradio` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `gprodname` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `gproddes` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `gprodcom` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `iprodname` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `iproddes` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `iprodcom` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `pdflang` varchar(5) collate utf8_unicode_ci NOT NULL default 'ge_de',
  `footerradio` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `logoradio` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `pageradio` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `owner` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `ownerphone` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `poname` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `clientid` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  `carrier` varchar(5) collate utf8_unicode_ci NOT NULL default 'true',
  PRIMARY KEY  (`pdfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `crmnow_pdfconfiguration` */

insert  into `crmnow_pdfconfiguration`(`pdfid`,`pdfmodul`,`fontid`,`fontsizebody`,`fontsizeheader`,`fontsizefooter`,`fontsizeaddress`,`dateused`,`spaceheadline`,`summaryradio`,`gprodname`,`gproddes`,`gprodcom`,`iprodname`,`iproddes`,`iprodcom`,`pdflang`,`footerradio`,`logoradio`,`pageradio`,`owner`,`ownerphone`,`poname`,`clientid`,`carrier`) values (0,'Quotes',13,8,8,7,9,1,0,'true','true','true','true','true','true','true','ge_de','false','false','false','false','false','false','false','false'),(1,'PurchaseOrder',13,8,8,7,9,1,0,'true','true','true','true','true','true','true','ge_de','true','true','true','true','true','false','false','false'),(2,'SalesOrder',13,8,8,7,9,1,0,'true','true','true','true','true','true','true','ge_de','true','true','true','false','false','false','false','false'),(3,'Invoice',13,8,8,7,9,0,0,'true','true','true','true','true','true','true','ge_de','true','true','true','true','true','true','true','false');

/*Table structure for table `crmnow_pdffonts` */

DROP TABLE IF EXISTS `crmnow_pdffonts`;

CREATE TABLE `crmnow_pdffonts` (
  `fontid` int(2) NOT NULL default '0',
  `tcpdfname` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `namedisplay` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`fontid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `crmnow_pdffonts` */

insert  into `crmnow_pdffonts`(`fontid`,`tcpdfname`,`namedisplay`) values (0,'dejavusans','Dejavu Sans'),(1,'dejavusansb','Dejavu Sans Bold'),(2,'dejavusansbi','Dejavu Sans Bold Italic'),(3,'dejavusanscondensed','Dejavu Sans Condensed'),(4,'dejavusanscondensedb','Dejavu Sans Condensed Bold'),(5,'dejavusanscondensedi','Dejavu Sans Condensed Italic'),(6,'dejavusanscondensedbi','Dejavu Sans Condensed Bold Italic'),(7,'dejavusans-extralight','Dejavu Sans Extra Light'),(8,'dejavusansi','Dejavu Sans Italic'),(9,'dejavusansmono','Dejavu Sans Mono'),(10,'dejavusansmonob','Dejavu Sans Mono Bold'),(11,'dejavusansmonoi','Dejavu Sans Mono Italic'),(12,'dejavusansmonobi','Dejavu Sans Bold Italic'),(13,'dejavuserif','Dejavu Serif'),(14,'dejavuserifb','Dejavu Serif Bold'),(15,'dejavuserifi','Dejavu Serif'),(16,'dejavuserifbi','Dejavu Serif Bold Italic'),(17,'dejavuserifcondensed','Dejavu Serif Condensed'),(18,'dejavuserifcondensedb','Dejavu Serif Condensed Bold'),(19,'dejavuserifcondensedi','Dejavu Serif Condensed Italic'),(20,'dejavuserifcondensedbi','Dejavu Serif Condensed Bold Italic'),(21,'freemono','Free Mono'),(22,'freemonob','Free Mono Bold'),(23,'freemonoi','Free Mono Italic'),(24,'freemonobi','Free Mono Bold Italic'),(25,'freesans','Free Sans'),(26,'freesansb','Free Sans Bold'),(27,'freesansi','Free Sans Italic'),(28,'freesansbi','Free Sans Bold Italic'),(29,'freeserif','Free Serif'),(30,'freeserifb','Free Serif Bold'),(31,'freeserifi','Free Serif Italic'),(32,'freeserifbi','Free Serif Bold Italic');

/*Table structure for table `salereturn_productdetail` */

DROP TABLE IF EXISTS `salereturn_productdetail`;

CREATE TABLE `salereturn_productdetail` (
  `id` int(11) NOT NULL auto_increment,
  `salesreturn_id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `invoice_qty` decimal(25,2) NOT NULL default '0.00',
  `unitprice` decimal(25,2) NOT NULL default '0.00',
  `discount` decimal(10,2) default '0.00',
  `vat` decimal(10,2) default '0.00',
  `saleret_qty` decimal(25,2) NOT NULL default '0.00',
  `saleret_price` decimal(25,2) NOT NULL default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salereturn_productdetail` */

insert  into `salereturn_productdetail`(`id`,`salesreturn_id`,`productid`,`invoice_qty`,`unitprice`,`discount`,`vat`,`saleret_qty`,`saleret_price`) values (1,109,93,'1.00','1000.00','0.00','5.00','1.00','1050.00'),(2,105,93,'1.00','1000.00','0.00','5.00','1.00','1050.00'),(3,569,509,'5.00','208.00','0.00','0.00','2.00','416.00'),(4,631,613,'1.00','157.50','0.00','5.00','1.00','165.38'),(5,634,621,'5.00','510.00','0.00','10.00','5.00','2805.00'),(6,716,678,'10.00','9200.00','0.00','0.00','10.00','9200.00'),(7,717,678,'100.00','9200.00','0.00','0.00','20.00','92000.00'),(8,726,722,'1.00','110.00','0.00','10.00','1.00','121.00'),(9,726,724,'2.00','525.00','0.00','10.00','3.00','577.50'),(10,726,723,'3.00','575.00','0.00','10.00','4.00','1265.00'),(11,727,665,'1.00','121.00','0.00','12.50','1.00','136.13'),(12,727,621,'1.00','510.00','0.00','10.00','1.00','561.00'),(13,727,620,'1.00','468.00','0.00','4.50','1.00','489.06'),(14,727,619,'1.00','262.50','0.00','12.50','1.00','295.31'),(15,728,509,'1.00','208.00','0.00','0.00','1.00','208.00'),(16,728,511,'1.00','360.00','0.00','0.00','1.00','360.00'),(17,728,510,'1.00','287.50','0.00','12.50','1.00','323.44'),(18,728,77,'1.00','10000.00','0.00','0.00','1.00','10000.00'),(19,728,74,'1.00','12000.00','0.00','5.00','1.00','12600.00'),(20,728,508,'1.00','165.00','20.00','5.00','1.00','138.60'),(21,26,23,'2.00','2472.30','0.00','5.00','1.00','2595.91'),(22,27,23,'1.00','2472.30','0.00','5.00','1.00','2595.91'),(23,27,21,'2.00','833.31','0.00','13.50','1.00','945.81'),(24,28,20,'2.00','1040.85','0.00','13.50','1.00','1181.36'),(25,30,23,'4.00','2472.30','0.00','5.00','2.00','5191.83'),(26,31,23,'2.00','2472.30','0.00','5.00','1.00','2595.91'),(27,37,23,'2.00','2472.30','0.00','5.00','1.00','2595.91'),(28,37,22,'4.00','2524.22','0.00','5.00','2.00','5300.86'),(29,41,22,'2.00','2524.22','0.00','5.00','1.00','2650.43'),(30,42,22,'2.00','2524.22','0.00','5.00','1.00','2650.43'),(31,43,23,'1.00','2472.30','0.00','5.00','1.00','2595.91'),(32,44,23,'1.00','2472.30','0.00','5.00','1.00','2595.91'),(33,45,23,'1.00','2472.30','0.00','5.00','1.00','2595.91'),(34,46,18,'1.00','387.59','0.00','0.00','1.00','387.59'),(35,47,23,'1.00','2472.30','0.00','5.00','1.00','2595.91'),(36,48,21,'1.00','833.31','0.00','13.50','1.00','945.81'),(37,49,20,'1.00','1040.85','0.00','13.50','1.00','1181.36'),(38,50,18,'1.00','387.59','0.00','0.00','1.00','387.59'),(39,51,18,'1.00','387.59','0.00','0.00','1.00','387.59'),(40,52,22,'1.00','2524.22','0.00','5.00','1.00','2650.43'),(41,53,18,'1.00','387.59','0.00','0.00','1.00','387.59'),(42,67,20,'5.00','1040.85','0.00','13.50','2.00','2362.73'),(43,145,140,'3.00','1137.14','10.00','5.50','1.00','1079.71'),(44,161,156,'4.00','174.56','0.00','14.50','1.00','199.87');

/*Table structure for table `stock_lifo_fifo` */

DROP TABLE IF EXISTS `stock_lifo_fifo`;

CREATE TABLE `stock_lifo_fifo` (
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock_lifo_fifo` */

insert  into `stock_lifo_fifo`(`status`) values ('FIFO');

/*Table structure for table `vtiger_account` */

DROP TABLE IF EXISTS `vtiger_account`;

CREATE TABLE `vtiger_account` (
  `accountid` int(19) NOT NULL default '0',
  `account_no` varchar(100) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `parentid` int(19) default '0',
  `account_type` varchar(200) default NULL,
  `industry` varchar(200) default NULL,
  `annualrevenue` int(19) default '0',
  `rating` varchar(200) default NULL,
  `ownership` varchar(50) default NULL,
  `siccode` varchar(50) default NULL,
  `tickersymbol` varchar(30) default NULL,
  `phone` varchar(30) default NULL,
  `otherphone` varchar(30) default NULL,
  `email1` varchar(100) default NULL,
  `email2` varchar(100) default NULL,
  `website` varchar(100) default NULL,
  `fax` varchar(30) default NULL,
  `employees` int(10) default '0',
  `emailoptout` varchar(3) default '0',
  `notify_owner` varchar(3) default '0',
  PRIMARY KEY  (`accountid`),
  KEY `account_account_type_idx` (`account_type`),
  CONSTRAINT `fk_1_vtiger_account` FOREIGN KEY (`accountid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_account` */

/*Table structure for table `vtiger_accountbillads` */

DROP TABLE IF EXISTS `vtiger_accountbillads`;

CREATE TABLE `vtiger_accountbillads` (
  `accountaddressid` int(19) NOT NULL default '0',
  `bill_city` varchar(30) default NULL,
  `bill_code` varchar(30) default NULL,
  `bill_country` varchar(30) default NULL,
  `bill_state` varchar(30) default NULL,
  `bill_street` varchar(250) default NULL,
  `bill_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`accountaddressid`),
  CONSTRAINT `fk_1_vtiger_accountbillads` FOREIGN KEY (`accountaddressid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountbillads` */

/*Table structure for table `vtiger_accountdepstatus` */

DROP TABLE IF EXISTS `vtiger_accountdepstatus`;

CREATE TABLE `vtiger_accountdepstatus` (
  `deploymentstatusid` int(19) NOT NULL auto_increment,
  `deploymentstatus` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`deploymentstatusid`),
  UNIQUE KEY `accountdepstatus_deploymentstatus_idx` (`deploymentstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountdepstatus` */

/*Table structure for table `vtiger_accountownership` */

DROP TABLE IF EXISTS `vtiger_accountownership`;

CREATE TABLE `vtiger_accountownership` (
  `acctownershipid` int(19) NOT NULL auto_increment,
  `ownership` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`acctownershipid`),
  UNIQUE KEY `accountownership_ownership_idx` (`ownership`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountownership` */

/*Table structure for table `vtiger_accountrating` */

DROP TABLE IF EXISTS `vtiger_accountrating`;

CREATE TABLE `vtiger_accountrating` (
  `accountratingid` int(19) NOT NULL auto_increment,
  `rating` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`accountratingid`),
  UNIQUE KEY `accountrating_rating_idx` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountrating` */

/*Table structure for table `vtiger_accountregion` */

DROP TABLE IF EXISTS `vtiger_accountregion`;

CREATE TABLE `vtiger_accountregion` (
  `accountregionid` int(19) NOT NULL auto_increment,
  `region` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`accountregionid`),
  UNIQUE KEY `accountregion_region_idx` (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountregion` */

/*Table structure for table `vtiger_accountscf` */

DROP TABLE IF EXISTS `vtiger_accountscf`;

CREATE TABLE `vtiger_accountscf` (
  `accountid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`accountid`),
  CONSTRAINT `fk_1_vtiger_accountscf` FOREIGN KEY (`accountid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountscf` */

/*Table structure for table `vtiger_accountshipads` */

DROP TABLE IF EXISTS `vtiger_accountshipads`;

CREATE TABLE `vtiger_accountshipads` (
  `accountaddressid` int(19) NOT NULL default '0',
  `ship_city` varchar(30) default NULL,
  `ship_code` varchar(30) default NULL,
  `ship_country` varchar(30) default NULL,
  `ship_state` varchar(30) default NULL,
  `ship_pobox` varchar(30) default NULL,
  `ship_street` varchar(250) default NULL,
  PRIMARY KEY  (`accountaddressid`),
  CONSTRAINT `fk_1_vtiger_accountshipads` FOREIGN KEY (`accountaddressid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accountshipads` */

/*Table structure for table `vtiger_accounttype` */

DROP TABLE IF EXISTS `vtiger_accounttype`;

CREATE TABLE `vtiger_accounttype` (
  `accounttypeid` int(19) NOT NULL auto_increment,
  `accounttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`accounttypeid`),
  UNIQUE KEY `accounttype_accounttype_idx` (`accounttype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accounttype` */

insert  into `vtiger_accounttype`(`accounttypeid`,`accounttype`,`presence`,`picklist_valueid`) values (1,'--None--',1,1),(2,'Analyst',1,2),(3,'Competitor',1,3),(4,'Customer',1,4),(5,'Integrator',1,5),(6,'Investor',1,6),(7,'Partner',1,7),(8,'Press',1,8),(9,'Prospect',1,9),(10,'Reseller',1,10),(11,'Other',1,11);

/*Table structure for table `vtiger_accounttype_seq` */

DROP TABLE IF EXISTS `vtiger_accounttype_seq`;

CREATE TABLE `vtiger_accounttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_accounttype_seq` */

insert  into `vtiger_accounttype_seq`(`id`) values (11);

/*Table structure for table `vtiger_actionmapping` */

DROP TABLE IF EXISTS `vtiger_actionmapping`;

CREATE TABLE `vtiger_actionmapping` (
  `actionid` int(19) NOT NULL,
  `actionname` varchar(200) NOT NULL,
  `securitycheck` int(19) default NULL,
  PRIMARY KEY  (`actionid`,`actionname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_actionmapping` */

insert  into `vtiger_actionmapping`(`actionid`,`actionname`,`securitycheck`) values (0,'Save',0),(0,'SavePriceBook',1),(0,'SaveVendor',1),(1,'DetailViewAjax',1),(1,'EditView',0),(1,'PriceBookEditView',1),(1,'QuickCreate',1),(1,'VendorEditView',1),(2,'Delete',0),(2,'DeletePriceBook',1),(2,'DeleteVendor',1),(3,'index',0),(3,'Popup',1),(4,'DetailView',0),(4,'PriceBookDetailView',1),(4,'TagCloud',1),(4,'VendorDetailView',1),(5,'Import',0),(6,'Export',0),(8,'Merge',0),(9,'ConvertLead',0),(10,'DuplicatesHandling',0);

/*Table structure for table `vtiger_activity` */

DROP TABLE IF EXISTS `vtiger_activity`;

CREATE TABLE `vtiger_activity` (
  `activityid` int(19) NOT NULL default '0',
  `subject` varchar(100) NOT NULL,
  `semodule` varchar(20) default NULL,
  `activitytype` varchar(200) NOT NULL,
  `date_start` date NOT NULL,
  `due_date` date default NULL,
  `time_start` varchar(50) default NULL,
  `time_end` varchar(50) default NULL,
  `sendnotification` varchar(3) NOT NULL default '0',
  `duration_hours` varchar(200) default NULL,
  `duration_minutes` varchar(200) default NULL,
  `status` varchar(200) default NULL,
  `eventstatus` varchar(200) default NULL,
  `priority` varchar(200) default NULL,
  `location` varchar(150) default NULL,
  `notime` varchar(3) NOT NULL default '0',
  `visibility` varchar(50) NOT NULL default 'all',
  `recurringtype` varchar(200) default NULL,
  PRIMARY KEY  (`activityid`),
  KEY `activity_activityid_subject_idx` (`activityid`,`subject`),
  KEY `activity_activitytype_date_start_idx` (`activitytype`,`date_start`),
  KEY `activity_date_start_due_date_idx` (`date_start`,`due_date`),
  KEY `activity_date_start_time_start_idx` (`date_start`,`time_start`),
  KEY `activity_eventstatus_idx` (`eventstatus`),
  KEY `activity_status_idx` (`status`),
  CONSTRAINT `fk_1_vtiger_activity` FOREIGN KEY (`activityid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activity` */

/*Table structure for table `vtiger_activity_reminder` */

DROP TABLE IF EXISTS `vtiger_activity_reminder`;

CREATE TABLE `vtiger_activity_reminder` (
  `activity_id` int(11) NOT NULL,
  `reminder_time` int(11) NOT NULL,
  `reminder_sent` int(2) NOT NULL,
  `recurringid` int(19) NOT NULL,
  PRIMARY KEY  (`activity_id`,`recurringid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activity_reminder` */

/*Table structure for table `vtiger_activity_reminder_popup` */

DROP TABLE IF EXISTS `vtiger_activity_reminder_popup`;

CREATE TABLE `vtiger_activity_reminder_popup` (
  `reminderid` int(19) NOT NULL auto_increment,
  `semodule` varchar(100) NOT NULL,
  `recordid` int(19) NOT NULL,
  `date_start` date NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY  (`reminderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activity_reminder_popup` */

/*Table structure for table `vtiger_activity_view` */

DROP TABLE IF EXISTS `vtiger_activity_view`;

CREATE TABLE `vtiger_activity_view` (
  `activity_viewid` int(19) NOT NULL auto_increment,
  `activity_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`activity_viewid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activity_view` */

insert  into `vtiger_activity_view`(`activity_viewid`,`activity_view`,`sortorderid`,`presence`) values (1,'Today',0,1),(2,'This Week',1,1),(3,'This Month',2,1),(4,'This Year',3,1);

/*Table structure for table `vtiger_activity_view_seq` */

DROP TABLE IF EXISTS `vtiger_activity_view_seq`;

CREATE TABLE `vtiger_activity_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activity_view_seq` */

insert  into `vtiger_activity_view_seq`(`id`) values (4);

/*Table structure for table `vtiger_activitycf` */

DROP TABLE IF EXISTS `vtiger_activitycf`;

CREATE TABLE `vtiger_activitycf` (
  `activityid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activitycf` */

/*Table structure for table `vtiger_activityproductrel` */

DROP TABLE IF EXISTS `vtiger_activityproductrel`;

CREATE TABLE `vtiger_activityproductrel` (
  `activityid` int(19) NOT NULL default '0',
  `productid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`activityid`,`productid`),
  KEY `activityproductrel_activityid_idx` (`activityid`),
  KEY `activityproductrel_productid_idx` (`productid`),
  CONSTRAINT `fk_2_vtiger_activityproductrel` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activityproductrel` */

/*Table structure for table `vtiger_activitytype` */

DROP TABLE IF EXISTS `vtiger_activitytype`;

CREATE TABLE `vtiger_activitytype` (
  `activitytypeid` int(19) NOT NULL auto_increment,
  `activitytype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`activitytypeid`),
  UNIQUE KEY `activitytype_activitytype_idx` (`activitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activitytype` */

insert  into `vtiger_activitytype`(`activitytypeid`,`activitytype`,`presence`,`picklist_valueid`) values (1,'Call',0,12),(2,'Meeting',0,13);

/*Table structure for table `vtiger_activitytype_seq` */

DROP TABLE IF EXISTS `vtiger_activitytype_seq`;

CREATE TABLE `vtiger_activitytype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activitytype_seq` */

insert  into `vtiger_activitytype_seq`(`id`) values (2);

/*Table structure for table `vtiger_activsubtype` */

DROP TABLE IF EXISTS `vtiger_activsubtype`;

CREATE TABLE `vtiger_activsubtype` (
  `activesubtypeid` int(19) NOT NULL auto_increment,
  `activsubtype` varchar(100) default NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`activesubtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_activsubtype` */

/*Table structure for table `vtiger_announcement` */

DROP TABLE IF EXISTS `vtiger_announcement`;

CREATE TABLE `vtiger_announcement` (
  `creatorid` int(19) NOT NULL,
  `announcement` text,
  `title` varchar(255) default NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`creatorid`),
  KEY `announcement_creatorid_idx` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_announcement` */

/*Table structure for table `vtiger_assets` */

DROP TABLE IF EXISTS `vtiger_assets`;

CREATE TABLE `vtiger_assets` (
  `assetsid` int(11) NOT NULL,
  `asset_no` varchar(30) NOT NULL,
  `account` int(19) NOT NULL,
  `product` int(19) NOT NULL,
  `serialnumber` varchar(200) NOT NULL,
  `datesold` date NOT NULL,
  `dateinservice` date NOT NULL,
  `assetstatus` varchar(200) default 'In Service',
  `tagnumber` varchar(300) default NULL,
  `invoiceid` int(19) default NULL,
  `shippingmethod` varchar(200) default NULL,
  `shippingtrackingnumber` varchar(200) default NULL,
  `assetname` varchar(100) default NULL,
  PRIMARY KEY  (`assetsid`),
  CONSTRAINT `fk_1_vtiger_assets` FOREIGN KEY (`assetsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_assets` */

/*Table structure for table `vtiger_assetscf` */

DROP TABLE IF EXISTS `vtiger_assetscf`;

CREATE TABLE `vtiger_assetscf` (
  `assetsid` int(19) NOT NULL,
  PRIMARY KEY  (`assetsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_assetscf` */

/*Table structure for table `vtiger_assetstatus` */

DROP TABLE IF EXISTS `vtiger_assetstatus`;

CREATE TABLE `vtiger_assetstatus` (
  `assetstatusid` int(11) NOT NULL auto_increment,
  `assetstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`assetstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_assetstatus` */

insert  into `vtiger_assetstatus`(`assetstatusid`,`assetstatus`,`presence`,`picklist_valueid`) values (1,'In Service',1,235),(2,'Out-of-service',1,236);

/*Table structure for table `vtiger_assetstatus_seq` */

DROP TABLE IF EXISTS `vtiger_assetstatus_seq`;

CREATE TABLE `vtiger_assetstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_assetstatus_seq` */

insert  into `vtiger_assetstatus_seq`(`id`) values (2);

/*Table structure for table `vtiger_asterisk` */

DROP TABLE IF EXISTS `vtiger_asterisk`;

CREATE TABLE `vtiger_asterisk` (
  `server` varchar(30) default NULL,
  `port` varchar(30) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `version` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_asterisk` */

/*Table structure for table `vtiger_asteriskextensions` */

DROP TABLE IF EXISTS `vtiger_asteriskextensions`;

CREATE TABLE `vtiger_asteriskextensions` (
  `userid` int(11) default NULL,
  `asterisk_extension` varchar(50) default NULL,
  `use_asterisk` varchar(3) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_asteriskextensions` */

insert  into `vtiger_asteriskextensions`(`userid`,`asterisk_extension`,`use_asterisk`) values (1,'','0'),(5,'','0'),(6,'','0'),(7,'','1'),(8,'','1'),(9,'','1'),(10,'','1'),(11,'','1'),(12,'','1'),(13,'','1'),(14,'','1'),(15,'','1'),(16,'','1'),(17,'','1'),(18,'','1'),(19,'','1'),(20,'','1'),(21,'','1'),(22,'','1'),(23,'','1'),(24,'','1'),(25,'','1'),(26,'','1'),(27,'','1'),(28,'','1'),(29,'','1'),(30,'','1'),(31,'','1'),(32,'','1'),(2,'','1'),(3,'','1'),(4,'','1'),(5,'','1'),(6,'','1'),(7,'','1'),(8,'','1'),(9,'','1'),(10,'','1'),(11,'','1'),(12,'','1'),(13,'','1'),(14,'','1'),(15,'','1'),(16,'','1'),(17,'','1'),(18,'','1'),(18,'','1'),(18,'','1'),(18,'','1'),(19,'','1'),(18,'','1'),(19,'','1'),(20,'','1'),(21,'','1'),(22,'','1'),(18,'','1'),(19,'','1'),(20,'','1'),(21,'','1'),(22,'','1'),(23,'','1'),(24,'','1'),(25,'','1');

/*Table structure for table `vtiger_asteriskincomingcalls` */

DROP TABLE IF EXISTS `vtiger_asteriskincomingcalls`;

CREATE TABLE `vtiger_asteriskincomingcalls` (
  `from_number` varchar(50) default NULL,
  `from_name` varchar(50) default NULL,
  `to_number` varchar(50) default NULL,
  `callertype` varchar(30) default NULL,
  `flag` int(19) default NULL,
  `timer` int(19) default NULL,
  `refuid` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_asteriskincomingcalls` */

/*Table structure for table `vtiger_asteriskincomingevents` */

DROP TABLE IF EXISTS `vtiger_asteriskincomingevents`;

CREATE TABLE `vtiger_asteriskincomingevents` (
  `uid` varchar(255) NOT NULL,
  `channel` varchar(100) default NULL,
  `from_number` bigint(20) default NULL,
  `from_name` varchar(100) default NULL,
  `to_number` bigint(20) default NULL,
  `callertype` varchar(100) default NULL,
  `timer` int(20) default NULL,
  `flag` varchar(3) default NULL,
  `pbxrecordid` int(19) default NULL,
  `relcrmid` int(19) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_asteriskincomingevents` */

/*Table structure for table `vtiger_attachments` */

DROP TABLE IF EXISTS `vtiger_attachments`;

CREATE TABLE `vtiger_attachments` (
  `attachmentsid` int(19) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` varchar(100) default NULL,
  `path` text,
  `subject` varchar(255) default NULL,
  PRIMARY KEY  (`attachmentsid`),
  KEY `attachments_attachmentsid_idx` (`attachmentsid`),
  CONSTRAINT `fk_1_vtiger_attachments` FOREIGN KEY (`attachmentsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_attachments` */

insert  into `vtiger_attachments`(`attachmentsid`,`name`,`description`,`type`,`path`,`subject`) values (107,'ad1.gif','','image/gif','storage/2012/August/week3/',NULL),(111,'ad1.gif','','image/gif','storage/2012/August/week4/',NULL),(141,'Cherry-icon.png','','image/png','storage/2012/October/week1/',NULL);

/*Table structure for table `vtiger_attachmentsfolder` */

DROP TABLE IF EXISTS `vtiger_attachmentsfolder`;

CREATE TABLE `vtiger_attachmentsfolder` (
  `folderid` int(19) NOT NULL auto_increment,
  `foldername` varchar(200) NOT NULL,
  `description` varchar(250) default NULL,
  `createdby` int(19) NOT NULL,
  `sequence` int(19) default NULL,
  PRIMARY KEY  (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_attachmentsfolder` */

insert  into `vtiger_attachmentsfolder`(`folderid`,`foldername`,`description`,`createdby`,`sequence`) values (1,'Default','This is a Default Folder',1,1);

/*Table structure for table `vtiger_attachmentsfolder_seq` */

DROP TABLE IF EXISTS `vtiger_attachmentsfolder_seq`;

CREATE TABLE `vtiger_attachmentsfolder_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_attachmentsfolder_seq` */

insert  into `vtiger_attachmentsfolder_seq`(`id`) values (1);

/*Table structure for table `vtiger_audit_trial` */

DROP TABLE IF EXISTS `vtiger_audit_trial`;

CREATE TABLE `vtiger_audit_trial` (
  `auditid` int(19) NOT NULL,
  `userid` int(19) default NULL,
  `module` varchar(255) default NULL,
  `action` varchar(255) default NULL,
  `recordid` varchar(20) default NULL,
  `actiondate` datetime default NULL,
  PRIMARY KEY  (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_audit_trial` */

insert  into `vtiger_audit_trial`(`auditid`,`userid`,`module`,`action`,`recordid`,`actiondate`) values (1,1,'Settings','SettingsAjax','','2011-11-18 03:40:59');

/*Table structure for table `vtiger_audit_trial_seq` */

DROP TABLE IF EXISTS `vtiger_audit_trial_seq`;

CREATE TABLE `vtiger_audit_trial_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_audit_trial_seq` */

insert  into `vtiger_audit_trial_seq`(`id`) values (1);

/*Table structure for table `vtiger_barcode` */

DROP TABLE IF EXISTS `vtiger_barcode`;

CREATE TABLE `vtiger_barcode` (
  `barcodeid` int(11) NOT NULL auto_increment,
  `companyname` varchar(100) default NULL,
  `barcode` varchar(225) NOT NULL default '',
  `product_name` varchar(225) default NULL,
  `price` double(12,2) default NULL,
  `vat` double(12,2) default NULL,
  `service` double(12,2) default NULL,
  `netprice` double(12,2) default NULL,
  `filename` varchar(100) NOT NULL,
  `category` int(10) NOT NULL,
  `size` varchar(100) default '',
  `barcode_color` varchar(100) default '',
  `barcode_cost` double(12,2) default NULL,
  `mark_up` double(12,2) default NULL,
  `barcode_withcform` decimal(12,2) default '0.00',
  `barcode_withoutcform` decimal(12,2) default '0.00',
  PRIMARY KEY  (`barcodeid`,`barcode`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_barcode` */

insert  into `vtiger_barcode`(`barcodeid`,`companyname`,`barcode`,`product_name`,`price`,`vat`,`service`,`netprice`,`filename`,`category`,`size`,`barcode_color`,`barcode_cost`,`mark_up`,`barcode_withcform`,`barcode_withoutcform`) values (12,'Vinayak Furnishing','51778','Esprit Bedsheet 108',2472.30,5.00,NULL,2595.91,'51778',5,'90*108','',2060.25,20.00,'0.00','0.00'),(13,'Vinayak Furnishing','739838','Esprit Bedsheet 90',2524.22,5.00,NULL,2650.43,'739838',5,'90*108','',2294.75,10.00,'0.00','0.00'),(14,'Vinayak Furnishing','988836','Esprit Umbrella 1',833.31,13.50,NULL,945.81,'988836',6,'','',666.65,25.00,'0.00','0.00'),(15,'Vinayak Furnishing','719768','Esprit Umbrella 2',1040.85,13.50,NULL,1181.36,'719768',6,'','',800.65,30.00,'0.00','0.00'),(16,'Vinayak Furnishing','81879','Tomtailor  90*108',2729.58,5.00,NULL,2866.06,'81879',5,'90*108','',2274.65,20.00,'0.00','0.00'),(17,'Vinayak Furnishing','83967','Curtain Cloth Hippo',387.59,0.00,NULL,387.59,'83967',10,'','',298.15,30.00,'0.00','0.00'),(32,'Vinayak Furnishing','455222','Tomtailor Bedsheet 1',1100.00,5.00,NULL,1155.00,'455222',5,'','',1000.00,10.00,'0.00','0.00'),(54,'Vinayak Furnishing','95653','lcd holder',12000.00,5.00,NULL,12600.00,'95653',5,'','',10000.00,20.00,'0.00','0.00'),(79,'Vinayak Furnishings','8583','cur123',952.38,5.00,NULL,1000.00,'8583',8,'','',793.65,20.00,'0.00','0.00'),(81,'Vinayak Furnishings','272291','cur1234',952.38,5.00,NULL,1000.00,'272291',8,'','',793.65,20.00,'0.00','0.00'),(82,'Vinayak Furnishings','512295','12tttt',952.38,5.00,NULL,1000.00,'512295',8,'','',793.65,20.00,'0.00','0.00'),(83,'Vinayak Furnishings','636912','fur123',176.11,13.50,NULL,200.00,'636912',60,'','',146.76,20.00,'0.00','0.00'),(84,'Vinayak Furnishings','93265','sofa raja',8805.31,13.50,NULL,10000.00,'93265',11,'','',6773.32,30.00,'0.00','0.00'),(91,'Vinayak Furnishings','373768','gggggg1',952.38,5.00,NULL,1000.00,'373768',5,'','',793.65,20.00,'0.00','0.00'),(102,'Vinayak Furnishings','93524','table1',952.38,5.00,NULL,1000.00,'93524',8,'','',793.65,20.00,'0.00','0.00'),(103,'Vinayak Furnishings','45247','wrewrwr',952.38,5.00,NULL,1000.00,'45247',8,'','',793.65,20.00,'0.00','0.00'),(105,'Vinayak Furnishings','838299','Glass Table',909.09,10.00,NULL,1000.00,'838299',104,'','',757.58,20.00,'0.00','0.00'),(109,'Vinayak Furnishings','245963','Boat 123',909.09,10.00,NULL,1000.00,'245963',108,'','',757.58,20.00,'0.00','0.00'),(112,'Vinayak Furnishings','36787','Blue Glass',909.09,10.00,NULL,1000.00,'36787',104,'90*108','Red-Yellow',757.58,20.00,'0.00','0.00'),(113,'Vinayak Furnishings','437953','Red glass',9090.91,10.00,NULL,10000.00,'437953',104,'90*108','Yellow',7575.76,20.00,'0.00','0.00'),(114,'Vinayak Furnishings','6613','Asian Blue Towel',1904.76,5.00,NULL,2000.00,'6613',7,'10X2','Yellow',1587.30,20.00,'0.00','0.00'),(115,'Vinayak Furnishings','749214','Stering',1180.91,10.00,NULL,1299.00,'749214',108,'20X20','Yellow',984.09,20.00,'0.00','0.00'),(116,'Vinayak Furnishings','596533','Royal Sofaset',1319.92,13.50,NULL,1499.00,'596533',60,'','',1015.32,30.00,'0.00','0.00'),(126,'Vinayak Furnishings','11538','Haldiram 500 gm',48.25,14.00,NULL,55.00,'11538',125,'','',43.86,10.00,'0.00','0.00'),(131,'Vinayak Furnishing','448','xyz123',56.10,14.00,NULL,63.95,'448',125,'Not Applicable','Not Applicable',50.00,10.00,'2.00','0.00'),(134,'Vinayak Furnishings','77869','Aagan Tadka 200 gm',57.02,14.00,NULL,65.00,'77869',125,'','',51.83,10.00,'0.00','0.00'),(137,'Miyavaali Group','781966','Fiber Glass',909.09,10.00,NULL,1000.00,'781966',104,'','',757.58,20.00,'0.00','0.00'),(139,'Vinayak Furnishings','32598','Wrangler Blue',1137.14,5.50,NULL,1200.00,'32598',138,'38','',947.62,20.00,'0.00','0.00'),(146,'Vinayak Furnishing','497912','jean123',947.62,5.50,NULL,1000.00,'497912',138,'','',789.68,20.00,'0.00','0.00'),(149,'Vinayak Furnishings','39197','products123',1230.96,5.50,NULL,1299.00,'39197',138,'','',1025.80,20.00,'0.00','0.00'),(150,'Vinayak Furnishings','1591','Black Overy',947.62,5.50,NULL,1000.00,'1591',138,'','',789.68,20.00,'0.00','0.00'),(152,'Vinayak Furnishings','771525','Mix Haldiram 200 gm',877.19,14.00,NULL,1000.00,'771525',125,'','',797.45,10.00,'0.00','0.00'),(155,'Vinayak Furnishings','464158','Ashirwad',174.56,14.50,NULL,200.00,'464158',154,'','',158.69,10.00,'0.00','0.00'),(158,'Vinayak Furnishing','89318','Brisk Farm',26.18,14.50,NULL,30.00,'89318',154,'','',23.80,10.00,'0.00','0.00'),(163,'Vinayak Furnishings','118847','Pilsberry 5 KG',261.84,14.50,NULL,300.00,'118847',154,'','',238.04,10.00,'0.00','0.00');

/*Table structure for table `vtiger_barcodecf` */

DROP TABLE IF EXISTS `vtiger_barcodecf`;

CREATE TABLE `vtiger_barcodecf` (
  `barcodeid` int(11) NOT NULL,
  `cf_829` decimal(15,2) default NULL,
  `cf_830` decimal(5,2) default NULL,
  `cf_831` decimal(5,2) default NULL,
  `cf_832` decimal(5,2) default NULL,
  PRIMARY KEY  (`barcodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_barcodecf` */

insert  into `vtiger_barcodecf`(`barcodeid`,`cf_829`,`cf_830`,`cf_831`,`cf_832`) values (12,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL),(17,NULL,NULL,NULL,NULL),(32,NULL,NULL,NULL,NULL),(54,NULL,NULL,NULL,NULL),(79,NULL,NULL,NULL,NULL),(81,NULL,NULL,NULL,NULL),(82,NULL,NULL,NULL,NULL),(83,NULL,NULL,NULL,NULL),(84,NULL,NULL,NULL,NULL),(91,NULL,NULL,NULL,NULL),(102,NULL,NULL,NULL,NULL),(103,NULL,NULL,NULL,NULL),(105,NULL,NULL,NULL,NULL),(109,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL),(114,NULL,NULL,NULL,NULL),(115,NULL,NULL,NULL,NULL),(116,NULL,NULL,NULL,NULL),(126,NULL,NULL,NULL,NULL),(131,NULL,NULL,NULL,NULL),(134,NULL,NULL,NULL,NULL),(137,NULL,NULL,NULL,NULL),(139,NULL,NULL,NULL,NULL),(146,NULL,NULL,NULL,NULL),(149,NULL,NULL,NULL,NULL),(150,NULL,NULL,NULL,NULL),(152,NULL,NULL,NULL,NULL),(155,NULL,NULL,NULL,NULL),(158,NULL,NULL,NULL,NULL),(163,NULL,NULL,NULL,NULL);

/*Table structure for table `vtiger_barcodegrouprel` */

DROP TABLE IF EXISTS `vtiger_barcodegrouprel`;

CREATE TABLE `vtiger_barcodegrouprel` (
  `barcodeid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`barcodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_barcodegrouprel` */

/*Table structure for table `vtiger_blocks` */

DROP TABLE IF EXISTS `vtiger_blocks`;

CREATE TABLE `vtiger_blocks` (
  `blockid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `blocklabel` varchar(100) NOT NULL,
  `sequence` int(10) default NULL,
  `show_title` int(2) default NULL,
  `visible` int(2) NOT NULL default '0',
  `create_view` int(2) NOT NULL default '0',
  `edit_view` int(2) NOT NULL default '0',
  `detail_view` int(2) NOT NULL default '0',
  `display_status` int(1) NOT NULL default '1',
  `iscustom` int(1) NOT NULL default '0',
  PRIMARY KEY  (`blockid`),
  KEY `block_tabid_idx` (`tabid`),
  CONSTRAINT `fk_1_vtiger_blocks` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_blocks` */

insert  into `vtiger_blocks`(`blockid`,`tabid`,`blocklabel`,`sequence`,`show_title`,`visible`,`create_view`,`edit_view`,`detail_view`,`display_status`,`iscustom`) values (1,2,'LBL_OPPORTUNITY_INFORMATION',1,0,0,0,0,0,1,0),(2,2,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(3,2,'LBL_DESCRIPTION_INFORMATION',3,0,0,0,0,0,1,0),(4,4,'LBL_CONTACT_INFORMATION',1,0,0,0,0,0,1,0),(5,4,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(6,4,'LBL_CUSTOMER_PORTAL_INFORMATION',3,0,1,0,0,0,0,0),(7,4,'LBL_ADDRESS_INFORMATION',4,0,0,0,0,0,1,0),(8,4,'LBL_DESCRIPTION_INFORMATION',5,0,0,0,0,0,1,0),(9,6,'LBL_ACCOUNT_INFORMATION',1,0,0,0,0,0,1,0),(10,6,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(11,6,'LBL_ADDRESS_INFORMATION',3,0,0,0,0,0,1,0),(12,6,'LBL_DESCRIPTION_INFORMATION',4,0,0,0,0,0,1,0),(13,7,'LBL_LEAD_INFORMATION',1,0,0,0,0,0,1,0),(14,7,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(15,7,'LBL_ADDRESS_INFORMATION',3,0,0,0,0,0,1,0),(16,7,'LBL_DESCRIPTION_INFORMATION',4,0,0,0,0,0,1,0),(17,8,'LBL_NOTE_INFORMATION',1,0,0,0,0,0,1,0),(18,8,'LBL_FILE_INFORMATION',3,1,0,0,0,0,1,0),(19,9,'LBL_TASK_INFORMATION',1,0,0,0,0,0,1,0),(20,9,'',2,1,0,0,0,0,1,0),(21,10,'LBL_EMAIL_INFORMATION',1,0,0,0,0,0,1,0),(22,10,'',2,1,0,0,0,0,1,0),(23,10,'',3,1,0,0,0,0,1,0),(24,10,'',4,1,0,0,0,0,1,0),(25,13,'LBL_TICKET_INFORMATION',1,0,0,0,0,0,1,0),(26,13,'',2,1,0,0,0,0,1,0),(27,13,'LBL_CUSTOM_INFORMATION',3,0,0,0,0,0,1,0),(28,13,'LBL_DESCRIPTION_INFORMATION',4,0,0,0,0,0,1,0),(29,13,'LBL_TICKET_RESOLUTION',5,0,0,1,0,0,1,0),(30,13,'LBL_COMMENTS',6,0,0,1,0,0,1,0),(31,14,'LBL_PRODUCT_INFORMATION',1,0,0,0,0,0,1,0),(32,14,'LBL_PRICING_INFORMATION',3,0,0,0,0,0,1,0),(33,14,'LBL_STOCK_INFORMATION',2,0,0,0,0,0,1,0),(34,14,'LBL_CUSTOM_INFORMATION',4,0,0,0,0,0,1,0),(35,14,'LBL_IMAGE_INFORMATION',5,0,0,0,0,0,1,0),(36,14,'LBL_DESCRIPTION_INFORMATION',6,0,0,0,0,0,1,0),(37,15,'LBL_FAQ_INFORMATION',1,0,0,0,0,0,1,0),(38,15,'LBL_COMMENT_INFORMATION',4,0,0,1,0,0,1,0),(39,16,'LBL_EVENT_INFORMATION',1,0,0,0,0,0,1,0),(40,16,'',2,1,0,0,0,0,1,0),(41,16,'',3,1,0,0,0,0,1,0),(42,18,'LBL_VENDOR_INFORMATION',1,0,0,0,0,0,1,0),(43,18,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(44,18,'LBL_VENDOR_ADDRESS_INFORMATION',3,0,1,0,0,0,1,0),(45,18,'LBL_DESCRIPTION_INFORMATION',4,0,0,0,0,0,1,0),(46,19,'LBL_PRICEBOOK_INFORMATION',1,0,0,0,0,0,1,0),(47,19,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(48,19,'LBL_DESCRIPTION_INFORMATION',3,0,0,0,0,0,1,0),(49,20,'LBL_QUOTE_INFORMATION',1,0,0,0,0,0,1,0),(50,20,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(51,20,'LBL_ADDRESS_INFORMATION',3,0,0,0,0,0,1,0),(52,20,'LBL_RELATED_PRODUCTS',4,0,0,0,0,0,1,0),(53,20,'LBL_TERMS_INFORMATION',5,0,0,0,0,0,1,0),(54,20,'LBL_DESCRIPTION_INFORMATION',6,0,0,0,0,0,1,0),(55,21,'LBL_PO_INFORMATION',1,0,0,0,0,0,1,0),(56,21,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(57,21,'LBL_ADDRESS_INFORMATION',3,0,0,0,0,0,1,0),(58,21,'LBL_RELATED_PRODUCTS',4,0,0,0,0,0,1,0),(59,21,'LBL_TERMS_INFORMATION',5,0,0,0,0,0,0,0),(60,21,'LBL_DESCRIPTION_INFORMATION',6,0,0,0,0,0,0,0),(61,22,'LBL_SO_INFORMATION',1,0,0,0,0,0,1,0),(62,22,'LBL_CUSTOM_INFORMATION',3,0,0,0,0,0,1,0),(63,22,'LBL_ADDRESS_INFORMATION',4,0,0,0,0,0,1,0),(64,22,'LBL_RELATED_PRODUCTS',5,0,0,0,0,0,1,0),(65,22,'LBL_TERMS_INFORMATION',6,0,0,0,0,0,1,0),(66,22,'LBL_DESCRIPTION_INFORMATION',7,0,0,0,0,0,1,0),(67,23,'LBL_INVOICE_INFORMATION',1,0,0,0,0,0,1,0),(68,23,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(69,23,'LBL_ADDRESS_INFORMATION',3,0,0,0,0,0,1,0),(70,23,'LBL_RELATED_PRODUCTS',4,0,0,0,0,0,1,0),(71,23,'LBL_TERMS_INFORMATION',5,0,0,0,0,0,0,0),(72,23,'LBL_DESCRIPTION_INFORMATION',6,0,0,0,0,0,0,0),(73,4,'LBL_IMAGE_INFORMATION',6,0,1,0,0,0,1,0),(74,26,'LBL_CAMPAIGN_INFORMATION',1,0,0,0,0,0,1,0),(75,26,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(76,26,'LBL_EXPECTATIONS_AND_ACTUALS',3,0,0,0,0,0,1,0),(77,29,'LBL_USERLOGIN_ROLE',1,0,0,0,0,0,1,0),(78,29,'LBL_MORE_INFORMATION',2,0,0,0,0,0,1,0),(79,29,'LBL_ADDRESS_INFORMATION',3,0,0,0,0,0,1,0),(80,26,'LBL_DESCRIPTION_INFORMATION',4,0,0,0,0,0,1,0),(81,29,'LBL_USER_IMAGE_INFORMATION',4,0,0,0,0,0,1,0),(82,29,'LBL_USER_ADV_OPTIONS',5,0,1,0,0,0,1,0),(83,8,'LBL_DESCRIPTION',2,0,0,0,0,0,1,0),(84,22,'Recurring Invoice Information',2,0,0,0,0,0,1,0),(85,9,'LBL_CUSTOM_INFORMATION',3,0,0,0,0,0,1,0),(86,16,'LBL_CUSTOM_INFORMATION',4,0,0,0,0,0,1,0),(87,31,'LBL_CALL_INFORMATION',1,0,0,0,0,0,1,0),(88,31,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(89,29,'Asterisk Configuration',6,0,0,0,0,0,1,0),(90,32,'LBL_SERVICE_CONTRACT_INFORMATION',1,0,0,0,0,0,1,0),(91,32,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(92,33,'LBL_SERVICE_INFORMATION',1,0,0,0,0,0,1,0),(93,33,'LBL_PRICING_INFORMATION',2,0,0,0,0,0,1,0),(94,33,'LBL_CUSTOM_INFORMATION',3,0,0,0,0,0,1,0),(95,33,'LBL_DESCRIPTION_INFORMATION',4,0,0,0,0,0,1,0),(96,35,'LBL_ASSET_INFORMATION',1,0,0,0,0,0,1,0),(97,35,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,0,0),(98,35,'LBL_DESCRIPTION_INFORMATION',3,0,0,0,0,0,1,0),(99,38,'LBL_MODCOMMENTS_INFORMATION',1,0,0,0,0,0,1,0),(100,38,'LBL_OTHER_INFORMATION',2,0,0,0,0,0,1,0),(101,38,'LBL_CUSTOM_INFORMATION',3,0,0,0,0,0,1,0),(102,39,'LBL_PROJECT_MILESTONE_INFORMATION',1,0,0,0,0,0,1,0),(103,39,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(104,39,'LBL_DESCRIPTION_INFORMATION',3,0,0,0,0,0,1,0),(105,40,'LBL_PROJECT_TASK_INFORMATION',1,0,0,0,0,0,1,0),(106,40,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(107,40,'LBL_DESCRIPTION_INFORMATION',3,0,0,0,0,0,1,0),(108,41,'LBL_PROJECT_INFORMATION',1,0,0,0,0,0,1,0),(109,41,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(110,41,'LBL_DESCRIPTION_INFORMATION',3,0,0,0,0,0,1,0),(111,43,'LBL_SMSNOTIFIER_INFORMATION',1,0,0,0,0,0,1,0),(112,43,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(113,43,'StatusInformation',3,0,0,0,0,0,1,0),(116,48,'LBL_BARCODE_INFORMATION',1,0,0,0,0,0,1,0),(117,48,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,0,0),(124,49,'LBL_WAREHOUSE_INFORMATION',1,0,0,0,0,0,1,0),(125,49,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(126,50,'LBL_PROMOTION_INFORMATION',1,0,0,0,0,0,1,0),(127,50,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(128,51,'LBL_CLEARANCE_INFORMATION',1,0,0,0,0,0,1,0),(129,51,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(130,52,'LBL_PURCHASEORDERRECEIVED_INFORMATION',1,0,0,0,0,0,1,0),(131,52,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(132,53,'LBL_SALESRETURN_INFORMATION',1,0,0,0,0,0,1,0),(133,53,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(146,54,'LBL_CASHRECEIPT_INFORMATION',1,0,0,0,0,0,1,0),(147,54,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(148,55,'LBL_STOCK_ADJUSTMENT',1,0,0,0,0,0,1,0),(149,55,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(152,56,'LBL_CATEGORY_INFORMATION',1,0,0,0,0,0,1,0),(153,56,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(154,57,'LBL_DELIVERY_CHALLAN',1,0,0,0,0,0,1,0),(155,57,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(156,58,'LBL_PURCHASEREQUEST_INFORMATION',1,0,0,0,0,0,1,0),(157,58,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(158,60,'LBL_PRDELIVERY_INFORMATION',1,0,0,0,0,0,1,0),(159,60,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(160,61,'LBL_PRRECEIVE_INFORMATION',1,0,0,0,0,0,1,0),(161,61,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0),(164,62,'LBL_EMAIL_SETTINGS',1,0,0,0,0,0,1,0),(165,62,'LBL_CUSTOM_INFORMATION',2,0,0,0,0,0,1,0);

/*Table structure for table `vtiger_blocks_seq` */

DROP TABLE IF EXISTS `vtiger_blocks_seq`;

CREATE TABLE `vtiger_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_blocks_seq` */

insert  into `vtiger_blocks_seq`(`id`) values (165);

/*Table structure for table `vtiger_businesstype` */

DROP TABLE IF EXISTS `vtiger_businesstype`;

CREATE TABLE `vtiger_businesstype` (
  `businesstypeid` int(19) NOT NULL auto_increment,
  `businesstype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`businesstypeid`),
  UNIQUE KEY `businesstype_businesstype_idx` (`businesstype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_businesstype` */

/*Table structure for table `vtiger_campaign` */

DROP TABLE IF EXISTS `vtiger_campaign`;

CREATE TABLE `vtiger_campaign` (
  `campaign_no` varchar(100) NOT NULL,
  `campaignname` varchar(255) default NULL,
  `campaigntype` varchar(200) default NULL,
  `campaignstatus` varchar(200) default NULL,
  `expectedrevenue` decimal(25,3) default NULL,
  `budgetcost` decimal(25,3) default NULL,
  `actualcost` decimal(25,3) default NULL,
  `expectedresponse` varchar(200) default NULL,
  `numsent` decimal(11,0) default NULL,
  `product_id` int(19) default NULL,
  `sponsor` varchar(255) default NULL,
  `targetaudience` varchar(255) default NULL,
  `targetsize` int(19) default NULL,
  `expectedresponsecount` int(19) default NULL,
  `expectedsalescount` int(19) default NULL,
  `expectedroi` decimal(25,3) default NULL,
  `actualresponsecount` int(19) default NULL,
  `actualsalescount` int(19) default NULL,
  `actualroi` decimal(25,3) default NULL,
  `campaignid` int(19) NOT NULL,
  `closingdate` date default NULL,
  PRIMARY KEY  (`campaignid`),
  KEY `campaign_campaignstatus_idx` (`campaignstatus`),
  KEY `campaign_campaignname_idx` (`campaignname`),
  KEY `campaign_campaignid_idx` (`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaign` */

insert  into `vtiger_campaign`(`campaign_no`,`campaignname`,`campaigntype`,`campaignstatus`,`expectedrevenue`,`budgetcost`,`actualcost`,`expectedresponse`,`numsent`,`product_id`,`sponsor`,`targetaudience`,`targetsize`,`expectedresponsecount`,`expectedsalescount`,`expectedroi`,`actualresponsecount`,`actualsalescount`,`actualroi`,`campaignid`,`closingdate`) values ('CAM1','User Conference','Conference','Planning','250000.000','25000.000','23500.000','','2000',0,'Finace','Managers',210000,2500,25000,'23.000',250,1250,'21.000',122,'2003-01-02'),('CAM2','International Electrical Engineers Association Trade Show','Trade Show','Planning','750000.000','50000.000','45000.000','','2500',0,'Marketing','CEOs',13390,7500,50000,'45.000',750,5200,'14.000',123,'2004-02-03'),('CAM3','DM Campaign to Top Customers','Direct Mail','Completed','500000.000','90000.000','80000.000','','3000',0,'Sales','Rookies',187424,5000,90000,'82.000',1500,2390,'12.000',124,'2005-04-12');

/*Table structure for table `vtiger_campaignaccountrel` */

DROP TABLE IF EXISTS `vtiger_campaignaccountrel`;

CREATE TABLE `vtiger_campaignaccountrel` (
  `campaignid` int(19) default NULL,
  `accountid` int(19) default NULL,
  `campaignrelstatusid` int(19) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignaccountrel` */

/*Table structure for table `vtiger_campaigncontrel` */

DROP TABLE IF EXISTS `vtiger_campaigncontrel`;

CREATE TABLE `vtiger_campaigncontrel` (
  `campaignid` int(19) NOT NULL default '0',
  `contactid` int(19) NOT NULL default '0',
  `campaignrelstatusid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`campaignid`,`contactid`,`campaignrelstatusid`),
  KEY `campaigncontrel_contractid_idx` (`contactid`),
  CONSTRAINT `fk_2_vtiger_campaigncontrel` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaigncontrel` */

/*Table structure for table `vtiger_campaignleadrel` */

DROP TABLE IF EXISTS `vtiger_campaignleadrel`;

CREATE TABLE `vtiger_campaignleadrel` (
  `campaignid` int(19) NOT NULL default '0',
  `leadid` int(19) NOT NULL default '0',
  `campaignrelstatusid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`campaignid`,`leadid`,`campaignrelstatusid`),
  KEY `campaignleadrel_leadid_campaignid_idx` (`leadid`,`campaignid`),
  CONSTRAINT `fk_2_vtiger_campaignleadrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignleadrel` */

/*Table structure for table `vtiger_campaignrelstatus` */

DROP TABLE IF EXISTS `vtiger_campaignrelstatus`;

CREATE TABLE `vtiger_campaignrelstatus` (
  `campaignrelstatusid` int(19) default NULL,
  `campaignrelstatus` varchar(256) default NULL,
  `sortorderid` int(19) default NULL,
  `presence` int(19) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignrelstatus` */

insert  into `vtiger_campaignrelstatus`(`campaignrelstatusid`,`campaignrelstatus`,`sortorderid`,`presence`) values (1,'--None--',0,1),(2,'Contacted - Successful',1,1),(3,'Contacted - Unsuccessful',2,1),(4,'Contacted - Never Contact Again',3,1);

/*Table structure for table `vtiger_campaignrelstatus_seq` */

DROP TABLE IF EXISTS `vtiger_campaignrelstatus_seq`;

CREATE TABLE `vtiger_campaignrelstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignrelstatus_seq` */

insert  into `vtiger_campaignrelstatus_seq`(`id`) values (4);

/*Table structure for table `vtiger_campaignscf` */

DROP TABLE IF EXISTS `vtiger_campaignscf`;

CREATE TABLE `vtiger_campaignscf` (
  `campaignid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`campaignid`),
  CONSTRAINT `fk_1_vtiger_campaignscf` FOREIGN KEY (`campaignid`) REFERENCES `vtiger_campaign` (`campaignid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignscf` */

insert  into `vtiger_campaignscf`(`campaignid`) values (122),(123),(124);

/*Table structure for table `vtiger_campaignstatus` */

DROP TABLE IF EXISTS `vtiger_campaignstatus`;

CREATE TABLE `vtiger_campaignstatus` (
  `campaignstatusid` int(19) NOT NULL auto_increment,
  `campaignstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`campaignstatusid`),
  KEY `campaignstatus_campaignstatus_idx` (`campaignstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignstatus` */

insert  into `vtiger_campaignstatus`(`campaignstatusid`,`campaignstatus`,`presence`,`picklist_valueid`) values (1,'--None--',1,14),(2,'Planning',1,15),(3,'Active',1,16),(4,'Inactive',1,17),(5,'Completed',1,18),(6,'Cancelled',1,19);

/*Table structure for table `vtiger_campaignstatus_seq` */

DROP TABLE IF EXISTS `vtiger_campaignstatus_seq`;

CREATE TABLE `vtiger_campaignstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaignstatus_seq` */

insert  into `vtiger_campaignstatus_seq`(`id`) values (6);

/*Table structure for table `vtiger_campaigntype` */

DROP TABLE IF EXISTS `vtiger_campaigntype`;

CREATE TABLE `vtiger_campaigntype` (
  `campaigntypeid` int(19) NOT NULL auto_increment,
  `campaigntype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`campaigntypeid`),
  UNIQUE KEY `campaigntype_campaigntype_idx` (`campaigntype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaigntype` */

insert  into `vtiger_campaigntype`(`campaigntypeid`,`campaigntype`,`presence`,`picklist_valueid`) values (1,'--None--',1,20),(2,'Conference',1,21),(3,'Webinar',1,22),(4,'Trade Show',1,23),(5,'Public Relations',1,24),(6,'Partners',1,25),(7,'Referral Program',1,26),(8,'Advertisement',1,27),(9,'Banner Ads',1,28),(10,'Direct Mail',1,29),(11,'Email',1,30),(12,'Telemarketing',1,31),(13,'Others',1,32);

/*Table structure for table `vtiger_campaigntype_seq` */

DROP TABLE IF EXISTS `vtiger_campaigntype_seq`;

CREATE TABLE `vtiger_campaigntype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_campaigntype_seq` */

insert  into `vtiger_campaigntype_seq`(`id`) values (13);

/*Table structure for table `vtiger_carrier` */

DROP TABLE IF EXISTS `vtiger_carrier`;

CREATE TABLE `vtiger_carrier` (
  `carrierid` int(19) NOT NULL auto_increment,
  `carrier` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`carrierid`),
  UNIQUE KEY `carrier_carrier_idx` (`carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_carrier` */

insert  into `vtiger_carrier`(`carrierid`,`carrier`,`presence`,`picklist_valueid`) values (1,'FedEx',1,33),(2,'UPS',1,34),(3,'USPS',1,35),(4,'DHL',1,36),(5,'BlueDart',1,37);

/*Table structure for table `vtiger_carrier_seq` */

DROP TABLE IF EXISTS `vtiger_carrier_seq`;

CREATE TABLE `vtiger_carrier_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_carrier_seq` */

insert  into `vtiger_carrier_seq`(`id`) values (5);

/*Table structure for table `vtiger_cashreceipt` */

DROP TABLE IF EXISTS `vtiger_cashreceipt`;

CREATE TABLE `vtiger_cashreceipt` (
  `cashreceiptid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `grandtotal` decimal(10,2) default '0.00',
  `creditamount` decimal(10,2) default '0.00',
  `paidamount` decimal(10,2) default '0.00',
  `pendingamount` decimal(10,2) default '0.00',
  `crediteddate` date default NULL,
  `lastpaiddate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_cashreceipt` */

insert  into `vtiger_cashreceipt`(`cashreceiptid`,`invoiceid`,`customerid`,`grandtotal`,`creditamount`,`paidamount`,`pendingamount`,`crediteddate`,`lastpaiddate`) values (36,34,35,'15793.55','10000.00','9100.00','900.00','2012-07-05','2012-07-05'),(59,57,58,'6564.26','2000.00','0.00','2000.00','2012-07-18',NULL),(64,62,63,'3831.79','2000.00','2000.00','0.00','2012-07-25','2012-07-25'),(66,65,63,'8557.25','4000.00','4000.00','0.00','2012-07-25','2012-07-25'),(70,68,69,'2650.43','1000.00','0.00','1000.00','2012-07-28',NULL),(72,71,63,'2650.43','1500.00','0.00','1500.00','2012-07-28',NULL),(74,73,63,'2650.43','1500.00','0.00','1500.00','2012-07-28',NULL),(76,75,63,'2650.43','1500.00','0.00','1500.00','2012-07-28',NULL),(78,77,63,'5300.86','3000.00','0.00','3000.00','2012-07-28',NULL),(130,129,63,'13220.02','2000.00','1000.00','1000.00','2012-09-08','2012-09-08'),(136,135,63,'31797.11','10000.00','0.00','10000.00','2012-09-21',NULL);

/*Table structure for table `vtiger_cashreceiptcf` */

DROP TABLE IF EXISTS `vtiger_cashreceiptcf`;

CREATE TABLE `vtiger_cashreceiptcf` (
  `cashreceiptid` int(11) NOT NULL,
  PRIMARY KEY  (`cashreceiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_cashreceiptcf` */

/*Table structure for table `vtiger_cashreceiptgrouprel` */

DROP TABLE IF EXISTS `vtiger_cashreceiptgrouprel`;

CREATE TABLE `vtiger_cashreceiptgrouprel` (
  `cashreceiptid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`cashreceiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_cashreceiptgrouprel` */

/*Table structure for table `vtiger_cashreturndetails` */

DROP TABLE IF EXISTS `vtiger_cashreturndetails`;

CREATE TABLE `vtiger_cashreturndetails` (
  `id` int(11) NOT NULL auto_increment,
  `cashreceiptid` int(11) NOT NULL,
  `amountpaid` decimal(10,2) NOT NULL,
  `datereceived` datetime default NULL,
  `paymentmethod` char(6) NOT NULL,
  `bankname` varchar(50) default NULL,
  `checkno` int(10) default NULL,
  `checkdate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_cashreturndetails` */

insert  into `vtiger_cashreturndetails`(`id`,`cashreceiptid`,`amountpaid`,`datereceived`,`paymentmethod`,`bankname`,`checkno`,`checkdate`) values (1,36,'5000.00','2012-07-05 12:40:18','cash','',0,'0000-00-00'),(2,36,'1000.00','2012-07-05 19:26:59','cash','',0,'0000-00-00'),(3,36,'1000.00','2012-07-05 19:39:15','bank','State Bank of India',123,'2012-07-05'),(4,36,'1000.00','2012-07-05 19:39:36','bank','State Bank of India',123,'2012-07-05'),(5,36,'1000.00','2012-07-05 19:42:45','bank','State Bank of India',354353,'2012-07-05'),(6,36,'100.00','2012-07-05 19:43:39','bank','State Bank of India',354352,'2012-07-05'),(7,64,'1000.00','2012-07-25 17:20:05','cash','',0,'0000-00-00'),(8,64,'1000.00','2012-07-25 17:21:15','cash','',0,'0000-00-00'),(9,66,'4000.00','2012-07-25 17:28:51','cash','',0,'0000-00-00'),(10,130,'1000.00','2012-09-08 17:56:06','cash','',0,'0000-00-00');

/*Table structure for table `vtiger_category` */

DROP TABLE IF EXISTS `vtiger_category`;

CREATE TABLE `vtiger_category` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(100) NOT NULL default '',
  `taxtype` varchar(10) NOT NULL,
  `vat` decimal(10,2) default NULL,
  `size` varchar(100) default '',
  `color` varchar(100) default '',
  PRIMARY KEY  (`categoryid`,`categoryname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_category` */

insert  into `vtiger_category`(`categoryid`,`categoryname`,`taxtype`,`vat`,`size`,`color`) values (5,'Bedsheet','taxable','5.00','',''),(6,'Umbrella','taxable','13.50','',''),(7,'Towel','taxable','5.00','',''),(8,'Dining Mat','taxable','5.00','',''),(9,'Bed Cover','taxable','5.00','',''),(10,'Curtain Cloth','taxable','0.00','',''),(11,'Sofaset','taxable','13.50','',''),(60,'Furniture','taxable','13.50','',''),(61,'Tyre','taxable','14.00','',''),(104,'glass','taxable','10.00','',''),(108,'Boat tools','taxable','10.00','',''),(125,'Namkeen','taxable','14.00','',''),(138,'Jeans','taxable','5.50','',''),(154,'Atta','taxable','14.50','','');

/*Table structure for table `vtiger_categorycf` */

DROP TABLE IF EXISTS `vtiger_categorycf`;

CREATE TABLE `vtiger_categorycf` (
  `categoryid` int(11) NOT NULL,
  PRIMARY KEY  (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_categorycf` */

insert  into `vtiger_categorycf`(`categoryid`) values (5),(6),(7),(8),(9),(10),(11),(60),(61),(104),(108),(125),(138),(154);

/*Table structure for table `vtiger_categorygrouprel` */

DROP TABLE IF EXISTS `vtiger_categorygrouprel`;

CREATE TABLE `vtiger_categorygrouprel` (
  `categoryid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_categorygrouprel` */

/*Table structure for table `vtiger_chat_msg` */

DROP TABLE IF EXISTS `vtiger_chat_msg`;

CREATE TABLE `vtiger_chat_msg` (
  `id` int(20) NOT NULL auto_increment,
  `chat_from` int(20) NOT NULL default '0',
  `chat_to` int(20) NOT NULL default '0',
  `born` datetime default NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `chat_msg_chat_from_idx` (`chat_from`),
  KEY `chat_msg_chat_to_idx` (`chat_to`),
  KEY `chat_msg_born_idx` (`born`),
  CONSTRAINT `fk_1_vtiger_chat_msg` FOREIGN KEY (`chat_from`) REFERENCES `vtiger_chat_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_chat_msg` */

/*Table structure for table `vtiger_chat_pchat` */

DROP TABLE IF EXISTS `vtiger_chat_pchat`;

CREATE TABLE `vtiger_chat_pchat` (
  `id` int(20) NOT NULL auto_increment,
  `msg` int(20) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `chat_pchat_msg_idx` (`msg`),
  CONSTRAINT `fk_1_vtiger_chat_pchat` FOREIGN KEY (`msg`) REFERENCES `vtiger_chat_msg` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_chat_pchat` */

/*Table structure for table `vtiger_chat_pvchat` */

DROP TABLE IF EXISTS `vtiger_chat_pvchat`;

CREATE TABLE `vtiger_chat_pvchat` (
  `id` int(20) NOT NULL auto_increment,
  `msg` int(20) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `chat_pvchat_msg_idx` (`msg`),
  CONSTRAINT `fk_1_vtiger_chat_pvchat` FOREIGN KEY (`msg`) REFERENCES `vtiger_chat_msg` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_chat_pvchat` */

/*Table structure for table `vtiger_chat_users` */

DROP TABLE IF EXISTS `vtiger_chat_users`;

CREATE TABLE `vtiger_chat_users` (
  `id` int(20) NOT NULL auto_increment,
  `nick` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL default '000.000.000.000',
  `ping` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `chat_users_nick_idx` (`nick`),
  KEY `chat_users_session_idx` (`session`),
  KEY `chat_users_ping_idx` (`ping`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_chat_users` */

/*Table structure for table `vtiger_clearance` */

DROP TABLE IF EXISTS `vtiger_clearance`;

CREATE TABLE `vtiger_clearance` (
  `clearanceid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `barcode_id` int(11) NOT NULL,
  `product_name` varchar(100) default NULL,
  `mrp` double default NULL,
  `discount` double default NULL,
  `newmrp` double default NULL,
  `vat` double(10,1) default NULL,
  `clearanceprice` double default NULL,
  `from_date` date default NULL,
  `to_date` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_clearance` */

insert  into `vtiger_clearance`(`clearanceid`,`productid`,`barcode_id`,`product_name`,`mrp`,`discount`,`newmrp`,`vat`,`clearanceprice`,`from_date`,`to_date`) values (122,119,437953,'Stering',1180.91,5,1234.05,10.0,1121.86,'2012-09-08','2012-09-18'),(123,117,437953,'Red glass',9090.91,10,9000,10.0,8181.82,'2012-09-08','2012-09-24'),(144,140,32598,'Wrangler Blue',1137.14,10,1079.71,5.5,1023.43,'2012-10-05','2012-10-26'),(162,156,464158,'Ashirwad',174.56,10,179.88,14.5,157.1,'2012-10-23','2012-10-31');

/*Table structure for table `vtiger_clearancecf` */

DROP TABLE IF EXISTS `vtiger_clearancecf`;

CREATE TABLE `vtiger_clearancecf` (
  `clearanceid` int(11) NOT NULL,
  PRIMARY KEY  (`clearanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_clearancecf` */

insert  into `vtiger_clearancecf`(`clearanceid`) values (122),(123),(144),(162);

/*Table structure for table `vtiger_clearancegrouprel` */

DROP TABLE IF EXISTS `vtiger_clearancegrouprel`;

CREATE TABLE `vtiger_clearancegrouprel` (
  `clearanceid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`clearanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_clearancegrouprel` */

/*Table structure for table `vtiger_cntactivityrel` */

DROP TABLE IF EXISTS `vtiger_cntactivityrel`;

CREATE TABLE `vtiger_cntactivityrel` (
  `contactid` int(19) NOT NULL default '0',
  `activityid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`contactid`,`activityid`),
  KEY `cntactivityrel_contactid_idx` (`contactid`),
  KEY `cntactivityrel_activityid_idx` (`activityid`),
  CONSTRAINT `fk_2_vtiger_cntactivityrel` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_cntactivityrel` */

/*Table structure for table `vtiger_competitor` */

DROP TABLE IF EXISTS `vtiger_competitor`;

CREATE TABLE `vtiger_competitor` (
  `competitorid` int(19) NOT NULL,
  `competitorname` varchar(100) NOT NULL,
  `website` varchar(100) default NULL,
  `strength` varchar(250) default NULL,
  `weakness` varchar(250) default NULL,
  PRIMARY KEY  (`competitorid`),
  CONSTRAINT `fk_1_vtiger_competitor` FOREIGN KEY (`competitorid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_competitor` */

/*Table structure for table `vtiger_consolidate_purchaserequest` */

DROP TABLE IF EXISTS `vtiger_consolidate_purchaserequest`;

CREATE TABLE `vtiger_consolidate_purchaserequest` (
  `consolidate_pr_id` int(11) NOT NULL auto_increment,
  `productid` int(11) default NULL,
  `barcode` varchar(100) default NULL,
  `requestedqty` int(100) default NULL,
  `receivedqty` int(100) default NULL,
  `balancedqty` int(100) default NULL,
  `is_po_generated` smallint(1) default NULL,
  PRIMARY KEY  (`consolidate_pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_consolidate_purchaserequest` */

insert  into `vtiger_consolidate_purchaserequest`(`consolidate_pr_id`,`productid`,`barcode`,`requestedqty`,`receivedqty`,`balancedqty`,`is_po_generated`) values (1,55,'95653',0,0,0,NULL),(2,132,'448',0,0,0,NULL),(3,147,'497912',0,0,0,NULL),(4,159,'89318',0,0,0,NULL);

/*Table structure for table `vtiger_contactaddress` */

DROP TABLE IF EXISTS `vtiger_contactaddress`;

CREATE TABLE `vtiger_contactaddress` (
  `contactaddressid` int(19) NOT NULL default '0',
  `mailingcity` varchar(40) default NULL,
  `mailingstreet` varchar(250) default NULL,
  `mailingcountry` varchar(40) default NULL,
  `othercountry` varchar(30) default NULL,
  `mailingstate` varchar(30) default NULL,
  `mailingpobox` varchar(30) default NULL,
  `othercity` varchar(40) default NULL,
  `otherstate` varchar(50) default NULL,
  `mailingzip` varchar(30) default NULL,
  `otherzip` varchar(30) default NULL,
  `otherstreet` varchar(250) default NULL,
  `otherpobox` varchar(30) default NULL,
  PRIMARY KEY  (`contactaddressid`),
  CONSTRAINT `fk_1_vtiger_contactaddress` FOREIGN KEY (`contactaddressid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contactaddress` */

insert  into `vtiger_contactaddress`(`contactaddressid`,`mailingcity`,`mailingstreet`,`mailingcountry`,`othercountry`,`mailingstate`,`mailingpobox`,`othercity`,`otherstate`,`mailingzip`,`otherzip`,`otherstreet`,`otherpobox`) values (35,'Bangalore','HSR','India','India','Karnataka','560102','Bangalore','Karnataka','560102','560102','HSR','560102'),(58,'Bangalore','asjsad','India','India','Karnataka','560102','Bangalore','Karnataka','560102','560102','asjsad','560102'),(63,'Bangalore','asdad','India','India','Karnataka','560102','Bangalore','Karnataka','560102','560102','asdad','560102'),(69,'Bangalore','slkjfslf','India','India','Karnataka','560102','Bangalore','Karnataka','560102','560102','slkjfslf','560102');

/*Table structure for table `vtiger_contactdetails` */

DROP TABLE IF EXISTS `vtiger_contactdetails`;

CREATE TABLE `vtiger_contactdetails` (
  `contactid` int(19) NOT NULL default '0',
  `contact_no` varchar(100) NOT NULL,
  `accountid` int(19) default NULL,
  `salutation` varchar(200) default NULL,
  `firstname` varchar(40) default NULL,
  `lastname` varchar(80) NOT NULL,
  `email` varchar(100) default NULL,
  `phone` varchar(50) default NULL,
  `mobile` varchar(50) default NULL,
  `title` varchar(50) default NULL,
  `department` varchar(30) default NULL,
  `fax` varchar(50) default NULL,
  `reportsto` varchar(30) default NULL,
  `training` varchar(50) default NULL,
  `usertype` varchar(50) default NULL,
  `contacttype` varchar(50) default NULL,
  `otheremail` varchar(100) default NULL,
  `yahooid` varchar(100) default NULL,
  `donotcall` varchar(3) default NULL,
  `emailoptout` varchar(3) default '0',
  `imagename` varchar(150) default NULL,
  `reference` varchar(3) default NULL,
  `notify_owner` varchar(3) default '0',
  PRIMARY KEY  (`contactid`),
  KEY `contactdetails_accountid_idx` (`accountid`),
  CONSTRAINT `fk_1_vtiger_contactdetails` FOREIGN KEY (`contactid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contactdetails` */

insert  into `vtiger_contactdetails`(`contactid`,`contact_no`,`accountid`,`salutation`,`firstname`,`lastname`,`email`,`phone`,`mobile`,`title`,`department`,`fax`,`reportsto`,`training`,`usertype`,`contacttype`,`otheremail`,`yahooid`,`donotcall`,`emailoptout`,`imagename`,`reference`,`notify_owner`) values (35,'CON1',0,'--None--','Girish','','','','9916024776','','','','0',NULL,NULL,NULL,NULL,'','0','0','','0','0'),(58,'CON2',0,'--None--','Sumit','','rr@rr.com','','9876544343','','','','0',NULL,NULL,NULL,NULL,'','0','0','','0','0'),(63,'CON3',0,'--None--','Swaroop Nayak','','test@test.com','','9916023654','','','','0',NULL,NULL,NULL,NULL,'','0','0','','0','0'),(69,'CON4',0,'--None--','Raju Khan','','dd@dd.com','','98765434','','','','0',NULL,NULL,NULL,NULL,'','0','0','','0','0');

/*Table structure for table `vtiger_contactroyality` */

DROP TABLE IF EXISTS `vtiger_contactroyality`;

CREATE TABLE `vtiger_contactroyality` (
  `royalityid` int(19) NOT NULL auto_increment,
  `contactid` int(19) NOT NULL default '0',
  `royalitynumber` varchar(100) NOT NULL,
  `royalitycount` int(19) NOT NULL,
  PRIMARY KEY  (`royalityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contactroyality` */

/*Table structure for table `vtiger_contactscf` */

DROP TABLE IF EXISTS `vtiger_contactscf`;

CREATE TABLE `vtiger_contactscf` (
  `contactid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`contactid`),
  CONSTRAINT `fk_1_vtiger_contactscf` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contactscf` */

insert  into `vtiger_contactscf`(`contactid`) values (35),(58),(63),(69);

/*Table structure for table `vtiger_contactsubdetails` */

DROP TABLE IF EXISTS `vtiger_contactsubdetails`;

CREATE TABLE `vtiger_contactsubdetails` (
  `contactsubscriptionid` int(19) NOT NULL default '0',
  `homephone` varchar(50) default NULL,
  `otherphone` varchar(50) default NULL,
  `assistant` varchar(30) default NULL,
  `assistantphone` varchar(50) default NULL,
  `birthday` date default NULL,
  `laststayintouchrequest` int(30) default '0',
  `laststayintouchsavedate` int(19) default '0',
  `leadsource` varchar(200) default NULL,
  PRIMARY KEY  (`contactsubscriptionid`),
  CONSTRAINT `fk_1_vtiger_contactsubdetails` FOREIGN KEY (`contactsubscriptionid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contactsubdetails` */

insert  into `vtiger_contactsubdetails`(`contactsubscriptionid`,`homephone`,`otherphone`,`assistant`,`assistantphone`,`birthday`,`laststayintouchrequest`,`laststayintouchsavedate`,`leadsource`) values (35,'','','','',NULL,0,0,'--None--'),(58,'','','','',NULL,0,0,'--None--'),(63,'','','','',NULL,0,0,'--None--'),(69,'','','','',NULL,0,0,'--None--');

/*Table structure for table `vtiger_contacttype` */

DROP TABLE IF EXISTS `vtiger_contacttype`;

CREATE TABLE `vtiger_contacttype` (
  `contacttypeid` int(19) NOT NULL auto_increment,
  `contacttype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`contacttypeid`),
  UNIQUE KEY `contacttype_contacttype_idx` (`contacttype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contacttype` */

/*Table structure for table `vtiger_contpotentialrel` */

DROP TABLE IF EXISTS `vtiger_contpotentialrel`;

CREATE TABLE `vtiger_contpotentialrel` (
  `contactid` int(19) NOT NULL default '0',
  `potentialid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`contactid`,`potentialid`),
  KEY `contpotentialrel_potentialid_idx` (`potentialid`),
  KEY `contpotentialrel_contactid_idx` (`contactid`),
  CONSTRAINT `fk_2_vtiger_contpotentialrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contpotentialrel` */

/*Table structure for table `vtiger_contract_priority` */

DROP TABLE IF EXISTS `vtiger_contract_priority`;

CREATE TABLE `vtiger_contract_priority` (
  `contract_priorityid` int(11) NOT NULL auto_increment,
  `contract_priority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`contract_priorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_contract_priority` */

insert  into `vtiger_contract_priority`(`contract_priorityid`,`contract_priority`,`presence`,`picklist_valueid`) values (1,'Low',1,220),(2,'Normal',1,221),(3,'High',1,222);

/*Table structure for table `vtiger_contract_priority_seq` */

DROP TABLE IF EXISTS `vtiger_contract_priority_seq`;

CREATE TABLE `vtiger_contract_priority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contract_priority_seq` */

insert  into `vtiger_contract_priority_seq`(`id`) values (3);

/*Table structure for table `vtiger_contract_status` */

DROP TABLE IF EXISTS `vtiger_contract_status`;

CREATE TABLE `vtiger_contract_status` (
  `contract_statusid` int(11) NOT NULL auto_increment,
  `contract_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`contract_statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_contract_status` */

insert  into `vtiger_contract_status`(`contract_statusid`,`contract_status`,`presence`,`picklist_valueid`) values (1,'Undefined',1,214),(2,'In Planning',1,215),(3,'In Progress',1,216),(4,'On Hold',1,217),(5,'Complete',0,218),(6,'Archived',1,219);

/*Table structure for table `vtiger_contract_status_seq` */

DROP TABLE IF EXISTS `vtiger_contract_status_seq`;

CREATE TABLE `vtiger_contract_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contract_status_seq` */

insert  into `vtiger_contract_status_seq`(`id`) values (6);

/*Table structure for table `vtiger_contract_type` */

DROP TABLE IF EXISTS `vtiger_contract_type`;

CREATE TABLE `vtiger_contract_type` (
  `contract_typeid` int(11) NOT NULL auto_increment,
  `contract_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`contract_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_contract_type` */

insert  into `vtiger_contract_type`(`contract_typeid`,`contract_type`,`presence`,`picklist_valueid`) values (1,'Support',1,223),(2,'Services',1,224),(3,'Administrative',1,225);

/*Table structure for table `vtiger_contract_type_seq` */

DROP TABLE IF EXISTS `vtiger_contract_type_seq`;

CREATE TABLE `vtiger_contract_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_contract_type_seq` */

insert  into `vtiger_contract_type_seq`(`id`) values (3);

/*Table structure for table `vtiger_convertleadmapping` */

DROP TABLE IF EXISTS `vtiger_convertleadmapping`;

CREATE TABLE `vtiger_convertleadmapping` (
  `cfmid` int(19) NOT NULL auto_increment,
  `leadfid` int(19) NOT NULL,
  `accountfid` int(19) default NULL,
  `contactfid` int(19) default NULL,
  `potentialfid` int(19) default NULL,
  PRIMARY KEY  (`cfmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_convertleadmapping` */

/*Table structure for table `vtiger_crmentity` */

DROP TABLE IF EXISTS `vtiger_crmentity`;

CREATE TABLE `vtiger_crmentity` (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL default '0',
  `smownerid` int(19) NOT NULL default '0',
  `modifiedby` int(19) NOT NULL default '0',
  `setype` varchar(30) NOT NULL,
  `description` text,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime default NULL,
  `status` varchar(50) default NULL,
  `version` int(19) NOT NULL default '0',
  `presence` int(1) default '1',
  `deleted` int(1) NOT NULL default '0',
  PRIMARY KEY  (`crmid`),
  KEY `crmentity_smcreatorid_idx` (`smcreatorid`),
  KEY `crmentity_modifiedby_idx` (`modifiedby`),
  KEY `crmentity_deleted_idx` (`deleted`),
  KEY `crm_ownerid_del_setype_idx` (`smownerid`,`deleted`,`setype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_crmentity` */

insert  into `vtiger_crmentity`(`crmid`,`smcreatorid`,`smownerid`,`modifiedby`,`setype`,`description`,`createdtime`,`modifiedtime`,`viewedtime`,`status`,`version`,`presence`,`deleted`) values (2,1,1,0,'Warehouse',NULL,'2012-07-03 11:40:16','2012-07-03 11:40:16','2012-07-03 11:40:17',NULL,0,1,0),(3,1,1,0,'Warehouse',NULL,'2012-07-03 11:41:09','2012-07-03 11:41:09','2012-07-03 11:41:10',NULL,0,1,0),(4,1,1,0,'Warehouse',NULL,'2012-07-03 11:41:35','2012-07-03 11:41:35','2012-07-03 11:41:36',NULL,0,1,0),(5,1,1,0,'Category',NULL,'2012-07-03 20:54:17','2012-07-03 20:54:17','2012-07-03 20:54:18',NULL,0,1,0),(6,1,1,0,'Category',NULL,'2012-07-03 20:54:50','2012-07-03 20:54:50','2012-07-03 20:54:51',NULL,0,1,0),(7,1,1,0,'Category',NULL,'2012-07-03 20:55:15','2012-07-03 20:55:15','2012-07-03 20:55:16',NULL,0,1,0),(8,1,1,0,'Category',NULL,'2012-07-03 20:55:37','2012-07-03 20:55:37','2012-07-03 20:55:38',NULL,0,1,0),(9,1,1,0,'Category',NULL,'2012-07-03 20:56:17','2012-07-03 20:56:17','2012-07-03 20:56:17',NULL,0,1,0),(10,1,1,0,'Category',NULL,'2012-07-03 20:56:34','2012-07-03 20:56:34','2012-07-03 20:56:35',NULL,0,1,0),(11,1,1,0,'Category',NULL,'2012-07-03 20:57:11','2012-07-03 20:57:11','2012-07-03 20:57:11',NULL,0,1,0),(12,1,1,0,'Barcode',NULL,'2012-07-03 20:59:44','2012-07-03 20:59:44','2012-07-03 21:15:02',NULL,0,1,0),(13,1,1,0,'Barcode',NULL,'2012-07-03 21:01:15','2012-07-03 21:01:15','2012-07-03 21:01:16',NULL,0,1,0),(14,1,1,0,'Barcode',NULL,'2012-07-03 21:02:20','2012-07-03 21:02:20','2012-07-03 21:02:21',NULL,0,1,0),(15,1,1,0,'Barcode',NULL,'2012-07-03 21:03:03','2012-07-03 21:03:03','2012-07-03 21:03:04',NULL,0,1,0),(16,1,1,0,'Barcode',NULL,'2012-07-03 21:05:07','2012-07-03 21:05:07','2012-07-03 21:05:08',NULL,0,1,0),(17,1,1,0,'Barcode',NULL,'2012-07-03 21:06:15','2012-07-03 21:06:15','2012-07-03 21:06:16',NULL,0,1,0),(18,1,1,0,'Products','','2012-07-03 21:10:20','2012-07-03 21:10:20','2012-07-03 21:10:20',NULL,0,1,0),(19,1,1,0,'Products','','2012-07-03 21:11:13','2012-07-03 21:11:13','2012-07-03 21:11:14',NULL,0,1,0),(20,1,1,0,'Products','','2012-07-03 21:13:38','2012-07-03 21:13:38','2012-07-03 21:13:39',NULL,0,1,0),(21,1,1,0,'Products','','2012-07-03 21:14:09','2012-07-03 21:14:09','2012-07-03 21:14:10',NULL,0,1,0),(22,1,1,0,'Products','','2012-07-03 21:14:51','2012-07-03 21:14:51','2012-07-03 21:14:52',NULL,0,1,0),(23,1,1,0,'Products','','2012-07-03 21:15:38','2012-07-03 21:15:38','2012-07-03 21:15:39',NULL,0,1,0),(24,1,1,0,'Invoice',NULL,'2012-07-03 21:45:08','2012-07-03 21:45:08','2012-07-03 21:45:08',NULL,0,1,0),(25,1,1,0,'Invoice',NULL,'2012-07-03 22:15:51','2012-07-03 22:15:51','2012-07-03 22:15:51',NULL,0,1,0),(26,1,1,0,'SalesReturn',NULL,'2012-07-04 00:30:24','2012-07-04 00:30:24','2012-07-04 00:30:24',NULL,0,1,0),(27,1,1,0,'SalesReturn',NULL,'2012-07-04 00:48:23','2012-07-04 00:48:23','2012-07-04 00:48:23',NULL,0,1,0),(28,1,1,0,'SalesReturn',NULL,'2012-07-04 00:51:26','2012-07-04 00:51:26','2012-07-04 00:51:26',NULL,0,1,0),(29,1,1,0,'Invoice',NULL,'2012-07-04 16:00:55','2012-07-04 16:00:55','2012-07-04 16:00:55',NULL,0,1,0),(30,1,1,0,'SalesReturn',NULL,'2012-07-04 16:04:02','2012-07-04 16:04:02','2012-07-04 16:04:02',NULL,0,1,0),(31,1,1,0,'SalesReturn',NULL,'2012-07-04 16:23:08','2012-07-04 16:23:08','2012-07-04 16:23:08',NULL,0,1,0),(32,1,1,0,'Barcode',NULL,'2012-07-04 18:14:17','2012-07-04 18:14:17','2012-07-04 18:14:20',NULL,0,1,0),(33,1,1,0,'Invoice',NULL,'2012-07-05 00:24:36','2012-07-05 00:24:36','2012-07-05 00:24:36',NULL,0,1,0),(34,1,1,0,'Invoice',NULL,'2012-07-05 12:37:59','2012-07-05 12:37:59','2012-07-05 12:37:59',NULL,0,1,0),(35,1,1,0,'Contacts',NULL,'2012-07-05 12:37:59','2012-07-05 12:37:59','2012-07-05 12:37:59',NULL,0,1,0),(36,1,1,0,'Cashreceipt',NULL,'2012-07-05 12:37:59','2012-07-05 12:37:59','2012-07-05 12:37:59',NULL,0,1,0),(37,1,1,0,'SalesReturn',NULL,'2012-07-05 12:42:47','2012-07-05 12:42:47','2012-07-05 12:42:47',NULL,0,1,0),(38,1,1,0,'Invoice',NULL,'2012-07-05 16:29:34','2012-07-05 16:29:34','2012-07-05 16:29:34',NULL,0,1,0),(39,1,1,0,'Invoice',NULL,'2012-07-05 16:31:25','2012-07-05 16:31:25','2012-07-05 16:31:25',NULL,0,1,0),(40,1,1,0,'Invoice',NULL,'2012-07-05 16:35:29','2012-07-05 16:35:29','2012-07-05 16:35:29',NULL,0,1,0),(41,1,1,0,'SalesReturn',NULL,'2012-07-05 17:08:03','2012-07-05 17:08:03','2012-07-05 17:08:03',NULL,0,1,0),(42,1,1,0,'SalesReturn',NULL,'2012-07-05 17:11:47','2012-07-05 17:11:47','2012-07-05 17:11:47',NULL,0,1,0),(43,1,1,0,'SalesReturn',NULL,'2012-07-05 18:18:33','2012-07-05 18:18:33','2012-07-05 18:18:33',NULL,0,1,0),(44,1,1,0,'SalesReturn',NULL,'2012-07-05 18:30:17','2012-07-05 18:30:17','2012-07-05 18:30:17',NULL,0,1,0),(45,1,1,0,'SalesReturn',NULL,'2012-07-05 18:31:51','2012-07-05 18:31:51','2012-07-05 18:31:51',NULL,0,1,0),(46,1,1,0,'SalesReturn',NULL,'2012-07-05 18:34:42','2012-07-05 18:34:42','2012-07-05 18:34:42',NULL,0,1,0),(47,1,1,0,'SalesReturn',NULL,'2012-07-05 18:38:44','2012-07-05 18:38:44','2012-07-05 18:38:44',NULL,0,1,0),(48,1,1,0,'SalesReturn',NULL,'2012-07-05 18:43:01','2012-07-05 18:43:01','2012-07-05 18:43:01',NULL,0,1,0),(49,1,1,0,'SalesReturn',NULL,'2012-07-05 18:46:38','2012-07-05 18:46:38','2012-07-05 18:46:38',NULL,0,1,0),(50,1,1,0,'SalesReturn',NULL,'2012-07-05 18:50:21','2012-07-05 18:50:21','2012-07-05 18:50:21',NULL,0,1,0),(51,1,1,0,'SalesReturn',NULL,'2012-07-05 18:54:23','2012-07-05 18:54:23','2012-07-05 18:54:23',NULL,0,1,0),(52,1,1,0,'SalesReturn',NULL,'2012-07-05 18:56:28','2012-07-05 18:56:28','2012-07-05 18:56:28',NULL,0,1,0),(53,1,1,0,'SalesReturn',NULL,'2012-07-05 21:07:00','2012-07-05 21:07:00','2012-07-05 21:07:00',NULL,0,1,0),(54,1,1,0,'Barcode',NULL,'2012-07-16 13:26:40','2012-07-16 13:26:40','2012-07-16 13:26:40',NULL,0,1,0),(55,1,1,0,'Products',NULL,'2012-07-16 13:26:40','2012-07-16 13:26:40','2012-07-16 13:26:40',NULL,0,1,0),(56,1,1,0,'Invoice',NULL,'2012-07-16 19:31:44','2012-07-16 19:31:44','2012-07-16 19:31:44',NULL,0,1,0),(57,1,1,0,'Invoice',NULL,'2012-07-18 21:19:32','2012-07-18 21:19:32','2012-07-18 21:19:32',NULL,0,1,0),(58,1,1,0,'Contacts',NULL,'2012-07-18 21:19:32','2012-07-18 21:19:32','2012-07-18 21:19:32',NULL,0,1,0),(59,1,1,0,'Cashreceipt',NULL,'2012-07-18 21:19:32','2012-07-18 21:19:32','2012-07-18 21:19:32',NULL,0,1,0),(60,1,1,0,'Category',NULL,'2012-07-18 16:56:49','2012-07-18 16:56:49','2012-07-18 16:56:50',NULL,0,1,0),(61,1,1,0,'Category',NULL,'2012-07-25 17:05:35','2012-07-25 17:05:35','2012-07-25 17:05:36',NULL,0,1,0),(62,1,1,0,'Invoice',NULL,'2012-07-25 17:16:42','2012-07-25 17:16:42','2012-07-25 17:16:42',NULL,0,1,0),(63,1,1,0,'Contacts',NULL,'2012-07-25 17:16:42','2012-07-25 17:16:42','2012-07-25 17:16:42',NULL,0,1,0),(64,1,1,0,'Cashreceipt',NULL,'2012-07-25 17:16:42','2012-07-25 17:16:42','2012-07-25 17:16:42',NULL,0,1,0),(65,1,1,0,'Invoice',NULL,'2012-07-25 17:27:22','2012-07-25 17:27:22','2012-07-25 17:27:22',NULL,0,1,0),(66,1,1,0,'Cashreceipt',NULL,'2012-07-25 17:27:22','2012-07-25 17:27:22','2012-07-25 17:27:22',NULL,0,1,0),(67,1,1,0,'SalesReturn',NULL,'2012-07-25 17:29:20','2012-07-25 17:29:20','2012-07-25 17:29:20',NULL,0,1,0),(68,1,1,0,'Invoice',NULL,'2012-07-28 15:54:55','2012-07-28 15:54:55','2012-07-28 15:54:55',NULL,0,1,0),(69,1,1,0,'Contacts',NULL,'2012-07-28 15:54:55','2012-07-28 15:54:55','2012-07-28 15:54:55',NULL,0,1,0),(70,1,1,0,'Cashreceipt',NULL,'2012-07-28 15:54:56','2012-07-28 15:54:56','2012-07-28 15:54:56',NULL,0,1,0),(71,1,1,0,'Invoice',NULL,'2012-07-28 16:20:23','2012-07-28 16:20:23','2012-07-28 16:20:23',NULL,0,1,0),(72,1,1,0,'Cashreceipt',NULL,'2012-07-28 16:20:23','2012-07-28 16:20:23','2012-07-28 16:20:23',NULL,0,1,0),(73,1,1,0,'Invoice',NULL,'2012-07-28 16:22:40','2012-07-28 16:22:40','2012-07-28 16:22:40',NULL,0,1,0),(74,1,1,0,'Cashreceipt',NULL,'2012-07-28 16:22:40','2012-07-28 16:22:40','2012-07-28 16:22:40',NULL,0,1,0),(75,1,1,0,'Invoice',NULL,'2012-07-28 16:23:45','2012-07-28 16:23:45','2012-07-28 16:23:45',NULL,0,1,0),(76,1,1,0,'Cashreceipt',NULL,'2012-07-28 16:23:45','2012-07-28 16:23:45','2012-07-28 16:23:45',NULL,0,1,0),(77,1,1,0,'Invoice',NULL,'2012-07-28 16:24:35','2012-07-28 16:24:35','2012-07-28 16:24:35',NULL,0,1,0),(78,1,1,0,'Cashreceipt',NULL,'2012-07-28 16:24:35','2012-07-28 16:24:35','2012-07-28 16:24:35',NULL,0,1,0),(79,1,1,0,'Barcode',NULL,'2012-08-02 20:29:11','2012-08-02 20:29:11','2012-08-02 20:29:13',NULL,0,1,0),(80,1,1,0,'Products','','2012-08-02 20:29:52','2012-08-02 20:29:52','2012-08-02 20:29:54',NULL,0,1,0),(81,1,1,0,'Barcode',NULL,'2012-08-02 20:33:45','2012-08-02 20:33:45','2012-08-02 20:33:47',NULL,0,1,0),(82,1,1,0,'Barcode',NULL,'2012-08-04 13:07:39','2012-08-04 13:07:39','2012-08-04 13:07:41',NULL,0,1,0),(83,1,1,0,'Barcode',NULL,'2012-08-04 18:52:40','2012-08-04 18:52:40','2012-08-04 18:52:41',NULL,0,1,0),(84,1,1,0,'Barcode',NULL,'2012-08-04 18:54:01','2012-08-04 18:54:01','2012-08-04 18:54:01',NULL,0,1,0),(85,1,1,0,'Invoice',NULL,'2012-08-06 11:51:44','2012-08-06 11:51:44','2012-08-06 11:51:44',NULL,0,1,0),(86,1,1,0,'Invoice',NULL,'2012-08-06 12:02:39','2012-08-06 12:02:39','2012-08-06 12:02:39',NULL,0,1,0),(87,1,1,0,'Invoice',NULL,'2012-08-06 12:56:01','2012-08-06 12:56:01','2012-08-06 12:56:01',NULL,0,1,0),(88,1,1,0,'Invoice',NULL,'2012-08-06 13:40:55','2012-08-06 13:40:55','2012-08-06 13:40:55',NULL,0,1,0),(89,1,1,0,'Invoice',NULL,'2012-08-06 13:42:07','2012-08-06 13:42:07','2012-08-06 13:42:07',NULL,0,1,0),(90,1,1,0,'Invoice',NULL,'2012-08-06 13:43:12','2012-08-06 13:43:12','2012-08-06 13:43:12',NULL,0,1,0),(91,1,1,0,'Barcode',NULL,'2012-08-06 17:02:30','2012-08-06 17:02:30','2012-08-06 17:02:32',NULL,0,1,0),(92,1,1,0,'Invoice',NULL,'2012-08-06 23:01:53','2012-08-06 23:01:53','2012-08-06 23:01:53',NULL,0,1,0),(93,1,1,0,'Invoice',NULL,'2012-08-06 23:04:51','2012-08-06 23:04:51','2012-08-06 23:04:51',NULL,0,1,0),(94,1,1,0,'Invoice',NULL,'2012-08-06 23:17:39','2012-08-06 23:17:39','2012-08-06 23:17:39',NULL,0,1,0),(95,1,1,0,'Invoice',NULL,'2012-08-06 23:27:12','2012-08-06 23:27:12','2012-08-06 23:27:12',NULL,0,1,0),(96,1,1,0,'Invoice',NULL,'2012-08-06 23:31:38','2012-08-06 23:31:38','2012-08-06 23:31:38',NULL,0,1,0),(97,1,1,0,'Invoice',NULL,'2012-08-06 23:32:36','2012-08-06 23:32:36','2012-08-06 23:32:36',NULL,0,1,0),(98,1,1,0,'Invoice',NULL,'2012-08-06 23:35:13','2012-08-06 23:35:13','2012-08-06 23:35:13',NULL,0,1,0),(99,1,1,0,'Leads','','2012-08-07 14:13:07','2012-08-07 14:13:07',NULL,NULL,0,1,0),(100,1,1,0,'Vendors','','2012-08-07 18:44:34','2012-08-07 18:44:34','2012-08-07 18:44:36',NULL,0,1,0),(101,1,1,0,'PurchaseOrder',NULL,'2012-08-07 18:45:15','2012-08-07 18:45:15','2012-08-07 18:45:17',NULL,0,1,0),(102,1,1,0,'Barcode',NULL,'2012-08-08 12:38:56','2012-08-08 12:38:56','2012-08-08 12:38:58',NULL,0,1,0),(103,1,1,0,'Barcode',NULL,'2012-08-14 11:36:40','2012-08-14 11:36:40','2012-08-14 11:36:43',NULL,0,1,0),(104,1,1,0,'Category',NULL,'2012-08-21 18:11:57','2012-08-21 18:11:57','2012-08-21 18:11:59',NULL,0,1,0),(105,1,1,0,'Barcode',NULL,'2012-08-21 18:13:58','2012-08-21 18:13:58','2012-08-21 18:13:59',NULL,0,1,0),(106,1,1,0,'Products','','2012-08-21 18:19:00','2012-08-21 18:19:00','2012-08-21 18:19:01',NULL,0,1,0),(107,1,1,0,'Products Image','','2012-08-21 18:19:00','2012-08-21 18:19:00',NULL,NULL,0,1,0),(108,1,1,0,'Category',NULL,'2012-08-23 18:26:22','2012-08-23 18:26:22','2012-08-23 18:26:24',NULL,0,1,0),(109,1,1,0,'Barcode',NULL,'2012-08-23 18:29:54','2012-08-23 18:29:54','2012-08-23 18:29:56',NULL,0,1,0),(110,1,1,0,'Products','','2012-08-23 18:31:58','2012-08-23 18:31:58','2012-08-23 18:32:00',NULL,0,1,0),(111,1,1,0,'Products Image','','2012-08-23 18:31:58','2012-08-23 18:31:58',NULL,NULL,0,1,0),(112,1,1,0,'Barcode',NULL,'2012-09-06 15:24:24','2012-09-06 15:24:24','2012-09-06 15:24:25',NULL,0,1,0),(113,1,1,1,'Barcode',NULL,'2012-09-06 15:44:50','2012-09-08 16:33:58','2012-09-06 16:26:02',NULL,0,1,0),(114,1,1,0,'Barcode',NULL,'2012-09-08 16:42:25','2012-09-08 16:42:25','2012-09-08 16:42:26',NULL,0,1,0),(115,1,1,0,'Barcode',NULL,'2012-09-08 16:53:37','2012-09-08 16:53:37','2012-09-08 16:53:38',NULL,0,1,0),(116,1,1,0,'Barcode',NULL,'2012-09-08 16:56:26','2012-09-08 16:56:26','2012-09-08 16:56:27',NULL,0,1,0),(117,1,1,0,'Products','','2012-09-08 17:00:47','2012-09-08 17:00:47','2012-09-08 17:00:49',NULL,0,1,0),(118,1,1,0,'Products','','2012-09-08 17:01:24','2012-09-08 17:01:24','2012-09-08 17:01:25',NULL,0,1,0),(119,1,1,0,'Products','','2012-09-08 17:02:27','2012-09-08 17:02:27','2012-09-08 17:02:28',NULL,0,1,0),(120,1,1,0,'Products','','2012-09-08 17:03:09','2012-09-08 17:03:09','2012-09-08 17:03:10',NULL,0,1,0),(121,1,1,0,'Invoice',NULL,'2012-09-08 17:06:28','2012-09-08 17:06:28','2012-09-08 17:06:28',NULL,0,1,0),(122,1,0,0,'ClearanceSale',NULL,'2012-09-08 17:14:55','2012-09-08 17:14:55',NULL,NULL,0,1,0),(123,1,0,0,'ClearanceSale',NULL,'2012-09-08 17:14:55','2012-09-08 17:14:55',NULL,NULL,0,1,0),(124,1,1,0,'Invoice',NULL,'2012-09-08 17:18:36','2012-09-08 17:18:36','2012-09-08 17:18:36',NULL,0,1,0),(125,1,1,0,'Category',NULL,'2012-09-08 17:46:24','2012-09-08 17:46:24','2012-09-08 17:46:25',NULL,0,1,0),(126,1,1,0,'Barcode',NULL,'2012-09-08 17:47:52','2012-09-08 17:47:52','2012-09-08 17:47:53',NULL,0,1,0),(127,1,1,0,'Products','','2012-09-08 17:49:56','2012-09-08 17:49:56','2012-09-08 17:49:57',NULL,0,1,0),(128,1,1,0,'Invoice',NULL,'2012-09-08 17:52:14','2012-09-08 17:52:14','2012-09-08 17:52:14',NULL,0,1,0),(129,1,1,0,'Invoice',NULL,'2012-09-08 17:55:17','2012-09-08 17:55:17','2012-09-08 17:55:17',NULL,0,1,0),(130,1,1,0,'Cashreceipt',NULL,'2012-09-08 17:55:17','2012-09-08 17:55:17','2012-09-08 17:55:17',NULL,0,1,0),(131,1,1,0,'Barcode',NULL,'2012-09-08 18:04:58','2012-09-08 18:04:58','2012-09-08 18:04:58',NULL,0,1,0),(132,1,1,0,'Products',NULL,'2012-09-08 18:04:58','2012-09-08 18:04:58','2012-09-08 18:04:58',NULL,0,1,0),(133,1,1,0,'PurchaseOrder',NULL,'2012-09-08 18:05:47','2012-09-08 18:06:54','2012-09-08 18:05:49',NULL,0,1,0),(134,1,1,0,'Barcode',NULL,'2012-09-08 22:41:46','2012-09-08 22:41:46','2012-09-08 22:41:48',NULL,0,1,0),(135,1,1,0,'Invoice',NULL,'2012-09-21 14:11:09','2012-09-21 14:11:09','2012-09-21 14:11:09',NULL,0,1,0),(136,1,1,0,'Cashreceipt',NULL,'2012-09-21 14:11:09','2012-09-21 14:11:09','2012-09-21 14:11:09',NULL,0,1,0),(137,1,1,0,'Barcode',NULL,'2012-09-21 15:58:00','2012-09-21 15:58:00','2012-09-21 15:58:04',NULL,0,1,0),(138,1,1,0,'Category',NULL,'2012-10-05 14:38:28','2012-10-05 14:38:28','2012-10-05 14:38:32',NULL,0,1,0),(139,1,1,0,'Barcode',NULL,'2012-10-05 14:41:20','2012-10-05 14:41:20','2012-10-05 14:41:24',NULL,0,1,0),(140,1,1,0,'Products','','2012-10-05 14:45:02','2012-10-05 14:45:02','2012-10-05 14:45:07',NULL,0,1,0),(141,1,1,0,'Products Image','','2012-10-05 14:45:03','2012-10-05 14:45:03',NULL,NULL,0,1,0),(142,1,1,0,'Invoice',NULL,'2012-10-05 14:48:56','2012-10-05 14:48:56','2012-10-05 14:48:56',NULL,0,1,0),(143,1,1,0,'Invoice',NULL,'2012-10-05 14:50:57','2012-10-05 14:50:57','2012-10-05 14:50:57',NULL,0,1,0),(144,1,0,0,'ClearanceSale',NULL,'2012-10-05 14:52:38','2012-10-05 14:52:38',NULL,NULL,0,1,0),(145,1,1,0,'SalesReturn',NULL,'2012-10-05 14:55:40','2012-10-05 14:55:40','2012-10-05 14:55:40',NULL,0,1,0),(146,1,1,0,'Barcode',NULL,'2012-10-05 15:02:58','2012-10-05 15:02:58','2012-10-05 15:02:58',NULL,0,1,0),(147,1,1,0,'Products',NULL,'2012-10-05 15:02:58','2012-10-05 15:02:58','2012-10-05 15:02:58',NULL,0,1,0),(148,1,1,0,'PurchaseOrder',NULL,'2012-10-05 15:03:34','2012-10-05 15:03:34','2012-10-05 15:03:37',NULL,0,1,0),(149,1,1,0,'Barcode',NULL,'2012-10-10 16:15:47','2012-10-10 16:15:47','2012-10-10 16:15:49',NULL,0,1,0),(150,1,1,1,'Barcode',NULL,'2012-10-22 23:51:27','2012-10-23 00:11:32','2012-10-23 00:11:33',NULL,0,1,0),(151,1,1,0,'Invoice',NULL,'2012-10-23 00:50:28','2012-10-23 00:50:28','2012-10-23 00:50:28',NULL,0,1,0),(152,1,1,0,'Barcode',NULL,'2012-10-23 10:00:42','2012-10-23 10:00:42','2012-10-23 10:00:45',NULL,0,1,0),(153,1,1,0,'Invoice',NULL,'2012-10-23 10:16:58','2012-10-23 10:16:58','2012-10-23 10:16:58',NULL,0,1,0),(154,1,1,0,'Category',NULL,'2012-10-23 10:18:30','2012-10-23 10:18:30','2012-10-23 10:18:31',NULL,0,1,0),(155,1,1,0,'Barcode',NULL,'2012-10-23 10:21:03','2012-10-23 10:21:03','2012-10-23 10:21:04',NULL,0,1,0),(156,1,1,0,'Products','','2012-10-23 10:24:21','2012-10-23 10:24:21','2012-10-23 10:24:22',NULL,0,1,0),(157,1,1,0,'Invoice',NULL,'2012-10-23 10:26:01','2012-10-23 10:26:01','2012-10-23 10:26:01',NULL,0,1,0),(158,1,1,0,'Barcode',NULL,'2012-10-23 10:32:17','2012-10-23 10:32:17','2012-10-23 10:32:17',NULL,0,1,0),(159,1,1,0,'Products',NULL,'2012-10-23 10:32:18','2012-10-23 10:32:18','2012-10-23 10:32:18',NULL,0,1,0),(160,1,1,0,'PurchaseOrder',NULL,'2012-10-23 10:33:14','2012-10-23 10:33:14','2012-10-23 10:33:16',NULL,0,1,0),(161,1,1,0,'SalesReturn',NULL,'2012-10-23 10:38:28','2012-10-23 10:38:28','2012-10-23 10:38:28',NULL,0,1,0),(162,1,0,0,'ClearanceSale',NULL,'2012-10-23 10:39:58','2012-10-23 10:39:58',NULL,NULL,0,1,0),(163,1,1,1,'Barcode',NULL,'2012-10-23 16:23:10','2012-10-23 17:11:13','2012-10-23 16:23:12',NULL,0,1,0);

/*Table structure for table `vtiger_crmentity_seq` */

DROP TABLE IF EXISTS `vtiger_crmentity_seq`;

CREATE TABLE `vtiger_crmentity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_crmentity_seq` */

insert  into `vtiger_crmentity_seq`(`id`) values (163);

/*Table structure for table `vtiger_crmentitynotesrel` */

DROP TABLE IF EXISTS `vtiger_crmentitynotesrel`;

CREATE TABLE `vtiger_crmentitynotesrel` (
  `crmid` int(19) NOT NULL default '0',
  `notesid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`crmid`,`notesid`),
  KEY `crmentitynotesrel_notesid_idx` (`notesid`),
  KEY `crmentitynotesrel_crmid_idx` (`crmid`),
  CONSTRAINT `fk_2_vtiger_crmentitynotesrel` FOREIGN KEY (`notesid`) REFERENCES `vtiger_notes` (`notesid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_crmentitynotesrel` */

/*Table structure for table `vtiger_crmentityrel` */

DROP TABLE IF EXISTS `vtiger_crmentityrel`;

CREATE TABLE `vtiger_crmentityrel` (
  `crmid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relcrmid` int(11) NOT NULL,
  `relmodule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_crmentityrel` */

insert  into `vtiger_crmentityrel`(`crmid`,`module`,`relcrmid`,`relmodule`) values (113,'Barcode',113,'Barcode'),(150,'Barcode',150,'Barcode');

/*Table structure for table `vtiger_currencies` */

DROP TABLE IF EXISTS `vtiger_currencies`;

CREATE TABLE `vtiger_currencies` (
  `currencyid` int(19) NOT NULL auto_increment,
  `currency_name` varchar(200) default NULL,
  `currency_code` varchar(50) default NULL,
  `currency_symbol` varchar(11) default NULL,
  PRIMARY KEY  (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_currencies` */

insert  into `vtiger_currencies`(`currencyid`,`currency_name`,`currency_code`,`currency_symbol`) values (1,'Albania, Leke','ALL','Lek'),(2,'Argentina, Pesos','ARS','$'),(3,'Aruba, Guilders','AWG','Æ’'),(4,'Australia, Dollars','AUD','$'),(5,'Azerbaijan, New Manats','AZN','Ð¼Ð°Ð½'),(6,'Bahamas, Dollars','BSD','$'),(7,'Bahrain, Dinar','BHD','BD'),(8,'Barbados, Dollars','BBD','$'),(9,'Belarus, Rubles','BYR','p.'),(10,'Belize, Dollars','BZD','BZ$'),(11,'Bermuda, Dollars','BMD','$'),(12,'Bolivia, Bolivianos','BOB','$b'),(13,'China, Yuan Renminbi','CNY','Â¥'),(14,'Convertible Marka','BAM','KM'),(15,'Botswana, Pulas','BWP','P'),(16,'Bulgaria, Leva','BGN','Ð»Ð²'),(17,'Brazil, Reais','BRL','R$'),(18,'Great Britain Pounds','GBP','Â£'),(19,'Brunei Darussalam, Dollars','BND','$'),(20,'Canada, Dollars','CAD','$'),(21,'Cayman Islands, Dollars','KYD','$'),(22,'Chile, Pesos','CLP','$'),(23,'Colombia, Pesos','COP','$'),(24,'Costa Rica, ColÃ³n','CRC','â‚¡'),(25,'Croatia, Kuna','HRK','kn'),(26,'Cuba, Pesos','CUP','â‚±'),(27,'Czech Republic, Koruny','CZK','KÄ'),(28,'Cyprus, Pounds','CYP','Â£'),(29,'Denmark, Kroner','DKK','kr'),(30,'Dominican Republic, Pesos','DOP','RD$'),(31,'East Caribbean, Dollars','XCD','$'),(32,'Egypt, Pounds','EGP','Â£'),(33,'El Salvador, ColÃ³n','SVC','â‚¡'),(34,'England, Pounds','GBP','Â£'),(35,'Estonia, Krooni','EEK','kr'),(36,'Euro','EUR','â‚¬'),(37,'Falkland Islands, Pounds','FKP','Â£'),(38,'Fiji, Dollars','FJD','$'),(39,'Ghana, Cedis','GHC','Â¢'),(40,'Gibraltar, Pounds','GIP','Â£'),(41,'Guatemala, Quetzales','GTQ','Q'),(42,'Guernsey, Pounds','GGP','Â£'),(43,'Guyana, Dollars','GYD','$'),(44,'Honduras, Lempiras','HNL','L'),(45,'LvHong Kong, Dollars ','HKD','HK$'),(46,'Hungary, Forint','HUF','Ft'),(47,'Iceland, Krona','ISK','kr'),(48,'India, Rupees','INR','Rs.'),(49,'Indonesia, Rupiahs','IDR','Rp'),(50,'Iran, Rials','IRR','ï·¼'),(51,'Isle of Man, Pounds','IMP','Â£'),(52,'Israel, New Shekels','ILS','â‚ª'),(53,'Jamaica, Dollars','JMD','J$'),(54,'Japan, Yen','JPY','Â¥'),(55,'Jersey, Pounds','JEP','Â£'),(56,'Jordan, Dinar','JOD','JOD'),(57,'Kazakhstan, Tenge','KZT','ã€’'),(58,'Kenya, Shilling','KES','KES'),(59,'Korea (North), Won','KPW','â‚©'),(60,'Korea (South), Won','KRW','â‚©'),(61,'Kuwait, Dinar','KWD','KWD'),(62,'Kyrgyzstan, Soms','KGS','Ð»Ð²'),(63,'Laos, Kips','LAK','â‚­'),(64,'Latvia, Lati','LVL','Ls'),(65,'Lebanon, Pounds','LBP','Â£'),(66,'Liberia, Dollars','LRD','$'),(67,'Switzerland Francs','CHF','CHF'),(68,'Lithuania, Litai','LTL','Lt'),(69,'MADAGASCAR, Malagasy Ariary','MGA','MGA'),(70,'Macedonia, Denars','MKD','Ð´ÐµÐ½'),(71,'Malaysia, Ringgits','MYR','RM'),(72,'Malta, Liri','MTL','â‚¤'),(73,'Mauritius, Rupees','MUR','Rs.'),(74,'Mexico, Pesos','MXN','$'),(75,'Mongolia, Tugriks','MNT','â‚®'),(76,'Mozambique, Meticais','MZN','MT'),(77,'Namibia, Dollars','NAD','$'),(78,'Nepal, Rupees','NPR','Rs.'),(79,'Netherlands Antilles, Guilders','ANG','Æ’'),(80,'New Zealand, Dollars','NZD','$'),(81,'Nicaragua, Cordobas','NIO','C$'),(82,'Nigeria, Nairas','NGN','â‚¦'),(83,'North Korea, Won','KPW','â‚©'),(84,'Norway, Krone','NOK','kr'),(85,'Oman, Rials','OMR','ï·¼'),(86,'Pakistan, Rupees','PKR','â‚¨'),(87,'Panama, Balboa','PAB','B/.'),(88,'Paraguay, Guarani','PYG','Gs'),(89,'Peru, Nuevos Soles','PEN','S/.'),(90,'Philippines, Pesos','PHP','Php'),(91,'Poland, Zlotych','PLN','zÅ‚'),(92,'Qatar, Rials','QAR','ï·¼'),(93,'Romania, New Lei','RON','lei'),(94,'Russia, Rubles','RUB','Ñ€ÑƒÐ±'),(95,'Saint Helena, Pounds','SHP','Â£'),(96,'Saudi Arabia, Riyals','SAR','ï·¼'),(97,'Serbia, Dinars','RSD','Ð”Ð¸Ð½.'),(98,'Seychelles, Rupees','SCR','Rs.'),(99,'Singapore, Dollars','SGD','$'),(100,'Solomon Islands, Dollars','SBD','$'),(101,'Somalia, Shillings','SOS','S'),(102,'South Africa, Rand','ZAR','R'),(103,'South Korea, Won','KRW','â‚©'),(104,'Sri Lanka, Rupees','LKR','Rs.'),(105,'Sweden, Kronor','SEK','kr'),(106,'Switzerland, Francs','CHF','CHF'),(107,'Suriname, Dollars','SRD','$'),(108,'Syria, Pounds','SYP','Â£'),(109,'Taiwan, New Dollars','TWD','NT$'),(110,'Thailand, Baht','THB','à¸¿'),(111,'Trinidad and Tobago, Dollars','TTD','TT$'),(112,'Turkey, New Lira','TRY','YTL'),(113,'Turkey, Liras','TRL','â‚¤'),(114,'Tuvalu, Dollars','TVD','$'),(115,'Ukraine, Hryvnia','UAH','â‚´'),(116,'United Arab Emirates, Dirham','AED','AED'),(117,'United Kingdom, Pounds','GBP','Â£'),(118,'United Republic of Tanzania, Shilling','TZS','TZS'),(119,'USA, Dollars','USD','$'),(120,'Uruguay, Pesos','UYU','$U'),(121,'Uzbekistan, Sums','UZS','Ð»Ð²'),(122,'Venezuela, Bolivares Fuertes','VEF','Bs'),(123,'Vietnam, Dong','VND','â‚«'),(124,'Zambia, Kwacha','ZMK','ZMK'),(125,'Yemen, Rials','YER','ï·¼'),(126,'Zimbabwe Dollars','ZWD','Z$');

/*Table structure for table `vtiger_currencies_seq` */

DROP TABLE IF EXISTS `vtiger_currencies_seq`;

CREATE TABLE `vtiger_currencies_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_currencies_seq` */

insert  into `vtiger_currencies_seq`(`id`) values (126);

/*Table structure for table `vtiger_currency` */

DROP TABLE IF EXISTS `vtiger_currency`;

CREATE TABLE `vtiger_currency` (
  `currencyid` int(19) NOT NULL auto_increment,
  `currency` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`currencyid`),
  UNIQUE KEY `currency_currency_idx` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_currency` */

/*Table structure for table `vtiger_currency_info` */

DROP TABLE IF EXISTS `vtiger_currency_info`;

CREATE TABLE `vtiger_currency_info` (
  `id` int(11) NOT NULL auto_increment,
  `currency_name` varchar(100) default NULL,
  `currency_code` varchar(100) default NULL,
  `currency_symbol` varchar(30) default NULL,
  `conversion_rate` decimal(10,3) default NULL,
  `currency_status` varchar(25) default NULL,
  `defaultid` varchar(10) NOT NULL default '0',
  `deleted` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_currency_info` */

insert  into `vtiger_currency_info`(`id`,`currency_name`,`currency_code`,`currency_symbol`,`conversion_rate`,`currency_status`,`defaultid`,`deleted`) values (1,'India, Rupees','INR','Rs.','1.000','Active','-11',0);

/*Table structure for table `vtiger_currency_info_seq` */

DROP TABLE IF EXISTS `vtiger_currency_info_seq`;

CREATE TABLE `vtiger_currency_info_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_currency_info_seq` */

insert  into `vtiger_currency_info_seq`(`id`) values (1);

/*Table structure for table `vtiger_customaction` */

DROP TABLE IF EXISTS `vtiger_customaction`;

CREATE TABLE `vtiger_customaction` (
  `cvid` int(19) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` text,
  KEY `customaction_cvid_idx` (`cvid`),
  CONSTRAINT `fk_1_vtiger_customaction` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_customaction` */

/*Table structure for table `vtiger_customerdetails` */

DROP TABLE IF EXISTS `vtiger_customerdetails`;

CREATE TABLE `vtiger_customerdetails` (
  `customerid` int(19) NOT NULL,
  `portal` varchar(3) default NULL,
  `support_start_date` date default NULL,
  `support_end_date` date default NULL,
  PRIMARY KEY  (`customerid`),
  CONSTRAINT `fk_1_vtiger_customerdetails` FOREIGN KEY (`customerid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_customerdetails` */

/*Table structure for table `vtiger_customerportal_fields` */

DROP TABLE IF EXISTS `vtiger_customerportal_fields`;

CREATE TABLE `vtiger_customerportal_fields` (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) default NULL,
  `visible` int(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_customerportal_fields` */

/*Table structure for table `vtiger_customerportal_prefs` */

DROP TABLE IF EXISTS `vtiger_customerportal_prefs`;

CREATE TABLE `vtiger_customerportal_prefs` (
  `tabid` int(19) NOT NULL,
  `prefkey` varchar(100) default NULL,
  `prefvalue` int(20) default NULL,
  PRIMARY KEY  (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_customerportal_prefs` */

insert  into `vtiger_customerportal_prefs`(`tabid`,`prefkey`,`prefvalue`) values (0,'userid',1),(4,'showrelatedinfo',1),(6,'showrelatedinfo',1),(8,'showrelatedinfo',1),(13,'showrelatedinfo',1),(14,'showrelatedinfo',1),(15,'showrelatedinfo',1),(20,'showrelatedinfo',1),(23,'showrelatedinfo',1),(33,'showrelatedinfo',1),(39,'showrelatedinfo',1),(40,'showrelatedinfo',1),(41,'showrelatedinfo',1);

/*Table structure for table `vtiger_customerportal_tabs` */

DROP TABLE IF EXISTS `vtiger_customerportal_tabs`;

CREATE TABLE `vtiger_customerportal_tabs` (
  `tabid` int(19) NOT NULL,
  `visible` int(1) default '1',
  `sequence` int(1) default NULL,
  PRIMARY KEY  (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_customerportal_tabs` */

insert  into `vtiger_customerportal_tabs`(`tabid`,`visible`,`sequence`) values (4,1,10),(6,1,11),(8,1,9),(13,1,3),(14,1,7),(15,1,4),(20,1,6),(23,1,5),(33,1,8),(35,1,1),(39,1,12),(40,1,13),(41,1,14);

/*Table structure for table `vtiger_customview` */

DROP TABLE IF EXISTS `vtiger_customview`;

CREATE TABLE `vtiger_customview` (
  `cvid` int(19) NOT NULL,
  `viewname` varchar(100) NOT NULL,
  `setdefault` int(1) default '0',
  `setmetrics` int(1) default '0',
  `entitytype` varchar(25) NOT NULL,
  `status` int(1) default '1',
  `userid` int(19) default '1',
  PRIMARY KEY  (`cvid`),
  KEY `customview_entitytype_idx` (`entitytype`),
  CONSTRAINT `fk_1_vtiger_customview` FOREIGN KEY (`entitytype`) REFERENCES `vtiger_tab` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_customview` */

insert  into `vtiger_customview`(`cvid`,`viewname`,`setdefault`,`setmetrics`,`entitytype`,`status`,`userid`) values (1,'All',1,0,'Leads',0,1),(2,'Hot Leads',0,1,'Leads',3,1),(3,'This Month Leads',0,0,'Leads',3,1),(4,'All',1,0,'Accounts',0,1),(5,'Prospect Accounts',0,1,'Accounts',3,1),(6,'New This Week',0,0,'Accounts',3,1),(7,'All',1,0,'Contacts',0,1),(8,'Contacts Address',0,0,'Contacts',3,1),(9,'Todays Birthday',0,0,'Contacts',3,1),(10,'All',1,0,'Potentials',0,1),(11,'Potentials Won',0,1,'Potentials',3,1),(12,'Prospecting',0,0,'Potentials',3,1),(13,'All',1,0,'HelpDesk',0,1),(14,'Open Tickets',0,1,'HelpDesk',3,1),(15,'High Prioriy Tickets',0,0,'HelpDesk',3,1),(16,'All',1,0,'Quotes',0,1),(17,'Open Quotes',0,1,'Quotes',3,1),(18,'Rejected Quotes',0,0,'Quotes',3,1),(19,'All',1,0,'Calendar',0,1),(20,'All',1,0,'Emails',0,1),(21,'All',1,0,'Invoice',0,1),(22,'All',1,0,'Documents',0,1),(23,'All',1,0,'PriceBooks',0,1),(24,'All',1,0,'Products',0,1),(25,'All',1,0,'PurchaseOrder',0,1),(26,'All',1,0,'SalesOrder',0,1),(27,'All',1,0,'Vendors',0,1),(28,'All',1,0,'Faq',0,1),(29,'All',1,0,'Campaigns',0,1),(30,'All',1,0,'Webmails',0,1),(31,'Drafted FAQ',0,0,'Faq',3,1),(32,'Published FAQ',0,0,'Faq',3,1),(33,'Open Purchase Orders',0,0,'PurchaseOrder',3,1),(35,'Open Invoices',0,0,'Invoice',3,1),(36,'Paid Invoices',0,0,'Invoice',3,1),(37,'Pending Sales Orders',0,0,'SalesOrder',3,1),(38,'All',1,0,'PBXManager',0,1),(39,'Missed',0,0,'PBXManager',3,1),(40,'Dialed',0,0,'PBXManager',3,1),(41,'Received',0,0,'PBXManager',3,1),(42,'All',1,0,'ServiceContracts',0,1),(43,'All',1,0,'Services',0,1),(44,'All',1,0,'Assets',0,1),(45,'All',0,0,'ModComments',0,1),(46,'All',1,0,'ProjectMilestone',0,1),(47,'All',1,0,'ProjectTask',0,1),(48,'All',1,0,'Project',0,1),(49,'All',0,0,'SMSNotifier',0,1),(53,'Barcode',0,0,'Products',1,1),(56,'All',1,0,'Barcode',0,1),(59,'Invoice',0,0,'Invoice',1,1),(66,'All',1,0,'Warehouse',0,1),(67,'All2',0,0,'Warehouse',3,1),(68,'Warehouse',0,0,'Warehouse',1,1),(69,'All',1,0,'Promotionalsale',0,1),(70,'All2',0,0,'Promotionalsale',3,1),(71,'Promotional Sale',0,0,'Promotionalsale',1,1),(72,'All',1,0,'ClearanceSale',0,1),(73,'All2',0,0,'ClearanceSale',3,1),(74,'ClearanceSale',0,0,'ClearanceSale',1,1),(75,'All',1,0,'PurchaseOrderReceived',0,1),(79,'PO Received',0,0,'PurchaseOrderReceived',1,1),(80,'All',1,0,'SalesReturn',0,1),(81,'All2',0,0,'SalesReturn',3,1),(82,'Invoice',0,0,'Invoice',1,1),(89,'All',1,0,'Cashreceipt',0,1),(90,'All2',0,0,'Cashreceipt',3,1),(91,'Cash Receipt',0,0,'Cashreceipt',1,1),(94,'All',1,0,'Stockadjustment',0,1),(95,'All2',0,0,'Stockadjustment',3,1),(99,'All',1,0,'Category',0,1),(100,'Category',0,0,'Category',1,1),(101,'All',1,0,'Deliverychallan',0,1),(102,'All2',0,0,'Deliverychallan',3,1),(103,'Deliverychallan',0,0,'Deliverychallan',2,1),(104,'Clearance',0,0,'ClearanceSale',2,1),(105,'Stockadjustment',0,0,'Stockadjustment',2,1),(106,'All',1,0,'PurchaseRequest',0,1),(107,'All2',0,0,'PurchaseRequest',3,1),(108,'All',1,0,'PRDelivery',0,1),(109,'All',1,0,'PRReceive',0,1),(112,'All',1,0,'EmailSettings',0,1),(113,'All2',0,0,'EmailSettings',3,1);

/*Table structure for table `vtiger_customview_seq` */

DROP TABLE IF EXISTS `vtiger_customview_seq`;

CREATE TABLE `vtiger_customview_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_customview_seq` */

insert  into `vtiger_customview_seq`(`id`) values (114);

/*Table structure for table `vtiger_cvadvfilter` */

DROP TABLE IF EXISTS `vtiger_cvadvfilter`;

CREATE TABLE `vtiger_cvadvfilter` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) default '',
  `comparator` varchar(10) default '',
  `value` varchar(200) default '',
  PRIMARY KEY  (`cvid`,`columnindex`),
  KEY `cvadvfilter_cvid_idx` (`cvid`),
  CONSTRAINT `fk_1_vtiger_cvadvfilter` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_cvadvfilter` */

insert  into `vtiger_cvadvfilter`(`cvid`,`columnindex`,`columnname`,`comparator`,`value`) values (2,0,'vtiger_leaddetails:leadstatus:leadstatus:Leads_Lead_Status:V','e','Hot'),(5,0,'vtiger_account:account_type:accounttype:Accounts_Type:V','e','Prospect'),(11,0,'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V','e','Closed Won'),(12,0,'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V','e','Prospecting'),(14,0,'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V','n','Closed'),(15,0,'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V','e','High'),(17,0,'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V','n','Accepted'),(17,1,'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V','n','Rejected'),(18,0,'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V','e','Rejected'),(31,0,'vtiger_faq:status:faqstatus:Faq_Status:V','e','Draft'),(32,0,'vtiger_faq:status:faqstatus:Faq_Status:V','e','Published'),(33,0,'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V','e','Created, Approved, Delivered'),(35,0,'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V','e','Created, Approved, Sent'),(36,0,'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V','e','Paid'),(37,0,'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V','e','Created, Approved'),(39,0,'vtiger_pbxmanager:status:status:PBXManager_Status:V','c','Missed'),(40,0,'vtiger_pbxmanager:status:status:PBXManager_Status:V','c','outgoing'),(41,0,'vtiger_pbxmanager:status:status:PBXManager_Status:V','c','received'),(67,0,'vtiger_warehouse:warehouse_name:warehouse_name:Warehouse_Warehouse_Name:V','c','Test'),(70,0,'vtiger_promotion:product_name:product_name:Promotionalsale_Product_Name:V','c','Test'),(73,0,'vtiger_clearance:product_name:product_name:ClearanceSale_Product_Name:V','c','Test'),(81,0,'vtiger_salesret:invoiceid:invoiceid:SalesReturn_Invoice_Id:N','c','Test'),(90,0,'vtiger_cashreceipt:invoiceid:invoiceid:Cashreceipt_Invoice_Number:V','c','Test'),(95,0,'vtiger_stockadjust:stockadjustid:stockadjustid:Stockadjustment_Stock_Number:V','c','Test'),(102,0,'vtiger_deliverychallan:dcid:dcid:Deliverychallan_Delivery_Id:V','c','Test');

/*Table structure for table `vtiger_cvcolumnlist` */

DROP TABLE IF EXISTS `vtiger_cvcolumnlist`;

CREATE TABLE `vtiger_cvcolumnlist` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) default '',
  PRIMARY KEY  (`cvid`,`columnindex`),
  KEY `cvcolumnlist_columnindex_idx` (`columnindex`),
  KEY `cvcolumnlist_cvid_idx` (`cvid`),
  CONSTRAINT `fk_1_vtiger_cvcolumnlist` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_cvcolumnlist` */

insert  into `vtiger_cvcolumnlist`(`cvid`,`columnindex`,`columnname`) values (1,0,'vtiger_leaddetails:lead_no:lead_no:Leads_Lead_No:V'),(1,1,'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),(1,2,'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),(1,3,'vtiger_leaddetails:company:company:Leads_Company:V'),(1,4,'vtiger_leadaddress:phone:phone:Leads_Phone:V'),(1,5,'vtiger_leadsubdetails:website:website:Leads_Website:V'),(1,6,'vtiger_leaddetails:email:email:Leads_Email:E'),(1,7,'vtiger_crmentity:smownerid:assigned_user_id:Leads_Assigned_To:V'),(2,0,'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),(2,1,'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),(2,2,'vtiger_leaddetails:company:company:Leads_Company:V'),(2,3,'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),(2,4,'vtiger_leadsubdetails:website:website:Leads_Website:V'),(2,5,'vtiger_leaddetails:email:email:Leads_Email:E'),(3,0,'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),(3,1,'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),(3,2,'vtiger_leaddetails:company:company:Leads_Company:V'),(3,3,'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),(3,4,'vtiger_leadsubdetails:website:website:Leads_Website:V'),(3,5,'vtiger_leaddetails:email:email:Leads_Email:E'),(4,0,'vtiger_account:account_no:account_no:Accounts_Account_No:V'),(4,1,'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),(4,2,'vtiger_accountbillads:bill_city:bill_city:Accounts_City:V'),(4,3,'vtiger_account:website:website:Accounts_Website:V'),(4,4,'vtiger_account:phone:phone:Accounts_Phone:V'),(4,5,'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),(5,0,'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),(5,1,'vtiger_account:phone:phone:Accounts_Phone:V'),(5,2,'vtiger_account:website:website:Accounts_Website:V'),(5,3,'vtiger_account:rating:rating:Accounts_Rating:V'),(5,4,'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),(6,0,'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),(6,1,'vtiger_account:phone:phone:Accounts_Phone:V'),(6,2,'vtiger_account:website:website:Accounts_Website:V'),(6,3,'vtiger_accountbillads:bill_city:bill_city:Accounts_City:V'),(6,4,'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),(7,0,'vtiger_contactdetails:contact_no:contact_no:Contacts_Contact_Id:V'),(7,1,'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),(7,2,'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),(7,3,'vtiger_contactdetails:title:title:Contacts_Title:V'),(7,5,'vtiger_contactdetails:email:email:Contacts_Email:E'),(7,6,'vtiger_contactdetails:phone:phone:Contacts_Office_Phone:V'),(8,0,'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),(8,1,'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),(8,2,'vtiger_contactaddress:mailingstreet:mailingstreet:Contacts_Mailing_Street:V'),(8,3,'vtiger_contactaddress:mailingcity:mailingcity:Contacts_Mailing_City:V'),(8,4,'vtiger_contactaddress:mailingstate:mailingstate:Contacts_Mailing_State:V'),(8,5,'vtiger_contactaddress:mailingzip:mailingzip:Contacts_Mailing_Zip:V'),(8,6,'vtiger_contactaddress:mailingcountry:mailingcountry:Contacts_Mailing_Country:V'),(9,0,'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),(9,1,'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),(9,2,'vtiger_contactdetails:title:title:Contacts_Title:V'),(9,3,'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:I'),(9,4,'vtiger_contactdetails:email:email:Contacts_Email:E'),(9,5,'vtiger_contactsubdetails:otherphone:otherphone:Contacts_Phone:V'),(9,6,'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),(10,0,'vtiger_potential:potential_no:potential_no:Potentials_Potential_No:V'),(10,1,'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),(10,2,'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),(10,3,'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V'),(10,4,'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),(10,5,'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),(10,6,'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),(11,0,'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),(11,1,'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),(11,2,'vtiger_potential:amount:amount:Potentials_Amount:N'),(11,3,'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),(11,4,'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),(12,0,'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),(12,1,'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),(12,2,'vtiger_potential:amount:amount:Potentials_Amount:N'),(12,3,'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),(12,4,'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),(12,5,'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),(13,0,'vtiger_troubletickets:ticket_no:ticket_no:HelpDesk_Ticket_No:V'),(13,1,'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),(13,2,'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),(13,3,'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),(13,4,'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),(13,5,'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),(14,0,'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),(14,1,'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),(14,2,'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),(14,3,'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),(14,4,'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),(15,0,'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),(15,1,'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),(15,2,'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),(15,3,'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),(15,4,'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),(16,0,'vtiger_quotes:quote_no:quote_no:Quotes_Quote_No:V'),(16,1,'vtiger_quotes:subject:subject:Quotes_Subject:V'),(16,2,'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),(16,3,'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),(16,4,'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),(16,5,'vtiger_quotes:total:hdnGrandTotal:Quotes_Total:I'),(16,6,'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),(17,0,'vtiger_quotes:subject:subject:Quotes_Subject:V'),(17,1,'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),(17,2,'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),(17,3,'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),(17,4,'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),(17,5,'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),(18,0,'vtiger_quotes:subject:subject:Quotes_Subject:V'),(18,1,'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),(18,2,'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),(18,3,'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),(18,4,'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),(19,0,'vtiger_activity:status:taskstatus:Calendar_Status:V'),(19,1,'vtiger_activity:activitytype:activitytype:Calendar_Type:V'),(19,2,'vtiger_activity:subject:subject:Calendar_Subject:V'),(19,3,'vtiger_seactivityrel:crmid:parent_id:Calendar_Related_to:V'),(19,4,'vtiger_activity:date_start:date_start:Calendar_Start_Date:D'),(19,5,'vtiger_activity:due_date:due_date:Calendar_End_Date:D'),(19,6,'vtiger_crmentity:smownerid:assigned_user_id:Calendar_Assigned_To:V'),(20,0,'vtiger_activity:subject:subject:Emails_Subject:V'),(20,1,'vtiger_emaildetails:to_email:saved_toid:Emails_To:V'),(20,2,'vtiger_activity:date_start:date_start:Emails_Date_Sent:D'),(21,0,'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),(21,1,'vtiger_invoice:customername:customername:Invoice_Customer_Name:V'),(21,2,'vtiger_invoice:mobile:mobile:Invoice_Mobile:V'),(21,3,'vtiger_invoice:subtotal:hdnSubTotal:Invoice_Sub_Total:N'),(21,4,'vtiger_invoice:total:hdnGrandTotal:Invoice_Total:N'),(21,5,'vtiger_invoice:invoicedate:invoicedate:Invoice_Invoice_Date:D'),(22,0,'vtiger_notes:note_no:note_no:Notes_Note_No:V'),(22,1,'vtiger_notes:title:notes_title:Notes_Title:V'),(22,2,'vtiger_notes:filename:filename:Notes_File:V'),(22,3,'vtiger_crmentity:modifiedtime:modifiedtime:Notes_Modified_Time:V'),(22,4,'vtiger_crmentity:smownerid:assigned_user_id:Notes_Assigned_To:V'),(23,0,'vtiger_pricebook:pricebook_no:pricebook_no:PriceBooks_PriceBook_No:V'),(23,1,'vtiger_pricebook:bookname:bookname:PriceBooks_Price_Book_Name:V'),(23,2,'vtiger_pricebook:active:active:PriceBooks_Active:V'),(23,3,'vtiger_pricebook:currency_id:currency_id:PriceBooks_Currency:I'),(24,0,'vtiger_products:barcode:barcode:Products_Barcode:V'),(24,1,'vtiger_products:productname:productname:Products_Product_Name:V'),(24,2,'vtiger_products:qtyinstock:qtyinstock:Products_Qty_In_Stock:NN'),(24,3,'vtiger_products:unit_price:unit_price:Products_Selling_Price:N'),(24,4,'vtiger_products:vat:vat:Products_VAT(%):NN'),(24,5,'vtiger_products:netprice:netprice:Products_MRP:(Rs.):N'),(24,6,'vtiger_products:reorderlevel:reorderlevel:Products_Reorder_Level:NN'),(25,0,'vtiger_purchaseorder:purchaseorder_no:purchaseorder_no:PurchaseOrder_PurchaseOrder_No:V'),(25,2,'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),(25,4,'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),(26,0,'vtiger_salesorder:salesorder_no:salesorder_no:SalesOrder_SalesOrder_No:V'),(26,1,'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),(26,2,'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),(26,3,'vtiger_salesorder:quoteid:quote_id:SalesOrder_Quote_Name:I'),(26,4,'vtiger_salesorder:total:hdnGrandTotal:SalesOrder_Total:V'),(26,5,'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),(27,0,'vtiger_vendor:vendor_no:vendor_no:Vendors_Vendor_No:V'),(27,1,'vtiger_vendor:vendorname:vendorname:Vendors_Vendor_Name:V'),(27,2,'vtiger_vendor:phone:phone:Vendors_Phone:V'),(27,3,'vtiger_vendor:email:email:Vendors_Email:E'),(27,4,'vtiger_vendor:category:category:Vendors_Category:V'),(28,0,'vtiger_faq:faq_no:faq_no:Faq_Faq_No:V'),(28,1,'vtiger_faq:question:question:Faq_Question:V'),(28,2,'vtiger_faq:category:faqcategories:Faq_Category:V'),(28,3,'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),(28,4,'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:D'),(28,5,'vtiger_crmentity:modifiedtime:modifiedtime:Faq_Modified_Time:D'),(29,0,'vtiger_campaign:campaign_no:campaign_no:Campaigns_Campaign_No:V'),(29,1,'vtiger_campaign:campaignname:campaignname:Campaigns_Campaign_Name:V'),(29,2,'vtiger_campaign:campaigntype:campaigntype:Campaigns_Campaign_Type:N'),(29,3,'vtiger_campaign:campaignstatus:campaignstatus:Campaigns_Campaign_Status:N'),(29,4,'vtiger_campaign:expectedrevenue:expectedrevenue:Campaigns_Expected_Revenue:V'),(29,5,'vtiger_campaign:closingdate:closingdate:Campaigns_Expected_Close_Date:D'),(29,6,'vtiger_crmentity:smownerid:assigned_user_id:Campaigns_Assigned_To:V'),(30,0,'subject:subject:subject:Subject:V'),(30,1,'from:fromname:fromname:From:N'),(30,2,'to:tpname:toname:To:N'),(30,3,'body:body:body:Body:V'),(31,0,'vtiger_faq:question:question:Faq_Question:V'),(31,1,'vtiger_faq:status:faqstatus:Faq_Status:V'),(31,2,'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),(31,3,'vtiger_faq:category:faqcategories:Faq_Category:V'),(31,4,'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:T'),(32,0,'vtiger_faq:question:question:Faq_Question:V'),(32,1,'vtiger_faq:answer:faq_answer:Faq_Answer:V'),(32,2,'vtiger_faq:status:faqstatus:Faq_Status:V'),(32,3,'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),(32,4,'vtiger_faq:category:faqcategories:Faq_Category:V'),(32,5,'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:T'),(33,0,'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),(33,1,'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V'),(33,2,'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),(33,3,'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),(33,4,'vtiger_purchaseorder:duedate:duedate:PurchaseOrder_Due_Date:V'),(35,0,'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),(35,1,'vtiger_invoice:subject:subject:Invoice_Subject:V'),(35,2,'vtiger_invoice:accountid:account_id:Invoice_Account_Name:I'),(35,3,'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),(35,4,'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),(35,5,'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),(35,6,'vtiger_crmentity:createdtime:createdtime:Invoice_Created_Time:T'),(36,0,'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),(36,1,'vtiger_invoice:subject:subject:Invoice_Subject:V'),(36,2,'vtiger_invoice:accountid:account_id:Invoice_Account_Name:I'),(36,3,'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),(36,4,'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),(36,5,'vtiger_invoiceshipads:ship_street:ship_street:Invoice_Shipping_Address:V'),(36,6,'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),(37,0,'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),(37,1,'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),(37,2,'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V'),(37,3,'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),(37,4,'vtiger_soshipads:ship_street:ship_street:SalesOrder_Shipping_Address:V'),(37,5,'vtiger_salesorder:carrier:carrier:SalesOrder_Carrier:V'),(38,0,'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),(38,1,'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),(38,2,'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),(38,3,'vtiger_pbxmanager:status:status:PBXManager_Status:V'),(39,0,'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),(39,1,'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),(39,2,'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),(39,3,'vtiger_pbxmanager:status:status:PBXManager_Status:V'),(40,0,'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),(40,1,'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),(40,2,'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),(40,3,'vtiger_pbxmanager:status:status:PBXManager_Status:V'),(41,0,'vtiger_pbxmanager:callfrom:callfrom:PBXManager_Call_From:V'),(41,1,'vtiger_pbxmanager:callto:callto:PBXManager_Call_To:V'),(41,2,'vtiger_pbxmanager:timeofcall:timeofcall:PBXManager_Time_Of_Call:V'),(41,3,'vtiger_pbxmanager:status:status:PBXManager_Status:V'),(42,0,'vtiger_servicecontracts:contract_no:contract_no:ServiceContracts_Contract_No:V'),(42,1,'vtiger_servicecontracts:subject:subject:ServiceContracts_Subject:V'),(42,2,'vtiger_servicecontracts:sc_related_to:sc_related_to:ServiceContracts_Related_to:V'),(42,3,'vtiger_crmentity:smownerid:assigned_user_id:ServiceContracts_Assigned_To:V'),(42,4,'vtiger_servicecontracts:start_date:start_date:ServiceContracts_Start_Date:D'),(42,5,'vtiger_servicecontracts:due_date:due_date:ServiceContracts_Due_date:D'),(42,7,'vtiger_servicecontracts:progress:progress:ServiceContracts_Progress:N'),(42,8,'vtiger_servicecontracts:contract_status:contract_status:ServiceContracts_Status:V'),(43,0,'vtiger_service:service_no:service_no:Services_Service_No:V'),(43,1,'vtiger_service:servicename:servicename:Services_Service_Name:V'),(43,2,'vtiger_service:service_usageunit:service_usageunit:Services_Usage_Unit:V'),(43,3,'vtiger_service:unit_price:unit_price:Services_Price:N'),(43,4,'vtiger_service:qty_per_unit:qty_per_unit:Services_No_of_Units:N'),(43,5,'vtiger_service:servicecategory:servicecategory:Services_Service_Category:V'),(43,6,'vtiger_service:handler:assigned_user_id:Services_Owner:I'),(44,0,'vtiger_assets:asset_no:asset_no:Assets_Asset_No:V'),(44,1,'vtiger_assets:assetname:assetname:Assets_Asset_Name:V'),(44,2,'vtiger_assets:account:account:Assets_Customer_Name:V'),(44,3,'vtiger_assets:product:product:Assets_Product_Name:V'),(45,0,'vtiger_modcomments:commentcontent:commentcontent:ModComments_Comment:V'),(45,1,'vtiger_modcomments:related_to:related_to:ModComments_Related_To:V'),(45,2,'vtiger_crmentity:modifiedtime:modifiedtime:ModComments_Modified_Time:T'),(45,3,'vtiger_crmentity:smownerid:assigned_user_id:ModComments_Assigned_To:V'),(46,0,'vtiger_projectmilestone:projectmilestonename:projectmilestonename:ProjectMilestone_Project_Milestone_Name:V'),(46,1,'vtiger_projectmilestone:projectmilestonedate:projectmilestonedate:ProjectMilestone_Milestone_Date:D'),(46,3,'vtiger_crmentity:description:description:ProjectMilestone_description:V'),(46,4,'vtiger_crmentity:createdtime:createdtime:ProjectMilestone_Created_Time:T'),(46,5,'vtiger_crmentity:modifiedtime:modifiedtime:ProjectMilestone_Modified_Time:T'),(47,2,'vtiger_projecttask:projecttaskname:projecttaskname:ProjectTask_Project_Task_Name:V'),(47,3,'vtiger_projecttask:projectid:projectid:ProjectTask_Related_to:V'),(47,4,'vtiger_projecttask:projecttaskpriority:projecttaskpriority:ProjectTask_Priority:V'),(47,5,'vtiger_projecttask:projecttaskprogress:projecttaskprogress:ProjectTask_Progress:V'),(47,6,'vtiger_projecttask:projecttaskhours:projecttaskhours:ProjectTask_Worked_Hours:V'),(47,7,'vtiger_projecttask:startdate:startdate:ProjectTask_Start_Date:D'),(47,8,'vtiger_projecttask:enddate:enddate:ProjectTask_End_Date:D'),(47,9,'vtiger_crmentity:smownerid:assigned_user_id:ProjectTask_Assigned_To:V'),(48,0,'vtiger_project:projectname:projectname:Project_Project_Name:V'),(48,1,'vtiger_project:linktoaccountscontacts:linktoaccountscontacts:Project_Related_to:V'),(48,2,'vtiger_project:startdate:startdate:Project_Start_Date:D'),(48,3,'vtiger_project:targetenddate:targetenddate:Project_Target_End_Date:D'),(48,4,'vtiger_project:actualenddate:actualenddate:Project_Actual_End_Date:D'),(48,5,'vtiger_project:targetbudget:targetbudget:Project_Target_Budget:V'),(48,6,'vtiger_project:progress:progress:Project_Progress:V'),(48,7,'vtiger_project:projectstatus:projectstatus:Project_Status:V'),(48,8,'vtiger_crmentity:smownerid:assigned_user_id:Project_Assigned_To:V'),(49,0,'vtiger_smsnotifier:message:message:SMSNotifier_message:V'),(49,2,'vtiger_crmentity:smownerid:assigned_user_id:SMSNotifier_Assigned_To:V'),(49,3,'vtiger_crmentity:createdtime:createdtime:SMSNotifier_Created_Time:T'),(49,4,'vtiger_crmentity:modifiedtime:modifiedtime:SMSNotifier_Modified_Time:T'),(53,0,'vtiger_products:barcode:barcode:Products_Barcode:V'),(53,1,'vtiger_products:productname:productname:Products_Product_Name:V'),(53,2,'vtiger_products:qtyinstock:qtyinstock:Products_Qty_In_Stock:NN'),(53,3,'vtiger_products:unit_price:unit_price:Products_Selling_Price(Rs.):N'),(53,4,'vtiger_products:vat:vat:Products_VAT(%):NN'),(53,5,'vtiger_products:netprice:netprice:Products_MRP:(Rs.):N'),(53,6,'vtiger_products:reorderlevel:reorderlevel:Products_Reorder_Level:NN'),(56,0,'vtiger_barcode:barcode:barcode:Barcode_Barcode:V'),(56,1,'vtiger_barcode:product_name:product_name:Barcode_Product_Name:V'),(56,2,'vtiger_barcode:price:price:Barcode_Selling_Price:(Rs.):N'),(56,3,'vtiger_barcode:vat:vat:Barcode_VAT(%):N'),(56,4,'vtiger_barcode:netprice:netprice:Barcode_MRP:(Rs.)_:N'),(56,5,'vtiger_barcode:size:size:Barcode_Size:V'),(56,6,'vtiger_barcode:barcode_color:barcode_color:Barcode_Color:V'),(59,0,'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),(59,1,'vtiger_invoice:customername:customername:Invoice_Customer_Name:V'),(59,2,'vtiger_invoice:mobile:mobile:Invoice_Mobile:V'),(59,3,'vtiger_invoice:salesorderno:salesorderno:Invoice_Sales_Order_No.:V'),(59,4,'vtiger_invoice:email:email:Invoice_Email:E'),(59,5,'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),(66,0,'vtiger_warehouse:warehouse_name:warehouse_name:Warehouse_Warehouse_Name:V'),(66,1,'vtiger_warehouse:address1:address1:Warehouse_Address1:V'),(66,2,'vtiger_warehouse:street:street:Warehouse_Street:V'),(66,3,'vtiger_warehouse:city:city:Warehouse_City:V'),(66,4,'vtiger_warehouse:state:state:Warehouse_State:V'),(66,5,'vtiger_warehouse:country:country:Warehouse_Country:V'),(66,6,'vtiger_warehouse:contact_person_name:contact_person_name:Warehouse_Contact_Person_Fullname:V'),(66,7,'vtiger_warehouse:mobile:mobile:Warehouse_Mobile:V'),(66,8,'vtiger_warehouse:landline:landline:Warehouse_Landline:V'),(67,0,'vtiger_warehouse:warehouse_name:warehouse_name:Warehouse_Warehouse_Name:V'),(67,1,'vtiger_warehouse:contact_person_name:contact_person_name:Warehouse_Contact_Person_Fullname:V'),(68,0,'vtiger_warehouse:warehouse_name:warehouse_name:Warehouse_Warehouse_Name:V'),(68,1,'vtiger_warehouse:address1:address1:Warehouse_Address1:V'),(68,2,'vtiger_warehouse:street:street:Warehouse_Street:V'),(68,3,'vtiger_warehouse:city:city:Warehouse_City:V'),(68,4,'vtiger_warehouse:state:state:Warehouse_State:V'),(68,5,'vtiger_warehouse:country:country:Warehouse_Country:V'),(68,6,'vtiger_warehouse:contact_person_name:contact_person_name:Warehouse_Contact_Person_Fullname:V'),(68,7,'vtiger_warehouse:mobile:mobile:Warehouse_Mobile:V'),(68,8,'vtiger_warehouse:landline:landline:Warehouse_Landline:V'),(69,0,'vtiger_promotion:productid:productid:Promotionalsale_Product_Id:I'),(69,1,'vtiger_promotion:product_name:product_name:Promotionalsale_Product_Name:V'),(69,2,'vtiger_promotion:qty:qty:Promotionalsale_Quantity:N'),(69,3,'vtiger_promotion:mrp:mrp:Promotionalsale_Mrp:N'),(69,4,'vtiger_promotion:vat:vat:Promotionalsale_Vat(%):N'),(69,5,'vtiger_promotion:service:service:Promotionalsale_Service(%):N'),(69,6,'vtiger_promotion:netprice:netprice:Promotionalsale_Net_Price:N'),(69,7,'vtiger_promotion:from_date:from_date:Promotionalsale_From_Date:DT'),(69,8,'vtiger_promotion:to_date:to_date:Promotionalsale_To_Date:DT'),(69,9,'vtiger_crmentity:smownerid:assigned_user_id:Promotionalsale_Assigned_To:V'),(70,0,'vtiger_promotion:product_name:product_name:Promotionalsale_Product_Name:V'),(70,1,'vtiger_promotion:mrp:mrp:Promotionalsale_Mrp:N'),(71,0,'vtiger_promotion:product_name:product_name:Promotionalsale_Product_Name:V'),(71,1,'vtiger_promotion:qty:qty:Promotionalsale_Quantity:N'),(71,2,'vtiger_promotion:mrp:mrp:Promotionalsale_Mrp:N'),(71,3,'vtiger_promotion:vat:vat:Promotionalsale_Vat(%):N'),(71,4,'vtiger_promotion:service:service:Promotionalsale_Service(%):N'),(71,5,'vtiger_promotion:netprice:netprice:Promotionalsale_Net_Price:N'),(71,6,'vtiger_promotion:from_date:from_date:Promotionalsale_From_Date:DT'),(71,7,'vtiger_promotion:to_date:to_date:Promotionalsale_To_Date:DT'),(72,0,'vtiger_clearance:product_name:product_name:ClearanceSale_Product_Name:V'),(72,1,'vtiger_clearance:from_date:from_date:ClearanceSale_From_Date:DT'),(72,2,'vtiger_clearance:to_date:to_date:ClearanceSale_To_Date:DT'),(72,3,'vtiger_clearance:clearanceprice:clearanceprice:ClearanceSale_New_MRP:N'),(72,4,'vtiger_clearance:vat:vat:ClearanceSale_Vat(%):N'),(72,5,'vtiger_clearance:newmrp:newmrp:ClearanceSale_New_Selling_Price:N'),(73,0,'vtiger_clearance:product_name:product_name:ClearanceSale_Product_Name:V'),(73,1,'vtiger_clearance:discount:discount:ClearanceSale_Discount:N'),(74,0,'vtiger_clearance:product_name:product_name:ClearanceSale_Product_Name:V'),(74,1,'vtiger_clearance:mrp:mrp:ClearanceSale_Selling_Price:N'),(74,2,'vtiger_clearance:discount:discount:ClearanceSale_Discount:N'),(74,3,'vtiger_clearance:clearanceprice:clearanceprice:ClearanceSale_New_Selling_Price:N'),(74,4,'vtiger_clearance:vat:vat:ClearanceSale_Vat(%):N'),(74,6,'vtiger_clearance:clearanceprice:clearanceprice:ClearanceSale_New_Selling_Price:N'),(74,7,'vtiger_clearance:from_date:from_date:ClearanceSale_From_Date:DT'),(74,8,'vtiger_clearance:to_date:to_date:ClearanceSale_To_Date:DT'),(75,0,'vtiger_purchaseorderreceived:purchaseorder_no:purchaseorder_no:PurchaseOrderReceived_PurchaseOrder_No:V'),(75,1,'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),(75,2,'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),(75,3,'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),(75,4,'vtiger_purchaseorder:duedate:duedate:PurchaseOrder_duedate:V'),(75,5,'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Cost:V'),(79,0,'vtiger_purchaseorderreceived:purchaseorder_no:purchaseorder_no:PurchaseOrderReceived_PurchaseOrder_No:V'),(79,1,'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),(79,2,'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),(79,3,'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),(79,4,'vtiger_purchaseorder:duedate:duedate:PurchaseOrder_duedate:V'),(79,5,'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Cost:V'),(80,0,'vtiger_salesret:invoiceid:invoiceid:SalesReturn_Invoice_Id:N'),(80,1,'vtiger_salesret:salesid:salesid:SalesReturn_Sales_Id:N'),(80,2,'vtiger_crmentity:smownerid:assigned_user_id:SalesReturn_Assigned_To:V'),(80,3,'vtiger_salesret:customername:customername:SalesReturn_Customername:N'),(80,4,'vtiger_salesret:mobile:mobile:SalesReturn_Mobile:N'),(81,0,'vtiger_salesret:invoiceid:invoiceid:SalesReturn_Invoice_Id:N'),(81,1,'vtiger_salesret:customername:customername:SalesReturn_Customername:N'),(82,0,'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),(82,1,'vtiger_invoice:customername:customername:Invoice_Customer_Name:V'),(82,2,'vtiger_invoice:mobile:mobile:Invoice_Mobile:V'),(82,3,'vtiger_invoice:subtotal:hdnSubTotal:Invoice_Sub_Total:N'),(82,4,'vtiger_invoice:total:hdnGrandTotal:Invoice_Total:N'),(82,5,'vtiger_invoice:invoicedate:invoicedate:Invoice_Invoice_Date:D'),(89,0,'vtiger_cashreceipt:invoiceid:invoiceid:Cashreceipt_Invoice_Number:V'),(89,2,'vtiger_crmentity:smownerid:assigned_user_id:Cashreceipt_Assigned_To:V'),(90,0,'vtiger_cashreceipt:invoiceid:invoiceid:Cashreceipt_Invoice_Number:V'),(91,0,'vtiger_cashreceipt:invoiceid:invoiceid:Cashreceipt_Invoice_Number:V'),(91,1,'vtiger_cashreceipt:customerid:customerid:Cashreceipt_Customer_Name:N'),(91,2,'vtiger_cashreceipt:grandtotal:grandtotal:Cashreceipt_Grand_Total:N'),(91,3,'vtiger_cashreceipt:creditamount:creditamount:Cashreceipt_Credit_Amount:N'),(91,4,'vtiger_cashreceipt:paidamount:paidamount:Cashreceipt_Paid_Amount:N'),(91,5,'vtiger_cashreceipt:pendingamount:pendingamount:Cashreceipt_Pending_Amount:N'),(94,0,'vtiger_stockadjust:stockadjustid:stockadjustid:Stockadjustment_Stock_Number:V'),(94,2,'vtiger_crmentity:smownerid:assigned_user_id:Stockadjustment_Assigned_To:V'),(95,0,'vtiger_stockadjust:stockadjustid:stockadjustid:Stockadjustment_Stock_Number:V'),(95,1,'vtiger_stockadjust:stocktotal:stocktotal:Stockadjustment_Stock_Total:V'),(95,2,'vtiger_stockadjust:productid:productid:Stockadjustment_Stock_Product_Id:V'),(95,3,'vtiger_stockadjust:adjustqty:adjustqty:Stockadjustment_Stock_Adjust_Qty:V'),(95,4,'vtiger_stockadjust:debitdate:debitdate:Stockadjustment_Debitdate:D'),(99,0,'vtiger_category:categoryname:categoryname:Category_Category_Name:V'),(99,1,'vtiger_category:taxtype:taxtype:Category_Tax_Type:V'),(99,2,'vtiger_category:vat:vat:Category_VAT(%):V'),(99,3,'vtiger_category:size:size:Category_Size:V'),(99,4,'vtiger_category:color:color:Category_Color:V'),(100,0,'vtiger_category:categoryname:categoryname:Category_Category_Name:V'),(100,1,'vtiger_category:taxtype:taxtype:Category_Tax_Type:V'),(100,2,'vtiger_category:vat:vat:Category_VAT(%):V'),(100,3,'vtiger_category:size:size:Category_Size:V'),(100,4,'vtiger_category:color:color:Category_Color:V'),(101,0,'vtiger_deliverychallan:from_wh_st:from_wh_st:Deliverychallan_From_Warehouse:V'),(101,1,'vtiger_deliverychallan:to_wh_st:to_wh_st:Deliverychallan_To_Warehouse:V'),(101,2,'vtiger_deliverychallan:createddate:createddate:Deliverychallan_Delivery_Date:D'),(101,3,'vtiger_deliverychallan:status:status:Deliverychallan_Status:V'),(102,0,'vtiger_deliverychallan:from_wh_st:from_wh_st:Deliverychallan_From_Warehouse:V'),(102,1,'vtiger_deliverychallan:to_wh_st:to_wh_st:Deliverychallan_To_Warehouse:V'),(102,2,'vtiger_deliverychallan:createddate:createddate:Deliverychallan_Delivery_Date:D'),(102,3,'vtiger_deliverychallan:status:status:Deliverychallan_Status:V'),(103,0,'vtiger_deliverychallan:from_wh_st:from_wh_st:Deliverychallan_From_Warehouse:V'),(103,1,'vtiger_deliverychallan:to_wh_st:to_wh_st:Deliverychallan_To_Warehouse:V'),(103,2,'vtiger_deliverychallan:createddate:createddate:Deliverychallan_Delivery_Date:D'),(103,3,'vtiger_deliverychallan:status:status:Deliverychallan_Status:V'),(104,0,'vtiger_clearance:product_name:product_name:ClearanceSale_Product_Name:V'),(104,1,'vtiger_clearance:from_date:from_date:ClearanceSale_From_Date:DT'),(104,2,'vtiger_clearance:to_date:to_date:ClearanceSale_To_Date:DT'),(104,3,'vtiger_clearance:clearanceprice:clearanceprice:ClearanceSale_New_MRP:N'),(104,4,'vtiger_clearance:vat:vat:ClearanceSale_Vat(%):N'),(104,5,'vtiger_clearance:newmrp:newmrp:ClearanceSale_New_Selling_Price:N'),(105,0,'vtiger_stockadjust:product_name:product_name:Stockadjustment_Product_Name:V'),(105,1,'vtiger_stockadjust:adjustqty:adjustqty:Stockadjustment_Adjust_Quantity:N'),(105,2,'vtiger_stockadjust:stocktotal:stocktotal:Stockadjustment_Stock_Total:N'),(105,3,'vtiger_stockadjust:debitdate:debitdate:Stockadjustment_Debit_Date:T'),(105,4,'vtiger_crmentity:smownerid:assigned_user_id:Stockadjustment_Assigned_To:V'),(106,0,'vtiger_purchaserequest:date:date:PurchaseRequest_Date:D'),(106,1,'vtiger_purchaserequest:customprid:customprid:PurchaseRequest_PurchaseRequest ID:V'),(106,2,'vtiger_purchaserequest:status:status:PurchaseRequest_Status:V'),(107,0,'vtiger_purchaserequest:date:date:PurchaseRequest_Date:D'),(107,1,'vtiger_purchaserequest:customprid:customprid:PurchaseRequest_PurchaseRequest ID:V'),(107,2,'vtiger_purchaserequest:status:status:PurchaseRequest_Status:V'),(108,0,'vtiger_crmentity:smownerid:assigned_user_id:PRDelivery_Assigned_To:V'),(109,0,'vtiger_crmentity:smownerid:assigned_user_id:PRReceive_Assigned_To:V'),(112,0,'vtiger_emailsettings:emailname:emailname:EmailSettings_Email_name:V'),(112,1,'vtiger_emailsettings:sendto:sendto:EmailSettings_Send_To:V'),(112,2,'vtiger_emailsettings:sendcc:sendcc:EmailSettings_Send_Cc:V'),(113,0,'vtiger_emailsettings:emailname:emailname:EmailSettings_Email_name:V'),(113,1,'vtiger_emailsettings:sendto:sendto:EmailSettings_Send_To:V'),(113,2,'vtiger_emailsettings:sendcc:sendcc:EmailSettings_Send_Cc:V');

/*Table structure for table `vtiger_cvstdfilter` */

DROP TABLE IF EXISTS `vtiger_cvstdfilter`;

CREATE TABLE `vtiger_cvstdfilter` (
  `cvid` int(19) NOT NULL,
  `columnname` varchar(250) default '',
  `stdfilter` varchar(250) default '',
  `startdate` date default NULL,
  `enddate` date default NULL,
  PRIMARY KEY  (`cvid`),
  KEY `cvstdfilter_cvid_idx` (`cvid`),
  CONSTRAINT `fk_1_vtiger_cvstdfilter` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_cvstdfilter` */

insert  into `vtiger_cvstdfilter`(`cvid`,`columnname`,`stdfilter`,`startdate`,`enddate`) values (3,'vtiger_crmentity:modifiedtime:modifiedtime:Leads_Modified_Time','thismonth','2005-06-01','2005-06-30'),(6,'vtiger_crmentity:createdtime:createdtime:Accounts_Created_Time','thisweek','2005-06-19','2005-06-25'),(9,'vtiger_contactsubdetails:birthday:birthday:Contacts_Birthdate','today','2005-06-25','2005-06-25');

/*Table structure for table `vtiger_datashare_grp2grp` */

DROP TABLE IF EXISTS `vtiger_datashare_grp2grp`;

CREATE TABLE `vtiger_datashare_grp2grp` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) default NULL,
  `to_groupid` int(19) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_grp2grp_share_groupid_idx` (`share_groupid`),
  KEY `datashare_grp2grp_to_groupid_idx` (`to_groupid`),
  CONSTRAINT `fk_3_vtiger_datashare_grp2grp` FOREIGN KEY (`to_groupid`) REFERENCES `vtiger_groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_grp2grp` */

/*Table structure for table `vtiger_datashare_grp2role` */

DROP TABLE IF EXISTS `vtiger_datashare_grp2role`;

CREATE TABLE `vtiger_datashare_grp2role` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) default NULL,
  `to_roleid` varchar(255) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `idx_datashare_grp2role_share_groupid` (`share_groupid`),
  KEY `idx_datashare_grp2role_to_roleid` (`to_roleid`),
  CONSTRAINT `fk_3_vtiger_datashare_grp2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_grp2role` */

/*Table structure for table `vtiger_datashare_grp2rs` */

DROP TABLE IF EXISTS `vtiger_datashare_grp2rs`;

CREATE TABLE `vtiger_datashare_grp2rs` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) default NULL,
  `to_roleandsubid` varchar(255) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_grp2rs_share_groupid_idx` (`share_groupid`),
  KEY `datashare_grp2rs_to_roleandsubid_idx` (`to_roleandsubid`),
  CONSTRAINT `fk_3_vtiger_datashare_grp2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_grp2rs` */

/*Table structure for table `vtiger_datashare_module_rel` */

DROP TABLE IF EXISTS `vtiger_datashare_module_rel`;

CREATE TABLE `vtiger_datashare_module_rel` (
  `shareid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `relationtype` varchar(200) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `idx_datashare_module_rel_tabid` (`tabid`),
  CONSTRAINT `fk_1_vtiger_datashare_module_rel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_module_rel` */

insert  into `vtiger_datashare_module_rel`(`shareid`,`tabid`,`relationtype`) values (1,56,'RS::ROLE');

/*Table structure for table `vtiger_datashare_module_rel_seq` */

DROP TABLE IF EXISTS `vtiger_datashare_module_rel_seq`;

CREATE TABLE `vtiger_datashare_module_rel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_module_rel_seq` */

insert  into `vtiger_datashare_module_rel_seq`(`id`) values (2);

/*Table structure for table `vtiger_datashare_relatedmodule_permission` */

DROP TABLE IF EXISTS `vtiger_datashare_relatedmodule_permission`;

CREATE TABLE `vtiger_datashare_relatedmodule_permission` (
  `shareid` int(19) NOT NULL,
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`,`datashare_relatedmodule_id`),
  KEY `datashare_relatedmodule_permission_shareid_permissions_idx` (`shareid`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_relatedmodule_permission` */

/*Table structure for table `vtiger_datashare_relatedmodules` */

DROP TABLE IF EXISTS `vtiger_datashare_relatedmodules`;

CREATE TABLE `vtiger_datashare_relatedmodules` (
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `tabid` int(19) default NULL,
  `relatedto_tabid` int(19) default NULL,
  PRIMARY KEY  (`datashare_relatedmodule_id`),
  KEY `datashare_relatedmodules_tabid_idx` (`tabid`),
  KEY `datashare_relatedmodules_relatedto_tabid_idx` (`relatedto_tabid`),
  CONSTRAINT `fk_2_vtiger_datashare_relatedmodules` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_relatedmodules` */

insert  into `vtiger_datashare_relatedmodules`(`datashare_relatedmodule_id`,`tabid`,`relatedto_tabid`) values (1,6,2),(2,6,13),(3,6,20),(4,6,22),(5,6,23),(6,2,20),(7,2,22),(8,20,22),(9,22,23);

/*Table structure for table `vtiger_datashare_relatedmodules_seq` */

DROP TABLE IF EXISTS `vtiger_datashare_relatedmodules_seq`;

CREATE TABLE `vtiger_datashare_relatedmodules_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_relatedmodules_seq` */

insert  into `vtiger_datashare_relatedmodules_seq`(`id`) values (9);

/*Table structure for table `vtiger_datashare_role2group` */

DROP TABLE IF EXISTS `vtiger_datashare_role2group`;

CREATE TABLE `vtiger_datashare_role2group` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) default NULL,
  `to_groupid` int(19) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `idx_datashare_role2group_share_roleid` (`share_roleid`),
  KEY `idx_datashare_role2group_to_groupid` (`to_groupid`),
  CONSTRAINT `fk_3_vtiger_datashare_role2group` FOREIGN KEY (`share_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_role2group` */

/*Table structure for table `vtiger_datashare_role2role` */

DROP TABLE IF EXISTS `vtiger_datashare_role2role`;

CREATE TABLE `vtiger_datashare_role2role` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) default NULL,
  `to_roleid` varchar(255) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_role2role_share_roleid_idx` (`share_roleid`),
  KEY `datashare_role2role_to_roleid_idx` (`to_roleid`),
  CONSTRAINT `fk_3_vtiger_datashare_role2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_role2role` */

/*Table structure for table `vtiger_datashare_role2rs` */

DROP TABLE IF EXISTS `vtiger_datashare_role2rs`;

CREATE TABLE `vtiger_datashare_role2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) default NULL,
  `to_roleandsubid` varchar(255) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_role2s_share_roleid_idx` (`share_roleid`),
  KEY `datashare_role2s_to_roleandsubid_idx` (`to_roleandsubid`),
  CONSTRAINT `fk_3_vtiger_datashare_role2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_role2rs` */

/*Table structure for table `vtiger_datashare_rs2grp` */

DROP TABLE IF EXISTS `vtiger_datashare_rs2grp`;

CREATE TABLE `vtiger_datashare_rs2grp` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) default NULL,
  `to_groupid` int(19) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_rs2grp_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `datashare_rs2grp_to_groupid_idx` (`to_groupid`),
  CONSTRAINT `fk_3_vtiger_datashare_rs2grp` FOREIGN KEY (`share_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_rs2grp` */

/*Table structure for table `vtiger_datashare_rs2role` */

DROP TABLE IF EXISTS `vtiger_datashare_rs2role`;

CREATE TABLE `vtiger_datashare_rs2role` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) default NULL,
  `to_roleid` varchar(255) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_rs2role_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `datashare_rs2role_to_roleid_idx` (`to_roleid`),
  CONSTRAINT `fk_3_vtiger_datashare_rs2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_rs2role` */

insert  into `vtiger_datashare_rs2role`(`shareid`,`share_roleandsubid`,`to_roleid`,`permission`) values (1,'H2','H5',0);

/*Table structure for table `vtiger_datashare_rs2rs` */

DROP TABLE IF EXISTS `vtiger_datashare_rs2rs`;

CREATE TABLE `vtiger_datashare_rs2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) default NULL,
  `to_roleandsubid` varchar(255) default NULL,
  `permission` int(19) default NULL,
  PRIMARY KEY  (`shareid`),
  KEY `datashare_rs2rs_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `idx_datashare_rs2rs_to_roleandsubid_idx` (`to_roleandsubid`),
  CONSTRAINT `fk_3_vtiger_datashare_rs2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_datashare_rs2rs` */

/*Table structure for table `vtiger_date_format` */

DROP TABLE IF EXISTS `vtiger_date_format`;

CREATE TABLE `vtiger_date_format` (
  `date_formatid` int(19) NOT NULL auto_increment,
  `date_format` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`date_formatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_date_format` */

insert  into `vtiger_date_format`(`date_formatid`,`date_format`,`sortorderid`,`presence`) values (1,'dd-mm-yyyy',0,1),(2,'mm-dd-yyyy',1,1),(3,'yyyy-mm-dd',2,1);

/*Table structure for table `vtiger_date_format_seq` */

DROP TABLE IF EXISTS `vtiger_date_format_seq`;

CREATE TABLE `vtiger_date_format_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_date_format_seq` */

insert  into `vtiger_date_format_seq`(`id`) values (3);

/*Table structure for table `vtiger_dealintimation` */

DROP TABLE IF EXISTS `vtiger_dealintimation`;

CREATE TABLE `vtiger_dealintimation` (
  `dealintimationid` int(19) NOT NULL default '0',
  `dealname` varchar(100) NOT NULL,
  `intimationamount` int(19) NOT NULL default '0',
  `dealprobability` decimal(3,2) NOT NULL default '0.00',
  `dealintimationactive` int(1) default NULL,
  `fromname` varchar(120) NOT NULL,
  `fromemailid` varchar(100) NOT NULL,
  `notifyemails` varchar(50) NOT NULL,
  `notifybccemails` varchar(50) NOT NULL,
  `notifyccmails` varchar(50) NOT NULL,
  `notifypotentialowner` int(1) default NULL,
  PRIMARY KEY  (`dealintimationid`),
  UNIQUE KEY `dealintimation_dealname_idx` (`dealname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_dealintimation` */

/*Table structure for table `vtiger_debtortransaction` */

DROP TABLE IF EXISTS `vtiger_debtortransaction`;

CREATE TABLE `vtiger_debtortransaction` (
  `transactionid` int(11) NOT NULL auto_increment,
  `date` datetime default NULL,
  `storeid` int(11) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(100) default NULL,
  `openingbalance` double(11,2) default '0.00',
  `invid` int(11) default NULL,
  `inv_no` varchar(100) default NULL,
  `grandtotal` double(11,2) default '0.00',
  `amt_received_by_cash` double(11,2) default '0.00',
  `amt_received_by_card` double(11,2) default '0.00',
  `amt_received_by_check` double(11,2) default '0.00',
  `salesret_id` int(11) default NULL,
  `amt_return` double(11,2) default '0.00',
  `mode_of_payment` varchar(100) default NULL,
  `bank_name` varchar(25) default NULL,
  `checkno` varchar(100) default NULL,
  `check_date` date default NULL,
  `balance` double(11,2) default '0.00',
  `adjustment` double(11,2) default '0.00',
  `ref_inv_no` varchar(100) default NULL,
  `closingbalance` double(11,2) default '0.00',
  `modulename` varchar(100) default NULL,
  PRIMARY KEY  (`transactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_debtortransaction` */

insert  into `vtiger_debtortransaction`(`transactionid`,`date`,`storeid`,`userid`,`username`,`openingbalance`,`invid`,`inv_no`,`grandtotal`,`amt_received_by_cash`,`amt_received_by_card`,`amt_received_by_check`,`salesret_id`,`amt_return`,`mode_of_payment`,`bank_name`,`checkno`,`check_date`,`balance`,`adjustment`,`ref_inv_no`,`closingbalance`,`modulename`) values (1,'2012-07-03 05:15:09',3,0,'',0.00,24,'INV1_ST1_MNG',7083.44,7083.44,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(2,'2012-07-03 05:45:51',3,0,'',0.00,25,'INV2_ST1_MNG',2362.73,2362.73,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(3,'2012-07-03 08:00:24',3,0,'',0.00,24,'INV1_ST1_MNG',0.00,0.00,0.00,0.00,26,2595.91,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(4,'2012-07-03 08:18:23',3,0,'',0.00,24,'INV1_ST1_MNG',0.00,0.00,0.00,0.00,27,3541.72,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(5,'2012-07-03 08:21:26',3,0,'',0.00,25,'INV2_ST1_MNG',0.00,0.00,0.00,0.00,28,1181.36,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(6,'2012-07-04 11:30:55',3,0,'',0.00,29,'INV3_ST1_MNG',10383.66,10383.66,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(7,'2012-07-04 11:34:02',3,0,'',0.00,29,'INV3_ST1_MNG',0.00,0.00,0.00,0.00,30,5191.83,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(8,'2012-07-04 11:53:08',3,0,'',0.00,29,'INV3_ST1_MNG',0.00,0.00,0.00,0.00,31,2595.91,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(9,'2012-07-04 07:54:36',3,0,'',0.00,33,'INV4_ST1_MNG',2650.43,2650.43,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(10,'2012-07-05 08:07:59',3,35,'Girish',0.00,34,'INV5_ST1_MNG',15793.55,5793.55,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',10000.00,0.00,NULL,10000.00,'Sales'),(11,'2012-07-05 12:40:18',3,35,'Girish',10000.00,34,'INV5_ST1_MNG',15793.55,5000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',5000.00,0.00,NULL,5000.00,'Cashreceipt'),(12,'2012-07-05 08:12:48',3,35,'Girish',5000.00,34,'INV5_ST1_MNG',0.00,0.00,0.00,0.00,37,7896.77,NULL,NULL,NULL,NULL,0.00,0.00,NULL,-2896.77,'Sales Return'),(13,'2012-07-05 11:59:35',3,0,'',0.00,38,'INV6_ST1_MNG',2983.50,2983.50,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(14,'2012-07-05 12:01:25',3,0,'',0.00,39,'INV7_ST1_MNG',387.59,387.59,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(15,'2012-07-05 12:05:29',3,0,'',0.00,40,'INV8_ST1_MNG',387.59,387.59,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(16,'2012-07-05 12:38:03',3,35,'Girish',-2896.77,34,'INV5_ST1_MNG',0.00,0.00,0.00,0.00,41,2650.43,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(17,'2012-07-05 12:41:48',3,35,'Girish',0.00,34,'INV5_ST1_MNG',0.00,0.00,0.00,0.00,42,2650.43,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(18,'2012-07-05 01:48:33',3,35,'Girish',0.00,34,'INV5_ST1_MNG',0.00,0.00,0.00,0.00,43,2595.91,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(19,'2012-07-05 02:00:17',3,0,'',0.00,38,'INV6_ST1_MNG',0.00,0.00,0.00,0.00,44,2595.91,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(20,'2012-07-05 02:01:51',3,0,'',0.00,38,'INV6_ST1_MNG',0.00,0.00,0.00,0.00,45,2595.91,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(21,'2012-07-05 02:04:43',3,0,'',0.00,40,'INV8_ST1_MNG',0.00,0.00,0.00,0.00,46,387.59,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(22,'2012-07-05 02:08:44',3,0,'',0.00,29,'INV3_ST1_MNG ',0.00,0.00,0.00,0.00,47,2595.91,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(23,'2012-07-05 02:13:01',3,0,'',0.00,24,'INV1_ST1_MNG',0.00,0.00,0.00,0.00,48,945.81,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(24,'2012-07-05 02:16:38',3,0,'',0.00,25,'INV2_ST1_MNG ',0.00,0.00,0.00,0.00,49,1181.36,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(25,'2012-07-05 02:20:21',3,0,'',0.00,38,'INV6_ST1_MNG',0.00,0.00,0.00,0.00,50,387.59,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(26,'2012-07-05 02:24:23',3,0,'',0.00,38,'INV6_ST1_MNG',0.00,0.00,0.00,0.00,51,387.59,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(27,'2012-07-05 02:26:28',3,0,'',0.00,33,'INV4_ST1_MNG ',0.00,0.00,0.00,0.00,52,2650.43,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(28,'2012-07-05 19:26:59',3,35,'Girish',0.00,34,'INV5_ST1_MNG',15793.55,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',4000.00,0.00,NULL,-1000.00,'Cashreceipt'),(29,'2012-07-05 19:39:15',3,35,'Girish',-1000.00,34,'INV5_ST1_MNG',15793.55,0.00,0.00,1000.00,NULL,0.00,'bank','State Bank of India','123','2012-07-05',3000.00,0.00,NULL,-2000.00,'Cashreceipt'),(30,'2012-07-05 19:39:36',3,35,'Girish',-2000.00,34,'INV5_ST1_MNG',15793.55,0.00,0.00,1000.00,NULL,0.00,'bank','State Bank of India','123','2012-07-05',3000.00,0.00,NULL,-3000.00,'Cashreceipt'),(31,'2012-07-05 19:42:45',3,35,'Girish',-3000.00,34,'INV5_ST1_MNG',15793.55,0.00,0.00,1000.00,NULL,0.00,'bank','State Bank of India','354353','2012-07-05',1000.00,0.00,NULL,-4000.00,'Cashreceipt'),(32,'2012-07-05 19:43:39',3,35,'Girish',-4000.00,34,'INV5_ST1_MNG',15793.55,0.00,0.00,100.00,NULL,0.00,'bank','State Bank of India','354352','2012-07-05',900.00,0.00,NULL,-4100.00,'Cashreceipt'),(33,'2012-07-05 04:37:00',3,0,'',0.00,39,'INV7_ST1_MNG',0.00,0.00,0.00,0.00,53,387.59,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(34,'2012-07-16 03:01:44',3,0,'',0.00,56,'INV9_ST1_MNG',8842.58,8842.58,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(35,'2012-07-18 04:49:33',3,58,'Sumit',0.00,57,'INV10_ST1_MNG',6564.26,4564.26,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',2000.00,0.00,NULL,2000.00,'Sales'),(36,'2012-07-25 12:46:42',3,63,'Swaroop Nayak',0.00,62,'INV11_ST1_MNG',3831.79,1831.79,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',2000.00,0.00,NULL,2000.00,'Sales'),(37,'2012-07-25 17:20:05',3,63,'Swaroop Nayak',2000.00,62,'INV11_ST1_MNG',3831.79,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',1000.00,0.00,NULL,1000.00,'Cashreceipt'),(38,'2012-07-25 17:21:15',3,63,'Swaroop Nayak',1000.00,62,'INV11_ST1_MNG',3831.79,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Cashreceipt'),(39,'2012-07-25 12:57:22',3,63,'Bajrang Singh',0.00,65,'INV12_ST1_MNG',8557.25,1557.25,0.00,3000.00,NULL,0.00,'cash/check','State Bank of India','567001','2012-07-25',4000.00,0.00,NULL,4000.00,'Sales'),(40,'2012-07-25 17:28:51',3,63,'Swaroop Nayak',4000.00,65,'INV12_ST1_MNG',8557.25,4000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Cashreceipt'),(41,'2012-07-25 12:59:20',3,63,'Bajrang Singh',0.00,65,'INV12_ST1_MNG',0.00,0.00,0.00,0.00,67,2362.73,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(42,'2012-07-28 11:24:56',3,69,'Raju Khan',0.00,68,'INV13_ST1_MNG',2650.43,1650.43,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',1000.00,0.00,NULL,1000.00,'Sales'),(43,'2012-07-28 11:50:23',3,63,'Ashok Pincha',0.00,71,'INV14_ST1_MNG',2650.43,1150.43,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',1500.00,0.00,NULL,1500.00,'Sales'),(44,'2012-07-28 11:52:40',3,63,'Ashok Pincha',1500.00,73,'INV15_ST1_MNG',2650.43,1150.43,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',1500.00,0.00,NULL,3000.00,'Sales'),(45,'2012-07-28 11:53:45',3,63,'Ashok Pincha',3000.00,75,'INV16_ST1_MNG',2650.43,1150.43,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',1500.00,0.00,NULL,4500.00,'Sales'),(46,'2012-07-28 11:54:35',3,63,'Golo Jupiter',4500.00,77,'INV17_ST1_MNG',5300.86,1300.86,0.00,1000.00,NULL,0.00,'cash/check','HDFC Ltd','234567','2012-07-28',3000.00,0.00,NULL,7500.00,'Sales'),(47,'2012-08-06 07:21:44',3,0,'',0.00,85,'INV18_ST1_MNG',2000.00,2000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(48,'2012-08-06 07:32:39',3,0,'',0.00,86,'INV19_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(49,'2012-08-06 08:26:01',3,0,'Golo Jupiter',0.00,87,'INV20_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(50,'2012-08-06 09:10:56',3,0,'',0.00,88,'INV21_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(51,'2012-08-06 09:12:07',3,0,'',0.00,89,'INV22_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(52,'2012-08-06 09:13:12',3,0,'',0.00,90,'INV23_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(53,'2012-08-06 06:31:53',3,0,'',0.00,92,'INV24_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(54,'2012-08-06 06:34:51',3,0,'',0.00,93,'INV25_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(55,'2012-08-06 06:47:39',3,0,'',0.00,94,'INV26_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(56,'2012-08-06 06:57:12',3,0,'',0.00,95,'INV27_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(57,'2012-08-06 07:01:39',3,0,'',0.00,96,'INV28_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(58,'2012-08-06 07:02:36',3,0,'',0.00,97,'INV29_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(59,'2012-08-06 07:05:13',3,0,'',0.00,98,'INV30_ST1_MNG',1000.00,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(60,'2012-09-08 12:36:28',3,0,'',0.00,121,'INV31_ST1_MNG',17594.22,17594.22,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(61,'2012-09-08 12:48:36',3,0,'',0.00,124,'INV32_ST1_MNG',10234.05,10234.05,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(62,'2012-09-08 01:22:14',3,0,'',0.00,128,'INV33_ST1_MNG',16818.24,16818.24,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(63,'2012-09-08 01:25:17',3,63,'Ashok Pincha',7500.00,129,'INV34_ST1_MNG',13220.02,9220.02,0.00,2000.00,NULL,0.00,'cash/check','State Bank of India','234567','2012-09-12',2000.00,0.00,NULL,9500.00,'Sales'),(64,'2012-09-08 17:56:06',3,63,'Swaroop Nayak',9500.00,129,'INV34_ST1_MNG',13220.02,1000.00,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',1000.00,0.00,NULL,8500.00,'Cashreceipt'),(65,'2012-09-21 09:41:09',3,63,'Ashok Pincha',8500.00,135,'INV35_ST1_MNG',31797.11,11797.11,0.00,10000.00,NULL,0.00,'cash/check','State Bank of India','234567','2012-09-24',10000.00,0.00,NULL,18500.00,'Sales'),(66,'2012-10-05 10:18:57',3,0,'',0.00,142,'INV36_ST1_MNG',8730.41,8730.41,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(67,'2012-10-05 10:20:57',3,0,'',0.00,143,'INV37_ST1_MNG',3239.14,3239.14,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(68,'2012-10-05 10:25:40',3,0,'',0.00,143,'INV37_ST1_MNG',0.00,0.00,0.00,0.00,145,1079.71,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return'),(69,'2012-10-22 08:20:29',3,0,'',0.00,151,'INV38_ST1_MNG',1162.77,1162.77,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(70,'2012-10-23 05:46:58',3,0,'',0.00,153,'INV39_ST1_MNG',2344.13,2344.13,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(71,'2012-10-23 05:56:01',3,0,'',0.00,157,'INV40_ST1_MNG',799.48,799.48,0.00,0.00,NULL,0.00,'cash','','','0000-00-00',0.00,0.00,NULL,0.00,'Sales'),(72,'2012-10-23 06:08:28',3,0,'',0.00,157,'INV40_ST1_MNG ',0.00,0.00,0.00,0.00,161,199.87,NULL,NULL,NULL,NULL,0.00,0.00,NULL,0.00,'Sales Return');

/*Table structure for table `vtiger_def_org_field` */

DROP TABLE IF EXISTS `vtiger_def_org_field`;

CREATE TABLE `vtiger_def_org_field` (
  `tabid` int(10) default NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) default NULL,
  `readonly` int(19) default NULL,
  PRIMARY KEY  (`fieldid`),
  KEY `def_org_field_tabid_fieldid_idx` (`tabid`,`fieldid`),
  KEY `def_org_field_tabid_idx` (`tabid`),
  KEY `def_org_field_visible_fieldid_idx` (`visible`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_def_org_field` */

insert  into `vtiger_def_org_field`(`tabid`,`fieldid`,`visible`,`readonly`) values (6,1,0,1),(6,2,0,1),(6,3,0,1),(6,4,0,1),(6,5,0,1),(6,6,0,1),(6,7,0,1),(6,8,0,1),(6,9,0,1),(6,10,0,1),(6,11,0,1),(6,12,0,1),(6,13,0,1),(6,14,0,1),(6,15,0,1),(6,16,0,1),(6,17,0,1),(6,18,0,1),(6,19,0,1),(6,20,0,1),(6,21,0,1),(6,22,0,1),(6,23,0,1),(6,24,0,1),(6,25,0,1),(6,26,0,1),(6,27,0,1),(6,28,0,1),(6,29,0,1),(6,30,0,1),(6,31,0,1),(6,32,0,1),(6,33,0,1),(6,34,0,1),(6,35,0,1),(7,36,0,1),(7,37,0,1),(7,38,0,1),(7,39,0,1),(7,40,0,1),(7,41,0,1),(7,42,0,1),(7,43,0,1),(7,44,0,1),(7,45,0,1),(7,46,0,1),(7,47,0,1),(7,48,0,1),(7,49,0,1),(7,50,0,1),(7,51,0,1),(7,52,0,1),(7,53,0,1),(7,54,0,1),(7,55,0,1),(7,56,0,1),(7,57,0,1),(7,58,0,1),(7,59,0,1),(7,60,0,1),(7,61,0,1),(7,62,0,1),(7,63,0,1),(4,64,0,1),(4,65,0,1),(4,66,0,1),(4,67,0,1),(4,68,0,1),(4,69,0,1),(4,70,0,1),(4,71,0,1),(4,72,0,1),(4,73,0,1),(4,74,0,1),(4,75,0,1),(4,76,0,1),(4,77,0,1),(4,78,0,1),(4,79,0,1),(4,80,0,1),(4,81,0,1),(4,82,0,1),(4,83,0,1),(4,84,0,1),(4,85,0,1),(4,86,0,1),(4,87,0,1),(4,88,0,1),(4,89,0,1),(4,90,0,1),(4,91,0,1),(4,92,0,1),(4,93,0,1),(4,94,0,1),(4,95,0,1),(4,96,0,1),(4,97,0,1),(4,98,0,1),(4,99,0,1),(4,100,0,1),(4,101,0,1),(4,102,0,1),(4,103,0,1),(4,104,0,1),(4,105,0,1),(4,106,0,1),(2,107,0,1),(2,108,0,1),(2,109,0,1),(2,110,0,1),(2,111,0,1),(2,112,0,1),(2,113,0,1),(2,114,0,1),(2,115,0,1),(2,116,0,1),(2,117,0,1),(2,118,0,1),(2,119,0,1),(2,120,0,1),(2,121,0,1),(26,122,0,1),(26,123,0,1),(26,124,0,1),(26,125,0,1),(26,126,0,1),(26,127,0,1),(26,128,0,1),(26,129,0,1),(26,130,0,1),(26,131,0,1),(26,132,0,1),(26,133,0,1),(26,134,0,1),(26,135,0,1),(26,136,0,1),(26,137,0,1),(26,138,0,1),(26,139,0,1),(26,140,0,1),(26,141,0,1),(26,142,0,1),(26,143,0,1),(26,144,0,1),(26,145,0,1),(4,146,0,1),(6,147,0,1),(7,148,0,1),(26,149,0,1),(13,150,0,1),(13,151,0,1),(13,152,0,1),(13,153,0,1),(13,154,0,1),(13,155,0,1),(13,156,0,1),(13,157,0,1),(13,158,0,1),(13,159,0,1),(13,160,0,1),(13,161,0,1),(13,162,0,1),(13,163,0,1),(13,164,0,1),(13,165,0,1),(13,166,0,1),(14,167,0,1),(14,168,0,1),(14,169,1,1),(14,170,0,1),(14,171,1,1),(14,172,0,1),(14,173,1,1),(14,174,0,1),(14,175,1,1),(14,176,1,1),(14,177,0,1),(14,178,0,1),(14,179,1,1),(14,180,1,1),(14,181,1,1),(14,182,1,1),(14,183,1,1),(14,184,0,1),(14,185,0,1),(14,186,0,1),(14,187,0,1),(14,188,1,1),(14,189,0,1),(14,190,0,1),(14,191,0,1),(14,192,0,1),(14,193,0,1),(14,194,0,1),(14,195,0,1),(14,196,0,1),(8,197,0,1),(8,198,0,1),(8,199,0,1),(8,200,0,1),(8,201,0,1),(8,202,0,1),(8,209,0,1),(8,210,0,1),(10,211,0,1),(10,212,0,1),(10,213,0,1),(10,214,0,1),(10,215,0,1),(10,216,0,1),(10,217,0,1),(10,218,0,1),(10,219,0,1),(10,220,0,1),(10,221,0,1),(9,222,0,1),(9,223,0,1),(9,224,0,1),(9,225,0,1),(9,226,0,1),(9,227,0,1),(9,228,0,1),(9,229,0,1),(9,230,0,1),(9,231,0,1),(9,232,0,1),(9,233,0,1),(9,234,0,1),(9,235,0,1),(9,236,0,1),(9,237,0,1),(9,238,0,1),(9,239,0,1),(9,240,0,1),(9,241,0,1),(9,242,0,1),(9,243,0,1),(9,244,0,1),(16,245,0,1),(16,246,0,1),(16,247,0,1),(16,248,0,1),(16,249,0,1),(16,250,0,1),(16,251,0,1),(16,252,0,1),(16,253,0,1),(16,254,0,1),(16,255,0,1),(16,256,0,1),(16,257,0,1),(16,258,0,1),(16,259,0,1),(16,260,0,1),(16,261,0,1),(16,262,0,1),(16,263,0,1),(16,264,0,1),(16,265,0,1),(16,266,0,1),(15,267,0,1),(15,268,0,1),(15,269,0,1),(15,270,0,1),(15,271,0,1),(15,272,0,1),(15,273,0,1),(15,274,0,1),(15,275,0,1),(18,276,0,1),(18,277,0,1),(18,278,0,1),(18,279,0,1),(18,280,0,1),(18,281,0,1),(18,282,0,1),(18,283,0,1),(18,284,0,1),(18,285,1,1),(18,286,1,1),(18,287,1,1),(18,288,1,1),(18,289,1,1),(18,290,1,1),(18,291,0,1),(19,292,0,1),(19,293,0,1),(19,294,0,1),(19,295,0,1),(19,296,0,1),(19,297,0,1),(19,298,0,1),(20,299,0,1),(20,300,0,1),(20,301,0,1),(20,302,0,1),(20,303,0,1),(20,304,0,1),(20,305,0,1),(20,306,0,1),(20,307,0,1),(20,308,0,1),(20,309,0,1),(20,310,0,1),(20,311,0,1),(20,312,0,1),(20,313,0,1),(20,314,0,1),(20,315,0,1),(20,316,0,1),(20,317,0,1),(20,318,0,1),(20,319,0,1),(20,320,0,1),(20,321,0,1),(20,322,0,1),(20,323,0,1),(20,324,0,1),(20,325,0,1),(20,326,0,1),(20,327,0,1),(20,328,0,1),(20,329,0,1),(20,330,0,1),(20,331,0,1),(20,332,0,1),(20,333,0,1),(20,334,0,1),(21,335,0,1),(21,336,0,1),(21,337,0,1),(21,338,0,1),(21,339,0,1),(21,340,0,1),(21,341,0,1),(21,342,0,1),(21,343,0,1),(21,344,0,1),(21,345,0,1),(21,346,0,1),(21,347,0,1),(21,348,0,1),(21,349,0,1),(21,350,0,1),(21,351,0,1),(21,352,0,1),(21,353,0,1),(21,354,0,1),(21,355,0,1),(21,356,0,1),(21,357,0,1),(21,358,0,1),(21,359,0,1),(21,360,0,1),(21,361,0,1),(21,362,0,1),(21,363,0,1),(21,364,0,1),(21,365,0,1),(21,366,0,1),(21,367,0,1),(21,368,0,1),(21,369,0,1),(21,370,0,1),(21,371,0,1),(22,372,0,1),(22,373,0,1),(22,374,0,1),(22,375,0,1),(22,376,0,1),(22,377,0,1),(22,378,0,1),(22,379,0,1),(22,380,0,1),(22,381,0,1),(22,382,0,1),(22,383,0,1),(22,384,0,1),(22,385,0,1),(22,386,0,1),(22,387,0,1),(22,388,0,1),(22,389,0,1),(22,390,0,1),(22,391,0,1),(22,392,0,1),(22,393,0,1),(22,394,0,1),(22,395,0,1),(22,396,0,1),(22,397,0,1),(22,398,0,1),(22,399,0,1),(22,400,0,1),(22,401,0,1),(22,402,0,1),(22,403,0,1),(22,404,0,1),(22,405,0,1),(22,406,0,1),(22,407,0,1),(22,408,0,1),(22,409,0,1),(22,410,0,1),(22,411,0,1),(22,412,0,1),(22,413,0,1),(22,414,0,1),(22,415,0,1),(22,416,0,1),(22,417,0,1),(23,418,0,1),(23,419,0,1),(23,420,0,1),(23,421,0,1),(23,422,0,1),(23,423,0,1),(23,424,0,1),(23,425,0,1),(23,426,0,1),(23,427,0,1),(23,428,0,1),(23,429,0,1),(23,430,0,1),(23,431,0,1),(23,432,0,1),(23,433,0,1),(23,434,0,1),(23,435,0,1),(23,436,0,1),(23,437,0,1),(23,438,0,1),(23,439,0,1),(23,440,0,1),(23,441,0,1),(23,442,0,1),(23,443,0,1),(23,444,0,1),(23,445,0,1),(23,446,0,1),(23,447,0,1),(23,448,0,1),(23,449,0,1),(23,450,0,1),(23,451,0,1),(23,452,0,1),(23,453,0,1),(23,454,0,1),(23,455,0,1),(10,493,0,1),(10,494,0,1),(10,495,0,1),(10,496,0,1),(10,497,0,1),(10,498,0,1),(31,499,0,1),(31,500,0,1),(31,501,0,1),(31,502,0,1),(32,505,0,1),(32,506,0,1),(32,507,0,1),(32,508,0,1),(32,509,0,1),(32,510,0,1),(32,511,0,1),(32,512,0,1),(32,513,0,1),(32,514,0,1),(32,515,0,1),(32,516,0,1),(32,517,0,1),(32,518,0,1),(32,519,0,1),(32,520,0,1),(32,521,0,1),(32,522,0,1),(33,523,0,1),(33,524,0,1),(33,525,0,1),(33,526,0,1),(33,527,0,1),(33,528,0,1),(33,529,0,1),(33,530,0,1),(33,531,0,1),(33,532,0,1),(33,533,0,1),(33,534,0,1),(33,535,0,1),(33,536,0,1),(33,537,0,1),(33,538,0,1),(33,539,0,1),(33,540,0,1),(35,541,0,1),(35,542,0,1),(35,543,0,1),(35,544,0,1),(35,545,0,1),(35,546,0,1),(35,547,0,1),(35,548,0,1),(35,549,0,1),(35,550,0,1),(35,551,0,1),(35,552,0,1),(35,553,0,1),(35,554,0,1),(35,555,0,1),(35,556,0,1),(38,557,0,1),(38,558,0,1),(38,559,0,1),(38,560,0,1),(38,561,0,1),(38,562,0,1),(38,563,0,1),(39,564,0,1),(39,565,0,1),(39,566,0,1),(39,567,0,1),(39,568,0,1),(39,569,0,1),(39,570,0,1),(39,571,0,1),(39,572,0,1),(40,573,0,1),(40,574,0,1),(40,575,0,1),(40,576,0,1),(40,577,0,1),(40,578,0,1),(40,579,0,1),(40,580,0,1),(40,581,0,1),(40,582,0,1),(40,583,0,1),(40,584,0,1),(40,585,0,1),(40,586,0,1),(41,587,0,1),(41,588,0,1),(41,589,0,1),(41,590,0,1),(41,591,0,1),(41,592,0,1),(41,593,0,1),(41,594,0,1),(41,595,0,1),(41,596,0,1),(41,597,0,1),(41,598,0,1),(41,599,0,1),(41,600,0,1),(41,601,0,1),(41,602,0,1),(43,603,0,1),(43,604,0,1),(43,605,0,1),(43,606,0,1),(14,611,0,1),(14,612,0,1),(14,613,0,1),(14,614,0,1),(14,616,0,1),(48,618,0,1),(48,619,0,1),(48,620,0,1),(48,621,0,1),(48,622,0,1),(48,623,0,1),(48,624,0,1),(48,625,0,1),(48,626,0,1),(48,627,0,1),(48,628,0,1),(48,629,0,1),(48,630,0,1),(48,631,0,1),(48,632,0,1),(48,633,0,1),(48,634,0,1),(48,635,0,1),(48,636,0,1),(23,637,0,1),(23,638,0,1),(23,639,0,1),(23,640,0,1),(49,641,0,1),(49,642,0,1),(49,643,0,1),(49,644,0,1),(49,645,0,1),(49,646,0,1),(49,647,0,1),(49,648,0,1),(49,649,0,1),(49,650,0,1),(49,651,0,1),(49,652,0,1),(49,653,0,1),(49,654,0,1),(49,655,0,1),(49,656,0,1),(49,657,0,1),(49,658,0,1),(49,659,0,1),(49,660,0,1),(49,661,0,1),(49,662,0,1),(49,663,0,1),(49,664,0,1),(49,665,0,1),(49,666,0,1),(49,667,0,1),(49,668,0,1),(49,669,0,1),(49,670,0,1),(49,671,0,1),(49,672,0,1),(49,673,0,1),(49,674,0,1),(49,675,0,1),(49,676,0,1),(49,677,0,1),(49,678,0,1),(49,679,0,1),(49,680,0,1),(49,681,0,1),(49,682,0,1),(49,683,0,1),(49,684,0,1),(49,685,0,1),(49,686,0,1),(49,687,0,1),(49,688,0,1),(49,689,0,1),(49,690,0,1),(49,691,0,1),(49,692,0,1),(14,694,0,1),(14,695,0,1),(50,696,0,1),(50,697,0,1),(50,698,0,1),(50,699,0,1),(50,700,0,1),(50,701,0,1),(50,702,0,1),(50,703,0,1),(50,704,0,1),(50,705,0,1),(50,706,0,1),(50,707,0,1),(14,708,0,1),(51,709,0,1),(51,710,0,1),(51,711,0,1),(51,712,0,1),(51,713,0,1),(51,714,0,1),(51,715,0,1),(51,716,0,1),(51,717,0,1),(51,718,0,1),(51,719,0,1),(51,720,0,1),(51,721,0,1),(52,722,0,1),(52,723,0,1),(52,724,0,1),(52,725,0,1),(52,726,0,1),(52,727,0,1),(52,728,0,1),(52,729,0,1),(52,730,0,1),(52,731,0,1),(53,732,0,1),(53,733,0,1),(53,734,0,1),(53,735,0,1),(53,736,0,1),(53,737,0,1),(53,738,0,1),(53,739,0,1),(53,740,0,1),(54,741,0,1),(54,742,0,1),(54,743,0,1),(54,744,0,1),(54,745,0,1),(54,746,0,1),(54,747,0,1),(54,748,0,1),(54,749,0,1),(54,750,0,1),(54,751,0,1),(54,752,0,1),(54,753,0,1),(54,754,0,1),(54,755,0,1),(54,756,0,1),(54,757,0,1),(54,758,0,1),(54,759,0,1),(54,760,0,1),(55,761,0,1),(55,762,0,1),(55,763,0,1),(55,764,0,1),(55,765,0,1),(55,766,0,1),(55,767,0,1),(56,768,0,1),(56,769,0,1),(56,770,0,1),(56,771,0,1),(56,772,0,1),(56,773,0,1),(56,774,0,1),(56,775,0,1),(56,776,0,1),(56,777,0,1),(56,778,0,1),(56,779,0,1),(48,780,0,1),(48,781,0,1),(56,782,0,1),(56,783,0,1),(48,784,0,1),(48,785,0,1),(49,786,0,1),(57,787,0,1),(57,788,0,1),(57,789,0,1),(57,790,0,1),(57,791,0,1),(57,792,0,1),(57,793,0,1),(57,794,0,1),(57,795,0,1),(57,796,0,1),(57,797,0,1),(57,798,0,1),(57,799,0,1),(58,800,0,1),(58,801,0,1),(58,802,0,1),(58,803,0,1),(58,804,0,1),(58,805,0,1),(58,806,0,1),(58,807,0,1),(58,808,0,1),(58,809,0,1),(58,810,0,1),(60,811,0,1),(60,812,0,1),(60,813,0,1),(61,814,0,1),(61,815,0,1),(61,816,0,1),(62,817,0,1),(62,818,0,1),(62,819,0,1),(62,820,0,1),(62,821,0,1),(62,822,0,1),(62,823,0,1),(62,824,0,1),(62,825,0,1),(62,826,0,1),(62,827,0,1),(62,828,0,1),(48,829,0,1),(48,830,0,1),(48,831,0,1),(48,832,0,1),(14,833,0,1),(14,834,0,1),(14,835,0,1);

/*Table structure for table `vtiger_def_org_share` */

DROP TABLE IF EXISTS `vtiger_def_org_share`;

CREATE TABLE `vtiger_def_org_share` (
  `ruleid` int(11) NOT NULL auto_increment,
  `tabid` int(11) NOT NULL,
  `permission` int(19) default NULL,
  `editstatus` int(19) default NULL,
  PRIMARY KEY  (`ruleid`),
  KEY `fk_1_vtiger_def_org_share` (`permission`),
  CONSTRAINT `fk_1_vtiger_def_org_share` FOREIGN KEY (`permission`) REFERENCES `vtiger_org_share_action_mapping` (`share_action_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_def_org_share` */

insert  into `vtiger_def_org_share`(`ruleid`,`tabid`,`permission`,`editstatus`) values (1,2,2,0),(2,4,2,2),(3,6,2,0),(4,7,2,0),(5,9,3,1),(6,13,2,0),(7,16,3,2),(8,20,2,0),(9,21,2,0),(10,22,2,0),(11,23,2,0),(12,26,2,0),(13,8,2,0),(14,31,3,0),(15,32,2,0),(16,35,2,0),(17,38,2,0),(18,39,2,0),(19,40,2,0),(20,41,2,0),(21,43,2,0),(22,48,2,0),(23,49,1,0),(24,50,1,0),(25,51,1,0),(26,52,1,0),(27,53,1,0),(28,54,1,0),(29,55,1,0),(30,56,2,0),(31,57,2,0),(32,58,2,0),(33,60,3,0),(34,61,2,0),(35,62,3,0);

/*Table structure for table `vtiger_def_org_share_seq` */

DROP TABLE IF EXISTS `vtiger_def_org_share_seq`;

CREATE TABLE `vtiger_def_org_share_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_def_org_share_seq` */

insert  into `vtiger_def_org_share_seq`(`id`) values (35);

/*Table structure for table `vtiger_defaultcv` */

DROP TABLE IF EXISTS `vtiger_defaultcv`;

CREATE TABLE `vtiger_defaultcv` (
  `tabid` int(19) NOT NULL,
  `defaultviewname` varchar(50) NOT NULL,
  `query` text,
  PRIMARY KEY  (`tabid`),
  CONSTRAINT `fk_1_vtiger_defaultcv` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_defaultcv` */

/*Table structure for table `vtiger_delivery_products` */

DROP TABLE IF EXISTS `vtiger_delivery_products`;

CREATE TABLE `vtiger_delivery_products` (
  `id` int(11) NOT NULL auto_increment,
  `dcid` int(11) NOT NULL,
  `barcodeid` varchar(100) NOT NULL,
  `productname` varchar(200) NOT NULL,
  `dc_qty` int(100) NOT NULL,
  `dc_qty_locked` int(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_delivery_products` */

/*Table structure for table `vtiger_deliverychallan` */

DROP TABLE IF EXISTS `vtiger_deliverychallan`;

CREATE TABLE `vtiger_deliverychallan` (
  `dcid` int(11) NOT NULL auto_increment,
  `from_wh_st` varchar(100) default NULL,
  `to_wh_st` varchar(100) default NULL,
  `createddate` date default NULL,
  `recieveddate` date default NULL,
  `status` varchar(11) NOT NULL,
  `dc_code` varchar(200) NOT NULL,
  PRIMARY KEY  (`dcid`),
  KEY `dcid` (`dcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_deliverychallan` */

/*Table structure for table `vtiger_deliverychallan_status` */

DROP TABLE IF EXISTS `vtiger_deliverychallan_status`;

CREATE TABLE `vtiger_deliverychallan_status` (
  `sid` int(11) NOT NULL auto_increment,
  `status_code` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_deliverychallan_status` */

insert  into `vtiger_deliverychallan_status`(`sid`,`status_code`,`status`) values (1,'CR','Created'),(2,'DR','Delivered'),(3,'RC','Recieved'),(4,'AP','Approved'),(5,'CL','Cancelled'),(6,'RQ','Requested');

/*Table structure for table `vtiger_deliverychallan_transaction` */

DROP TABLE IF EXISTS `vtiger_deliverychallan_transaction`;

CREATE TABLE `vtiger_deliverychallan_transaction` (
  `tid` int(11) NOT NULL auto_increment,
  `dcid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `from_warehouse_store` varchar(11) NOT NULL,
  `to_warehouse_store` varchar(11) NOT NULL,
  `dc_quantity` int(100) NOT NULL,
  `dc_qty_locked` int(100) NOT NULL,
  `createddate` date NOT NULL,
  `recieveddate` date default NULL,
  `status` varchar(11) NOT NULL,
  UNIQUE KEY `tid` (`tid`),
  KEY `tid_2` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_deliverychallan_transaction` */

/*Table structure for table `vtiger_deliverychallancf` */

DROP TABLE IF EXISTS `vtiger_deliverychallancf`;

CREATE TABLE `vtiger_deliverychallancf` (
  `dcid` int(11) NOT NULL,
  `cf_799` varchar(100) default '',
  PRIMARY KEY  (`dcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_deliverychallancf` */

/*Table structure for table `vtiger_deliverychallangrouprel` */

DROP TABLE IF EXISTS `vtiger_deliverychallangrouprel`;

CREATE TABLE `vtiger_deliverychallangrouprel` (
  `dcid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`dcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_deliverychallangrouprel` */

/*Table structure for table `vtiger_downloadpurpose` */

DROP TABLE IF EXISTS `vtiger_downloadpurpose`;

CREATE TABLE `vtiger_downloadpurpose` (
  `downloadpurposeid` int(19) NOT NULL auto_increment,
  `purpose` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`downloadpurposeid`),
  UNIQUE KEY `downloadpurpose_purpose_idx` (`purpose`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_downloadpurpose` */

/*Table structure for table `vtiger_duration_minutes` */

DROP TABLE IF EXISTS `vtiger_duration_minutes`;

CREATE TABLE `vtiger_duration_minutes` (
  `minutesid` int(19) NOT NULL auto_increment,
  `duration_minutes` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`minutesid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_duration_minutes` */

insert  into `vtiger_duration_minutes`(`minutesid`,`duration_minutes`,`sortorderid`,`presence`) values (1,'00',0,1),(2,'15',1,1),(3,'30',2,1),(4,'45',3,1);

/*Table structure for table `vtiger_duration_minutes_seq` */

DROP TABLE IF EXISTS `vtiger_duration_minutes_seq`;

CREATE TABLE `vtiger_duration_minutes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_duration_minutes_seq` */

insert  into `vtiger_duration_minutes_seq`(`id`) values (4);

/*Table structure for table `vtiger_durationhrs` */

DROP TABLE IF EXISTS `vtiger_durationhrs`;

CREATE TABLE `vtiger_durationhrs` (
  `hrsid` int(19) NOT NULL auto_increment,
  `hrs` varchar(50) default NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`hrsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_durationhrs` */

/*Table structure for table `vtiger_durationmins` */

DROP TABLE IF EXISTS `vtiger_durationmins`;

CREATE TABLE `vtiger_durationmins` (
  `minsid` int(19) NOT NULL auto_increment,
  `mins` varchar(50) default NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`minsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_durationmins` */

/*Table structure for table `vtiger_email_access` */

DROP TABLE IF EXISTS `vtiger_email_access`;

CREATE TABLE `vtiger_email_access` (
  `crmid` int(11) default NULL,
  `mailid` int(11) default NULL,
  `accessdate` date default NULL,
  `accesstime` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_email_access` */

/*Table structure for table `vtiger_email_track` */

DROP TABLE IF EXISTS `vtiger_email_track`;

CREATE TABLE `vtiger_email_track` (
  `crmid` int(11) default NULL,
  `mailid` int(11) default NULL,
  `access_count` int(11) default NULL,
  UNIQUE KEY `link_tabidtype_idx` (`crmid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_email_track` */

insert  into `vtiger_email_track`(`crmid`,`mailid`,`access_count`) values (84,150,1),(84,151,1);

/*Table structure for table `vtiger_emaildetails` */

DROP TABLE IF EXISTS `vtiger_emaildetails`;

CREATE TABLE `vtiger_emaildetails` (
  `emailid` int(19) NOT NULL,
  `from_email` varchar(50) NOT NULL default '',
  `to_email` text,
  `cc_email` text,
  `bcc_email` text,
  `assigned_user_email` varchar(50) NOT NULL default '',
  `idlists` text,
  `email_flag` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_emaildetails` */

/*Table structure for table `vtiger_emailsettings` */

DROP TABLE IF EXISTS `vtiger_emailsettings`;

CREATE TABLE `vtiger_emailsettings` (
  `emailsettingsid` int(11) NOT NULL,
  `emailname` varchar(100) NOT NULL,
  `sendto` varchar(100) NOT NULL,
  `sendcc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_emailsettings` */

/*Table structure for table `vtiger_emailsettingscf` */

DROP TABLE IF EXISTS `vtiger_emailsettingscf`;

CREATE TABLE `vtiger_emailsettingscf` (
  `emailsettingsid` int(11) NOT NULL,
  PRIMARY KEY  (`emailsettingsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_emailsettingscf` */

/*Table structure for table `vtiger_emailsettingsgrouprel` */

DROP TABLE IF EXISTS `vtiger_emailsettingsgrouprel`;

CREATE TABLE `vtiger_emailsettingsgrouprel` (
  `emailsettingsid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`emailsettingsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_emailsettingsgrouprel` */

/*Table structure for table `vtiger_emailtemplates` */

DROP TABLE IF EXISTS `vtiger_emailtemplates`;

CREATE TABLE `vtiger_emailtemplates` (
  `foldername` varchar(100) default NULL,
  `templatename` varchar(100) default NULL,
  `subject` varchar(100) default NULL,
  `description` text,
  `body` text,
  `deleted` int(1) NOT NULL default '0',
  `templateid` int(19) NOT NULL auto_increment,
  `groupid` int(19) default '0',
  `templatecodeid` varchar(100) default NULL,
  PRIMARY KEY  (`templateid`),
  KEY `emailtemplates_foldernamd_templatename_subject_idx` (`foldername`,`templatename`,`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_emailtemplates` */

insert  into `vtiger_emailtemplates`(`foldername`,`templatename`,`subject`,`description`,`body`,`deleted`,`templateid`,`groupid`,`templatecodeid`) values ('Public','Pending Invoices','Invoices Pending','Payment Due','name <br />\nstreet, <br />\ncity, <br />\nstate, <br />\n zip) <br />\n  <br />\n Dear <br />\n <br />\n Please check the following invoices that are yet to be paid by you: <br />\n <br />\n No. Date      Amount <br />\n 1   1/1/01    $4000 <br />\n 2   2/2//01   $5000 <br />\n 3   3/3/01    $10000 <br />\n 4   7/4/01    $23560 <br />\n <br />\n Kindly let us know if there are any issues that you feel are pending to be discussed. <br />\n We will be more than happy to give you a call. <br />\n We would like to continue our business with you.',0,2,0,NULL),('Public','Acceptance Proposal','Acceptance Proposal','Acceptance of Proposal',' Dear <br />\n <br />\nYour proposal on the project XYZW has been reviewed by us <br />\nand is acceptable in its entirety. <br />\n <br />\nWe are eagerly looking forward to this project <br />\nand are pleased about having the opportunity to work <br />\ntogether. We look forward to a long standing relationship <br />\nwith your esteemed firm. <br />\n<br />\nI would like to take this opportunity to invite you <br />\nto a game of golf on Wednesday morning 9am at the <br />\nCuff Links Ground. We will be waiting for you in the <br />\nExecutive Lounge. <br />\n<br />\nLooking forward to seeing you there.',0,3,0,NULL),('Public','Goods received acknowledgement','Goods received acknowledgement','Acknowledged Receipt of Goods',' The undersigned hereby acknowledges receipt and delivery of the goods. <br />\nThe undersigned will release the payment subject to the goods being discovered not satisfactory. <br />\n<br />\nSigned under seal this <date>',0,4,0,NULL),('Public','Accept Order','Accept Order','Acknowledgement/Acceptance of Order',' Dear <br />\n         We are in receipt of your order as contained in the <br />\n   purchase order form.We consider this to be final and binding on both sides. <br />\nIf there be any exceptions noted, we shall consider them <br />\nonly if the objection is received within ten days of receipt of <br />\nthis notice. <br />\n <br />\nThank you for your patronage.',0,5,0,NULL),('Public','Address Change','Change of Address','Address Change','Dear <br />\n <br />\nWe are relocating our office to <br />\n11111,XYZDEF Cross, <br />\nUVWWX Circle <br />\nThe telephone number for this new location is (101) 1212-1328. <br />\n<br />\nOur Manufacturing Division will continue operations <br />\nat 3250 Lovedale Square Avenue, in Frankfurt. <br />\n<br />\nWe hope to keep in touch with you all. <br />\nPlease update your addressbooks.',0,6,0,NULL),('Public','Follow Up','Follow Up','Follow Up of meeting','Dear <br />\n<br />\nThank you for extending us the opportunity to meet with <br />\nyou and members of your staff. <br />\n<br />\nI know that John Doe serviced your account <br />\nfor many years and made many friends at your firm. He has personally <br />\ndiscussed with me the deep relationship that he had with your firm. <br />\nWhile his presence will be missed, I can promise that we will <br />\ncontinue to provide the fine service that was accorded by <br />\nJohn to your firm. <br />\n<br />\nI was genuinely touched to receive such fine hospitality. <br />\n<br />\nThank you once again.',0,7,0,NULL),('Public','Target Crossed!','Target Crossed!','Fantastic Sales Spree!','Congratulations! <br />\n<br />\nThe numbers are in and I am proud to inform you that our <br />\ntotal sales for the previous quarter <br />\namounts to $100,000,00.00!. This is the first time <br />\nwe have exceeded the target by almost 30%. <br />\nWe have also beat the previous quarter record by a <br />\nwhopping 75%! <br />\n<br />\nLet us meet at Smoking Joe for a drink in the evening! <br />\n\nC you all there guys!',0,8,0,NULL),('Public','Thanks Note','Thanks Note','Note of thanks','Dear <br />\n<br />\nThank you for your confidence in our ability to serve you. <br />\nWe are glad to be given the chance to serve you.I look <br />\nforward to establishing a long term partnership with you. <br />\nConsider me as a friend. <br />\nShould any need arise,please do give us a call.',0,9,0,NULL),('Public','Customer Login Details','Customer Portal Login Details','Send Portal login details to customer','<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width=\"50\"> </td>\n            <td>\n            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;\">\n                                <tr>\n                                    <td align=\"center\" rowspan=\"4\">$logo$</td>\n                                    <td align=\"center\"> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"left\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;\">vtiger CRM<br /> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"right\" style=\"padding-right: 100px;\">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">\n                                <tr>\n                                    <td valign=\"top\">\n                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\">\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">Dear $contact_name$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\"> Thank you very much for subscribing to the vtiger CRM - annual support service.<br />Here is your self service portal login details:</td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"center\">\n                                                <table width=\"75%\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\" style=\"border: 2px solid rgb(180, 180, 179); background-color: rgb(226, 226, 225); font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal;\">\n                                                        <tr>\n                                                            <td><br />User ID     : <font color=\"#990000\"><strong> $login_name$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td>Password: <font color=\"#990000\"><strong> $password$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td align=\"center\"> <strong>  $URL$<br /> </strong> </td>\n                                                        </tr>\n                                                </table>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\"><strong>NOTE:</strong> We suggest you to change your password after logging in first time. <br /><br /> <strong><u>Help Documentation</u></strong><br />  <br /> After logging in to vtiger Self-service Portal first time, you can access the vtiger CRM documents from the <strong>Documents</strong> tab. Following documents are available for your reference:<br />\n                                                <ul>\n                                                    <li>Installation Manual (Windows &amp; Linux OS)<br /> </li>\n                                                    <li>User &amp; Administrator Manual<br /> </li>\n                                                    <li>vtiger Customer Portal - User Manual<br /> </li>\n                                                    <li>vtiger Outlook Plugin - User Manual<br /> </li>\n                                                    <li>vtiger Office Plug-in - User Manual<br /> </li>\n                                                    <li>vtiger Thunderbird Extension - User Manual<br /> </li>\n                                                    <li>vtiger Web Forms - User Manual<br /> </li>\n                                                    <li>vtiger Firefox Tool bar - User Manual<br /> </li>\n                                                </ul>\n                                                <br />  <br /> <strong><u>Knowledge Base</u></strong><br /> <br /> Periodically we update frequently asked question based on our customer experiences. You can access the latest articles from the <strong>FAQ</strong> tab.<br /> <br /> <strong><u>vtiger CRM - Details</u></strong><br /> <br /> Kindly let us know your current vtiger CRM version and system specification so that we can provide you necessary guidelines to enhance your vtiger CRM system performance. Based on your system specification we alert you about the latest security &amp; upgrade patches.<br />  <br />			 Thank you once again and wish you a wonderful experience with vtiger CRM.<br /> </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\"><br /><br />Best Regards</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">$support_team$ </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\" href=\"http://www.vtiger.com\">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width=\"1%\" valign=\"top\"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);\">\n                                <tr>\n                                    <td align=\"center\">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Email Id: <a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);\" href=\"mailto:support@vtiger.com\">support@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width=\"50\"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>',0,10,0,NULL),('Public','Support end notification before a week','VtigerCRM Support Notification','Send Notification mail to customer before a week of support end date','<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width=\"50\"> </td>\n            <td>\n            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;\">\n                                <tr>\n                                    <td align=\"center\" rowspan=\"4\">$logo$</td>\n                                    <td align=\"center\"> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"left\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;\">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"right\" style=\"padding-right: 100px;\">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">\n                                <tr>\n                                    <td valign=\"top\">\n                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\">\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">This is just a notification mail regarding your support end.<br /><span style=\"font-weight: bold;\">Priority:</span> Urgent<br />Your Support is going to expire on next week<br />Please contact support@vtiger.com.<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"center\"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\" href=\"http://www.vtiger.com\">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width=\"1%\" valign=\"top\"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);\">\n                                <tr>\n                                    <td align=\"center\">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Email Id: <a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);\" href=\"mailto:info@vtiger.com\">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width=\"50\"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>',0,11,0,NULL),('Public','Support end notification before a month','VtigerCRM Support Notification','Send Notification mail to customer before a month of support end date','<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width=\"50\"> </td>\n            <td>\n            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;\">\n                                <tr>\n                                    <td align=\"center\" rowspan=\"4\">$logo$</td>\n                                    <td align=\"center\"> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"left\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;\">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"right\" style=\"padding-right: 100px;\">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">\n                                <tr>\n                                    <td valign=\"top\">\n                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\">\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">This is just a notification mail regarding your support end.<br /><span style=\"font-weight: bold;\">Priority:</span> Normal<br />Your Support is going to expire on next month.<br />Please contact support@vtiger.com<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"center\"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><a href=\"http://www.vtiger.com\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width=\"1%\" valign=\"top\"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);\">\n                                <tr>\n                                    <td align=\"center\">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Email Id: <a href=\"mailto:info@vtiger.com\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);\">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width=\"50\"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>',0,12,0,NULL),('Public','TEST123','SUBJECT_123','DESCRIPTION_123','<p>\r\n	Hello</p>\r\n',0,14,158,'3'),('Public','PR Request','Purchase  Request','Sending PR Request','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please look at the below list for Purchase Request.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																$ITEM$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,15,216,'1'),('Public','Revised PR Request','Revised PR Request against PurchaseRequest ID : - ','Revised PR Request','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please look at the below revised list for Purchase Request.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																$ITEM$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,16,216,'5'),('Public','Approved Purchase Request','Approved Purchase Request for PurchaseRequest ID : - ','Approved Purchase Request','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please look below for Approved Qty. of Purchase Request.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																$ITEM$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,17,215,'2'),('Public','Send Purchase Order','Send Purchase Order','Send Purchase Order','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please find the attached PO.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,18,215,'4'),('Public','Cancel PO','PO Number $SUBJECT$ is Cancelled','PO Cancelled','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please find the attached Cancelled PO.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,19,215,'6'),('Public','Revised PO','Revised PO For PO No : - ','Revised PO','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please find the attached Revised PO No. $REVISEDPO$ on the ref. of the PO No. $OLDPO$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,20,215,'7'),('Public','PR Delivery','Purchase Request Details','PR Delivery','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please look at the below list for Purchase Request Delivery Detail.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																$ITEM$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,21,216,'8'),('Public','PR Received','PR Received','PR Received','<p>\r\n	&nbsp;</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																Please note that the below list for Purchase Request has been received.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																$ITEM$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,22,217,'9'),('Public','User Login Details','User Login Details','User Login Details','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																$ITEM$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<br />\r\n																<br />\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,23,220,'10'),('Public','Send Delivery Challan','Delivery Challan No. $DC_NO$ has been dispatched FROM here.','Send Delivery Challan','<TABLE align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; TEXT-decoration: NONE; background-color: rgb(122, 122, 254);\" width=\"700\">\r\n <tbody>\r\n  <tr>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n  </tr>\r\n  <tr>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n  </tr>\r\n  <tr>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n  </tr>\r\n  <tr>\r\n   <td width=\"50\">\r\n    &nbsp;</td>\r\n   <td>\r\n    <TABLE border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n     <tbody>\r\n      <tr>\r\n       <td>\r\n        <TABLE border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\" width=\"100%\">\r\n         <tbody>\r\n          <tr>\r\n           <td valign=\"top\">\r\n            <TABLE border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n             <tbody>\r\n              <tr>\r\n               <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; TEXT-decoration: NONE; color: rgb(66, 66, 253);\">\r\n                &nbsp;</td>\r\n              </tr>\r\n              <tr>\r\n               <td>\r\n                &nbsp;</td>\r\n              </tr>\r\n              <tr>\r\n               <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n                Dear $NAME$,</td>\r\n              </tr>\r\n              <tr>\r\n               <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; TEXT-align: justify; line-height: 20px;\">\r\n                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$ITEM$</td>\r\n              </tr>\r\n              <tr>\r\n               <td align=\"center\">\r\n                &nbsp;</td>\r\n              </tr>\r\n              <tr>\r\n               <td align=\"right\">\r\n                <br />\r\n                <br />\r\n                <strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n              </tr>\r\n              <tr>\r\n               <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n                $WAREHOUSENAME$</td>\r\n              </tr>\r\n              <tr>\r\n               <td>\r\n                &nbsp;</td>\r\n              </tr>\r\n             </tbody>\r\n            </TABLE>\r\n           </td>\r\n           <td valign=\"top\" width=\"1%\">\r\n            &nbsp;</td>\r\n          </tr>\r\n         </tbody>\r\n        </TABLE>\r\n       </td>\r\n      </tr>\r\n     </tbody>\r\n    </TABLE>\r\n   </td>\r\n   <td width=\"50\">\r\n    &nbsp;</td>\r\n  </tr>\r\n  <tr>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n  </tr>\r\n  <tr>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n  </tr>\r\n  <tr>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n   <td>\r\n    &nbsp;</td>\r\n  </tr>\r\n </tbody>\r\n</TABLE>',0,24,221,'11'),('Public','Add Customer','Thanks for visiting.','Add Customer','<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none;\" width=\"700\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n			<td>\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); \" width=\"100%\">\r\n									<tbody>\r\n										<tr>\r\n											<td valign=\"top\">\r\n												<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">\r\n																Dear $NAME$,</td>\r\n														</tr>\r\n														<tr>\r\n															<td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">\r\n																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your visit.</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"center\">\r\n																&nbsp;</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\">\r\n																<strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\">Sincerely,</strong></td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																$WAREHOUSENAME$</td>\r\n														</tr>\r\n														<tr>\r\n															<td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">\r\n																Vinayak Furnishing</td>\r\n														</tr>\r\n														<tr>\r\n															<td>\r\n																&nbsp;</td>\r\n														</tr>\r\n													</tbody>\r\n												</table>\r\n											</td>\r\n											<td valign=\"top\" width=\"1%\">\r\n												&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n			<td width=\"50\">\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,25,225,'12');

/*Table structure for table `vtiger_emailtemplates_seq` */

DROP TABLE IF EXISTS `vtiger_emailtemplates_seq`;

CREATE TABLE `vtiger_emailtemplates_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_emailtemplates_seq` */

insert  into `vtiger_emailtemplates_seq`(`id`) values (25);

/*Table structure for table `vtiger_entityname` */

DROP TABLE IF EXISTS `vtiger_entityname`;

CREATE TABLE `vtiger_entityname` (
  `tabid` int(19) NOT NULL default '0',
  `modulename` varchar(50) NOT NULL,
  `tablename` varchar(100) NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `entityidfield` varchar(150) NOT NULL,
  `entityidcolumn` varchar(150) NOT NULL,
  PRIMARY KEY  (`tabid`),
  KEY `entityname_tabid_idx` (`tabid`),
  CONSTRAINT `fk_1_vtiger_entityname` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_entityname` */

insert  into `vtiger_entityname`(`tabid`,`modulename`,`tablename`,`fieldname`,`entityidfield`,`entityidcolumn`) values (2,'Potentials','vtiger_potential','potentialname','potentialid','potential_id'),(4,'Contacts','vtiger_contactdetails','lastname,firstname','contactid','contact_id'),(6,'Accounts','vtiger_account','accountname','accountid','account_id'),(7,'Leads','vtiger_leaddetails','lastname,firstname','leadid','leadid'),(8,'Documents','vtiger_notes','title','notesid','notesid'),(9,'Calendar','vtiger_activity','subject','activityid','activityid'),(10,'Emails','vtiger_activity','subject','activityid','activityid'),(13,'HelpDesk','vtiger_troubletickets','title','ticketid','ticketid'),(14,'Products','vtiger_products','productname','productid','product_id'),(15,'Faq','vtiger_faq','question','id','id'),(18,'Vendors','vtiger_vendor','vendorname','vendorid','vendor_id'),(19,'PriceBooks','vtiger_pricebook','bookname','pricebookid','pricebookid'),(20,'Quotes','vtiger_quotes','subject','quoteid','quote_id'),(21,'PurchaseOrder','vtiger_purchaseorder','subject','purchaseorderid','purchaseorderid'),(22,'SalesOrder','vtiger_salesorder','subject','salesorderid','salesorder_id'),(23,'Invoice','vtiger_invoice','subject','invoiceid','invoiceid'),(26,'Campaigns','vtiger_campaign','campaignname','campaignid','campaignid'),(29,'Users','vtiger_users','last_name,first_name','id','id'),(31,'PBXManager','vtiger_pbxmanager','callfrom','pbxmanagerid','pbxmanagerid'),(32,'ServiceContracts','vtiger_servicecontracts','subject','servicecontractsid','servicecontractsid'),(33,'Services','vtiger_service','servicename','serviceid','serviceid'),(35,'Assets','vtiger_assets','assetname','assetsid','assetsid'),(38,'ModComments','vtiger_modcomments','commentcontent','modcommentsid','modcommentsid'),(39,'ProjectMilestone','vtiger_projectmilestone','projectmilestonename','projectmilestoneid','projectmilestoneid'),(40,'ProjectTask','vtiger_projecttask','projecttaskname','projecttaskid','projecttaskid'),(41,'Project','vtiger_project','projectname','projectid','projectid'),(43,'SMSNotifier','vtiger_smsnotifier','message','smsnotifierid','smsnotifierid'),(48,'Barcode','vtiger_barcode','barcode','barcodeid','barcodeid'),(49,'Warehouse','vtiger_warehouse','warehouse_name','warehouseid','warehouseid'),(50,'Promotionalsale','vtiger_promotion','productid','promotionid','promotionid'),(51,'ClearanceSale','vtiger_clearance','productid','clearanceid','clearanceid'),(52,'PurchaseOrderReceived','vtiger_purchaseorderreceived','purchaseorder_no','poreceivedid','poreceivedid'),(53,'SalesReturn','vtiger_salesret','invoiceid','salesid','salesid'),(54,'Cashreceipt','vtiger_cashreceipt','invoiceid','cashreceiptid','cashreceiptid'),(55,'Stockadjustment','vtiger_stockadjust','stockadjustid','stockadjustid','stockadjustid'),(56,'Category','vtiger_category','categoryname','categoryid','categoryid'),(57,'Deliverychallan','vtiger_deliverychallan','dcid','dcid','dcid'),(58,'PurchaseRequest','vtiger_purchaserequest','warehouseid','purchaserequestid','purchaserequestid'),(62,'EmailSettings','vtiger_emailsettings','emailname','emailsettingsid','emailsettingsid');

/*Table structure for table `vtiger_evaluationstatus` */

DROP TABLE IF EXISTS `vtiger_evaluationstatus`;

CREATE TABLE `vtiger_evaluationstatus` (
  `evalstatusid` int(19) NOT NULL auto_increment,
  `status` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`evalstatusid`),
  UNIQUE KEY `evaluationstatus_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_evaluationstatus` */

/*Table structure for table `vtiger_eventhandler_module` */

DROP TABLE IF EXISTS `vtiger_eventhandler_module`;

CREATE TABLE `vtiger_eventhandler_module` (
  `eventhandler_module_id` int(11) NOT NULL auto_increment,
  `module_name` varchar(100) default NULL,
  `handler_class` varchar(100) default NULL,
  PRIMARY KEY  (`eventhandler_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_eventhandler_module` */

insert  into `vtiger_eventhandler_module`(`eventhandler_module_id`,`module_name`,`handler_class`) values (1,'ServiceContracts','ServiceContractsHandler'),(2,'FieldFormulas','VTFieldFormulasEventHandler');

/*Table structure for table `vtiger_eventhandler_module_seq` */

DROP TABLE IF EXISTS `vtiger_eventhandler_module_seq`;

CREATE TABLE `vtiger_eventhandler_module_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_eventhandler_module_seq` */

insert  into `vtiger_eventhandler_module_seq`(`id`) values (2);

/*Table structure for table `vtiger_eventhandlers` */

DROP TABLE IF EXISTS `vtiger_eventhandlers`;

CREATE TABLE `vtiger_eventhandlers` (
  `eventhandler_id` int(11) NOT NULL auto_increment,
  `event_name` varchar(100) NOT NULL,
  `handler_path` varchar(400) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `cond` text,
  `is_active` int(1) NOT NULL,
  PRIMARY KEY  (`eventhandler_id`,`event_name`,`handler_class`),
  UNIQUE KEY `eventhandler_idx` (`eventhandler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_eventhandlers` */

insert  into `vtiger_eventhandlers`(`eventhandler_id`,`event_name`,`handler_path`,`handler_class`,`cond`,`is_active`) values (1,'vtiger.entity.aftersave','modules/SalesOrder/RecurringInvoiceHandler.php','RecurringInvoiceHandler','',1),(2,'vtiger.entity.aftersave','modules/com_vtiger_workflow/VTEventHandler.inc','VTWorkflowEventHandler','',1),(3,'vtiger.entity.afterrestore','modules/com_vtiger_workflow/VTEventHandler.inc','VTWorkflowEventHandler','',1),(4,'vtiger.entity.beforesave','modules/ServiceContracts/ServiceContractsHandler.php','ServiceContractsHandler','',0),(5,'vtiger.entity.aftersave','modules/ServiceContracts/ServiceContractsHandler.php','ServiceContractsHandler','',0),(6,'vtiger.entity.beforesave.modifiable','modules/FieldFormulas/VTFieldFormulasEventHandler.inc','VTFieldFormulasEventHandler','',1);

/*Table structure for table `vtiger_eventhandlers_seq` */

DROP TABLE IF EXISTS `vtiger_eventhandlers_seq`;

CREATE TABLE `vtiger_eventhandlers_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_eventhandlers_seq` */

insert  into `vtiger_eventhandlers_seq`(`id`) values (6);

/*Table structure for table `vtiger_eventstatus` */

DROP TABLE IF EXISTS `vtiger_eventstatus`;

CREATE TABLE `vtiger_eventstatus` (
  `eventstatusid` int(19) NOT NULL auto_increment,
  `eventstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`eventstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_eventstatus` */

insert  into `vtiger_eventstatus`(`eventstatusid`,`eventstatus`,`presence`,`picklist_valueid`) values (1,'Planned',0,38),(2,'Held',0,39),(3,'Not Held',0,40);

/*Table structure for table `vtiger_eventstatus_seq` */

DROP TABLE IF EXISTS `vtiger_eventstatus_seq`;

CREATE TABLE `vtiger_eventstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_eventstatus_seq` */

insert  into `vtiger_eventstatus_seq`(`id`) values (3);

/*Table structure for table `vtiger_expectedresponse` */

DROP TABLE IF EXISTS `vtiger_expectedresponse`;

CREATE TABLE `vtiger_expectedresponse` (
  `expectedresponseid` int(19) NOT NULL auto_increment,
  `expectedresponse` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`expectedresponseid`),
  UNIQUE KEY `CampaignExpRes_UK01` (`expectedresponse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_expectedresponse` */

insert  into `vtiger_expectedresponse`(`expectedresponseid`,`expectedresponse`,`presence`,`picklist_valueid`) values (1,'--None--',1,41),(2,'Excellent',1,42),(3,'Good',1,43),(4,'Average',1,44),(5,'Poor',1,45);

/*Table structure for table `vtiger_expectedresponse_seq` */

DROP TABLE IF EXISTS `vtiger_expectedresponse_seq`;

CREATE TABLE `vtiger_expectedresponse_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_expectedresponse_seq` */

insert  into `vtiger_expectedresponse_seq`(`id`) values (5);

/*Table structure for table `vtiger_faq` */

DROP TABLE IF EXISTS `vtiger_faq`;

CREATE TABLE `vtiger_faq` (
  `id` int(11) NOT NULL auto_increment,
  `faq_no` varchar(100) NOT NULL,
  `product_id` varchar(100) default NULL,
  `question` text,
  `answer` text,
  `category` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `faq_id_idx` (`id`),
  CONSTRAINT `fk_1_vtiger_faq` FOREIGN KEY (`id`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_faq` */

/*Table structure for table `vtiger_faqcategories` */

DROP TABLE IF EXISTS `vtiger_faqcategories`;

CREATE TABLE `vtiger_faqcategories` (
  `faqcategories_id` int(19) NOT NULL auto_increment,
  `faqcategories` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`faqcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_faqcategories` */

insert  into `vtiger_faqcategories`(`faqcategories_id`,`faqcategories`,`presence`,`picklist_valueid`) values (1,'General',1,46);

/*Table structure for table `vtiger_faqcategories_seq` */

DROP TABLE IF EXISTS `vtiger_faqcategories_seq`;

CREATE TABLE `vtiger_faqcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_faqcategories_seq` */

insert  into `vtiger_faqcategories_seq`(`id`) values (1);

/*Table structure for table `vtiger_faqcomments` */

DROP TABLE IF EXISTS `vtiger_faqcomments`;

CREATE TABLE `vtiger_faqcomments` (
  `commentid` int(19) NOT NULL auto_increment,
  `faqid` int(19) default NULL,
  `comments` text,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`commentid`),
  KEY `faqcomments_faqid_idx` (`faqid`),
  CONSTRAINT `fk_1_vtiger_faqcomments` FOREIGN KEY (`faqid`) REFERENCES `vtiger_faq` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_faqcomments` */

/*Table structure for table `vtiger_faqstatus` */

DROP TABLE IF EXISTS `vtiger_faqstatus`;

CREATE TABLE `vtiger_faqstatus` (
  `faqstatus_id` int(19) NOT NULL auto_increment,
  `faqstatus` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`faqstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_faqstatus` */

insert  into `vtiger_faqstatus`(`faqstatus_id`,`faqstatus`,`presence`,`picklist_valueid`) values (1,'Draft',0,47),(2,'Reviewed',0,48),(3,'Published',0,49),(4,'Obsolete',0,50);

/*Table structure for table `vtiger_faqstatus_seq` */

DROP TABLE IF EXISTS `vtiger_faqstatus_seq`;

CREATE TABLE `vtiger_faqstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_faqstatus_seq` */

insert  into `vtiger_faqstatus_seq`(`id`) values (4);

/*Table structure for table `vtiger_field` */

DROP TABLE IF EXISTS `vtiger_field`;

CREATE TABLE `vtiger_field` (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) NOT NULL auto_increment,
  `columnname` varchar(30) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `generatedtype` int(19) NOT NULL default '0',
  `uitype` varchar(30) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `fieldlabel` varchar(50) NOT NULL,
  `readonly` int(1) NOT NULL,
  `presence` int(19) NOT NULL default '1',
  `selected` int(1) NOT NULL,
  `maximumlength` int(19) default NULL,
  `sequence` int(19) default NULL,
  `block` int(19) default NULL,
  `displaytype` int(19) default NULL,
  `typeofdata` varchar(100) default NULL,
  `quickcreate` int(10) NOT NULL default '1',
  `quickcreatesequence` int(19) default NULL,
  `info_type` varchar(20) default NULL,
  `masseditable` int(10) NOT NULL default '1',
  `helpinfo` text,
  PRIMARY KEY  (`fieldid`),
  KEY `field_tabid_idx` (`tabid`),
  KEY `field_fieldname_idx` (`fieldname`),
  KEY `field_block_idx` (`block`),
  KEY `field_displaytype_idx` (`displaytype`),
  CONSTRAINT `fk_1_vtiger_field` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_field` */

insert  into `vtiger_field`(`tabid`,`fieldid`,`columnname`,`tablename`,`generatedtype`,`uitype`,`fieldname`,`fieldlabel`,`readonly`,`presence`,`selected`,`maximumlength`,`sequence`,`block`,`displaytype`,`typeofdata`,`quickcreate`,`quickcreatesequence`,`info_type`,`masseditable`,`helpinfo`) values (6,1,'accountname','vtiger_account',1,'2','accountname','Account Name',1,0,0,100,1,9,1,'V~M',0,1,'BAS',0,NULL),(6,2,'account_no','vtiger_account',1,'4','account_no','Account No',1,0,0,100,2,9,1,'V~O',3,NULL,'BAS',0,NULL),(6,3,'phone','vtiger_account',1,'11','phone','Phone',1,2,0,100,4,9,1,'V~O',2,2,'BAS',1,NULL),(6,4,'website','vtiger_account',1,'17','website','Website',1,2,0,100,3,9,1,'V~O',2,3,'BAS',1,NULL),(6,5,'fax','vtiger_account',1,'11','fax','Fax',1,2,0,100,6,9,1,'V~O',1,NULL,'BAS',1,NULL),(6,6,'tickersymbol','vtiger_account',1,'1','tickersymbol','Ticker Symbol',1,2,0,100,5,9,1,'V~O',1,NULL,'BAS',1,NULL),(6,7,'otherphone','vtiger_account',1,'11','otherphone','Other Phone',1,2,0,100,8,9,1,'V~O',1,NULL,'ADV',1,NULL),(6,8,'parentid','vtiger_account',1,'51','account_id','Member Of',1,2,0,100,7,9,1,'I~O',1,NULL,'BAS',0,NULL),(6,9,'email1','vtiger_account',1,'13','email1','Email',1,2,0,100,10,9,1,'E~O',1,NULL,'BAS',1,NULL),(6,10,'employees','vtiger_account',1,'7','employees','Employees',1,2,0,100,9,9,1,'I~O',1,NULL,'ADV',1,NULL),(6,11,'email2','vtiger_account',1,'13','email2','Other Email',1,2,0,100,11,9,1,'E~O',1,NULL,'ADV',1,NULL),(6,12,'ownership','vtiger_account',1,'1','ownership','Ownership',1,2,0,100,12,9,1,'V~O',1,NULL,'ADV',1,NULL),(6,13,'rating','vtiger_account',1,'15','rating','Rating',1,2,0,100,14,9,1,'V~O',1,NULL,'ADV',1,NULL),(6,14,'industry','vtiger_account',1,'15','industry','industry',1,2,0,100,13,9,1,'V~O',1,NULL,'ADV',1,NULL),(6,15,'siccode','vtiger_account',1,'1','siccode','SIC Code',1,2,0,100,16,9,1,'V~O',1,NULL,'ADV',1,NULL),(6,16,'account_type','vtiger_account',1,'15','accounttype','Type',1,2,0,100,15,9,1,'V~O',1,NULL,'ADV',1,NULL),(6,17,'annualrevenue','vtiger_account',1,'71','annual_revenue','Annual Revenue',1,2,0,100,18,9,1,'I~O',1,NULL,'ADV',1,NULL),(6,18,'emailoptout','vtiger_account',1,'56','emailoptout','Email Opt Out',1,2,0,100,17,9,1,'C~O',1,NULL,'ADV',1,NULL),(6,19,'notify_owner','vtiger_account',1,'56','notify_owner','Notify Owner',1,2,0,10,20,9,1,'C~O',1,NULL,'ADV',1,NULL),(6,20,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,19,9,1,'V~M',0,4,'BAS',1,NULL),(6,21,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,22,9,2,'T~O',3,NULL,'BAS',0,NULL),(6,22,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,21,9,2,'T~O',3,NULL,'BAS',0,NULL),(6,23,'bill_street','vtiger_accountbillads',1,'21','bill_street','Billing Address',1,2,0,100,1,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,24,'ship_street','vtiger_accountshipads',1,'21','ship_street','Shipping Address',1,2,0,100,2,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,25,'bill_city','vtiger_accountbillads',1,'1','bill_city','Billing City',1,2,0,100,5,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,26,'ship_city','vtiger_accountshipads',1,'1','ship_city','Shipping City',1,2,0,100,6,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,27,'bill_state','vtiger_accountbillads',1,'1','bill_state','Billing State',1,2,0,100,7,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,28,'ship_state','vtiger_accountshipads',1,'1','ship_state','Shipping State',1,2,0,100,8,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,29,'bill_code','vtiger_accountbillads',1,'1','bill_code','Billing Code',1,2,0,100,9,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,30,'ship_code','vtiger_accountshipads',1,'1','ship_code','Shipping Code',1,2,0,100,10,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,31,'bill_country','vtiger_accountbillads',1,'1','bill_country','Billing Country',1,2,0,100,11,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,32,'ship_country','vtiger_accountshipads',1,'1','ship_country','Shipping Country',1,2,0,100,12,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,33,'bill_pobox','vtiger_accountbillads',1,'1','bill_pobox','Billing Po Box',1,2,0,100,3,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,34,'ship_pobox','vtiger_accountshipads',1,'1','ship_pobox','Shipping Po Box',1,2,0,100,4,11,1,'V~O',1,NULL,'BAS',1,NULL),(6,35,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,12,1,'V~O',1,NULL,'BAS',1,NULL),(7,36,'salutation','vtiger_leaddetails',1,'55','salutationtype','Salutation',1,0,0,100,1,13,3,'V~O',1,NULL,'BAS',1,NULL),(7,37,'firstname','vtiger_leaddetails',1,'55','firstname','First Name',1,2,0,100,2,13,1,'V~O',2,1,'BAS',1,NULL),(7,38,'lead_no','vtiger_leaddetails',1,'4','lead_no','Lead No',1,0,0,100,3,13,1,'V~O',3,NULL,'BAS',0,NULL),(7,39,'phone','vtiger_leadaddress',1,'11','phone','Phone',1,2,0,100,5,13,1,'V~O',2,4,'BAS',1,NULL),(7,40,'lastname','vtiger_leaddetails',1,'255','lastname','Last Name',1,0,0,100,4,13,1,'V~M',0,2,'BAS',1,NULL),(7,41,'mobile','vtiger_leadaddress',1,'11','mobile','Mobile',1,2,0,100,7,13,1,'V~O',1,NULL,'BAS',1,NULL),(7,42,'company','vtiger_leaddetails',1,'2','company','Company',1,2,0,100,6,13,1,'V~M',2,3,'BAS',1,NULL),(7,43,'fax','vtiger_leadaddress',1,'11','fax','Fax',1,2,0,100,9,13,1,'V~O',1,NULL,'BAS',1,NULL),(7,44,'designation','vtiger_leaddetails',1,'1','designation','Designation',1,2,0,100,8,13,1,'V~O',1,NULL,'BAS',1,NULL),(7,45,'email','vtiger_leaddetails',1,'13','email','Email',1,2,0,100,11,13,1,'E~O',2,5,'BAS',1,NULL),(7,46,'leadsource','vtiger_leaddetails',1,'15','leadsource','Lead Source',1,2,0,100,10,13,1,'V~O',1,NULL,'BAS',1,NULL),(7,47,'website','vtiger_leadsubdetails',1,'17','website','Website',1,2,0,100,13,13,1,'V~O',1,NULL,'ADV',1,NULL),(7,48,'industry','vtiger_leaddetails',1,'15','industry','Industry',1,2,0,100,12,13,1,'V~O',1,NULL,'ADV',1,NULL),(7,49,'leadstatus','vtiger_leaddetails',1,'15','leadstatus','Lead Status',1,2,0,100,15,13,1,'V~O',1,NULL,'BAS',1,NULL),(7,50,'annualrevenue','vtiger_leaddetails',1,'71','annualrevenue','Annual Revenue',1,2,0,100,14,13,1,'I~O',1,NULL,'ADV',1,NULL),(7,51,'rating','vtiger_leaddetails',1,'15','rating','Rating',1,2,0,100,17,13,1,'V~O',1,NULL,'ADV',1,NULL),(7,52,'noofemployees','vtiger_leaddetails',1,'1','noofemployees','No Of Employees',1,2,0,100,16,13,1,'I~O',1,NULL,'ADV',1,NULL),(7,53,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,19,13,1,'V~M',0,6,'BAS',1,NULL),(7,54,'yahooid','vtiger_leaddetails',1,'13','yahooid','Yahoo Id',1,2,0,100,18,13,1,'E~O',1,NULL,'ADV',1,NULL),(7,55,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,21,13,2,'T~O',3,NULL,'BAS',0,NULL),(7,56,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,20,13,2,'T~O',3,NULL,'BAS',0,NULL),(7,57,'lane','vtiger_leadaddress',1,'21','lane','Street',1,2,0,100,1,15,1,'V~O',1,NULL,'BAS',1,NULL),(7,58,'code','vtiger_leadaddress',1,'1','code','Postal Code',1,2,0,100,3,15,1,'V~O',1,NULL,'BAS',1,NULL),(7,59,'city','vtiger_leadaddress',1,'1','city','City',1,2,0,100,4,15,1,'V~O',1,NULL,'BAS',1,NULL),(7,60,'country','vtiger_leadaddress',1,'1','country','Country',1,2,0,100,5,15,1,'V~O',1,NULL,'BAS',1,NULL),(7,61,'state','vtiger_leadaddress',1,'1','state','State',1,2,0,100,6,15,1,'V~O',1,NULL,'BAS',1,NULL),(7,62,'pobox','vtiger_leadaddress',1,'1','pobox','Po Box',1,2,0,100,2,15,1,'V~O',1,NULL,'BAS',1,NULL),(7,63,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,16,1,'V~O',1,NULL,'BAS',1,NULL),(4,64,'salutation','vtiger_contactdetails',1,'55','salutationtype','Salutation',1,0,0,100,1,4,3,'V~O',1,NULL,'BAS',1,NULL),(4,65,'firstname','vtiger_contactdetails',1,'255','firstname','First Name',1,2,0,100,2,4,1,'V~M',2,7,'BAS',1,NULL),(4,66,'contact_no','vtiger_contactdetails',1,'4','contact_no','Contact Id',1,0,0,100,3,4,1,'V~O',3,NULL,'BAS',0,NULL),(4,67,'phone','vtiger_contactdetails',1,'11','phone','Office Phone',1,2,0,100,5,4,1,'V~O',2,4,'BAS',1,NULL),(4,68,'lastname','vtiger_contactdetails',1,'255','lastname','Last Name',1,0,0,100,4,4,1,'V~M',0,2,'BAS',1,NULL),(4,69,'mobile','vtiger_contactdetails',1,'11','mobile','Mobile',1,2,0,100,7,4,1,'V~O',1,NULL,'BAS',1,NULL),(4,70,'accountid','vtiger_contactdetails',1,'51','account_id','Account Name',1,1,0,100,6,4,1,'I~O',1,1,'BAS',2,NULL),(4,71,'homephone','vtiger_contactsubdetails',1,'11','homephone','Home Phone',1,1,0,100,9,4,1,'V~O',1,1,'ADV',2,NULL),(4,72,'leadsource','vtiger_contactsubdetails',1,'15','leadsource','Lead Source',1,1,0,100,8,4,1,'V~O',1,1,'BAS',1,NULL),(4,73,'otherphone','vtiger_contactsubdetails',1,'11','otherphone','Other Phone',1,1,0,100,11,4,1,'V~O',1,1,'ADV',2,NULL),(4,74,'title','vtiger_contactdetails',1,'1','title','Title',1,2,0,100,10,4,1,'V~O',1,NULL,'BAS',1,NULL),(4,75,'fax','vtiger_contactdetails',1,'11','fax','Fax',1,1,0,100,13,4,1,'V~O',1,1,'BAS',2,NULL),(4,76,'department','vtiger_contactdetails',1,'1','department','Department',1,1,0,100,12,4,1,'V~O',1,1,'ADV',2,NULL),(4,77,'birthday','vtiger_contactsubdetails',1,'5','birthday','Birthdate',1,1,0,100,16,4,1,'D~O',1,1,'ADV',2,NULL),(4,78,'email','vtiger_contactdetails',1,'13','email','Email',1,2,0,100,15,4,1,'E~O',2,5,'BAS',1,NULL),(4,79,'reportsto','vtiger_contactdetails',1,'57','contact_id','Reports To',1,1,0,100,18,4,1,'V~O',1,1,'ADV',0,NULL),(4,80,'assistant','vtiger_contactsubdetails',1,'1','assistant','Assistant',1,1,0,100,17,4,1,'V~O',1,1,'ADV',2,NULL),(4,81,'yahooid','vtiger_contactdetails',1,'13','yahooid','Yahoo Id',1,1,0,100,20,4,1,'E~O',1,1,'ADV',2,NULL),(4,82,'assistantphone','vtiger_contactsubdetails',1,'11','assistantphone','Assistant Phone',1,1,0,100,19,4,1,'V~O',1,1,'ADV',2,NULL),(4,83,'donotcall','vtiger_contactdetails',1,'56','donotcall','Do Not Call',1,1,0,100,22,4,1,'C~O',1,1,'ADV',2,NULL),(4,84,'emailoptout','vtiger_contactdetails',1,'56','emailoptout','Email Opt Out',1,1,0,100,21,4,1,'C~O',1,1,'ADV',2,NULL),(4,85,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,27,4,1,'V~M',0,6,'BAS',2,NULL),(4,86,'reference','vtiger_contactdetails',1,'56','reference','Reference',1,1,0,10,23,4,1,'C~O',1,1,'ADV',2,NULL),(4,87,'notify_owner','vtiger_contactdetails',1,'56','notify_owner','Notify Owner',1,1,0,10,26,4,1,'C~O',1,1,'ADV',2,NULL),(4,88,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,24,4,2,'T~O',3,NULL,'BAS',0,NULL),(4,89,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,25,4,2,'T~O',3,NULL,'BAS',0,NULL),(4,90,'portal','vtiger_customerdetails',1,'56','portal','Portal User',1,2,0,100,1,6,1,'C~O',1,NULL,'ADV',0,NULL),(4,91,'support_start_date','vtiger_customerdetails',1,'5','support_start_date','Support Start Date',1,2,0,100,2,6,1,'D~O',1,NULL,'ADV',1,NULL),(4,92,'support_end_date','vtiger_customerdetails',1,'5','support_end_date','Support End Date',1,2,0,100,3,6,1,'D~O~OTH~GE~support_start_date~Support Start Date',1,NULL,'ADV',1,NULL),(4,93,'mailingstreet','vtiger_contactaddress',1,'21','mailingstreet','Mailing Street',1,2,0,100,1,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,94,'otherstreet','vtiger_contactaddress',1,'21','otherstreet','Other Street',1,2,0,100,2,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,95,'mailingcity','vtiger_contactaddress',1,'1','mailingcity','Mailing City',1,2,0,100,5,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,96,'othercity','vtiger_contactaddress',1,'1','othercity','Other City',1,2,0,100,6,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,97,'mailingstate','vtiger_contactaddress',1,'1','mailingstate','Mailing State',1,2,0,100,7,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,98,'otherstate','vtiger_contactaddress',1,'1','otherstate','Other State',1,2,0,100,8,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,99,'mailingzip','vtiger_contactaddress',1,'1','mailingzip','Mailing Zip',1,2,0,100,9,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,100,'otherzip','vtiger_contactaddress',1,'1','otherzip','Other Zip',1,2,0,100,10,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,101,'mailingcountry','vtiger_contactaddress',1,'1','mailingcountry','Mailing Country',1,2,0,100,11,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,102,'othercountry','vtiger_contactaddress',1,'1','othercountry','Other Country',1,2,0,100,12,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,103,'mailingpobox','vtiger_contactaddress',1,'1','mailingpobox','Mailing Po Box',1,2,0,100,3,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,104,'otherpobox','vtiger_contactaddress',1,'1','otherpobox','Other Po Box',1,2,0,100,4,7,1,'V~O',1,NULL,'BAS',1,NULL),(4,105,'imagename','vtiger_contactdetails',1,'69','imagename','Contact Image',1,2,0,100,1,73,1,'V~O',3,NULL,'ADV',0,NULL),(4,106,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,8,1,'V~O',1,NULL,'BAS',1,NULL),(2,107,'potentialname','vtiger_potential',1,'2','potentialname','Potential Name',1,0,0,100,1,1,1,'V~M',0,1,'BAS',1,NULL),(2,108,'potential_no','vtiger_potential',1,'4','potential_no','Potential No',1,0,0,100,2,1,1,'V~O',3,NULL,'BAS',0,NULL),(2,109,'amount','vtiger_potential',1,'71','amount','Amount',1,2,0,100,4,1,1,'N~O',2,5,'BAS',1,NULL),(2,110,'related_to','vtiger_potential',1,'10','related_to','Related To',1,0,0,100,3,1,1,'V~M',0,2,'BAS',1,NULL),(2,111,'closingdate','vtiger_potential',1,'23','closingdate','Expected Close Date',1,2,0,100,7,1,1,'D~M',2,3,'BAS',1,NULL),(2,112,'potentialtype','vtiger_potential',1,'15','opportunity_type','Type',1,2,0,100,6,1,1,'V~O',1,NULL,'BAS',1,NULL),(2,113,'nextstep','vtiger_potential',1,'1','nextstep','Next Step',1,2,0,100,9,1,1,'V~O',1,NULL,'BAS',1,NULL),(2,114,'leadsource','vtiger_potential',1,'15','leadsource','Lead Source',1,2,0,100,8,1,1,'V~O',1,NULL,'BAS',1,NULL),(2,115,'sales_stage','vtiger_potential',1,'15','sales_stage','Sales Stage',1,2,0,100,11,1,1,'V~M',2,4,'BAS',1,NULL),(2,116,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,10,1,1,'V~M',0,6,'BAS',1,NULL),(2,117,'probability','vtiger_potential',1,'9','probability','Probability',1,2,0,100,13,1,1,'N~O',1,NULL,'BAS',1,NULL),(2,118,'campaignid','vtiger_potential',1,'58','campaignid','Campaign Source',1,2,0,100,12,1,1,'N~O',1,NULL,'BAS',1,NULL),(2,119,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,15,1,2,'T~O',3,NULL,'BAS',0,NULL),(2,120,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,14,1,2,'T~O',3,NULL,'BAS',0,NULL),(2,121,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,3,1,'V~O',1,NULL,'BAS',1,NULL),(26,122,'campaignname','vtiger_campaign',1,'2','campaignname','Campaign Name',1,0,0,100,1,74,1,'V~M',0,1,'BAS',1,NULL),(26,123,'campaign_no','vtiger_campaign',1,'4','campaign_no','Campaign No',1,0,0,100,2,74,1,'V~O',3,NULL,'BAS',0,NULL),(26,124,'campaigntype','vtiger_campaign',1,'15','campaigntype','Campaign Type',1,2,0,100,5,74,1,'V~O',2,3,'BAS',1,NULL),(26,125,'product_id','vtiger_campaign',1,'59','product_id','Product',1,2,0,100,6,74,1,'I~O',2,5,'BAS',1,NULL),(26,126,'campaignstatus','vtiger_campaign',1,'15','campaignstatus','Campaign Status',1,2,0,100,4,74,1,'V~O',2,6,'BAS',1,NULL),(26,127,'closingdate','vtiger_campaign',1,'23','closingdate','Expected Close Date',1,2,0,100,8,74,1,'D~M',2,2,'BAS',1,NULL),(26,128,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,3,74,1,'V~M',0,7,'BAS',1,NULL),(26,129,'numsent','vtiger_campaign',1,'9','numsent','Num Sent',1,2,0,100,12,74,1,'N~O',1,NULL,'BAS',1,NULL),(26,130,'sponsor','vtiger_campaign',1,'1','sponsor','Sponsor',1,2,0,100,9,74,1,'V~O',1,NULL,'BAS',1,NULL),(26,131,'targetaudience','vtiger_campaign',1,'1','targetaudience','Target Audience',1,2,0,100,7,74,1,'V~O',1,NULL,'BAS',1,NULL),(26,132,'targetsize','vtiger_campaign',1,'1','targetsize','TargetSize',1,2,0,100,10,74,1,'I~O',1,NULL,'BAS',1,NULL),(26,133,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,11,74,2,'T~O',3,NULL,'BAS',0,NULL),(26,134,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,13,74,2,'T~O',3,NULL,'BAS',0,NULL),(26,135,'expectedresponse','vtiger_campaign',1,'15','expectedresponse','Expected Response',1,2,0,100,3,76,1,'V~O',2,4,'BAS',1,NULL),(26,136,'expectedrevenue','vtiger_campaign',1,'1','expectedrevenue','Expected Revenue',1,2,0,100,4,76,1,'N~O',1,NULL,'BAS',1,NULL),(26,137,'budgetcost','vtiger_campaign',1,'1','budgetcost','Budget Cost',1,2,0,100,1,76,1,'N~O',1,NULL,'BAS',1,NULL),(26,138,'actualcost','vtiger_campaign',1,'1','actualcost','Actual Cost',1,2,0,100,2,76,1,'N~O',1,NULL,'BAS',1,NULL),(26,139,'expectedresponsecount','vtiger_campaign',1,'1','expectedresponsecount','Expected Response Count',1,2,0,100,7,76,1,'I~O',1,NULL,'BAS',1,NULL),(26,140,'expectedsalescount','vtiger_campaign',1,'1','expectedsalescount','Expected Sales Count',1,2,0,100,5,76,1,'I~O',1,NULL,'BAS',1,NULL),(26,141,'expectedroi','vtiger_campaign',1,'1','expectedroi','Expected ROI',1,2,0,100,9,76,1,'N~O',1,NULL,'BAS',1,NULL),(26,142,'actualresponsecount','vtiger_campaign',1,'1','actualresponsecount','Actual Response Count',1,2,0,100,8,76,1,'I~O',1,NULL,'BAS',1,NULL),(26,143,'actualsalescount','vtiger_campaign',1,'1','actualsalescount','Actual Sales Count',1,2,0,100,6,76,1,'I~O',1,NULL,'BAS',1,NULL),(26,144,'actualroi','vtiger_campaign',1,'1','actualroi','Actual ROI',1,2,0,100,10,76,1,'N~O',1,NULL,'BAS',1,NULL),(26,145,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,80,1,'V~O',1,NULL,'BAS',1,NULL),(4,146,'campaignrelstatus','vtiger_campaignrelstatus',1,'16','campaignrelstatus','Status',1,0,0,100,1,NULL,1,'V~O',1,NULL,'BAS',0,NULL),(6,147,'campaignrelstatus','vtiger_campaignrelstatus',1,'16','campaignrelstatus','Status',1,0,0,100,1,NULL,1,'V~O',1,NULL,'BAS',0,NULL),(7,148,'campaignrelstatus','vtiger_campaignrelstatus',1,'16','campaignrelstatus','Status',1,0,0,100,1,NULL,1,'V~O',1,NULL,'BAS',0,NULL),(26,149,'campaignrelstatus','vtiger_campaignrelstatus',1,'16','campaignrelstatus','Status',1,0,0,100,1,NULL,1,'V~O',1,NULL,'BAS',0,NULL),(13,150,'ticket_no','vtiger_troubletickets',1,'4','ticket_no','Ticket No',1,0,0,100,13,25,1,'V~O',3,NULL,'BAS',0,NULL),(13,151,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,4,25,1,'V~M',0,4,'BAS',1,NULL),(13,152,'parent_id','vtiger_troubletickets',1,'68','parent_id','Related To',1,0,0,100,2,25,1,'I~O',1,NULL,'BAS',1,NULL),(13,153,'priority','vtiger_troubletickets',1,'15','ticketpriorities','Priority',1,2,0,100,6,25,1,'V~O',2,3,'BAS',1,NULL),(13,154,'product_id','vtiger_troubletickets',1,'59','product_id','Product Name',1,2,0,100,5,25,1,'I~O',1,NULL,'BAS',1,NULL),(13,155,'severity','vtiger_troubletickets',1,'15','ticketseverities','Severity',1,2,0,100,8,25,1,'V~O',1,NULL,'BAS',1,NULL),(13,156,'status','vtiger_troubletickets',1,'15','ticketstatus','Status',1,2,0,100,7,25,1,'V~M',1,2,'BAS',1,NULL),(13,157,'category','vtiger_troubletickets',1,'15','ticketcategories','Category',1,2,0,100,10,25,1,'V~O',1,NULL,'BAS',1,NULL),(13,158,'update_log','vtiger_troubletickets',1,'19','update_log','Update History',1,0,0,100,11,25,3,'V~O',1,NULL,'BAS',0,NULL),(13,159,'hours','vtiger_troubletickets',1,'1','hours','Hours',1,2,0,100,9,25,1,'I~O',1,NULL,'BAS',1,'This gives the estimated hours for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.'),(13,160,'days','vtiger_troubletickets',1,'1','days','Days',1,2,0,100,10,25,1,'I~O',1,NULL,'BAS',1,'This gives the estimated days for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.'),(13,161,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,9,25,2,'T~O',3,NULL,'BAS',0,NULL),(13,162,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,12,25,2,'T~O',3,NULL,'BAS',0,NULL),(13,163,'title','vtiger_troubletickets',1,'22','ticket_title','Title',1,0,0,100,1,25,1,'V~M',0,1,'BAS',1,NULL),(13,164,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,28,1,'V~O',2,4,'BAS',1,NULL),(13,165,'solution','vtiger_troubletickets',1,'19','solution','Solution',1,0,0,100,1,29,1,'V~O',3,NULL,'BAS',0,NULL),(13,166,'comments','vtiger_ticketcomments',1,'19','comments','Add Comment',1,0,0,100,1,30,1,'V~O',3,NULL,'BAS',0,NULL),(14,167,'productname','vtiger_products',1,'2','productname','Product Name',1,0,0,100,4,31,1,'V~O',0,1,'BAS',1,NULL),(14,168,'product_no','vtiger_products',1,'4','product_no','Product No',1,0,0,100,20,31,1,'V~O',3,NULL,'BAS',0,NULL),(14,169,'productcode','vtiger_products',1,'1','productcode','Part Number',1,1,0,100,13,31,1,'V~O',1,1,'BAS',2,NULL),(14,170,'discontinued','vtiger_products',1,'56','discontinued','Product Active',1,3,0,100,6,31,1,'V~O',2,2,'BAS',1,NULL),(14,171,'manufacturer','vtiger_products',1,'15','manufacturer','Manufacturer',1,1,0,100,10,31,1,'V~O',1,1,'BAS',1,NULL),(14,172,'productcategory','vtiger_products',1,'2','productcategory','Product Category',1,2,0,100,7,31,1,'V~O',1,NULL,'BAS',1,NULL),(14,173,'sales_start_date','vtiger_products',1,'5','sales_start_date','Sales Start Date',1,1,0,100,22,31,1,'D~O',1,1,'BAS',2,NULL),(14,174,'sales_end_date','vtiger_products',1,'5','sales_end_date','Sales End Date',1,1,0,100,17,31,1,'D~O~OTH~GE~sales_start_date~Sales Start Date',1,1,'BAS',1,NULL),(14,175,'start_date','vtiger_products',1,'5','start_date','Support Start Date',1,1,0,100,8,31,1,'D~O',1,1,'BAS',1,NULL),(14,176,'expiry_date','vtiger_products',1,'5','expiry_date','Support Expiry Date',1,1,0,100,15,31,1,'D~O~OTH~GE~start_date~Start Date',1,1,'BAS',1,NULL),(14,177,'website','vtiger_products',1,'17','website','Website',1,1,0,100,14,31,1,'V~O',1,NULL,'BAS',1,NULL),(14,178,'vendor_id','vtiger_products',1,'75','vendor_id','Vendor Name',1,1,0,100,19,31,1,'I~O',1,NULL,'BAS',1,NULL),(14,179,'mfr_part_no','vtiger_products',1,'1','mfr_part_no','Mfr PartNo',1,1,0,100,16,31,1,'V~O',1,1,'BAS',1,NULL),(14,180,'vendor_part_no','vtiger_products',1,'1','vendor_part_no','Vendor PartNo',1,1,0,100,21,31,1,'V~O',1,1,'BAS',1,NULL),(14,181,'serialno','vtiger_products',1,'1','serial_no','Serial No',1,1,0,100,18,31,1,'V~O',1,1,'BAS',2,NULL),(14,182,'productsheet','vtiger_products',1,'1','productsheet','Product Sheet',1,1,0,100,23,31,1,'V~O',1,1,'BAS',1,NULL),(14,183,'glacct','vtiger_products',1,'15','glacct','GL Account',1,1,0,100,20,31,1,'V~O',1,1,'BAS',1,NULL),(14,184,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,25,31,2,'T~O',3,NULL,'BAS',0,NULL),(14,185,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,24,31,2,'T~O',3,NULL,'BAS',0,NULL),(14,186,'unit_price','vtiger_products',1,'71','unit_price','Selling Price',1,2,0,100,5,32,1,'N~O',2,3,'BAS',0,NULL),(14,187,'commissionrate','vtiger_products',1,'9','commissionrate','Commission Rate',1,1,0,100,2,32,1,'N~O',1,1,'BAS',1,NULL),(14,188,'taxclass','vtiger_products',1,'83','taxclass','Tax Class',1,1,0,100,1,32,1,'V~O',3,NULL,'BAS',2,NULL),(14,189,'usageunit','vtiger_products',1,'15','usageunit','Usage Unit',1,2,0,100,1,33,1,'V~O',1,NULL,'ADV',1,NULL),(14,190,'qty_per_unit','vtiger_products',1,'1','qty_per_unit','Qty/Unit',1,1,0,100,2,33,1,'N~O',1,1,'ADV',2,NULL),(14,191,'qtyinstock','vtiger_products',1,'1','qtyinstock','Qty In Stock',1,2,0,100,3,33,1,'NN~O',0,4,'ADV',1,NULL),(14,192,'reorderlevel','vtiger_products',1,'1','reorderlevel','Reorder Level',1,2,0,100,5,33,1,'I~O',1,NULL,'ADV',1,NULL),(14,193,'handler','vtiger_products',1,'52','assigned_user_id','Handler',1,1,0,100,5,33,1,'I~O',1,NULL,'ADV',1,NULL),(14,194,'qtyindemand','vtiger_products',1,'1','qtyindemand','Qty In Demand',1,1,0,100,6,33,1,'I~O',1,1,'ADV',1,NULL),(14,195,'imagename','vtiger_products',1,'69','imagename','Product Image',1,2,0,100,1,35,1,'V~O',3,NULL,'ADV',0,NULL),(14,196,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,36,1,'V~O',1,NULL,'BAS',1,NULL),(8,197,'title','vtiger_notes',1,'2','notes_title','Title',1,0,0,100,1,17,1,'V~M',0,1,'BAS',0,NULL),(8,198,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,5,17,2,'T~O',3,NULL,'BAS',0,NULL),(8,199,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,6,17,2,'T~O',3,NULL,'BAS',0,NULL),(8,200,'filename','vtiger_notes',1,'28','filename','File Name',1,2,0,100,3,18,1,'V~O',3,NULL,'BAS',0,NULL),(8,201,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,4,17,1,'V~M',0,3,'BAS',0,NULL),(8,202,'notecontent','vtiger_notes',1,'19','notecontent','Note',1,2,0,100,1,83,1,'V~O',1,NULL,'BAS',0,NULL),(8,209,'folderid','vtiger_notes',1,'26','folderid','Folder Name',1,2,0,100,2,17,1,'V~O',2,2,'BAS',0,NULL),(8,210,'note_no','vtiger_notes',1,'4','note_no','Document No',1,0,0,100,3,17,1,'V~O',3,NULL,'BAS',0,NULL),(10,211,'date_start','vtiger_activity',1,'6','date_start','Date & Time Sent',1,0,0,100,1,21,1,'DT~M~time_start~Time Start',1,NULL,'BAS',1,NULL),(10,212,'semodule','vtiger_activity',1,'2','parent_type','Sales Enity Module',1,0,0,100,2,21,3,'',1,NULL,'BAS',1,NULL),(10,213,'activitytype','vtiger_activity',1,'2','activitytype','Activtiy Type',1,0,0,100,3,21,3,'V~O',1,NULL,'BAS',1,NULL),(10,214,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,5,21,1,'V~M',1,NULL,'BAS',1,NULL),(10,215,'subject','vtiger_activity',1,'2','subject','Subject',1,0,0,100,1,23,1,'V~M',1,NULL,'BAS',1,NULL),(10,216,'name','vtiger_attachments',1,'61','filename','Attachment',1,0,0,100,2,23,1,'V~O',1,NULL,'BAS',1,NULL),(10,217,'description','vtiger_crmentity',1,'19','description','Description',1,0,0,100,1,24,1,'V~O',1,NULL,'BAS',1,NULL),(10,218,'time_start','vtiger_activity',1,'2','time_start','Time Start',1,0,0,100,9,23,1,'T~O',1,NULL,'BAS',1,NULL),(10,219,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,10,22,1,'T~O',3,NULL,'BAS',0,NULL),(10,220,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,11,21,2,'T~O',3,NULL,'BAS',0,NULL),(10,221,'access_count','vtiger_email_track',1,'25','access_count','Access Count',1,0,0,100,6,21,3,'V~O',1,NULL,'BAS',0,NULL),(9,222,'subject','vtiger_activity',1,'2','subject','Subject',1,0,0,100,1,19,1,'V~M',0,1,'BAS',1,NULL),(9,223,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,2,19,1,'V~M',0,4,'BAS',1,NULL),(9,224,'date_start','vtiger_activity',1,'6','date_start','Start Date & Time',1,0,0,100,3,19,1,'DT~M~time_start',0,2,'BAS',1,NULL),(9,225,'time_start','vtiger_activity',1,'2','time_start','Time Start',1,0,0,100,4,19,3,'T~O',1,NULL,'BAS',1,NULL),(9,226,'time_end','vtiger_activity',1,'2','time_end','End Time',1,0,0,100,4,19,3,'T~O',1,NULL,'BAS',1,NULL),(9,227,'due_date','vtiger_activity',1,'23','due_date','Due Date',1,0,0,100,5,19,1,'D~M~OTH~GE~date_start~Start Date & Time',1,NULL,'BAS',1,NULL),(9,228,'crmid','vtiger_seactivityrel',1,'66','parent_id','Related To',1,0,0,100,7,19,1,'I~O',1,NULL,'BAS',1,NULL),(9,229,'contactid','vtiger_cntactivityrel',1,'57','contact_id','Contact Name',1,0,0,100,8,19,1,'I~O',1,NULL,'BAS',1,NULL),(9,230,'status','vtiger_activity',1,'15','taskstatus','Status',1,0,0,100,8,19,1,'V~M',0,3,'BAS',1,NULL),(9,231,'eventstatus','vtiger_activity',1,'15','eventstatus','Status',1,0,0,100,9,19,3,'V~O',1,NULL,'BAS',1,NULL),(9,232,'priority','vtiger_activity',1,'15','taskpriority','Priority',1,0,0,100,10,19,1,'V~O',1,NULL,'BAS',1,NULL),(9,233,'sendnotification','vtiger_activity',1,'56','sendnotification','Send Notification',1,0,0,100,11,19,1,'C~O',1,NULL,'BAS',1,NULL),(9,234,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,14,19,2,'T~O',3,NULL,'BAS',0,NULL),(9,235,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,15,19,2,'T~O',3,NULL,'BAS',0,NULL),(9,236,'activitytype','vtiger_activity',1,'15','activitytype','Activity Type',1,0,0,100,16,19,3,'V~O',1,NULL,'BAS',1,NULL),(9,237,'visibility','vtiger_activity',1,'16','visibility','Visibility',1,0,0,100,17,19,3,'V~O',1,NULL,'BAS',1,NULL),(9,238,'description','vtiger_crmentity',1,'19','description','Description',1,0,0,100,1,20,1,'V~O',1,NULL,'BAS',1,NULL),(9,239,'duration_hours','vtiger_activity',1,'63','duration_hours','Duration',1,0,0,100,17,19,3,'T~O',1,NULL,'BAS',1,NULL),(9,240,'duration_minutes','vtiger_activity',1,'16','duration_minutes','Duration Minutes',1,0,0,100,18,19,3,'T~O',1,NULL,'BAS',1,NULL),(9,241,'location','vtiger_activity',1,'1','location','Location',1,0,0,100,19,19,3,'V~O',1,NULL,'BAS',1,NULL),(9,242,'reminder_time','vtiger_activity_reminder',1,'30','reminder_time','Send Reminder',1,0,0,100,1,19,3,'I~O',1,NULL,'BAS',1,NULL),(9,243,'recurringtype','vtiger_activity',1,'16','recurringtype','Recurrence',1,0,0,100,6,19,3,'O~O',1,NULL,'BAS',1,NULL),(9,244,'notime','vtiger_activity',1,'56','notime','No Time',1,0,0,100,20,19,3,'C~O',1,NULL,'BAS',1,NULL),(16,245,'subject','vtiger_activity',1,'2','subject','Subject',1,0,0,100,1,41,1,'V~M',0,1,'BAS',1,NULL),(16,246,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,2,41,1,'V~M',0,6,'BAS',1,NULL),(16,247,'date_start','vtiger_activity',1,'6','date_start','Start Date & Time',1,0,0,100,3,41,1,'DT~M~time_start',0,2,'BAS',1,NULL),(16,248,'time_start','vtiger_activity',1,'2','time_start','Time Start',1,0,0,100,4,41,3,'T~M',1,NULL,'BAS',1,NULL),(16,249,'due_date','vtiger_activity',1,'23','due_date','End Date',1,0,0,100,5,41,1,'D~M~OTH~GE~date_start~Start Date & Time',0,5,'BAS',1,NULL),(16,250,'time_end','vtiger_activity',1,'2','time_end','End Time',1,0,0,100,5,41,3,'T~M',1,NULL,'BAS',1,NULL),(16,251,'recurringtype','vtiger_activity',1,'16','recurringtype','Recurrence',1,0,0,100,6,41,1,'O~O',1,NULL,'BAS',1,NULL),(16,252,'duration_hours','vtiger_activity',1,'63','duration_hours','Duration',1,0,0,100,7,41,1,'I~M',1,NULL,'BAS',1,NULL),(16,253,'duration_minutes','vtiger_activity',1,'16','duration_minutes','Duration Minutes',1,0,0,100,8,41,3,'O~O',1,NULL,'BAS',1,NULL),(16,254,'crmid','vtiger_seactivityrel',1,'66','parent_id','Related To',1,0,0,100,9,41,1,'I~O',1,NULL,'BAS',1,NULL),(16,255,'eventstatus','vtiger_activity',1,'15','eventstatus','Status',1,0,0,100,10,41,1,'V~M',0,3,'BAS',1,NULL),(16,256,'sendnotification','vtiger_activity',1,'56','sendnotification','Send Notification',1,0,0,100,11,41,1,'C~O',1,NULL,'BAS',1,NULL),(16,257,'activitytype','vtiger_activity',1,'15','activitytype','Activity Type',1,0,0,100,12,41,1,'V~M',0,4,'BAS',1,NULL),(16,258,'location','vtiger_activity',1,'1','location','Location',1,0,0,100,13,41,1,'V~O',1,NULL,'BAS',1,NULL),(16,259,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,14,41,2,'T~O',3,NULL,'BAS',0,NULL),(16,260,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,15,41,2,'T~O',3,NULL,'BAS',0,NULL),(16,261,'priority','vtiger_activity',1,'15','taskpriority','Priority',1,0,0,100,16,41,1,'V~O',1,NULL,'BAS',1,NULL),(16,262,'notime','vtiger_activity',1,'56','notime','No Time',1,0,0,100,17,41,1,'C~O',1,NULL,'BAS',1,NULL),(16,263,'visibility','vtiger_activity',1,'16','visibility','Visibility',1,0,0,100,18,41,1,'V~O',1,NULL,'BAS',1,NULL),(16,264,'description','vtiger_crmentity',1,'19','description','Description',1,0,0,100,1,41,1,'V~O',1,NULL,'BAS',1,NULL),(16,265,'reminder_time','vtiger_activity_reminder',1,'30','reminder_time','Send Reminder',1,0,0,100,1,40,1,'I~O',1,NULL,'BAS',1,NULL),(16,266,'contactid','vtiger_cntactivityrel',1,'57','contact_id','Contact Name',1,0,0,100,1,19,1,'I~O',1,NULL,'BAS',1,NULL),(15,267,'product_id','vtiger_faq',1,'59','product_id','Product Name',1,2,0,100,1,37,1,'I~O',3,NULL,'BAS',1,NULL),(15,268,'faq_no','vtiger_faq',1,'4','faq_no','Faq No',1,0,0,100,2,37,1,'V~O',3,NULL,'BAS',0,NULL),(15,269,'category','vtiger_faq',1,'15','faqcategories','Category',1,2,0,100,4,37,1,'V~O',3,NULL,'BAS',1,NULL),(15,270,'status','vtiger_faq',1,'15','faqstatus','Status',1,2,0,100,3,37,1,'V~M',3,NULL,'BAS',1,NULL),(15,271,'question','vtiger_faq',1,'20','question','Question',1,2,0,100,7,37,1,'V~M',3,NULL,'BAS',1,NULL),(15,272,'answer','vtiger_faq',1,'20','faq_answer','Answer',1,2,0,100,8,37,1,'V~M',3,NULL,'BAS',1,NULL),(15,273,'comments','vtiger_faqcomments',1,'19','comments','Add Comment',1,0,0,100,1,38,1,'V~O',3,NULL,'BAS',0,NULL),(15,274,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,5,37,2,'T~O',3,NULL,'BAS',0,NULL),(15,275,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,6,37,2,'T~O',3,NULL,'BAS',0,NULL),(18,276,'vendorname','vtiger_vendor',1,'2','vendorname','Vendor Name',1,0,0,100,1,42,1,'V~M',0,1,'BAS',1,NULL),(18,277,'vendor_no','vtiger_vendor',1,'4','vendor_no','Vendor No',1,0,0,100,2,42,1,'V~O',3,NULL,'BAS',0,NULL),(18,278,'phone','vtiger_vendor',1,'1','phone','Phone',1,2,0,100,4,42,1,'V~O',2,2,'BAS',1,NULL),(18,279,'email','vtiger_vendor',1,'13','email','Email',1,2,0,100,3,42,1,'E~O',2,3,'BAS',1,NULL),(18,280,'website','vtiger_vendor',1,'17','website','Website',1,2,0,100,6,42,1,'V~O',1,NULL,'BAS',1,NULL),(18,281,'glacct','vtiger_vendor',1,'15','glacct','GL Account',1,2,0,100,5,42,1,'V~O',1,NULL,'BAS',1,NULL),(18,282,'category','vtiger_vendor',1,'1','category','Category',1,2,0,100,8,42,1,'V~O',1,NULL,'BAS',1,NULL),(18,283,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,7,42,2,'T~O',3,NULL,'BAS',0,NULL),(18,284,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,9,42,2,'T~O',3,NULL,'BAS',0,NULL),(18,285,'street','vtiger_vendor',1,'21','street','Street',1,2,0,100,1,44,1,'V~O',1,NULL,'ADV',1,NULL),(18,286,'pobox','vtiger_vendor',1,'1','pobox','Po Box',1,2,0,100,2,44,1,'V~O',1,NULL,'ADV',1,NULL),(18,287,'city','vtiger_vendor',1,'1','city','City',1,2,0,100,3,44,1,'V~O',1,NULL,'ADV',1,NULL),(18,288,'state','vtiger_vendor',1,'1','state','State',1,2,0,100,4,44,1,'V~O',1,NULL,'ADV',1,NULL),(18,289,'postalcode','vtiger_vendor',1,'1','postalcode','Postal Code',1,2,0,100,5,44,1,'V~O',1,NULL,'ADV',1,NULL),(18,290,'country','vtiger_vendor',1,'1','country','Country',1,2,0,100,6,44,1,'V~O',1,NULL,'ADV',1,NULL),(18,291,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,45,1,'V~O',1,NULL,'BAS',1,NULL),(19,292,'bookname','vtiger_pricebook',1,'2','bookname','Price Book Name',1,0,0,100,1,46,1,'V~M',0,1,'BAS',1,NULL),(19,293,'pricebook_no','vtiger_pricebook',1,'4','pricebook_no','PriceBook No',1,0,0,100,3,46,1,'V~O',3,NULL,'BAS',0,NULL),(19,294,'active','vtiger_pricebook',1,'56','active','Active',1,2,0,100,2,46,1,'C~O',2,2,'BAS',1,NULL),(19,295,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,4,46,2,'T~O',3,NULL,'BAS',0,NULL),(19,296,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,5,46,2,'T~O',3,NULL,'BAS',0,NULL),(19,297,'currency_id','vtiger_pricebook',1,'117','currency_id','Currency',1,0,0,100,5,46,1,'I~M',0,3,'BAS',0,NULL),(19,298,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,48,1,'V~O',1,NULL,'BAS',1,NULL),(20,299,'quote_no','vtiger_quotes',1,'4','quote_no','Quote No',1,0,0,100,3,49,1,'V~O',3,NULL,'BAS',0,NULL),(20,300,'subject','vtiger_quotes',1,'2','subject','Subject',1,0,0,100,1,49,1,'V~M',1,NULL,'BAS',1,NULL),(20,301,'potentialid','vtiger_quotes',1,'76','potential_id','Potential Name',1,2,0,100,2,49,1,'I~O',3,NULL,'BAS',1,NULL),(20,302,'quotestage','vtiger_quotes',1,'15','quotestage','Quote Stage',1,2,0,100,4,49,1,'V~M',3,NULL,'BAS',1,NULL),(20,303,'validtill','vtiger_quotes',1,'5','validtill','Valid Till',1,2,0,100,5,49,1,'D~O',3,NULL,'BAS',1,NULL),(20,304,'contactid','vtiger_quotes',1,'57','contact_id','Contact Name',1,2,0,100,6,49,1,'V~O',3,NULL,'BAS',1,NULL),(20,305,'carrier','vtiger_quotes',1,'15','carrier','Carrier',1,2,0,100,8,49,1,'V~O',3,NULL,'BAS',1,NULL),(20,306,'subtotal','vtiger_quotes',1,'1','hdnSubTotal','Sub Total',1,2,0,100,9,49,3,'N~O',3,NULL,'BAS',1,NULL),(20,307,'shipping','vtiger_quotes',1,'1','shipping','Shipping',1,2,0,100,10,49,1,'V~O',3,NULL,'BAS',1,NULL),(20,308,'inventorymanager','vtiger_quotes',1,'77','assigned_user_id1','Inventory Manager',1,2,0,100,11,49,1,'I~O',3,NULL,'BAS',1,NULL),(20,309,'adjustment','vtiger_quotes',1,'1','txtAdjustment','Adjustment',1,2,0,100,20,49,3,'NN~O',3,NULL,'BAS',1,NULL),(20,310,'total','vtiger_quotes',1,'1','hdnGrandTotal','Total',1,2,0,100,14,49,3,'N~O',3,NULL,'BAS',1,NULL),(20,311,'taxtype','vtiger_quotes',1,'16','hdnTaxType','Tax Type',1,2,0,100,14,49,3,'V~O',3,NULL,'BAS',1,NULL),(20,312,'discount_percent','vtiger_quotes',1,'1','hdnDiscountPercent','Discount Percent',1,2,0,100,14,49,3,'N~O',3,NULL,'BAS',1,NULL),(20,313,'discount_amount','vtiger_quotes',1,'1','hdnDiscountAmount','Discount Amount',1,2,0,100,14,49,3,'N~O',3,NULL,'BAS',1,NULL),(20,314,'s_h_amount','vtiger_quotes',1,'1','hdnS_H_Amount','S&H Amount',1,2,0,100,14,49,3,'N~O',3,NULL,'BAS',1,NULL),(20,315,'accountid','vtiger_quotes',1,'73','account_id','Account Name',1,2,0,100,16,49,1,'I~M',3,NULL,'BAS',1,NULL),(20,316,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,17,49,1,'V~M',3,NULL,'BAS',1,NULL),(20,317,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,18,49,2,'T~O',3,NULL,'BAS',0,NULL),(20,318,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,19,49,2,'T~O',3,NULL,'BAS',0,NULL),(20,319,'currency_id','vtiger_quotes',1,'117','currency_id','Currency',1,2,1,100,20,49,3,'I~O',3,NULL,'BAS',1,NULL),(20,320,'conversion_rate','vtiger_quotes',1,'1','conversion_rate','Conversion Rate',1,2,1,100,21,49,3,'N~O',3,NULL,'BAS',1,NULL),(20,321,'bill_street','vtiger_quotesbillads',1,'24','bill_street','Billing Address',1,2,0,100,1,51,1,'V~M',3,NULL,'BAS',1,NULL),(20,322,'ship_street','vtiger_quotesshipads',1,'24','ship_street','Shipping Address',1,2,0,100,2,51,1,'V~M',3,NULL,'BAS',1,NULL),(20,323,'bill_city','vtiger_quotesbillads',1,'1','bill_city','Billing City',1,2,0,100,5,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,324,'ship_city','vtiger_quotesshipads',1,'1','ship_city','Shipping City',1,2,0,100,6,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,325,'bill_state','vtiger_quotesbillads',1,'1','bill_state','Billing State',1,2,0,100,7,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,326,'ship_state','vtiger_quotesshipads',1,'1','ship_state','Shipping State',1,2,0,100,8,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,327,'bill_code','vtiger_quotesbillads',1,'1','bill_code','Billing Code',1,2,0,100,9,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,328,'ship_code','vtiger_quotesshipads',1,'1','ship_code','Shipping Code',1,2,0,100,10,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,329,'bill_country','vtiger_quotesbillads',1,'1','bill_country','Billing Country',1,2,0,100,11,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,330,'ship_country','vtiger_quotesshipads',1,'1','ship_country','Shipping Country',1,2,0,100,12,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,331,'bill_pobox','vtiger_quotesbillads',1,'1','bill_pobox','Billing Po Box',1,2,0,100,3,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,332,'ship_pobox','vtiger_quotesshipads',1,'1','ship_pobox','Shipping Po Box',1,0,0,100,4,51,1,'V~O',3,NULL,'BAS',1,NULL),(20,333,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,54,1,'V~O',3,NULL,'BAS',1,NULL),(20,334,'terms_conditions','vtiger_quotes',1,'19','terms_conditions','Terms & Conditions',1,2,0,100,1,53,1,'V~O',3,NULL,'ADV',1,NULL),(21,335,'purchaseorder_no','vtiger_purchaseorder',1,'4','purchaseorder_no','PurchaseOrder No',1,0,0,100,2,55,1,'V~O',3,NULL,'BAS',0,NULL),(21,336,'subject','vtiger_purchaseorder',1,'1','subject','Subject',1,0,0,100,1,55,0,'V~O',3,NULL,'BAS',2,NULL),(21,337,'vendorid','vtiger_purchaseorder',1,'81','vendor_id','Vendor Name',1,0,0,100,3,55,1,'I~M',3,NULL,'BAS',1,NULL),(21,338,'requisition_no','vtiger_purchaseorder',1,'1','requisition_no','Ref. PO No',1,2,0,100,4,55,1,'V~O',3,NULL,'BAS',1,NULL),(21,339,'tracking_no','vtiger_purchaseorder',1,'1','tracking_no','Tracking Number',1,1,0,100,5,55,1,'V~O',3,NULL,'BAS',2,NULL),(21,340,'contactid','vtiger_purchaseorder',1,'57','contact_id','Contact Name',1,1,0,100,6,55,1,'I~O',3,NULL,'BAS',2,NULL),(21,341,'duedate','vtiger_purchaseorder',1,'5','duedate','Due Date',1,2,0,100,7,55,1,'D~O',3,NULL,'BAS',1,NULL),(21,342,'carrier','vtiger_purchaseorder',1,'15','carrier','Carrier',1,1,0,100,8,55,1,'V~O',3,NULL,'BAS',2,NULL),(21,343,'adjustment','vtiger_purchaseorder',1,'1','txtAdjustment','Adjustment',1,2,0,100,10,55,3,'NN~O',3,NULL,'BAS',1,NULL),(21,344,'salescommission','vtiger_purchaseorder',1,'1','salescommission','Sales Commission',1,1,0,100,11,55,1,'N~O',3,NULL,'BAS',2,NULL),(21,345,'exciseduty','vtiger_purchaseorder',1,'1','exciseduty','Excise Duty',1,1,0,100,12,55,1,'N~O',3,NULL,'BAS',2,NULL),(21,346,'total','vtiger_purchaseorder',1,'1','hdnGrandTotal','Total',1,2,0,100,13,55,3,'N~O',3,NULL,'BAS',1,NULL),(21,347,'subtotal','vtiger_purchaseorder',1,'1','hdnSubTotal','Sub Total',1,2,0,100,14,55,3,'N~O',3,NULL,'BAS',1,NULL),(21,348,'taxtype','vtiger_purchaseorder',1,'16','hdnTaxType','Tax Type',1,2,0,100,14,55,3,'V~O',3,NULL,'BAS',1,NULL),(21,349,'discount_percent','vtiger_purchaseorder',1,'1','hdnDiscountPercent','Discount Percent',1,2,0,100,14,55,3,'N~O',3,NULL,'BAS',1,NULL),(21,350,'discount_amount','vtiger_purchaseorder',1,'1','hdnDiscountAmount','Discount Amount',1,0,0,100,14,55,3,'N~O',3,NULL,'BAS',1,NULL),(21,351,'s_h_amount','vtiger_purchaseorder',1,'1','hdnS_H_Amount','S&H Amount',1,2,0,100,14,55,3,'N~O',3,NULL,'BAS',1,NULL),(21,352,'postatus','vtiger_purchaseorder',1,'15','postatus','Status',1,2,0,100,15,55,1,'V~M',3,NULL,'BAS',1,NULL),(21,353,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,16,55,1,'V~O',3,NULL,'BAS',1,NULL),(21,354,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,17,55,2,'T~O',3,NULL,'BAS',0,NULL),(21,355,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,18,55,2,'T~O',3,NULL,'BAS',0,NULL),(21,356,'currency_id','vtiger_purchaseorder',1,'117','currency_id','Currency',1,2,1,100,19,55,3,'I~O',3,NULL,'BAS',1,NULL),(21,357,'conversion_rate','vtiger_purchaseorder',1,'1','conversion_rate','Conversion Rate',1,2,1,100,20,55,3,'N~O',3,NULL,'BAS',1,NULL),(21,358,'bill_street','vtiger_pobillads',1,'24','bill_street','Billing Address',1,2,0,100,1,57,1,'V~M',3,NULL,'BAS',1,NULL),(21,359,'ship_street','vtiger_poshipads',1,'24','ship_street','Shipping Address',1,2,0,100,2,57,1,'V~M',3,NULL,'BAS',1,NULL),(21,360,'bill_city','vtiger_pobillads',1,'1','bill_city','Billing City',1,2,0,100,5,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,361,'ship_city','vtiger_poshipads',1,'1','ship_city','Shipping City',1,2,0,100,6,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,362,'bill_state','vtiger_pobillads',1,'1','bill_state','Billing State',1,2,0,100,7,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,363,'ship_state','vtiger_poshipads',1,'1','ship_state','Shipping State',1,2,0,100,8,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,364,'bill_code','vtiger_pobillads',1,'1','bill_code','Billing Code',1,2,0,100,9,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,365,'ship_code','vtiger_poshipads',1,'1','ship_code','Shipping Code',1,2,0,100,10,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,366,'bill_country','vtiger_pobillads',1,'1','bill_country','Billing Country',1,2,0,100,11,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,367,'ship_country','vtiger_poshipads',1,'1','ship_country','Shipping Country',1,2,0,100,12,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,368,'bill_pobox','vtiger_pobillads',1,'1','bill_pobox','Billing Po Box',1,2,0,100,3,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,369,'ship_pobox','vtiger_poshipads',1,'1','ship_pobox','Shipping Po Box',1,2,0,100,4,57,1,'V~O',3,NULL,'BAS',1,NULL),(21,370,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,60,1,'V~O',3,NULL,'BAS',1,NULL),(21,371,'terms_conditions','vtiger_purchaseorder',1,'19','terms_conditions','Terms & Conditions',1,2,0,100,1,59,1,'V~O',3,NULL,'BAS',1,NULL),(22,372,'salesorder_no','vtiger_salesorder',1,'4','salesorder_no','SalesOrder No',1,0,0,100,4,61,1,'V~O',3,NULL,'BAS',0,NULL),(22,373,'subject','vtiger_salesorder',1,'2','subject','Subject',1,0,0,100,1,61,1,'V~M',3,NULL,'BAS',1,NULL),(22,374,'potentialid','vtiger_salesorder',1,'76','potential_id','Potential Name',1,2,0,100,2,61,1,'I~O',3,NULL,'BAS',1,NULL),(22,375,'customerno','vtiger_salesorder',1,'1','customerno','Customer No',1,2,0,100,3,61,1,'V~O',3,NULL,'BAS',1,NULL),(22,376,'quoteid','vtiger_salesorder',1,'78','quote_id','Quote Name',1,2,0,100,5,61,1,'I~O',3,NULL,'BAS',0,NULL),(22,377,'purchaseorder','vtiger_salesorder',1,'1','vtiger_purchaseorder','Purchase Order',1,2,0,100,5,61,1,'V~O',3,NULL,'BAS',1,NULL),(22,378,'contactid','vtiger_salesorder',1,'57','contact_id','Contact Name',1,2,0,100,6,61,1,'I~O',3,NULL,'BAS',1,NULL),(22,379,'duedate','vtiger_salesorder',1,'5','duedate','Due Date',1,2,0,100,8,61,1,'D~O',3,NULL,'BAS',1,NULL),(22,380,'carrier','vtiger_salesorder',1,'15','carrier','Carrier',1,2,0,100,9,61,1,'V~O',3,NULL,'BAS',1,NULL),(22,381,'pending','vtiger_salesorder',1,'1','pending','Pending',1,2,0,100,10,61,1,'V~O',3,NULL,'BAS',1,NULL),(22,382,'sostatus','vtiger_salesorder',1,'15','sostatus','Status',1,2,0,100,11,61,1,'V~M',3,NULL,'BAS',1,NULL),(22,383,'adjustment','vtiger_salesorder',1,'1','txtAdjustment','Adjustment',1,2,0,100,12,61,3,'NN~O',3,NULL,'BAS',1,NULL),(22,384,'salescommission','vtiger_salesorder',1,'1','salescommission','Sales Commission',1,2,0,100,13,61,1,'N~O',3,NULL,'BAS',1,NULL),(22,385,'exciseduty','vtiger_salesorder',1,'1','exciseduty','Excise Duty',1,2,0,100,13,61,1,'N~O',3,NULL,'BAS',1,NULL),(22,386,'total','vtiger_salesorder',1,'1','hdnGrandTotal','Total',1,2,0,100,14,61,3,'N~O',3,NULL,'BAS',1,NULL),(22,387,'subtotal','vtiger_salesorder',1,'1','hdnSubTotal','Sub Total',1,2,0,100,15,61,3,'N~O',3,NULL,'BAS',1,NULL),(22,388,'taxtype','vtiger_salesorder',1,'16','hdnTaxType','Tax Type',1,2,0,100,15,61,3,'V~O',3,NULL,'BAS',1,NULL),(22,389,'discount_percent','vtiger_salesorder',1,'1','hdnDiscountPercent','Discount Percent',1,2,0,100,15,61,3,'N~O',3,NULL,'BAS',1,NULL),(22,390,'discount_amount','vtiger_salesorder',1,'1','hdnDiscountAmount','Discount Amount',1,0,0,100,15,61,3,'N~O',3,NULL,'BAS',1,NULL),(22,391,'s_h_amount','vtiger_salesorder',1,'1','hdnS_H_Amount','S&H Amount',1,2,0,100,15,61,3,'N~O',3,NULL,'BAS',1,NULL),(22,392,'accountid','vtiger_salesorder',1,'73','account_id','Account Name',1,2,0,100,16,61,1,'I~M',3,NULL,'BAS',1,NULL),(22,393,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,17,61,1,'V~M',3,NULL,'BAS',1,NULL),(22,394,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,18,61,2,'T~O',3,NULL,'BAS',0,NULL),(22,395,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,19,61,2,'T~O',3,NULL,'BAS',0,NULL),(22,396,'currency_id','vtiger_salesorder',1,'117','currency_id','Currency',1,2,1,100,20,61,3,'I~O',3,NULL,'BAS',1,NULL),(22,397,'conversion_rate','vtiger_salesorder',1,'1','conversion_rate','Conversion Rate',1,2,1,100,21,61,3,'N~O',3,NULL,'BAS',1,NULL),(22,398,'bill_street','vtiger_sobillads',1,'24','bill_street','Billing Address',1,2,0,100,1,63,1,'V~M',3,NULL,'BAS',1,NULL),(22,399,'ship_street','vtiger_soshipads',1,'24','ship_street','Shipping Address',1,2,0,100,2,63,1,'V~M',3,NULL,'BAS',1,NULL),(22,400,'bill_city','vtiger_sobillads',1,'1','bill_city','Billing City',1,2,0,100,5,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,401,'ship_city','vtiger_soshipads',1,'1','ship_city','Shipping City',1,2,0,100,6,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,402,'bill_state','vtiger_sobillads',1,'1','bill_state','Billing State',1,2,0,100,7,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,403,'ship_state','vtiger_soshipads',1,'1','ship_state','Shipping State',1,2,0,100,8,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,404,'bill_code','vtiger_sobillads',1,'1','bill_code','Billing Code',1,2,0,100,9,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,405,'ship_code','vtiger_soshipads',1,'1','ship_code','Shipping Code',1,2,0,100,10,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,406,'bill_country','vtiger_sobillads',1,'1','bill_country','Billing Country',1,2,0,100,11,63,3,'V~O',3,NULL,'BAS',1,NULL),(22,407,'ship_country','vtiger_soshipads',1,'1','ship_country','Shipping Country',1,2,0,100,12,63,3,'V~O',3,NULL,'BAS',1,NULL),(22,408,'bill_pobox','vtiger_sobillads',1,'1','bill_pobox','Billing Po Box',1,2,0,100,3,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,409,'ship_pobox','vtiger_soshipads',1,'1','ship_pobox','Shipping Po Box',1,2,0,100,4,63,1,'V~O',3,NULL,'BAS',1,NULL),(22,410,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,66,1,'V~O',3,NULL,'BAS',1,NULL),(22,411,'terms_conditions','vtiger_salesorder',1,'19','terms_conditions','Terms & Conditions',1,2,0,100,1,65,1,'V~O',3,NULL,'ADV',1,NULL),(22,412,'enable_recurring','vtiger_salesorder',1,'56','enable_recurring','Enable Recurring',1,0,0,100,1,84,1,'C~O',3,NULL,'BAS',0,NULL),(22,413,'recurring_frequency','vtiger_invoice_recurring_info',1,'16','recurring_frequency','Frequency',1,0,0,100,2,84,1,'V~O',3,NULL,'BAS',0,NULL),(22,414,'start_period','vtiger_invoice_recurring_info',1,'5','start_period','Start Period',1,0,0,100,3,84,1,'D~O',3,NULL,'BAS',0,NULL),(22,415,'end_period','vtiger_invoice_recurring_info',1,'5','end_period','End Period',1,0,0,100,4,84,1,'D~O~OTH~G~start_period~Start Period',3,NULL,'BAS',0,NULL),(22,416,'payment_duration','vtiger_invoice_recurring_info',1,'16','payment_duration','Payment Duration',1,0,0,100,5,84,1,'V~O',3,NULL,'BAS',0,NULL),(22,417,'invoice_status','vtiger_invoice_recurring_info',1,'15','invoicestatus','Invoice Status',1,0,0,100,6,84,1,'V~M',3,NULL,'BAS',0,NULL),(23,418,'subject','vtiger_invoice',1,'1','subject','Subject',1,1,0,100,1,67,1,'V~O',3,NULL,'BAS',0,NULL),(23,419,'salesorderid','vtiger_invoice',1,'80','salesorder_id','Sales Order',1,1,0,100,3,67,1,'I~O',3,NULL,'BAS',0,NULL),(23,420,'customerno','vtiger_invoice',1,'1','customerno','Customer No',1,1,0,100,4,67,1,'V~O',3,NULL,'BAS',1,NULL),(23,421,'contactid','vtiger_invoice',1,'57','contact_id','Contact Name',1,1,0,100,4,67,1,'I~O',3,NULL,'BAS',1,NULL),(23,422,'invoicedate','vtiger_invoice',1,'5','invoicedate','Invoice Date',1,2,0,100,5,67,1,'D~O',3,NULL,'BAS',1,NULL),(23,423,'duedate','vtiger_invoice',1,'5','duedate','Due Date',1,1,0,100,6,67,1,'D~O',3,NULL,'BAS',2,NULL),(23,424,'purchaseorder','vtiger_invoice',1,'1','vtiger_purchaseorder','Purchase Order',1,1,0,100,8,67,1,'V~O',3,NULL,'BAS',2,NULL),(23,425,'adjustment','vtiger_invoice',1,'1','txtAdjustment','Adjustment',1,2,0,100,9,67,3,'NN~O',3,NULL,'BAS',1,NULL),(23,426,'salescommission','vtiger_invoice',1,'1','salescommission','Sales Commission',1,1,0,10,13,67,1,'N~O',3,NULL,'BAS',2,NULL),(23,427,'exciseduty','vtiger_invoice',1,'1','exciseduty','Excise Duty',1,1,0,100,11,67,1,'N~O',3,NULL,'BAS',2,NULL),(23,428,'subtotal','vtiger_invoice',1,'1','hdnSubTotal','Sub Total',1,2,0,100,12,67,3,'N~O',3,NULL,'BAS',1,NULL),(23,429,'total','vtiger_invoice',1,'1','hdnGrandTotal','Total',1,2,0,100,13,67,3,'N~O',3,NULL,'BAS',1,NULL),(23,430,'taxtype','vtiger_invoice',1,'16','hdnTaxType','Tax Type',1,2,0,100,13,67,3,'V~O',3,NULL,'BAS',1,NULL),(23,431,'discount_percent','vtiger_invoice',1,'1','hdnDiscountPercent','Discount Percent',1,2,0,100,13,67,3,'N~O',3,NULL,'BAS',1,NULL),(23,432,'discount_amount','vtiger_invoice',1,'1','hdnDiscountAmount','Discount Amount',1,2,0,100,13,67,3,'N~O',3,NULL,'BAS',1,NULL),(23,433,'s_h_amount','vtiger_invoice',1,'1','hdnS_H_Amount','S&H Amount',1,2,0,100,14,57,3,'N~O',3,NULL,'BAS',1,NULL),(23,434,'accountid','vtiger_invoice',1,'73','account_id','Account Name',1,1,0,100,14,67,1,'I~M',3,NULL,'BAS',1,NULL),(23,435,'invoicestatus','vtiger_invoice',1,'15','invoicestatus','Status',1,2,0,100,23,67,1,'V~O',3,NULL,'BAS',1,NULL),(23,436,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,16,67,1,'V~M',3,NULL,'BAS',1,NULL),(23,437,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,1,0,100,17,67,2,'T~O',3,NULL,'BAS',0,NULL),(23,438,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,1,0,100,18,67,2,'T~O',3,NULL,'BAS',0,NULL),(23,439,'currency_id','vtiger_invoice',1,'117','currency_id','Currency',1,2,1,100,15,67,3,'I~O',3,NULL,'BAS',1,NULL),(23,440,'conversion_rate','vtiger_invoice',1,'1','conversion_rate','Conversion Rate',1,2,1,100,20,67,3,'N~O',3,NULL,'BAS',1,NULL),(23,441,'bill_street','vtiger_invoicebillads',1,'24','bill_street','Billing Address',1,2,0,100,1,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,442,'ship_street','vtiger_invoiceshipads',1,'24','ship_street','Shipping Address',1,2,0,100,2,69,1,'V~O',3,NULL,'BAS',2,NULL),(23,443,'bill_city','vtiger_invoicebillads',1,'1','bill_city','Billing City',1,2,0,100,5,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,444,'ship_city','vtiger_invoiceshipads',1,'1','ship_city','Shipping City',1,2,0,100,6,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,445,'bill_state','vtiger_invoicebillads',1,'1','bill_state','Billing State',1,2,0,100,7,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,446,'ship_state','vtiger_invoiceshipads',1,'1','ship_state','Shipping State',1,2,0,100,8,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,447,'bill_code','vtiger_invoicebillads',1,'1','bill_code','Billing Code',1,2,0,100,9,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,448,'ship_code','vtiger_invoiceshipads',1,'1','ship_code','Shipping Code',1,2,0,100,10,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,449,'bill_country','vtiger_invoicebillads',1,'1','bill_country','Billing Country',1,2,0,100,11,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,450,'ship_country','vtiger_invoiceshipads',1,'1','ship_country','Shipping Country',1,2,0,100,12,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,451,'bill_pobox','vtiger_invoicebillads',1,'1','bill_pobox','Billing Po Box',1,1,0,100,3,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,452,'ship_pobox','vtiger_invoiceshipads',1,'1','ship_pobox','Shipping Po Box',1,1,0,100,4,69,1,'V~O',3,NULL,'BAS',1,NULL),(23,453,'description','vtiger_crmentity',1,'19','description','Description',1,1,0,100,1,72,1,'V~O',3,NULL,'BAS',2,NULL),(23,454,'terms_conditions','vtiger_invoice',1,'19','terms_conditions','Terms & Conditions',1,1,0,100,1,71,1,'V~O',3,NULL,'ADV',2,NULL),(23,455,'invoice_no','vtiger_invoice',1,'4','invoice_no','Invoice No',1,0,0,100,NULL,67,1,'V~O',3,NULL,'BAS',0,NULL),(29,456,'user_name','vtiger_users',1,'106','user_name','User Name',1,0,0,11,1,77,1,'V~M',1,NULL,'BAS',1,NULL),(29,457,'is_admin','vtiger_users',1,'156','is_admin','Admin',1,0,0,3,2,77,1,'V~O',1,NULL,'BAS',1,NULL),(29,458,'user_password','vtiger_users',1,'99','user_password','Password',1,0,0,30,3,77,1,'P~M',1,NULL,'BAS',1,NULL),(29,459,'confirm_password','vtiger_users',1,'99','confirm_password','Confirm Password',1,0,0,30,5,77,1,'P~M',1,NULL,'BAS',1,NULL),(29,460,'first_name','vtiger_users',1,'1','first_name','First Name',1,0,0,30,7,77,1,'V~O',1,NULL,'BAS',1,NULL),(29,461,'last_name','vtiger_users',1,'2','last_name','Last Name',1,0,0,30,9,77,1,'V~M',1,NULL,'BAS',1,NULL),(29,462,'roleid','vtiger_user2role',1,'98','roleid','Role',1,0,0,200,11,77,1,'V~M',1,NULL,'BAS',1,NULL),(29,463,'email1','vtiger_users',1,'104','email1','Email',1,0,0,100,4,77,1,'E~M',1,NULL,'BAS',1,NULL),(29,464,'status','vtiger_users',1,'115','status','Status',1,0,0,100,6,77,1,'V~O',1,NULL,'BAS',1,NULL),(29,465,'activity_view','vtiger_users',1,'16','activity_view','Default Activity View',1,0,0,100,12,77,4,'V~O',1,NULL,'BAS',1,NULL),(29,466,'lead_view','vtiger_users',1,'16','lead_view','Default Lead View',1,0,0,100,10,77,4,'V~O',1,NULL,'BAS',1,NULL),(29,467,'currency_id','vtiger_users',1,'117','currency_id','Currency',1,0,0,100,8,77,4,'I~O',1,NULL,'BAS',1,NULL),(29,468,'hour_format','vtiger_users',1,'116','hour_format','Calendar Hour Format',1,0,0,100,13,77,3,'V~O',1,NULL,'BAS',1,NULL),(29,469,'end_hour','vtiger_users',1,'116','end_hour','Day ends at',1,0,0,100,15,77,3,'V~O',1,NULL,'BAS',1,NULL),(29,470,'start_hour','vtiger_users',1,'116','start_hour','Day starts at',1,0,0,100,14,77,3,'V~O',1,NULL,'BAS',1,NULL),(29,471,'title','vtiger_users',1,'1','title','Title',1,0,0,50,1,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,472,'phone_work','vtiger_users',1,'1','phone_work','Office Phone',1,0,0,50,5,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,473,'department','vtiger_users',1,'1','department','Department',1,0,0,50,3,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,474,'phone_mobile','vtiger_users',1,'1','phone_mobile','Mobile',1,0,0,50,7,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,475,'reports_to_id','vtiger_users',1,'101','reports_to_id','Reports To',1,0,0,50,8,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,476,'phone_other','vtiger_users',1,'1','phone_other','Other Phone',1,0,0,50,11,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,477,'email2','vtiger_users',1,'13','email2','Other Email',1,0,0,100,4,78,1,'E~O',1,NULL,'BAS',1,NULL),(29,478,'phone_fax','vtiger_users',1,'1','phone_fax','Fax',1,0,0,50,2,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,479,'yahoo_id','vtiger_users',1,'13','yahoo_id','Yahoo id',1,0,0,100,6,78,1,'E~O',1,NULL,'BAS',1,NULL),(29,480,'phone_home','vtiger_users',1,'1','phone_home','Home Phone',1,0,0,50,9,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,481,'date_format','vtiger_users',1,'16','date_format','Date Format',1,0,0,30,12,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,482,'signature','vtiger_users',1,'21','signature','Signature',1,0,0,250,13,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,483,'description','vtiger_users',1,'21','description','Documents',1,0,0,250,14,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,484,'address_street','vtiger_users',1,'21','address_street','Street Address',1,0,0,250,1,79,1,'V~O',1,NULL,'BAS',1,NULL),(29,485,'address_city','vtiger_users',1,'1','address_city','City',1,0,0,100,3,79,1,'V~O',1,NULL,'BAS',1,NULL),(29,486,'address_state','vtiger_users',1,'1','address_state','State',1,0,0,100,5,79,1,'V~O',1,NULL,'BAS',1,NULL),(29,487,'address_postalcode','vtiger_users',1,'1','address_postalcode','Postal Code',1,0,0,100,4,79,1,'V~O',1,NULL,'BAS',1,NULL),(29,488,'address_country','vtiger_users',1,'1','address_country','Country',1,0,0,100,2,79,1,'V~O',1,NULL,'BAS',1,NULL),(29,489,'accesskey','vtiger_users',1,'3','accesskey','Webservice Access Key',1,0,0,100,2,82,2,'V~O',1,NULL,'BAS',1,NULL),(29,490,'imagename','vtiger_users',1,'105','imagename','User Image',1,0,0,250,10,81,1,'V~O',1,NULL,'BAS',1,NULL),(29,491,'internal_mailer','vtiger_users',1,'56','internal_mailer','INTERNAL_MAIL_COMPOSER',1,0,0,50,15,78,1,'V~O',1,NULL,'BAS',1,NULL),(29,492,'reminder_interval','vtiger_users',1,'16','reminder_interval','Reminder Interval',1,0,0,100,1,82,1,'V~O',1,NULL,'BAS',1,NULL),(10,493,'from_email','vtiger_emaildetails',1,'12','from_email','From',1,2,0,100,1,21,3,'V~M',3,NULL,'BAS',0,NULL),(10,494,'to_email','vtiger_emaildetails',1,'8','saved_toid','To',1,2,0,100,2,21,1,'V~M',3,NULL,'BAS',0,NULL),(10,495,'cc_email','vtiger_emaildetails',1,'8','ccmail','CC',1,2,0,1000,3,21,1,'V~O',3,NULL,'BAS',0,NULL),(10,496,'bcc_email','vtiger_emaildetails',1,'8','bccmail','BCC',1,2,0,1000,4,21,1,'V~O',3,NULL,'BAS',0,NULL),(10,497,'idlists','vtiger_emaildetails',1,'357','parent_id','Parent ID',1,2,0,1000,5,21,1,'V~O',3,NULL,'BAS',0,NULL),(10,498,'email_flag','vtiger_emaildetails',1,'16','email_flag','Email Flag',1,2,0,1000,6,21,3,'V~O',3,NULL,'BAS',0,NULL),(31,499,'callfrom','vtiger_pbxmanager',1,'2','callfrom','Call From',1,0,0,100,1,87,1,'V~M',1,NULL,'BAS',1,''),(31,500,'callto','vtiger_pbxmanager',1,'2','callto','Call To',1,0,0,100,2,87,1,'V~M',1,NULL,'BAS',1,''),(31,501,'timeofcall','vtiger_pbxmanager',1,'2','timeofcall','Time Of Call',1,0,0,100,3,87,1,'V~O',1,NULL,'BAS',1,''),(31,502,'status','vtiger_pbxmanager',1,'2','status','Status',1,0,0,100,4,87,1,'V~O',1,NULL,'BAS',1,''),(29,503,'asterisk_extension','vtiger_asteriskextensions',1,'1','asterisk_extension','Asterisk Extension',1,0,0,30,1,89,1,'V~O',1,NULL,'BAS',1,NULL),(29,504,'use_asterisk','vtiger_asteriskextensions',1,'56','use_asterisk',' Receive Incoming Calls',1,0,0,30,2,89,1,'C~O',1,NULL,'BAS',1,NULL),(32,505,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,4,90,1,'V~M',2,2,'BAS',1,''),(32,508,'start_date','vtiger_servicecontracts',1,'5','start_date','Start Date',1,2,0,100,7,90,1,'D~O',2,4,'BAS',1,''),(32,509,'end_date','vtiger_servicecontracts',1,'5','end_date','End Date',1,2,0,100,11,90,2,'D~O',3,0,'BAS',0,''),(32,510,'sc_related_to','vtiger_servicecontracts',1,'10','sc_related_to','Related to',1,2,0,100,3,90,1,'V~O',2,6,'BAS',1,''),(32,511,'tracking_unit','vtiger_servicecontracts',1,'15','tracking_unit','Tracking Unit',1,2,0,100,6,90,1,'V~O',2,7,'BAS',1,''),(32,512,'total_units','vtiger_servicecontracts',1,'7','total_units','Total Units',1,2,0,100,8,90,1,'V~O',2,8,'BAS',1,''),(32,513,'used_units','vtiger_servicecontracts',1,'7','used_units','Used Units',1,2,0,100,10,90,1,'V~O',2,9,'BAS',1,''),(32,514,'subject','vtiger_servicecontracts',1,'1','subject','Subject',1,0,0,100,1,90,1,'V~M',0,1,'BAS',1,''),(32,515,'due_date','vtiger_servicecontracts',1,'23','due_date','Due date',1,2,0,100,9,90,1,'D~O',2,5,'BAS',1,''),(32,518,'contract_status','vtiger_servicecontracts',1,'15','contract_status','Status',1,2,0,100,12,90,1,'V~O',1,NULL,'BAS',1,''),(32,519,'priority','vtiger_servicecontracts',1,'15','contract_priority','Priority',1,2,0,100,14,90,1,'V~O',1,NULL,'BAS',1,''),(32,520,'contract_type','vtiger_servicecontracts',1,'15','contract_type','Type',1,2,0,100,5,90,1,'V~O',1,NULL,'BAS',1,''),(32,521,'progress','vtiger_servicecontracts',1,'9','progress','Progress',1,2,0,100,16,90,2,'N~O~2~2',3,3,'BAS',0,''),(33,523,'servicename','vtiger_service',1,'2','servicename','Service Name',1,0,0,100,1,92,1,'V~M',0,1,'BAS',1,''),(33,525,'discontinued','vtiger_service',1,'56','discontinued','Service Active',1,2,0,100,4,92,1,'V~O',2,3,'BAS',1,''),(33,526,'sales_start_date','vtiger_service',1,'5','sales_start_date','Sales Start Date',1,2,0,100,9,92,1,'D~O',1,NULL,'BAS',1,''),(33,527,'sales_end_date','vtiger_service',1,'5','sales_end_date','Sales End Date',1,2,0,100,10,92,1,'D~O~OTH~GE~sales_start_date~Sales Start Date',1,NULL,'BAS',1,''),(33,528,'start_date','vtiger_service',1,'5','start_date','Support Start Date',1,2,0,100,11,92,1,'D~O',1,NULL,'BAS',1,''),(33,529,'expiry_date','vtiger_service',1,'5','expiry_date','Support Expiry Date',1,2,0,100,12,92,1,'D~O~OTH~GE~start_date~Start Date',1,NULL,'BAS',1,''),(33,530,'website','vtiger_service',1,'17','website','Website',1,2,0,100,6,92,1,'V~O',1,NULL,'BAS',1,''),(33,533,'service_usageunit','vtiger_service',1,'15','service_usageunit','Usage Unit',1,2,0,100,3,92,1,'V~O',1,NULL,'BAS',1,''),(33,534,'qty_per_unit','vtiger_service',1,'1','qty_per_unit','No of Units',1,2,0,100,5,92,1,'N~O',1,NULL,'BAS',1,''),(33,535,'handler','vtiger_service',1,'52','assigned_user_id','Owner',1,0,0,100,8,92,1,'I~O',1,NULL,'BAS',1,''),(33,536,'servicecategory','vtiger_service',1,'15','servicecategory','Service Category',1,2,0,100,7,92,1,'V~O',1,NULL,'BAS',1,''),(33,537,'unit_price','vtiger_service',1,'71','unit_price','Price',1,2,0,100,1,93,1,'N~O',2,2,'BAS',0,''),(33,538,'taxclass','vtiger_service',1,'83','taxclass','Tax Class',1,2,0,100,4,93,1,'V~O',1,NULL,'BAS',1,''),(33,539,'commissionrate','vtiger_service',1,'9','commissionrate','Commission Rate',1,2,0,100,2,93,1,'N~O',1,NULL,'BAS',1,''),(33,540,'description','vtiger_crmentity',1,'19','description','Description',1,2,0,100,1,95,1,'V~O',1,NULL,'BAS',1,''),(35,541,'asset_no','vtiger_assets',1,'4','asset_no','Asset No',1,0,0,100,2,96,1,'V~O',3,0,'BAS',0,''),(35,542,'product','vtiger_assets',1,'10','product','Product Name',1,2,0,100,3,96,1,'V~M',0,3,'BAS',1,''),(35,543,'serialnumber','vtiger_assets',1,'2','serialnumber','Serial Number',1,2,0,100,4,96,1,'V~M',0,5,'BAS',1,''),(35,544,'datesold','vtiger_assets',1,'5','datesold','Date Sold',1,2,0,100,5,96,1,'D~M~OTH~GE~datesold~Date Sold',0,0,'BAS',1,''),(35,545,'dateinservice','vtiger_assets',1,'5','dateinservice','Date in Service',1,2,0,100,6,96,1,'D~M~OTH~GE~dateinservice~Date in Service',0,4,'BAS',1,''),(35,547,'tagnumber','vtiger_assets',1,'2','tagnumber','Tag Number',1,2,0,100,8,96,1,'V~O',1,NULL,'BAS',1,''),(35,548,'invoiceid','vtiger_assets',1,'10','invoiceid','Invoice Name',1,2,0,100,9,96,1,'V~O',1,NULL,'BAS',1,''),(35,549,'shippingmethod','vtiger_assets',1,'2','shippingmethod','Shipping Method',1,2,0,100,10,96,1,'V~O',1,NULL,'BAS',1,''),(35,550,'shippingtrackingnumber','vtiger_assets',1,'2','shippingtrackingnumber','Shipping Tracking Number',1,2,0,100,11,96,1,'V~O',1,NULL,'BAS',1,''),(35,551,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,4,96,1,'V~M',0,2,'BAS',1,''),(35,552,'assetname','vtiger_assets',1,'1','assetname','Asset Name',1,0,0,100,12,96,1,'V~M',0,6,'BAS',1,''),(35,556,'description','vtiger_crmentity',1,'19','description','Notes',1,2,0,100,1,98,1,'V~O',1,NULL,'BAS',1,''),(38,557,'commentcontent','vtiger_modcomments',1,'19','commentcontent','Comment',1,0,0,100,4,99,1,'V~M',0,4,'BAS',2,''),(38,558,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,1,100,1,'V~M',0,1,'BAS',2,''),(38,559,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,5,100,2,'T~O',0,2,'BAS',0,''),(38,560,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,6,100,2,'T~O',0,3,'BAS',0,''),(38,561,'related_to','vtiger_modcomments',1,'10','related_to','Related To',1,2,0,100,2,100,1,'V~M',2,5,'BAS',2,''),(38,562,'smcreatorid','vtiger_crmentity',1,'52','creator','Creator',1,2,0,100,4,100,2,'V~O',1,NULL,'BAS',1,''),(38,563,'parent_comments','vtiger_modcomments',1,'10','parent_comments','Related To Comments',1,2,0,100,7,100,1,'V~O',1,NULL,'BAS',1,''),(39,564,'projectmilestonename','vtiger_projectmilestone',1,'2','projectmilestonename','Project Milestone Name',1,2,0,100,1,102,1,'V~M',0,1,'BAS',1,''),(39,565,'projectmilestonedate','vtiger_projectmilestone',1,'5','projectmilestonedate','Milestone Date',1,2,0,100,5,102,1,'D~O',0,3,'BAS',1,''),(39,566,'projectid','vtiger_projectmilestone',1,'10','projectid','Related to',1,0,0,100,4,102,1,'V~M',0,4,'BAS',1,''),(39,567,'projectmilestonetype','vtiger_projectmilestone',1,'15','projectmilestonetype','Type',1,2,0,100,7,102,1,'V~O',1,NULL,'BAS',1,''),(39,568,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,6,102,1,'V~M',0,2,'BAS',1,''),(39,569,'projectmilestone_no','vtiger_projectmilestone',2,'4','projectmilestone_no','Project Milestone No',1,0,0,100,2,102,1,'V~O',3,4,'BAS',0,''),(39,570,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,2,0,100,1,103,2,'T~O',1,NULL,'BAS',1,''),(39,571,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,2,0,100,2,103,2,'T~O',1,NULL,'BAS',1,''),(39,572,'description','vtiger_crmentity',1,'19','description','description',1,2,0,100,1,104,1,'V~O',1,NULL,'BAS',1,''),(40,573,'projecttaskname','vtiger_projecttask',1,'2','projecttaskname','Project Task Name',1,2,0,100,1,105,1,'V~M',0,1,'BAS',1,''),(40,574,'projecttasktype','vtiger_projecttask',1,'15','projecttasktype','Type',1,2,0,100,4,105,1,'V~O',1,NULL,'BAS',1,''),(40,575,'projecttaskpriority','vtiger_projecttask',1,'15','projecttaskpriority','Priority',1,2,0,100,3,105,1,'V~O',1,NULL,'BAS',1,''),(40,576,'projectid','vtiger_projecttask',1,'10','projectid','Related to',1,0,0,100,6,105,1,'V~M',0,5,'BAS',1,''),(40,577,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,7,105,1,'V~M',0,2,'BAS',1,''),(40,578,'projecttasknumber','vtiger_projecttask',1,'7','projecttasknumber','Project Task Number',1,2,0,100,5,105,1,'I~O',1,NULL,'BAS',1,''),(40,579,'projecttask_no','vtiger_projecttask',2,'4','projecttask_no','Project Task No',1,0,0,100,2,105,1,'V~O',3,4,'BAS',0,''),(40,580,'projecttaskprogress','vtiger_projecttask',1,'15','projecttaskprogress','Progress',1,2,0,100,1,106,1,'V~O',1,NULL,'BAS',1,''),(40,581,'projecttaskhours','vtiger_projecttask',1,'7','projecttaskhours','Worked Hours',1,2,0,100,2,106,1,'V~O',1,NULL,'BAS',1,''),(40,582,'startdate','vtiger_projecttask',1,'5','startdate','Start Date',1,2,0,100,3,106,1,'D~O',0,3,'BAS',1,''),(40,583,'enddate','vtiger_projecttask',1,'5','enddate','End Date',1,2,0,100,4,106,1,'D~O~OTH~GE~startdate~Start Date',1,NULL,'BAS',1,''),(40,584,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,2,0,100,5,106,2,'T~O',1,NULL,'BAS',1,''),(40,585,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,2,0,100,6,106,2,'T~O',1,NULL,'BAS',1,''),(40,586,'description','vtiger_crmentity',1,'19','description','description',1,2,0,100,1,107,1,'V~O',1,NULL,'BAS',1,''),(41,587,'projectname','vtiger_project',1,'2','projectname','Project Name',1,2,0,100,1,108,1,'V~M',0,1,'BAS',1,''),(41,588,'startdate','vtiger_project',1,'23','startdate','Start Date',1,2,0,100,3,108,1,'D~O',0,3,'BAS',1,''),(41,589,'targetenddate','vtiger_project',1,'23','targetenddate','Target End Date',1,2,0,100,5,108,1,'D~O~OTH~GE~startdate~Start Date',0,4,'BAS',1,''),(41,590,'actualenddate','vtiger_project',1,'23','actualenddate','Actual End Date',1,2,0,100,6,108,1,'D~O~OTH~GE~startdate~Start Date',1,NULL,'BAS',1,''),(41,591,'projectstatus','vtiger_project',1,'15','projectstatus','Status',1,2,0,100,7,108,1,'V~O',1,NULL,'BAS',1,''),(41,592,'projecttype','vtiger_project',1,'15','projecttype','Type',1,2,0,100,8,108,1,'V~O',1,NULL,'BAS',1,''),(41,593,'linktoaccountscontacts','vtiger_project',1,'10','linktoaccountscontacts','Related to',1,2,0,100,9,108,1,'V~O',1,NULL,'BAS',1,''),(41,594,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,4,108,1,'V~M',0,2,'BAS',1,''),(41,595,'project_no','vtiger_project',2,'4','project_no','Project No',1,0,0,100,2,108,1,'V~O',3,0,'BAS',0,''),(41,596,'targetbudget','vtiger_project',1,'7','targetbudget','Target Budget',1,2,0,100,1,109,1,'V~O',1,NULL,'BAS',1,''),(41,597,'projecturl','vtiger_project',1,'17','projecturl','Project Url',1,2,0,100,2,109,1,'V~O',1,NULL,'BAS',1,''),(41,598,'projectpriority','vtiger_project',1,'15','projectpriority','Priority',1,2,0,100,3,109,1,'V~O',1,NULL,'BAS',1,''),(41,599,'progress','vtiger_project',1,'15','progress','Progress',1,2,0,100,4,109,1,'V~O',1,NULL,'BAS',1,''),(41,600,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,2,0,100,5,109,2,'T~O',1,NULL,'BAS',1,''),(41,601,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,2,0,100,6,109,2,'T~O',1,NULL,'BAS',1,''),(41,602,'description','vtiger_crmentity',1,'19','description','description',1,2,0,100,1,110,1,'V~O',1,NULL,'BAS',1,''),(43,603,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,0,0,100,2,111,1,'V~M',1,NULL,'BAS',1,''),(43,604,'createdtime','vtiger_crmentity',1,'70','createdtime','Created Time',1,0,0,100,5,111,2,'T~O',1,NULL,'BAS',0,''),(43,605,'modifiedtime','vtiger_crmentity',1,'70','modifiedtime','Modified Time',1,0,0,100,6,111,2,'T~O',1,NULL,'BAS',0,''),(43,606,'message','vtiger_smsnotifier',1,'21','message','message',1,0,0,100,1,111,1,'V~M',1,NULL,'BAS',1,''),(14,612,'frequency','vtiger_products',2,'15','frequency','Frequency',0,2,0,100,7,33,1,'V~M',1,0,'BAS',1,NULL),(14,613,'barcode','vtiger_products',1,'2','barcode','Barcode',1,2,0,100,4,31,1,'V~O',0,1,'BAS',1,NULL),(14,614,'netprice','vtiger_products',1,'2','netprice','MRP (Rs.)',0,0,0,100,7,32,1,'N~O',1,NULL,'BAS',1,NULL),(14,616,'warehouse_id','vtiger_products',2,'15','warehouse_id','Warehouse/Store',1,2,0,100,4,33,1,'V~O',1,NULL,'BAS',1,NULL),(29,617,'warehouse_id','vtiger_users',1,'33','warehouse_id','Warehouse',1,1,0,100,4,77,1,'V~M',1,NULL,'BAS',1,NULL),(48,627,'barcode','vtiger_barcode',1,'2','barcode','Barcode',1,2,0,100,3,116,1,'V~M',1,1,'BAS',2,''),(48,628,'product_name','vtiger_barcode',1,'2','product_name','Product Name',1,2,0,100,4,116,1,'V~M',1,NULL,'BAS',1,''),(48,629,'price','vtiger_barcode',1,'2','price','Selling Price:(Rs.)',1,2,0,100,9,116,1,'N~M',1,NULL,'BAS',1,''),(48,630,'vat','vtiger_barcode',1,'1','vat','VAT(%)',1,2,0,100,10,116,1,'N~O',1,NULL,'BAS',1,''),(48,631,'service','vtiger_barcode',1,'1','service','Service(%)',1,1,0,100,11,116,1,'N~O',1,1,'BAS',2,''),(48,632,'netprice','vtiger_barcode',1,'1','netprice','MRP:(Rs.) ',1,2,0,100,11,116,1,'N~O',1,NULL,'BAS',1,''),(48,633,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,16,116,1,'V~O',1,NULL,'BAS',1,''),(48,634,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,13,116,2,'T~O',1,NULL,'BAS',1,''),(48,635,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,14,116,2,'T~O',1,NULL,'BAS',1,''),(48,636,'companyname','vtiger_barcode',2,'1','companyname','Company Name',0,2,0,100,1,116,1,'V~O~LE~100',1,0,'BAS',1,NULL),(23,637,'customername','vtiger_invoice',2,'1','customername','Customer Name',0,2,0,100,16,67,1,'V~O~LE~100',3,0,'BAS',1,NULL),(23,638,'mobile','vtiger_invoice',2,'11','mobile','Mobile',0,2,0,100,19,67,1,'V~O',3,0,'BAS',1,NULL),(23,639,'salesorderno','vtiger_invoice',2,'1','salesorderno','Order No.',0,2,0,100,21,67,1,'V~O~LE~100',3,0,'BAS',1,NULL),(23,640,'email','vtiger_invoice',2,'13','email','Email',0,2,0,100,22,67,1,'E~O',3,0,'BAS',1,NULL),(49,680,'warehouse_name','vtiger_warehouse',1,'2','warehouse_name','Warehouse/Store Name',1,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,681,'address1','vtiger_warehouse',1,'2','address1','Address1',1,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,682,'address2','vtiger_warehouse',1,'2','address2','Address2',1,2,0,100,1,124,1,'V~O',1,NULL,'BAS',1,''),(49,683,'street','vtiger_warehouse',1,'1','street','Street',1,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,684,'city','vtiger_warehouse',1,'1','city','City',1,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,685,'state','vtiger_warehouse',1,'1','state','State',0,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,686,'country','vtiger_warehouse',1,'1','country','Country',0,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,687,'contact_person_name','vtiger_warehouse',1,'1','contact_person_name','Contact Person Fullname',0,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,688,'mobile','vtiger_warehouse',1,'1','mobile','Mobile',0,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,689,'landline','vtiger_warehouse',1,'1','landline','Landline',0,2,0,100,1,124,1,'V~M',1,NULL,'BAS',1,''),(49,690,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,8,124,1,'V~O',1,NULL,'BAS',1,''),(49,691,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,124,2,'T~O',1,NULL,'BAS',1,''),(49,692,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,124,2,'T~O',1,NULL,'BAS',1,''),(14,694,'vat','vtiger_products',2,'7','vat','VAT(%)',1,2,0,100,6,32,1,'NN~O~11,2',1,0,'BAS',1,NULL),(14,695,'service','vtiger_products',2,'7','service','Service(%)',0,1,0,100,3,32,1,'NN~O~11,2',1,1,'BAS',2,NULL),(50,696,'productid','vtiger_promotion',1,'1','productid','Product Id',0,2,0,100,6,126,1,'I~O',1,1,'BAS',1,''),(50,697,'product_name','vtiger_promotion',1,'1','product_name','Product Name',0,2,0,100,1,126,1,'V~O',1,1,'BAS',1,''),(50,698,'qty','vtiger_promotion',1,'2','qty','Quantity',1,2,0,100,3,126,1,'N~M',1,NULL,'BAS',1,''),(50,699,'mrp','vtiger_promotion',1,'1','mrp','Mrp',0,2,0,100,2,126,1,'N~O',1,1,'BAS',1,''),(50,700,'vat','vtiger_promotion',1,'1','vat','Vat(%)',0,2,0,100,3,126,1,'N~O',1,NULL,'BAS',1,''),(50,701,'service','vtiger_promotion',1,'1','service','Service(%)',0,2,0,100,3,126,1,'N~O',1,NULL,'BAS',1,''),(50,702,'netprice','vtiger_promotion',1,'1','netprice','Net Price',0,2,0,100,3,126,1,'N~O',1,1,'BAS',1,''),(50,703,'from_date','vtiger_promotion',1,'5','from_date','From Date',1,2,0,100,3,126,1,'DT~M~time_start~Time Start',1,NULL,'BAS',1,''),(50,704,'to_date','vtiger_promotion',1,'5','to_date','To Date',1,2,0,100,3,126,1,'DT~M~time_start~Time Start',1,NULL,'BAS',1,''),(50,705,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,7,126,1,'V~O',1,NULL,'BAS',1,''),(50,706,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,3,126,2,'T~O',1,NULL,'BAS',1,''),(50,707,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,5,126,2,'T~O',1,NULL,'BAS',1,''),(14,708,'cost','vtiger_products',2,'2','cost','Cost',0,2,0,100,1,32,1,'N~M',1,0,'BAS',1,NULL),(51,709,'productid','vtiger_clearance',1,'1','productid','Product Id',0,2,0,100,13,128,1,'N~O',1,NULL,'BAS',1,''),(51,710,'product_name','vtiger_clearance',1,'1','product_name','Product Name',0,2,0,100,1,128,1,'V~O',1,NULL,'BAS',1,''),(51,711,'mrp','vtiger_clearance',1,'1','mrp','Selling Price',0,2,0,100,2,128,1,'N~O',1,NULL,'BAS',1,''),(51,712,'discount','vtiger_clearance',1,'2','discount','Discount',1,2,0,100,3,128,1,'N~M',1,NULL,'BAS',1,''),(51,713,'newmrp','vtiger_clearance',1,'1','newmrp','New Selling Price',1,2,0,100,4,128,1,'N~O',1,NULL,'BAS',1,''),(51,714,'vat','vtiger_clearance',1,'1','vat','Vat(%)',0,2,0,100,5,128,1,'N~O',1,NULL,'BAS',1,''),(51,715,'service','vtiger_clearance',1,'1','service','Service(%)',0,1,0,100,6,128,1,'N~O',1,1,'BAS',1,''),(51,716,'clearanceprice','vtiger_clearance',1,'1','clearanceprice','New MRP',0,2,0,100,7,128,1,'N~O',1,NULL,'BAS',1,''),(51,717,'from_date','vtiger_clearance',1,'5','from_date','From Date',1,2,0,100,8,128,1,'DT~M~time_start~Time Start',1,NULL,'BAS',1,''),(51,718,'to_date','vtiger_clearance',1,'5','to_date','To Date',1,2,0,100,9,128,1,'DT~M~time_start~Time Start',1,NULL,'BAS',1,''),(51,719,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,12,128,1,'V~M',1,NULL,'BAS',1,''),(51,720,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,10,128,2,'T~O',1,NULL,'BAS',1,''),(51,721,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,11,128,2,'T~O',1,NULL,'BAS',1,''),(52,722,'purchaseorder_no','vtiger_purchaseorderreceived',1,'2','purchaseorder_no','PurchaseOrder No',1,2,0,100,1,130,1,'V~M',1,NULL,'BAS',1,''),(52,723,'productname','vtiger_purchaseorderreceived',1,'2','productname','Product Name',1,2,0,100,1,130,1,'V~M',1,NULL,'BAS',1,''),(52,724,'quantity','vtiger_purchaseorderreceived',1,'2','quantity','Quantity',1,2,0,100,1,130,1,'N~M~10,2',1,NULL,'BAS',1,''),(52,725,'cost','vtiger_purchaseorderreceived',1,'2','cost','Cost',1,2,0,100,1,130,1,'N~M~10,2',1,NULL,'BAS',1,''),(52,726,'vat','vtiger_purchaseorderreceived',1,'1','vat','VAT(%)',1,2,0,100,1,130,1,'N~O~10,2',1,NULL,'BAS',1,''),(52,727,'service','vtiger_purchaseorderreceived',1,'1','service','Service(%)',1,2,0,100,1,130,1,'N~O~10,2',1,NULL,'BAS',1,''),(52,728,'netprice','vtiger_purchaseorderreceived',1,'1','netprice','Net Price',0,2,0,100,1,130,1,'N~O~10,2',1,NULL,'BAS',1,''),(52,729,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,130,1,'V~O',1,NULL,'BAS',1,''),(52,730,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,130,2,'T~O',1,NULL,'BAS',1,''),(52,731,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,130,2,'T~O',1,NULL,'BAS',1,''),(52,732,'productid','vtiger_purchaseorderreceived',1,'1','productid','Product ID',1,1,0,100,1,130,1,'N~M',1,NULL,NULL,1,NULL),(52,733,'purchaseorderid','vtiger_purchaseorderreceived',1,'1','purchaseorderid','PurchaseOrder ID',1,1,0,100,1,130,1,'N~M',1,NULL,NULL,1,NULL),(53,734,'qty','vtiger_salesret',1,'2','qty','Quantity',0,2,0,100,3,132,1,'N~O',1,NULL,'BAS',1,''),(53,735,'price','vtiger_salesret',1,'2','price','Price',1,2,0,100,3,132,1,'N~0',1,NULL,'BAS',1,''),(53,736,'sale_return_qty','vtiger_salesret',1,'1','sale_return_qty','Sales Return Qty',1,2,0,100,3,132,1,'N~O',1,NULL,'BAS',1,''),(53,737,'sale_return_price','vtiger_salesret',1,'1','sale_return_price','Sales Return Price',0,2,0,100,3,132,1,'N~O',1,NULL,'BAS',1,''),(53,738,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,132,1,'V~M',2,2,'BAS',1,''),(53,739,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,132,2,'T~O',1,NULL,'BAS',1,''),(53,740,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,132,2,'T~O',1,NULL,'BAS',1,''),(54,752,'invoiceid','vtiger_cashreceipt',1,'1','invoiceid','Invoice Number',0,2,0,100,1,146,1,'V~M',2,1,'BAS',1,''),(54,753,'customerid','vtiger_cashreceipt',1,'1','customerid','Customer Name',0,2,0,100,1,146,1,'N~O',1,NULL,'BAS',1,''),(54,754,'grandtotal','vtiger_cashreceipt',1,'1','grandtotal','Grand Total',0,2,0,100,1,146,1,'N~O',1,NULL,'BAS',1,''),(54,755,'creditamount','vtiger_cashreceipt',1,'1','creditamount','Credit Amount',0,2,0,100,1,146,1,'N~O',1,NULL,'BAS',1,''),(54,756,'paidamount','vtiger_cashreceipt',1,'1','paidamount','Paid Amount',0,2,0,100,1,146,1,'N~O',1,NULL,'BAS',1,''),(54,757,'pendingamount','vtiger_cashreceipt',1,'1','pendingamount','Pending Amount',0,2,0,100,1,146,1,'N~O',1,NULL,'BAS',1,''),(54,758,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,146,1,'V~M',1,NULL,'BAS',1,''),(54,759,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,146,2,'T~O',1,NULL,'BAS',1,''),(54,760,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,146,2,'T~O',1,NULL,'BAS',1,''),(55,761,'stockadjustid','vtiger_stockadjust',1,'1','stockadjustid','Stock Number',0,2,0,100,1,148,1,'V~O',1,NULL,'BAS',1,''),(55,762,'productid','vtiger_stockadjust',1,'1','productid','Product Id',0,2,0,100,1,148,1,'N~O',1,NULL,'BAS',1,''),(55,763,'stocktotal','vtiger_stockadjust',1,'1','stocktotal','Stock Total',0,2,0,100,1,148,1,'N~O',1,NULL,'BAS',1,''),(55,764,'adjustqty','vtiger_stockadjust',1,'1','adjustqty','Adjust Quantity',0,2,0,100,1,148,1,'N~O',1,NULL,'BAS',1,''),(55,765,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,148,1,'V~M',1,NULL,'BAS',1,''),(55,766,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,148,2,'T~O',1,NULL,'BAS',1,''),(55,767,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,148,2,'T~O',1,NULL,'BAS',1,''),(56,774,'categoryname','vtiger_category',1,'2','categoryname','Category Name',0,2,0,100,1,152,1,'V~M',1,NULL,'BAS',1,''),(56,775,'taxtype','vtiger_category',0,'16','taxtype','Tax Type',0,2,0,100,2,152,1,'V~M',1,NULL,'BAS',1,''),(56,776,'vat','vtiger_category',0,'1','vat','VAT(%)',0,2,0,100,3,152,1,'V~O',1,NULL,'BAS',1,''),(56,777,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,9,152,1,'V~M',1,NULL,'BAS',1,''),(56,778,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,7,152,2,'T~O',1,NULL,'BAS',1,''),(56,779,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,8,152,2,'T~O',1,NULL,'BAS',1,''),(48,780,'filename','vtiger_barcode',2,'1','filename','Filename',0,2,0,100,14,116,1,'V~O~LE~100',1,0,'BAS',1,NULL),(48,781,'category','vtiger_barcode',2,'15','category','Category',0,2,0,100,2,116,1,'V~M',2,2,'BAS',1,NULL),(56,782,'color','vtiger_category',2,'1','color','Color',0,1,0,100,6,152,1,'V~O~LE~100',1,1,'BAS',2,NULL),(56,783,'size','vtiger_category',2,'1','size','Size',0,1,0,100,5,152,1,'V~O~LE~10',1,1,'BAS',2,NULL),(48,784,'size','vtiger_barcode',2,'1','size','Size',0,2,0,100,12,116,1,'V~O',1,1,'BAS',1,NULL),(48,785,'barcode_color','vtiger_barcode',2,'1','barcode_color','Color',1,2,0,100,13,116,1,'V~O',1,1,'BAS',1,NULL),(49,786,'identifier','vtiger_warehouse',2,'15','identifier','Select Warehouse/Store',0,2,0,100,5,124,1,'V~M',1,NULL,'BAS',1,NULL),(57,787,'dcid','vtiger_deliverychallan',1,'1','dcid','Delivery Id',0,2,0,100,1,154,1,'V~O',1,NULL,'BAS',1,''),(57,788,'productid','vtiger_deliverychallan',1,'1','productid','Product Id',0,2,0,100,1,154,1,'N~O',1,NULL,'BAS',1,''),(57,789,'barcodeid','vtiger_deliverychallan',1,'1','barcodeid','Barcode Id',0,2,0,100,1,154,1,'N~O',1,NULL,'BAS',1,''),(57,790,'dc_qty','vtiger_deliverychallan',1,'1','dc_qty','Quantity',0,2,0,100,1,154,1,'N~O',1,NULL,'BAS',1,''),(57,791,'from_wh_st','vtiger_deliverychallan',1,'1','from_wh_st','From Warehouse',0,2,0,100,1,154,1,'V~M',2,2,'BAS',1,''),(57,792,'to_wh_st','vtiger_deliverychallan',1,'1','to_wh_st','To Warehouse',0,2,0,100,1,154,1,'V~O',1,NULL,'BAS',1,''),(57,793,'createddate','vtiger_deliverychallan',1,'23','createddate','Delivery Date',1,2,0,100,3,154,1,'D~O',1,1,'BAS',2,''),(57,794,'recieveddate','vtiger_deliverychallan',1,'23','recieveddate','Recieved Date',1,2,0,100,3,154,1,'D~O',1,1,'BAS',1,''),(57,795,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,154,1,'V~O',1,1,'BAS',1,''),(57,796,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,154,2,'T~O',1,NULL,'BAS',1,''),(57,797,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,154,2,'T~O',1,NULL,'BAS',1,''),(57,798,'status','vtiger_deliverychallan',2,'1','status','Status',0,2,0,100,8,154,1,'V~O~LE~100',1,0,'BAS',1,NULL),(57,799,'productname','vtiger_deliverychallan',2,'1','productname','Product Name',0,2,0,100,9,154,1,'V~O~LE~100',1,0,'BAS',1,NULL),(55,800,'product_name','vtiger_stockadjust',1,'1','product_name','Product Name',0,2,0,200,2,148,1,'V~O',1,NULL,'BAS',0,NULL),(55,801,'debitdate','vtiger_stockadjust',1,'70','debitdate','Debit Date',1,2,0,100,4,148,2,'T~O',1,NULL,'BAS',0,NULL),(58,804,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,9,156,1,'V~M',1,NULL,'BAS',1,''),(58,805,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,10,156,2,'T~O',1,NULL,'BAS',1,''),(58,806,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,8,156,2,'T~O',1,NULL,'BAS',1,''),(58,808,'date','vtiger_purchaserequest',2,'5','date','Date',0,2,0,100,7,156,1,'D~O',1,0,'BAS',1,NULL),(58,809,'customprid','vtiger_purchaserequest',2,'1','customprid','PurchaseRequest ID',0,2,0,100,2,156,1,'V~O~LE~100',1,0,'BAS',1,NULL),(58,810,'status','vtiger_purchaserequest',2,'1','status','Status',0,2,0,100,10,156,1,'V~O~LE~100',1,0,'BAS',1,NULL),(60,811,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,158,1,'V~M',1,NULL,'BAS',1,''),(60,812,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,158,2,'T~O',1,NULL,'BAS',1,''),(60,813,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,158,2,'T~O',1,NULL,'BAS',1,''),(61,814,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,5,160,1,'V~M',1,NULL,'BAS',1,''),(61,815,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,6,160,2,'T~O',1,NULL,'BAS',1,''),(61,816,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,7,160,2,'T~O',1,NULL,'BAS',1,''),(62,823,'emailname','vtiger_emailsettings',1,'2','emailname','Email name',0,2,0,100,1,164,1,'V~M',1,NULL,'BAS',1,''),(62,824,'sendto','vtiger_emailsettings',1,'2','sendto','Send To',0,2,0,100,2,164,1,'V~M',1,NULL,'BAS',1,''),(62,825,'sendcc','vtiger_emailsettings',1,'1','sendcc','Send Cc',0,2,0,100,3,164,1,'V~M',1,NULL,'BAS',1,''),(62,826,'createdtime','vtiger_crmentity',1,'70','CreatedTime','Created Time',1,2,0,100,4,164,2,'T~O',1,NULL,'BAS',1,''),(62,827,'modifiedtime','vtiger_crmentity',1,'70','ModifiedTime','Modified Time',1,2,0,100,5,164,2,'T~O',1,NULL,'BAS',1,''),(62,828,'smownerid','vtiger_crmentity',1,'53','assigned_user_id','Assigned To',1,2,0,100,6,164,1,'V~O',1,NULL,'BAS',1,''),(48,829,'barcode_cost','vtiger_barcode',2,'7','barcode_cost','Cost:(Rs.)',0,2,0,100,5,116,1,'NN~M~12,2',2,3,'BAS',1,NULL),(48,830,'mark_up','vtiger_barcode',2,'9','mark_up','Mark up(%)',0,2,0,100,8,116,1,'N~M~2~2',2,4,'BAS',1,NULL),(48,831,'barcode_withcform','vtiger_barcode',2,'9','barcode_withcform','CST with C-form(%)',0,2,0,100,6,116,1,'N~O~2~2',1,1,'BAS',2,NULL),(48,832,'barcode_withoutcform','vtiger_barcode',2,'9','barcode_withoutcform','CST without C-form(%)',0,2,0,100,7,116,1,'N~O~2~2',1,1,'BAS',2,NULL),(14,833,'product_markup','vtiger_products',2,'9','product_markup','Mark up(%)',0,2,0,100,4,32,1,'N~O~2~2',1,0,'BAS',1,NULL),(14,834,'product_withcform','vtiger_products',2,'9','product_withcform','CST with C-form(%)',0,2,0,100,2,32,1,'N~O~2~2',1,0,'BAS',1,NULL),(14,835,'product_withoutcform','vtiger_products',2,'9','product_withoutcform','CST without C-form(%)',0,2,0,100,3,32,1,'N~O~2~2',1,0,'BAS',1,NULL);

/*Table structure for table `vtiger_field_seq` */

DROP TABLE IF EXISTS `vtiger_field_seq`;

CREATE TABLE `vtiger_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_field_seq` */

insert  into `vtiger_field_seq`(`id`) values (835);

/*Table structure for table `vtiger_fieldformulas` */

DROP TABLE IF EXISTS `vtiger_fieldformulas`;

CREATE TABLE `vtiger_fieldformulas` (
  `expressionid` int(11) NOT NULL default '0',
  `modulename` varchar(100) default NULL,
  `expression_engine` text,
  PRIMARY KEY  (`expressionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_fieldformulas` */

/*Table structure for table `vtiger_fieldmodulerel` */

DROP TABLE IF EXISTS `vtiger_fieldmodulerel`;

CREATE TABLE `vtiger_fieldmodulerel` (
  `fieldid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relmodule` varchar(100) NOT NULL,
  `status` varchar(10) default NULL,
  `sequence` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_fieldmodulerel` */

insert  into `vtiger_fieldmodulerel`(`fieldid`,`module`,`relmodule`,`status`,`sequence`) values (110,'Potentials','Accounts',NULL,0),(110,'Potentials','Contacts',NULL,1),(510,'ServiceContracts','Contacts',NULL,NULL),(510,'ServiceContracts','Accounts',NULL,NULL),(542,'Assets','Products',NULL,NULL),(548,'Assets','Invoice',NULL,NULL),(553,'Assets','Accounts',NULL,NULL),(561,'ModComments','Leads',NULL,NULL),(561,'ModComments','Contacts',NULL,NULL),(561,'ModComments','Accounts',NULL,NULL),(563,'ModComments','ModComments',NULL,NULL),(566,'ProjectMilestone','Project',NULL,NULL),(576,'ProjectTask','Project',NULL,NULL),(561,'ModComments','ProjectTask',NULL,NULL),(593,'Project','Accounts',NULL,NULL),(593,'Project','Contacts',NULL,NULL),(561,'ModComments','Project',NULL,NULL);

/*Table structure for table `vtiger_files` */

DROP TABLE IF EXISTS `vtiger_files`;

CREATE TABLE `vtiger_files` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) default NULL,
  `content` longblob,
  `deleted` int(1) NOT NULL default '0',
  `date_entered` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `assigned_user_id` varchar(36) default NULL,
  PRIMARY KEY  (`id`),
  KEY `files_assigned_user_id_name_deleted_idx` (`assigned_user_id`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_files` */

/*Table structure for table `vtiger_freetagged_objects` */

DROP TABLE IF EXISTS `vtiger_freetagged_objects`;

CREATE TABLE `vtiger_freetagged_objects` (
  `tag_id` int(20) NOT NULL default '0',
  `tagger_id` int(20) NOT NULL default '0',
  `object_id` int(20) NOT NULL default '0',
  `tagged_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `module` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`tag_id`,`tagger_id`,`object_id`),
  KEY `freetagged_objects_tag_id_tagger_id_object_id_idx` (`tag_id`,`tagger_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_freetagged_objects` */

insert  into `vtiger_freetagged_objects`(`tag_id`,`tagger_id`,`object_id`,`tagged_on`,`module`) values (2,1,10,'2011-11-18 08:59:12','Accounts'),(3,1,12,'2011-11-18 08:59:13','Accounts'),(4,1,14,'2011-11-18 08:59:14','Accounts'),(5,1,16,'2011-11-18 08:59:14','Accounts'),(6,1,18,'2011-11-18 08:59:15','Accounts'),(7,1,20,'2011-11-18 08:59:16','Accounts'),(8,1,31,'2011-11-18 08:59:20','Contacts'),(10,1,115,'2011-11-18 08:59:47','HelpDesk');

/*Table structure for table `vtiger_freetags` */

DROP TABLE IF EXISTS `vtiger_freetags`;

CREATE TABLE `vtiger_freetags` (
  `id` int(19) NOT NULL,
  `tag` varchar(50) NOT NULL default '',
  `raw_tag` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_freetags` */

insert  into `vtiger_freetags`(`id`,`tag`,`raw_tag`) values (2,'X-CEED','X-CEED'),(3,'X-CEED','X-CEED'),(4,'X-CEED','X-CEED'),(5,'X-CEED','X-CEED'),(6,'X-CEED','X-CEED'),(7,'X-CEED','X-CEED'),(8,'X-CEED','X-CEED'),(9,'SO_vendtl','SO_vendtl'),(10,'vtiger_50usr','vtiger_50usr');

/*Table structure for table `vtiger_freetags_seq` */

DROP TABLE IF EXISTS `vtiger_freetags_seq`;

CREATE TABLE `vtiger_freetags_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_freetags_seq` */

insert  into `vtiger_freetags_seq`(`id`) values (10);

/*Table structure for table `vtiger_glacct` */

DROP TABLE IF EXISTS `vtiger_glacct`;

CREATE TABLE `vtiger_glacct` (
  `glacctid` int(19) NOT NULL auto_increment,
  `glacct` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`glacctid`),
  UNIQUE KEY `glacct_glacct_idx` (`glacct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_glacct` */

insert  into `vtiger_glacct`(`glacctid`,`glacct`,`presence`,`picklist_valueid`) values (1,'300-Sales-Software',1,51),(2,'301-Sales-Hardware',1,52),(3,'302-Rental-Income',1,53),(4,'303-Interest-Income',1,54),(5,'304-Sales-Software-Support',1,55),(6,'305-Sales Other',1,56),(7,'306-Internet Sales',1,57),(8,'307-Service-Hardware Labor',1,58),(9,'308-Sales-Books',1,59);

/*Table structure for table `vtiger_glacct_seq` */

DROP TABLE IF EXISTS `vtiger_glacct_seq`;

CREATE TABLE `vtiger_glacct_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_glacct_seq` */

insert  into `vtiger_glacct_seq`(`id`) values (9);

/*Table structure for table `vtiger_group2grouprel` */

DROP TABLE IF EXISTS `vtiger_group2grouprel`;

CREATE TABLE `vtiger_group2grouprel` (
  `groupid` int(19) NOT NULL,
  `containsgroupid` int(19) NOT NULL,
  PRIMARY KEY  (`groupid`,`containsgroupid`),
  CONSTRAINT `fk_2_vtiger_group2grouprel` FOREIGN KEY (`groupid`) REFERENCES `vtiger_groups` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_group2grouprel` */

/*Table structure for table `vtiger_group2role` */

DROP TABLE IF EXISTS `vtiger_group2role`;

CREATE TABLE `vtiger_group2role` (
  `groupid` int(19) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  PRIMARY KEY  (`groupid`,`roleid`),
  KEY `fk_2_vtiger_group2role` (`roleid`),
  CONSTRAINT `fk_2_vtiger_group2role` FOREIGN KEY (`roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_group2role` */

insert  into `vtiger_group2role`(`groupid`,`roleid`) values (3,'H2'),(4,'H3'),(2,'H4');

/*Table structure for table `vtiger_group2rs` */

DROP TABLE IF EXISTS `vtiger_group2rs`;

CREATE TABLE `vtiger_group2rs` (
  `groupid` int(19) NOT NULL,
  `roleandsubid` varchar(255) NOT NULL,
  PRIMARY KEY  (`groupid`,`roleandsubid`),
  KEY `fk_2_vtiger_group2rs` (`roleandsubid`),
  CONSTRAINT `fk_2_vtiger_group2rs` FOREIGN KEY (`roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_group2rs` */

insert  into `vtiger_group2rs`(`groupid`,`roleandsubid`) values (3,'H3'),(4,'H3');

/*Table structure for table `vtiger_groups` */

DROP TABLE IF EXISTS `vtiger_groups`;

CREATE TABLE `vtiger_groups` (
  `groupid` int(19) NOT NULL,
  `groupname` varchar(100) default NULL,
  `description` text,
  PRIMARY KEY  (`groupid`),
  UNIQUE KEY `groups_groupname_idx` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_groups` */

insert  into `vtiger_groups`(`groupid`,`groupname`,`description`) values (2,'Team Selling','Group Related to Sales'),(3,'Marketing Group','Group Related to Marketing Activities'),(4,'Support Group','Group Related to providing Support to Customers');

/*Table structure for table `vtiger_headers` */

DROP TABLE IF EXISTS `vtiger_headers`;

CREATE TABLE `vtiger_headers` (
  `fileid` int(3) NOT NULL auto_increment,
  `headernames` varchar(30) NOT NULL,
  PRIMARY KEY  (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_headers` */

/*Table structure for table `vtiger_home_layout` */

DROP TABLE IF EXISTS `vtiger_home_layout`;

CREATE TABLE `vtiger_home_layout` (
  `userid` int(19) NOT NULL,
  `layout` int(19) NOT NULL default '4',
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_home_layout` */

/*Table structure for table `vtiger_homedashbd` */

DROP TABLE IF EXISTS `vtiger_homedashbd`;

CREATE TABLE `vtiger_homedashbd` (
  `stuffid` int(19) NOT NULL default '0',
  `dashbdname` varchar(100) default NULL,
  `dashbdtype` varchar(100) default NULL,
  PRIMARY KEY  (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  CONSTRAINT `fk_1_vtiger_homedashbd` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homedashbd` */

/*Table structure for table `vtiger_homedefault` */

DROP TABLE IF EXISTS `vtiger_homedefault`;

CREATE TABLE `vtiger_homedefault` (
  `stuffid` int(19) NOT NULL default '0',
  `hometype` varchar(30) NOT NULL,
  `maxentries` int(19) default NULL,
  `setype` varchar(30) default NULL,
  PRIMARY KEY  (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  CONSTRAINT `fk_1_vtiger_homedefault` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homedefault` */

insert  into `vtiger_homedefault`(`stuffid`,`hometype`,`maxentries`,`setype`) values (1,'LTFAQ',5,'Faq'),(2,'PA',5,'Calendar'),(3,'OLTPO',3,'PurchaseOrder'),(4,'MNL',5,'Leads'),(5,'ILTI',5,'Invoice'),(6,'OLTSO',5,'SalesOrder'),(7,'GRT',5,'NULL'),(8,'UA',5,'Calendar'),(9,'HLT',5,'HelpDesk'),(10,'CVLVT',5,'NULL'),(11,'QLTQ',5,'Quotes'),(12,'PLVT',5,'Potentials'),(13,'HDB',5,'Dashboard'),(14,'ALVT',5,'Accounts'),(871,'ALVT',5,'Accounts'),(872,'HDB',5,'Dashboard'),(873,'PLVT',5,'Potentials'),(874,'QLTQ',5,'Quotes'),(875,'CVLVT',5,'NULL'),(876,'HLT',5,'HelpDesk'),(877,'UA',5,'Calendar'),(878,'GRT',5,'NULL'),(879,'OLTSO',5,'SalesOrder'),(880,'ILTI',5,'Invoice'),(881,'MNL',5,'Leads'),(882,'OLTPO',5,'PurchaseOrder'),(883,'PA',5,'Calendar'),(884,'LTFAQ',5,'Faq'),(886,'ALVT',5,'Accounts'),(887,'HDB',5,'Dashboard'),(888,'PLVT',5,'Potentials'),(889,'QLTQ',5,'Quotes'),(890,'CVLVT',5,'NULL'),(891,'HLT',5,'HelpDesk'),(892,'UA',5,'Calendar'),(893,'GRT',5,'NULL'),(894,'OLTSO',5,'SalesOrder'),(895,'ILTI',5,'Invoice'),(896,'MNL',5,'Leads'),(897,'OLTPO',5,'PurchaseOrder'),(898,'PA',5,'Calendar'),(899,'LTFAQ',5,'Faq'),(901,'ALVT',5,'Accounts'),(902,'HDB',5,'Dashboard'),(903,'PLVT',5,'Potentials'),(904,'QLTQ',5,'Quotes'),(905,'CVLVT',5,'NULL'),(906,'HLT',5,'HelpDesk'),(907,'UA',5,'Calendar'),(908,'GRT',5,'NULL'),(909,'OLTSO',5,'SalesOrder'),(910,'ILTI',5,'Invoice'),(911,'MNL',5,'Leads'),(912,'OLTPO',5,'PurchaseOrder'),(913,'PA',5,'Calendar'),(914,'LTFAQ',5,'Faq'),(916,'ALVT',5,'Accounts'),(917,'HDB',5,'Dashboard'),(918,'PLVT',5,'Potentials'),(919,'QLTQ',5,'Quotes'),(920,'CVLVT',5,'NULL'),(921,'HLT',5,'HelpDesk'),(922,'UA',5,'Calendar'),(923,'GRT',5,'NULL'),(924,'OLTSO',5,'SalesOrder'),(925,'ILTI',5,'Invoice'),(926,'MNL',5,'Leads'),(927,'OLTPO',5,'PurchaseOrder'),(928,'PA',5,'Calendar'),(929,'LTFAQ',5,'Faq'),(931,'ALVT',5,'Accounts'),(932,'HDB',5,'Dashboard'),(933,'PLVT',5,'Potentials'),(934,'QLTQ',5,'Quotes'),(935,'CVLVT',5,'NULL'),(936,'HLT',5,'HelpDesk'),(937,'UA',5,'Calendar'),(938,'GRT',5,'NULL'),(939,'OLTSO',5,'SalesOrder'),(940,'ILTI',5,'Invoice'),(941,'MNL',5,'Leads'),(942,'OLTPO',5,'PurchaseOrder'),(943,'PA',5,'Calendar'),(944,'LTFAQ',5,'Faq');

/*Table structure for table `vtiger_homemodule` */

DROP TABLE IF EXISTS `vtiger_homemodule`;

CREATE TABLE `vtiger_homemodule` (
  `stuffid` int(19) NOT NULL,
  `modulename` varchar(100) default NULL,
  `maxentries` int(19) NOT NULL,
  `customviewid` int(19) NOT NULL,
  `setype` varchar(30) NOT NULL,
  PRIMARY KEY  (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  CONSTRAINT `fk_1_vtiger_homemodule` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homemodule` */

/*Table structure for table `vtiger_homemoduleflds` */

DROP TABLE IF EXISTS `vtiger_homemoduleflds`;

CREATE TABLE `vtiger_homemoduleflds` (
  `stuffid` int(19) default NULL,
  `fieldname` varchar(100) default NULL,
  KEY `stuff_stuffid_idx` (`stuffid`),
  CONSTRAINT `fk_1_vtiger_homemoduleflds` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homemodule` (`stuffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homemoduleflds` */

/*Table structure for table `vtiger_homerss` */

DROP TABLE IF EXISTS `vtiger_homerss`;

CREATE TABLE `vtiger_homerss` (
  `stuffid` int(19) NOT NULL default '0',
  `url` varchar(100) default NULL,
  `maxentries` int(19) NOT NULL,
  PRIMARY KEY  (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  CONSTRAINT `fk_1_vtiger_homerss` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homerss` */

/*Table structure for table `vtiger_homestuff` */

DROP TABLE IF EXISTS `vtiger_homestuff`;

CREATE TABLE `vtiger_homestuff` (
  `stuffid` int(19) NOT NULL default '0',
  `stuffsequence` int(19) NOT NULL default '0',
  `stufftype` varchar(100) default NULL,
  `userid` int(19) NOT NULL,
  `visible` int(10) NOT NULL default '0',
  `stufftitle` varchar(100) default NULL,
  PRIMARY KEY  (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  KEY `fk_1_vtiger_homestuff` (`userid`),
  CONSTRAINT `fk_1_vtiger_homestuff` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homestuff` */

insert  into `vtiger_homestuff`(`stuffid`,`stuffsequence`,`stufftype`,`userid`,`visible`,`stufftitle`) values (1,1,'Default',1,1,'My Recent FAQs'),(2,2,'Default',1,1,'Pending Activities'),(3,1,'Default',1,0,'Top Purchase Orders'),(4,4,'Default',1,1,'My New Leads'),(5,0,'Default',1,0,'Top Invoices'),(6,6,'Default',1,0,'Top Sales Orders'),(7,7,'Default',1,1,'My Group Allocation'),(8,8,NULL,1,1,'Upcoming Activities'),(9,9,'Default',1,1,'Top Trouble Tickets'),(10,10,'Default',1,1,'Key Metrics'),(11,11,'Default',1,1,'Top Quotes'),(12,12,'Default',1,1,'Top Potentials'),(13,13,'Default',1,0,'Home Page Dashboard'),(14,14,'Default',1,0,'Top Accounts'),(15,15,'Tag Cloud',1,1,'Tag Cloud'),(871,1,'Default',21,0,'Top Accounts'),(872,2,'Default',21,0,'Home Page Dashboard'),(873,3,'Default',21,1,'Top Potentials'),(874,4,'Default',21,1,'Top Quotes'),(875,5,'Default',21,1,'Key Metrics'),(876,6,'Default',21,1,'Top Trouble Tickets'),(877,7,'Default',21,1,'Upcoming Activities'),(878,8,'Default',21,1,'My Group Allocation'),(879,9,'Default',21,0,'Top Sales Orders'),(880,10,'Default',21,0,'Top Invoices'),(881,11,'Default',21,1,'My New Leads'),(882,12,'Default',21,0,'Top Purchase Orders'),(883,13,'Default',21,1,'Pending Activities'),(884,14,'Default',21,1,'My Recent FAQs'),(885,15,'Tag Cloud',21,1,'Tag Cloud'),(886,1,'Default',22,0,'Top Accounts'),(887,2,'Default',22,0,'Home Page Dashboard'),(888,3,'Default',22,1,'Top Potentials'),(889,4,'Default',22,1,'Top Quotes'),(890,5,'Default',22,1,'Key Metrics'),(891,6,'Default',22,1,'Top Trouble Tickets'),(892,7,'Default',22,1,'Upcoming Activities'),(893,8,'Default',22,1,'My Group Allocation'),(894,9,'Default',22,0,'Top Sales Orders'),(895,10,'Default',22,0,'Top Invoices'),(896,11,'Default',22,1,'My New Leads'),(897,12,'Default',22,0,'Top Purchase Orders'),(898,13,'Default',22,1,'Pending Activities'),(899,14,'Default',22,1,'My Recent FAQs'),(900,15,'Tag Cloud',22,1,'Tag Cloud'),(901,1,'Default',23,0,'Top Accounts'),(902,2,'Default',23,0,'Home Page Dashboard'),(903,3,'Default',23,1,'Top Potentials'),(904,4,'Default',23,1,'Top Quotes'),(905,5,'Default',23,1,'Key Metrics'),(906,6,'Default',23,1,'Top Trouble Tickets'),(907,7,'Default',23,1,'Upcoming Activities'),(908,8,'Default',23,1,'My Group Allocation'),(909,9,'Default',23,0,'Top Sales Orders'),(910,10,'Default',23,0,'Top Invoices'),(911,11,'Default',23,1,'My New Leads'),(912,12,'Default',23,0,'Top Purchase Orders'),(913,13,'Default',23,1,'Pending Activities'),(914,14,'Default',23,1,'My Recent FAQs'),(915,15,'Tag Cloud',23,1,'Tag Cloud'),(916,1,'Default',24,0,'Top Accounts'),(917,2,'Default',24,0,'Home Page Dashboard'),(918,3,'Default',24,1,'Top Potentials'),(919,4,'Default',24,1,'Top Quotes'),(920,5,'Default',24,1,'Key Metrics'),(921,6,'Default',24,1,'Top Trouble Tickets'),(922,7,'Default',24,1,'Upcoming Activities'),(923,8,'Default',24,1,'My Group Allocation'),(924,9,'Default',24,0,'Top Sales Orders'),(925,10,'Default',24,0,'Top Invoices'),(926,11,'Default',24,1,'My New Leads'),(927,12,'Default',24,0,'Top Purchase Orders'),(928,13,'Default',24,1,'Pending Activities'),(929,14,'Default',24,1,'My Recent FAQs'),(930,15,'Tag Cloud',24,1,'Tag Cloud'),(931,1,'Default',25,0,'Top Accounts'),(932,2,'Default',25,0,'Home Page Dashboard'),(933,3,'Default',25,1,'Top Potentials'),(934,4,'Default',25,1,'Top Quotes'),(935,5,'Default',25,1,'Key Metrics'),(936,6,'Default',25,1,'Top Trouble Tickets'),(937,7,'Default',25,1,'Upcoming Activities'),(938,8,'Default',25,1,'My Group Allocation'),(939,9,'Default',25,0,'Top Sales Orders'),(940,10,'Default',25,0,'Top Invoices'),(941,11,'Default',25,1,'My New Leads'),(942,12,'Default',25,0,'Top Purchase Orders'),(943,13,'Default',25,1,'Pending Activities'),(944,14,'Default',25,1,'My Recent FAQs'),(945,15,'Tag Cloud',25,1,'Tag Cloud');

/*Table structure for table `vtiger_homestuff_seq` */

DROP TABLE IF EXISTS `vtiger_homestuff_seq`;

CREATE TABLE `vtiger_homestuff_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_homestuff_seq` */

insert  into `vtiger_homestuff_seq`(`id`) values (945);

/*Table structure for table `vtiger_import_maps` */

DROP TABLE IF EXISTS `vtiger_import_maps`;

CREATE TABLE `vtiger_import_maps` (
  `id` int(19) NOT NULL auto_increment,
  `name` varchar(36) NOT NULL,
  `module` varchar(36) NOT NULL,
  `content` longblob,
  `has_header` int(1) NOT NULL default '1',
  `deleted` int(1) NOT NULL default '0',
  `date_entered` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `assigned_user_id` varchar(36) default NULL,
  `is_published` varchar(3) NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `import_maps_assigned_user_id_module_name_deleted_idx` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_import_maps` */

/*Table structure for table `vtiger_industry` */

DROP TABLE IF EXISTS `vtiger_industry`;

CREATE TABLE `vtiger_industry` (
  `industryid` int(19) NOT NULL auto_increment,
  `industry` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`industryid`),
  UNIQUE KEY `industry_industry_idx` (`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_industry` */

insert  into `vtiger_industry`(`industryid`,`industry`,`presence`,`picklist_valueid`) values (1,'--None--',1,60),(2,'Apparel',1,61),(3,'Banking',1,62),(4,'Biotechnology',1,63),(5,'Chemicals',1,64),(6,'Communications',1,65),(7,'Construction',1,66),(8,'Consulting',1,67),(9,'Education',1,68),(10,'Electronics',1,69),(11,'Energy',1,70),(12,'Engineering',1,71),(13,'Entertainment',1,72),(14,'Environmental',1,73),(15,'Finance',1,74),(16,'Food & Beverage',1,75),(17,'Government',1,76),(18,'Healthcare',1,77),(19,'Hospitality',1,78),(20,'Insurance',1,79),(21,'Machinery',1,80),(22,'Manufacturing',1,81),(23,'Media',1,82),(24,'Not For Profit',1,83),(25,'Recreation',1,84),(26,'Retail',1,85),(27,'Shipping',1,86),(28,'Technology',1,87),(29,'Telecommunications',1,88),(30,'Transportation',1,89),(31,'Utilities',1,90),(32,'Other',1,91);

/*Table structure for table `vtiger_industry_seq` */

DROP TABLE IF EXISTS `vtiger_industry_seq`;

CREATE TABLE `vtiger_industry_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_industry_seq` */

insert  into `vtiger_industry_seq`(`id`) values (32);

/*Table structure for table `vtiger_inventory_tandc` */

DROP TABLE IF EXISTS `vtiger_inventory_tandc`;

CREATE TABLE `vtiger_inventory_tandc` (
  `id` int(19) NOT NULL,
  `type` varchar(30) NOT NULL,
  `tandc` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventory_tandc` */

insert  into `vtiger_inventory_tandc`(`id`,`type`,`tandc`) values (1,'Inventory','1) All dispute subject to Guwahati Juridiction.'),(2,'Inventory','2) Those who pay through Credit/Debit card, Vinayak could not be liable for any payment other then for charge slips Generated and reflected in the day and settelments other maters should be dealt between the customers with their respective banks Vinayak will not entertain/liable for any transactions whose payment is received by us.');

/*Table structure for table `vtiger_inventory_tandc_seq` */

DROP TABLE IF EXISTS `vtiger_inventory_tandc_seq`;

CREATE TABLE `vtiger_inventory_tandc_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventory_tandc_seq` */

insert  into `vtiger_inventory_tandc_seq`(`id`) values (1);

/*Table structure for table `vtiger_inventorynotification` */

DROP TABLE IF EXISTS `vtiger_inventorynotification`;

CREATE TABLE `vtiger_inventorynotification` (
  `notificationid` int(19) NOT NULL auto_increment,
  `notificationname` varchar(200) default NULL,
  `notificationsubject` varchar(200) default NULL,
  `notificationbody` text,
  `label` varchar(50) default NULL,
  `status` varchar(30) default NULL,
  PRIMARY KEY  (`notificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventorynotification` */

insert  into `vtiger_inventorynotification`(`notificationid`,`notificationname`,`notificationsubject`,`notificationbody`,`label`,`status`) values (1,'InvoiceNotification','{PRODUCTNAME} Stock Level is Low','Dear {HANDLER},\n\nThe current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}. Kindly procure required number of units as the stock level is below reorder level {REORDERLEVELVALUE}.\n\nPlease treat this information as Urgent as the invoice is already sent  to the customer.\n\nSeverity: Critical\n\nThanks,\n{CURRENTUSER} ','InvoiceNotificationDescription',NULL),(2,'QuoteNotification','Quote given for {PRODUCTNAME}','Dear {HANDLER},\n\nQuote is generated for {QUOTEQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}. \n\nSeverity: Minor\n\nThanks,\n{CURRENTUSER} ','QuoteNotificationDescription',NULL),(3,'SalesOrderNotification','Sales Order generated for {PRODUCTNAME}','Dear {HANDLER},\n\nSalesOrder is generated for {SOQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}. \n\nPlease treat this information  with priority as the sales order is already generated.\n\nSeverity: Major\n\nThanks,\n{CURRENTUSER} ','SalesOrderNotificationDescription',NULL);

/*Table structure for table `vtiger_inventorynotification_seq` */

DROP TABLE IF EXISTS `vtiger_inventorynotification_seq`;

CREATE TABLE `vtiger_inventorynotification_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventorynotification_seq` */

insert  into `vtiger_inventorynotification_seq`(`id`) values (3);

/*Table structure for table `vtiger_inventoryproductrel` */

DROP TABLE IF EXISTS `vtiger_inventoryproductrel`;

CREATE TABLE `vtiger_inventoryproductrel` (
  `id` int(19) default NULL,
  `productid` int(19) default NULL,
  `sequence_no` int(4) default NULL,
  `qtyinstock` int(11) default NULL,
  `quantity` int(11) default '0',
  `listprice` decimal(25,2) default NULL,
  `discount_percent` decimal(7,3) default NULL,
  `discount_amount` decimal(10,2) default NULL,
  `comment` varchar(250) default NULL,
  `description` text,
  `incrementondel` int(11) NOT NULL default '0',
  `lineitem_id` int(11) NOT NULL auto_increment,
  `tax1` decimal(7,3) default NULL,
  `tax2` decimal(7,3) default NULL,
  `tax3` decimal(7,3) default NULL,
  `vat` decimal(7,2) default '0.00',
  `taxamount` decimal(12,2) default '0.00',
  `withcform` tinyint(1) default NULL,
  `cstwithcform_per` decimal(12,2) default '0.00',
  `cstwithcform_amt` decimal(12,2) default '0.00',
  `cstwithoutcform_per` decimal(12,2) default '0.00',
  `cstwithoutcform_amt` decimal(12,2) default '0.00',
  `service` decimal(7,3) default NULL,
  `netprice` decimal(15,2) default NULL,
  `tax4` decimal(7,3) default NULL,
  `tax5` decimal(7,3) default NULL,
  `tax6` decimal(7,3) default NULL,
  PRIMARY KEY  (`lineitem_id`),
  KEY `inventoryproductrel_id_idx` (`id`),
  KEY `inventoryproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventoryproductrel` */

insert  into `vtiger_inventoryproductrel`(`id`,`productid`,`sequence_no`,`qtyinstock`,`quantity`,`listprice`,`discount_percent`,`discount_amount`,`comment`,`description`,`incrementondel`,`lineitem_id`,`tax1`,`tax2`,`tax3`,`vat`,`taxamount`,`withcform`,`cstwithcform_per`,`cstwithcform_amt`,`cstwithoutcform_per`,`cstwithoutcform_amt`,`service`,`netprice`,`tax4`,`tax5`,`tax6`) values (24,23,1,NULL,2,'2472.30',NULL,'0.00',NULL,NULL,0,1,NULL,NULL,NULL,'5.00','247.23',NULL,'0.00','0.00','0.00','0.00',NULL,'5191.83',NULL,NULL,NULL),(24,21,1,NULL,2,'833.31',NULL,'0.00',NULL,NULL,0,2,NULL,NULL,NULL,'13.50','224.99',NULL,'0.00','0.00','0.00','0.00',NULL,'1891.61',NULL,NULL,NULL),(25,20,1,NULL,2,'1040.85',NULL,'0.00',NULL,NULL,0,3,NULL,NULL,NULL,'13.50','281.03',NULL,'0.00','0.00','0.00','0.00',NULL,'2362.73',NULL,NULL,NULL),(29,23,1,NULL,4,'2472.30',NULL,'0.00',NULL,NULL,0,4,NULL,NULL,NULL,'5.00','494.46',NULL,'0.00','0.00','0.00','0.00',NULL,'10383.66',NULL,NULL,NULL),(33,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,5,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(34,23,1,NULL,2,'2472.30',NULL,'0.00',NULL,NULL,0,6,NULL,NULL,NULL,'5.00','247.23',NULL,'0.00','0.00','0.00','0.00',NULL,'5191.83',NULL,NULL,NULL),(34,22,1,NULL,4,'2524.22',NULL,'0.00',NULL,NULL,0,7,NULL,NULL,NULL,'5.00','504.84',NULL,'0.00','0.00','0.00','0.00',NULL,'10601.72',NULL,NULL,NULL),(38,23,1,NULL,1,'2472.30',NULL,'0.00',NULL,NULL,0,8,NULL,NULL,NULL,'5.00','123.62',NULL,'0.00','0.00','0.00','0.00',NULL,'2595.91',NULL,NULL,NULL),(38,18,1,NULL,1,'387.59',NULL,'0.00',NULL,NULL,0,9,NULL,NULL,NULL,'0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,'387.59',NULL,NULL,NULL),(39,18,1,NULL,1,'387.59',NULL,'0.00',NULL,NULL,0,10,NULL,NULL,NULL,'0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,'387.59',NULL,NULL,NULL),(40,18,1,NULL,1,'387.59',NULL,'0.00',NULL,NULL,0,11,NULL,NULL,NULL,'0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,'387.59',NULL,NULL,NULL),(56,23,1,NULL,1,'2472.30',NULL,'0.00',NULL,NULL,0,12,NULL,NULL,NULL,'5.00','123.62',NULL,'0.00','0.00','0.00','0.00',NULL,'2595.91',NULL,NULL,NULL),(56,22,1,NULL,2,'2524.22',NULL,'0.00',NULL,NULL,0,13,NULL,NULL,NULL,'5.00','252.42',NULL,'0.00','0.00','0.00','0.00',NULL,'5300.86',NULL,NULL,NULL),(56,21,1,NULL,1,'833.31',NULL,'0.00',NULL,NULL,0,14,NULL,NULL,NULL,'13.50','112.50',NULL,'0.00','0.00','0.00','0.00',NULL,'945.81',NULL,NULL,NULL),(57,23,1,NULL,2,'2472.30',NULL,'10.00',NULL,NULL,0,15,NULL,NULL,NULL,'5.00','247.23',NULL,'0.00','0.00','0.00','0.00',NULL,'4672.65',NULL,NULL,NULL),(57,21,1,NULL,2,'833.31',NULL,'0.00',NULL,NULL,0,16,NULL,NULL,NULL,'13.50','224.99',NULL,'0.00','0.00','0.00','0.00',NULL,'1891.61',NULL,NULL,NULL),(62,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,17,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(62,20,1,NULL,1,'1040.85',NULL,'0.00',NULL,NULL,0,18,NULL,NULL,NULL,'13.50','140.51',NULL,'0.00','0.00','0.00','0.00',NULL,'1181.36',NULL,NULL,NULL),(65,20,1,NULL,5,'1040.85',NULL,'0.00',NULL,NULL,0,19,NULL,NULL,NULL,'13.50','702.57',NULL,'0.00','0.00','0.00','0.00',NULL,'5906.82',NULL,NULL,NULL),(65,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,20,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(68,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,21,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(71,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,22,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(73,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,23,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(75,22,1,NULL,1,'2524.22',NULL,'0.00',NULL,NULL,0,24,NULL,NULL,NULL,'5.00','126.21',NULL,'0.00','0.00','0.00','0.00',NULL,'2650.43',NULL,NULL,NULL),(77,22,1,NULL,2,'2524.22',NULL,'0.00',NULL,NULL,0,25,NULL,NULL,NULL,'5.00','252.42',NULL,'0.00','0.00','0.00','0.00',NULL,'5300.86',NULL,NULL,NULL),(85,80,1,NULL,2,'952.38',NULL,'0.00',NULL,NULL,0,26,NULL,NULL,NULL,'5.00','95.24',NULL,'0.00','0.00','0.00','0.00',NULL,'2000.00',NULL,NULL,NULL),(86,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,27,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(87,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,28,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(88,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,29,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(89,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,30,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(90,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,31,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(92,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,32,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(93,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,33,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(94,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,34,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(95,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,35,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(96,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,36,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(97,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,37,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(98,80,1,NULL,1,'952.38',NULL,'0.00',NULL,NULL,0,38,NULL,NULL,NULL,'5.00','47.62',NULL,'0.00','0.00','0.00','0.00',NULL,'1000.00',NULL,NULL,NULL),(101,55,1,0,2,'10000.00','0.000',NULL,NULL,'0',0,39,NULL,NULL,NULL,'5.00','500.00',2,'0.00','0.00','0.00','0.00',NULL,'21000.00',NULL,NULL,NULL),(121,119,1,NULL,2,'1180.91',NULL,'0.00',NULL,NULL,0,40,NULL,NULL,NULL,'10.00','236.18',NULL,'0.00','0.00','0.00','0.00',NULL,'2598.00',NULL,NULL,NULL),(121,120,1,NULL,2,'1319.92',NULL,'0.00',NULL,NULL,0,41,NULL,NULL,NULL,'13.50','356.38',NULL,'0.00','0.00','0.00','0.00',NULL,'2996.22',NULL,NULL,NULL),(121,117,1,NULL,1,'9090.91',NULL,'0.00',NULL,NULL,0,42,NULL,NULL,NULL,'10.00','909.09',NULL,'0.00','0.00','0.00','0.00',NULL,'10000.00',NULL,NULL,NULL),(121,118,1,NULL,1,'1904.76',NULL,'0.00',NULL,NULL,0,43,NULL,NULL,NULL,'5.00','95.24',NULL,'0.00','0.00','0.00','0.00',NULL,'2000.00',NULL,NULL,NULL),(124,117,1,NULL,1,'9090.91',NULL,'10.00',NULL,NULL,0,44,NULL,NULL,NULL,'10.00','909.09',NULL,'0.00','0.00','0.00','0.00',NULL,'9000.00',NULL,NULL,NULL),(124,119,1,NULL,1,'1180.91',NULL,'5.00',NULL,NULL,0,45,NULL,NULL,NULL,'10.00','118.09',NULL,'0.00','0.00','0.00','0.00',NULL,'1234.05',NULL,NULL,NULL),(128,127,1,NULL,4,'48.25',NULL,'0.00',NULL,NULL,0,46,NULL,NULL,NULL,'14.00','27.02',NULL,'0.00','0.00','0.00','0.00',NULL,'220.02',NULL,NULL,NULL),(128,117,1,NULL,1,'9090.91',NULL,'10.00',NULL,NULL,0,47,NULL,NULL,NULL,'10.00','909.09',NULL,'0.00','0.00','0.00','0.00',NULL,'9000.00',NULL,NULL,NULL),(128,118,1,NULL,1,'1904.76',NULL,'0.00',NULL,NULL,0,48,NULL,NULL,NULL,'5.00','95.24',NULL,'0.00','0.00','0.00','0.00',NULL,'2000.00',NULL,NULL,NULL),(128,119,1,NULL,1,'1180.91',NULL,'5.00',NULL,NULL,0,49,NULL,NULL,NULL,'10.00','118.09',NULL,'0.00','0.00','0.00','0.00',NULL,'1234.05',NULL,NULL,NULL),(128,120,1,NULL,1,'1319.92',NULL,'0.00',NULL,NULL,0,50,NULL,NULL,NULL,'13.50','178.19',NULL,'0.00','0.00','0.00','0.00',NULL,'1498.11',NULL,NULL,NULL),(128,19,1,NULL,1,'2729.58',NULL,'0.00',NULL,NULL,0,51,NULL,NULL,NULL,'5.00','136.48',NULL,'0.00','0.00','0.00','0.00',NULL,'2866.06',NULL,NULL,NULL),(129,127,1,NULL,4,'48.25',NULL,'0.00',NULL,NULL,0,52,NULL,NULL,NULL,'14.00','27.02',NULL,'0.00','0.00','0.00','0.00',NULL,'220.02',NULL,NULL,NULL),(129,118,1,NULL,2,'1904.76',NULL,'0.00',NULL,NULL,0,53,NULL,NULL,NULL,'5.00','190.48',NULL,'0.00','0.00','0.00','0.00',NULL,'4000.00',NULL,NULL,NULL),(129,117,1,NULL,1,'9090.91',NULL,'10.00',NULL,NULL,0,54,NULL,NULL,NULL,'10.00','909.09',NULL,'0.00','0.00','0.00','0.00',NULL,'9000.00',NULL,NULL,NULL),(133,132,1,0,100,'50.00','0.000',NULL,NULL,'0',0,55,NULL,NULL,NULL,'14.00','0.00',1,'2.00','1.00','0.00','0.00',NULL,'5100.00',NULL,NULL,NULL),(135,117,1,NULL,3,'9090.91',NULL,'10.00',NULL,NULL,0,56,NULL,NULL,NULL,'10.00','2727.27',NULL,'0.00','0.00','0.00','0.00',NULL,'27000.00',NULL,NULL,NULL),(135,118,1,NULL,1,'1904.76',NULL,'0.00',NULL,NULL,0,57,NULL,NULL,NULL,'5.00','95.24',NULL,'0.00','0.00','0.00','0.00',NULL,'2000.00',NULL,NULL,NULL),(135,119,1,NULL,1,'1180.91',NULL,'0.00',NULL,NULL,0,58,NULL,NULL,NULL,'10.00','118.09',NULL,'0.00','0.00','0.00','0.00',NULL,'1299.00',NULL,NULL,NULL),(135,120,1,NULL,1,'1319.92',NULL,'0.00',NULL,NULL,0,59,NULL,NULL,NULL,'13.50','178.19',NULL,'0.00','0.00','0.00','0.00',NULL,'1498.11',NULL,NULL,NULL),(142,140,1,NULL,4,'1137.14',NULL,'0.00',NULL,NULL,0,60,NULL,NULL,NULL,'5.50','250.17',NULL,'0.00','0.00','0.00','0.00',NULL,'4798.73',NULL,NULL,NULL),(142,20,1,NULL,3,'1040.85',NULL,'0.00',NULL,NULL,0,61,NULL,NULL,NULL,'13.50','421.54',NULL,'0.00','0.00','0.00','0.00',NULL,'3544.09',NULL,NULL,NULL),(142,18,1,NULL,1,'387.59',NULL,'0.00',NULL,NULL,0,62,NULL,NULL,NULL,'0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,'387.59',NULL,NULL,NULL),(143,140,1,NULL,3,'1137.14',NULL,'10.00',NULL,NULL,0,63,NULL,NULL,NULL,'5.50','187.63',NULL,'0.00','0.00','0.00','0.00',NULL,'3239.14',NULL,NULL,NULL),(148,147,1,0,100,'790.00','0.000',NULL,NULL,'0',0,64,NULL,NULL,NULL,'5.50','43.45',2,'0.00','0.00','0.00','0.00',NULL,'83345.00',NULL,NULL,NULL),(151,18,1,NULL,1,'387.59',NULL,'0.00',NULL,NULL,0,65,NULL,NULL,NULL,'0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,'1162.77',NULL,NULL,NULL),(153,18,1,NULL,3,'387.59',NULL,'0.00',NULL,NULL,0,66,NULL,NULL,NULL,'0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,'1162.77',NULL,NULL,NULL),(153,20,1,NULL,1,'1040.85',NULL,'0.00',NULL,NULL,0,67,NULL,NULL,NULL,'13.50','140.51',NULL,'0.00','0.00','0.00','0.00',NULL,'1181.36',NULL,NULL,NULL),(157,156,1,NULL,4,'174.56',NULL,'0.00',NULL,NULL,0,68,NULL,NULL,NULL,'14.50','101.24',NULL,'0.00','0.00','0.00','0.00',NULL,'799.48',NULL,NULL,NULL),(160,159,1,0,20,'24.00','0.000',NULL,NULL,'0',0,69,NULL,NULL,NULL,'14.50','0.00',1,'2.00','0.48','0.00','0.00',NULL,'490.00',NULL,NULL,NULL);

/*Table structure for table `vtiger_inventoryshippingrel` */

DROP TABLE IF EXISTS `vtiger_inventoryshippingrel`;

CREATE TABLE `vtiger_inventoryshippingrel` (
  `id` int(19) default NULL,
  `shtax1` decimal(7,3) default NULL,
  `shtax2` decimal(7,3) default NULL,
  `shtax3` decimal(7,3) default NULL,
  KEY `inventoryishippingrel_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventoryshippingrel` */

/*Table structure for table `vtiger_inventorysubproductrel` */

DROP TABLE IF EXISTS `vtiger_inventorysubproductrel`;

CREATE TABLE `vtiger_inventorysubproductrel` (
  `id` int(19) NOT NULL,
  `sequence_no` int(10) NOT NULL,
  `productid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventorysubproductrel` */

/*Table structure for table `vtiger_inventorytaxinfo` */

DROP TABLE IF EXISTS `vtiger_inventorytaxinfo`;

CREATE TABLE `vtiger_inventorytaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) default NULL,
  `taxlabel` varchar(50) default NULL,
  `percentage` decimal(7,3) default NULL,
  `deleted` int(1) default NULL,
  PRIMARY KEY  (`taxid`),
  KEY `inventorytaxinfo_taxname_idx` (`taxname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventorytaxinfo` */

insert  into `vtiger_inventorytaxinfo`(`taxid`,`taxname`,`taxlabel`,`percentage`,`deleted`) values (1,'tax1','VAT','4.500',0),(2,'tax2','Sales','10.000',1),(3,'tax3','ServiceTax','12.500',0),(4,'cstcform','CST with C form','2.000',0),(5,'cst','CST without C form','14.000',0),(6,'tax6','text','12.000',1);

/*Table structure for table `vtiger_inventorytaxinfo_seq` */

DROP TABLE IF EXISTS `vtiger_inventorytaxinfo_seq`;

CREATE TABLE `vtiger_inventorytaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventorytaxinfo_seq` */

insert  into `vtiger_inventorytaxinfo_seq`(`id`) values (6);

/*Table structure for table `vtiger_inventorytransaction` */

DROP TABLE IF EXISTS `vtiger_inventorytransaction`;

CREATE TABLE `vtiger_inventorytransaction` (
  `transaction_id` int(11) NOT NULL auto_increment,
  `date` datetime default NULL,
  `barcode` varchar(11) default NULL,
  `productid` int(11) default NULL,
  `product_name` varchar(25) default NULL,
  `opening_stock_qty` int(11) unsigned default NULL,
  `opening_stock_WS_qty` int(11) NOT NULL,
  `opening_cost` double(12,2) default NULL,
  `markup_per` double(12,2) default '0.00',
  `markup_amt` double(12,2) default '0.00',
  `poid` int(11) default NULL,
  `purchase_qty` int(11) default NULL,
  `purchase_cost` double(12,2) default NULL,
  `cstwithcform_per` decimal(12,2) default '0.00',
  `cstwithcform_amt` decimal(12,2) default '0.00',
  `cstwithoutcform_per` decimal(12,2) default '0.00',
  `cstwithoutcform_amt` decimal(12,2) default '0.00',
  `inv_id` int(11) default NULL,
  `invoice_no` varchar(25) default NULL,
  `sales_qty` int(11) unsigned default NULL,
  `store_id` int(11) default NULL,
  `sales_cost` double(12,2) default NULL,
  `purchase_return_qty` int(10) unsigned default NULL,
  `purchase_return_cost` double(12,2) default NULL,
  `salesret_id` int(11) default NULL,
  `sales_return_qty` int(11) unsigned default NULL,
  `sales_return_cost` double(12,2) default NULL,
  `adjustment_qty` int(11) unsigned default NULL,
  `adjustment_cost` double(12,2) default NULL,
  `challan_id` int(11) default NULL,
  `challan_no` varchar(25) default NULL,
  `challan_qty_sent` int(11) NOT NULL default '0',
  `challan_qty_receive` int(11) NOT NULL default '0',
  `closing_stock` int(11) default NULL,
  `final_stock` int(11) default '0',
  `discount` decimal(10,2) default NULL,
  `unitprice` double(12,2) default '0.00',
  `closing_stock_WS_qty` int(11) NOT NULL,
  `vat` decimal(10,2) default NULL,
  `vendor_id` int(11) default NULL,
  PRIMARY KEY  (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_inventorytransaction` */

insert  into `vtiger_inventorytransaction`(`transaction_id`,`date`,`barcode`,`productid`,`product_name`,`opening_stock_qty`,`opening_stock_WS_qty`,`opening_cost`,`markup_per`,`markup_amt`,`poid`,`purchase_qty`,`purchase_cost`,`cstwithcform_per`,`cstwithcform_amt`,`cstwithoutcform_per`,`cstwithoutcform_amt`,`inv_id`,`invoice_no`,`sales_qty`,`store_id`,`sales_cost`,`purchase_return_qty`,`purchase_return_cost`,`salesret_id`,`sales_return_qty`,`sales_return_cost`,`adjustment_qty`,`adjustment_cost`,`challan_id`,`challan_no`,`challan_qty_sent`,`challan_qty_receive`,`closing_stock`,`final_stock`,`discount`,`unitprice`,`closing_stock_WS_qty`,`vat`,`vendor_id`) values (1,'2012-07-03 21:10:20','83967',18,'Curtain Cloth Hippo',100,0,298.15,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,92,NULL,387.59,0,'0.00',NULL),(2,'2012-07-03 21:11:13','81879',19,'Tomtailor  90*108',30,0,2274.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,29,NULL,2729.58,0,'5.00',NULL),(3,'2012-07-03 21:13:38','719768',20,'Esprit Umbrella 2',40,0,800.65,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,28,NULL,1040.85,0,'13.50',NULL),(4,'2012-07-03 21:14:09','988836',21,'Esprit Umbrella 1',10,0,666.65,25.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,5,NULL,833.31,0,'13.50',NULL),(5,'2012-07-03 21:14:51','739838',22,'Esprit Bedsheet 90',100,0,2294.75,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,85,NULL,2524.22,0,'5.00',NULL),(6,'2012-07-03 21:15:38','51778',23,'Esprit Bedsheet 108',20,0,2060.25,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,8,NULL,2472.30,0,'5.00',NULL),(7,'2012-07-03 21:45:09',NULL,23,'Esprit Bedsheet 108',20,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',2,3,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,18,0,NULL,2472.30,0,NULL,NULL),(8,'2012-07-03 21:45:09',NULL,21,'Esprit Umbrella 1',10,0,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',2,3,833.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,8,0,NULL,833.31,0,NULL,NULL),(9,'2012-07-03 22:15:51','719768',20,'Esprit Umbrella 2',40,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',25,'INV2_ST1_MNG',2,3,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,38,0,NULL,1040.85,0,NULL,NULL),(10,'2012-07-04 00:30:24','51778',23,'Esprit Bedsheet 108',18,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',NULL,3,NULL,NULL,NULL,26,1,2595.91,NULL,NULL,NULL,NULL,0,0,19,0,'0.00',2472.30,0,'5.00',NULL),(11,'2012-07-04 00:48:23','51778',23,'Esprit Bedsheet 108',19,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',NULL,3,NULL,NULL,NULL,27,1,2595.91,NULL,NULL,NULL,NULL,0,0,20,0,'0.00',2472.30,0,'5.00',NULL),(12,'2012-07-04 00:48:23','988836',21,'Esprit Umbrella 1',8,0,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',NULL,3,NULL,NULL,NULL,27,1,945.81,NULL,NULL,NULL,NULL,0,0,9,0,'0.00',833.31,0,'13.50',NULL),(13,'2012-07-04 00:51:26','719768',20,'Esprit Umbrella 2',38,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',25,'INV2_ST1_MNG',NULL,3,NULL,NULL,NULL,28,1,1181.36,NULL,NULL,NULL,NULL,0,0,39,0,'0.00',1040.85,0,'13.50',NULL),(14,'2012-07-04 16:00:55','51778',23,'Esprit Bedsheet 108',20,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',29,'INV3_ST1_MNG',4,3,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,16,0,NULL,2472.30,0,NULL,NULL),(15,'2012-07-04 16:04:02','51778',23,'Esprit Bedsheet 108',16,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',29,'INV3_ST1_MNG',NULL,3,NULL,NULL,NULL,30,2,5191.83,NULL,NULL,NULL,NULL,0,0,18,0,'0.00',2472.30,0,'5.00',NULL),(16,'2012-07-04 16:23:08','51778',23,'Esprit Bedsheet 108',18,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',29,'INV3_ST1_MNG',NULL,3,NULL,NULL,NULL,31,1,2595.91,NULL,NULL,NULL,NULL,0,0,19,0,'0.00',2472.30,0,'5.00',NULL),(17,'2012-07-05 00:24:36','739838',22,'Esprit Bedsheet 90',100,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',33,'INV4_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,99,0,NULL,2524.22,0,NULL,NULL),(18,'2012-07-05 12:37:59','51778',23,'Esprit Bedsheet 108',19,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',2,3,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,17,0,NULL,2472.30,0,NULL,NULL),(19,'2012-07-05 12:37:59','739838',22,'Esprit Bedsheet 90',99,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',4,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,95,0,NULL,2524.22,0,NULL,NULL),(20,'2012-07-05 12:42:47','51778',23,'Esprit Bedsheet 108',17,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',NULL,3,NULL,NULL,NULL,37,1,2595.91,NULL,NULL,NULL,NULL,0,0,18,0,'0.00',2472.30,0,'5.00',NULL),(21,'2012-07-05 12:42:47','739838',22,'Esprit Bedsheet 90',95,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',NULL,3,NULL,NULL,NULL,37,2,5300.86,NULL,NULL,NULL,NULL,0,0,97,0,'0.00',2524.22,0,'5.00',NULL),(22,'2012-07-05 16:29:35','51778',23,'Esprit Bedsheet 108',18,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',1,3,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,17,0,NULL,2472.30,0,NULL,NULL),(23,'2012-07-05 16:29:35','83967',18,'Curtain Cloth Hippo',100,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',1,3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,99,0,NULL,387.59,0,NULL,NULL),(24,'2012-07-05 16:31:25','83967',18,'Curtain Cloth Hippo',99,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',39,'INV7_ST1_MNG',1,3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,98,0,NULL,387.59,0,NULL,NULL),(25,'2012-07-05 16:35:29','83967',18,'Curtain Cloth Hippo',98,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',40,'INV8_ST1_MNG',1,3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,97,0,NULL,387.59,0,NULL,NULL),(26,'2012-07-05 17:08:03','739838',22,'Esprit Bedsheet 90',97,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',NULL,3,NULL,NULL,NULL,41,1,2650.43,NULL,NULL,NULL,NULL,0,0,98,0,'0.00',2524.22,0,'5.00',NULL),(27,'2012-07-05 17:11:48','739838',22,'Esprit Bedsheet 90',98,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',NULL,3,NULL,NULL,NULL,42,1,2650.43,NULL,NULL,NULL,NULL,0,0,99,0,'0.00',2524.22,0,'5.00',NULL),(28,'2012-07-05 18:18:33','51778',23,'Esprit Bedsheet 108',17,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',NULL,3,NULL,NULL,NULL,43,1,2595.91,NULL,NULL,NULL,NULL,0,0,18,0,'0.00',2472.30,0,'5.00',NULL),(29,'2012-07-05 18:30:17','51778',23,'Esprit Bedsheet 108',18,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',NULL,3,NULL,NULL,NULL,44,1,2595.91,NULL,NULL,NULL,NULL,0,0,19,0,'0.00',2472.30,0,'5.00',NULL),(30,'2012-07-05 18:31:51','51778',23,'Esprit Bedsheet 108',19,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',NULL,3,NULL,NULL,NULL,45,1,2595.91,NULL,NULL,NULL,NULL,0,0,20,0,'0.00',2472.30,0,'5.00',NULL),(31,'2012-07-05 18:34:42','83967',18,'Curtain Cloth Hippo',97,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',40,'INV8_ST1_MNG',NULL,3,NULL,NULL,NULL,46,1,387.59,NULL,NULL,NULL,NULL,0,0,98,0,'0.00',387.59,0,'0.00',NULL),(32,'2012-07-05 18:38:44','51778',23,'Esprit Bedsheet 108',20,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',29,'INV3_ST1_MNG ',NULL,3,NULL,NULL,NULL,47,1,2595.91,NULL,NULL,NULL,NULL,0,0,21,0,'0.00',2472.30,0,'5.00',NULL),(33,'2012-07-05 18:43:01','988836',21,'Esprit Umbrella 1',9,0,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',NULL,3,NULL,NULL,NULL,48,1,945.81,NULL,NULL,NULL,NULL,0,0,10,0,'0.00',833.31,0,'13.50',NULL),(34,'2012-07-05 18:46:38','719768',20,'Esprit Umbrella 2',39,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',25,'INV2_ST1_MNG ',NULL,3,NULL,NULL,NULL,49,1,1181.36,NULL,NULL,NULL,NULL,0,0,40,0,'0.00',1040.85,0,'13.50',NULL),(35,'2012-07-05 18:50:21','83967',18,'Curtain Cloth Hippo',98,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',NULL,3,NULL,NULL,NULL,50,1,387.59,NULL,NULL,NULL,NULL,0,0,99,0,'0.00',387.59,0,'0.00',NULL),(36,'2012-07-05 18:54:23','83967',18,'Curtain Cloth Hippo',99,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',NULL,3,NULL,NULL,NULL,51,1,387.59,NULL,NULL,NULL,NULL,0,0,100,0,'0.00',387.59,0,'0.00',NULL),(37,'2012-07-05 18:56:28','739838',22,'Esprit Bedsheet 90',99,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',33,'INV4_ST1_MNG ',NULL,3,NULL,NULL,NULL,52,1,2650.43,NULL,NULL,NULL,NULL,0,0,100,0,'0.00',2524.22,0,'5.00',NULL),(38,'2012-07-05 21:07:00','83967',18,'Curtain Cloth Hippo',100,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',39,'INV7_ST1_MNG',NULL,3,NULL,NULL,NULL,53,1,387.59,NULL,NULL,NULL,NULL,0,0,101,0,'0.00',387.59,0,'0.00',NULL),(39,'2012-07-16 13:26:40','95653',55,'lcd holder',0,0,10000.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,12000.00,0,NULL,NULL),(40,'2012-07-16 19:31:44','51778',23,'Esprit Bedsheet 108',21,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',56,'INV9_ST1_MNG',1,3,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,0,NULL,2472.30,0,NULL,NULL),(41,'2012-07-16 19:31:44','739838',22,'Esprit Bedsheet 90',100,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',56,'INV9_ST1_MNG',2,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,98,0,NULL,2524.22,0,NULL,NULL),(42,'2012-07-16 19:31:44','988836',21,'Esprit Umbrella 1',10,0,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',56,'INV9_ST1_MNG',1,3,833.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,9,0,NULL,833.31,0,NULL,NULL),(43,'2012-07-18 21:19:33','51778',23,'Esprit Bedsheet 108',20,0,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',57,'INV10_ST1_MNG',2,3,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,18,0,NULL,2472.30,0,NULL,NULL),(44,'2012-07-18 21:19:33','988836',21,'Esprit Umbrella 1',9,0,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',57,'INV10_ST1_MNG',2,3,833.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,NULL,833.31,0,NULL,NULL),(45,'2012-07-25 17:16:42','739838',22,'Esprit Bedsheet 90',98,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',62,'INV11_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,97,0,NULL,2524.22,0,NULL,NULL),(46,'2012-07-25 17:16:42','719768',20,'Esprit Umbrella 2',40,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',62,'INV11_ST1_MNG',1,3,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,39,0,NULL,1040.85,0,NULL,NULL),(47,'2012-07-25 17:27:22','719768',20,'Esprit Umbrella 2',39,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',65,'INV12_ST1_MNG',5,3,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,34,0,NULL,1040.85,0,NULL,NULL),(48,'2012-07-25 17:27:22','739838',22,'Esprit Bedsheet 90',97,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',65,'INV12_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,2524.22,0,NULL,NULL),(49,'2012-07-25 17:29:20','719768',20,'Esprit Umbrella 2',34,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',65,'INV12_ST1_MNG',NULL,3,NULL,NULL,NULL,67,2,2362.73,NULL,NULL,NULL,NULL,0,0,36,0,'0.00',1040.85,0,'13.50',NULL),(50,'2012-07-28 15:54:56','739838',22,'Esprit Bedsheet 90',96,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',68,'INV13_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,95,0,NULL,2524.22,0,NULL,NULL),(51,'2012-07-28 16:20:23','739838',22,'Esprit Bedsheet 90',95,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',71,'INV14_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,94,0,NULL,2524.22,0,NULL,NULL),(52,'2012-07-28 16:22:40','739838',22,'Esprit Bedsheet 90',94,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',73,'INV15_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,93,0,NULL,2524.22,0,NULL,NULL),(53,'2012-07-28 16:23:45','739838',22,'Esprit Bedsheet 90',93,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',75,'INV16_ST1_MNG',1,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,92,0,NULL,2524.22,0,NULL,NULL),(54,'2012-07-28 16:24:35','739838',22,'Esprit Bedsheet 90',92,0,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',77,'INV17_ST1_MNG',2,3,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,90,0,NULL,2524.22,0,NULL,NULL),(55,'2012-08-02 20:29:52','8583',80,'cur123',101,0,793.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,101,87,NULL,952.38,0,'5.00',NULL),(56,'2012-08-06 11:51:44','8583',80,'cur123',101,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',85,'INV18_ST1_MNG',2,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,99,0,NULL,952.38,0,NULL,NULL),(57,'2012-08-06 12:02:39','8583',80,'cur123',99,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',86,'INV19_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,98,0,NULL,952.38,0,NULL,NULL),(58,'2012-08-06 12:56:01','8583',80,'cur123',98,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',87,'INV20_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,97,0,NULL,952.38,0,NULL,NULL),(59,'2012-08-06 13:40:55','8583',80,'cur123',97,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',88,'INV21_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,952.38,0,NULL,NULL),(60,'2012-08-06 13:42:07','8583',80,'cur123',96,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',89,'INV22_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,95,0,NULL,952.38,0,NULL,NULL),(61,'2012-08-06 13:43:12','8583',80,'cur123',95,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',90,'INV23_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,94,0,NULL,952.38,0,NULL,NULL),(62,'2012-08-06 23:01:53','8583',80,'cur123',94,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',92,'INV24_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,93,0,NULL,952.38,0,NULL,NULL),(63,'2012-08-06 23:04:51','8583',80,'cur123',93,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',93,'INV25_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,92,0,NULL,952.38,0,NULL,NULL),(64,'2012-08-06 23:17:39','8583',80,'cur123',92,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',94,'INV26_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,91,0,NULL,952.38,0,NULL,NULL),(65,'2012-08-06 23:27:12','8583',80,'cur123',91,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',95,'INV27_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,90,0,NULL,952.38,0,NULL,NULL),(66,'2012-08-06 23:31:38','8583',80,'cur123',90,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',96,'INV28_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,89,0,NULL,952.38,0,NULL,NULL),(67,'2012-08-06 23:32:36','8583',80,'cur123',89,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',97,'INV29_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,88,0,NULL,952.38,0,NULL,NULL),(68,'2012-08-06 23:35:13','8583',80,'cur123',88,0,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',98,'INV30_ST1_MNG',1,3,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,87,0,NULL,952.38,0,NULL,NULL),(69,'2012-08-21 18:19:00','838299',106,'Glass Table',100,0,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,100,NULL,909.09,0,'10.00',NULL),(70,'2012-08-21 18:20:33','Curtain Clo',18,'Curtain Cloth Hippo',101,17,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,0,0,98,0,NULL,0.00,14,NULL,NULL),(71,'2012-08-23 18:31:58','245963',110,'Boat 123',100,0,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,100,NULL,909.09,0,'10.00',NULL),(72,'2012-08-23 18:33:21','Curtain Clo',18,'Curtain Cloth Hippo',98,14,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,0,0,95,0,NULL,0.00,11,NULL,NULL),(73,'2012-09-08 17:00:47','437953',117,'Red glass',100,0,7575.76,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,93,NULL,9090.91,0,'10.00',NULL),(74,'2012-09-08 17:01:24','6613',118,'Asian Blue Towel',50,0,1587.30,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,50,45,NULL,1904.76,0,'5.00',NULL),(75,'2012-09-08 17:02:27','749214',119,'Stering',100,0,984.09,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,95,NULL,1180.91,0,'10.00',NULL),(76,'2012-09-08 17:03:09','596533',120,'Royal Sofaset',100,0,1015.32,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,96,NULL,1319.92,0,'13.50',NULL),(77,'2012-09-08 17:06:28','749214',119,'Stering',100,0,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',2,3,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,98,0,NULL,1180.91,0,NULL,NULL),(78,'2012-09-08 17:06:28','596533',120,'Royal Sofaset',100,0,1015.32,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',2,3,1319.92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,98,0,NULL,1319.92,0,NULL,NULL),(79,'2012-09-08 17:06:28','437953',117,'Red glass',100,0,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',1,3,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,99,0,NULL,9090.91,0,NULL,NULL),(80,'2012-09-08 17:06:28','6613',118,'Asian Blue Towel',50,0,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',1,3,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,49,0,NULL,1904.76,0,NULL,NULL),(81,'2012-09-08 17:18:36','437953',117,'Red glass',99,0,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',124,'INV32_ST1_MNG',1,3,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,98,0,NULL,9090.91,0,NULL,NULL),(82,'2012-09-08 17:18:36','749214',119,'Stering',98,0,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',124,'INV32_ST1_MNG',1,3,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,97,0,NULL,1180.91,0,NULL,NULL),(83,'2012-09-08 17:49:56','11538',127,'Haldiram 500 gm',100,0,43.86,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,92,NULL,48.25,0,'14.00',NULL),(84,'2012-09-08 17:52:14','11538',127,'Haldiram 500 gm',100,0,43.86,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',4,3,48.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,48.25,0,NULL,NULL),(85,'2012-09-08 17:52:14','437953',117,'Red glass',98,0,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,3,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,97,0,NULL,9090.91,0,NULL,NULL),(86,'2012-09-08 17:52:14','6613',118,'Asian Blue Towel',49,0,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,3,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,48,0,NULL,1904.76,0,NULL,NULL),(87,'2012-09-08 17:52:14','749214',119,'Stering',97,0,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,3,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,1180.91,0,NULL,NULL),(88,'2012-09-08 17:52:14','596533',120,'Royal Sofaset',98,0,1015.32,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,3,1319.92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,97,0,NULL,1319.92,0,NULL,NULL),(89,'2012-09-08 17:52:14','81879',19,'Tomtailor  90*108',30,0,2274.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,3,2729.58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,29,0,NULL,2729.58,0,NULL,NULL),(90,'2012-09-08 17:55:17','11538',127,'Haldiram 500 gm',96,0,43.86,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',129,'INV34_ST1_MNG',4,3,48.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,92,0,NULL,48.25,0,NULL,NULL),(91,'2012-09-08 17:55:17','6613',118,'Asian Blue Towel',48,0,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',129,'INV34_ST1_MNG',2,3,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,46,0,NULL,1904.76,0,NULL,NULL),(92,'2012-09-08 17:55:17','437953',117,'Red glass',97,0,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',129,'INV34_ST1_MNG',1,3,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,9090.91,0,NULL,NULL),(93,'2012-09-08 18:04:58','448',132,'xyz123',0,0,50.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,55.00,0,NULL,NULL),(94,'2012-09-08 18:06:54','448',132,'xyz123',0,0,50.00,10.00,0.00,133,100,50.00,'2.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,100,NULL,56.10,0,'14.00',NULL),(95,'2012-09-21 14:11:09','437953',117,'Red glass',96,0,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',3,3,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,93,0,NULL,9090.91,0,NULL,NULL),(96,'2012-09-21 14:11:09','6613',118,'Asian Blue Towel',46,0,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',1,3,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,45,0,NULL,1904.76,0,NULL,NULL),(97,'2012-09-21 14:11:09','749214',119,'Stering',96,0,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',1,3,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,95,0,NULL,1180.91,0,NULL,NULL),(98,'2012-09-21 14:11:09','596533',120,'Royal Sofaset',97,0,1015.32,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',1,3,1319.92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,1319.92,0,NULL,NULL),(99,'2012-10-05 14:45:03','32598',140,'Wrangler Blue',100,0,947.62,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,93,NULL,1137.14,0,'5.50',NULL),(100,'2012-10-05 14:48:57','32598',140,'Wrangler Blue',100,0,947.62,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',142,'INV36_ST1_MNG',4,3,1137.14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,1137.14,0,NULL,NULL),(101,'2012-10-05 14:48:57','719768',20,'Esprit Umbrella 2',36,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',142,'INV36_ST1_MNG',3,3,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,33,0,NULL,1040.85,0,NULL,NULL),(102,'2012-10-05 14:48:57','83967',18,'Curtain Cloth Hippo',95,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',142,'INV36_ST1_MNG',1,3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,94,0,NULL,387.59,0,NULL,NULL),(103,'2012-10-05 14:50:57','32598',140,'Wrangler Blue',96,0,947.62,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',143,'INV37_ST1_MNG',3,3,1137.14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,93,0,NULL,1137.14,0,NULL,NULL),(104,'2012-10-05 14:55:40','32598',140,'Wrangler Blue',93,0,947.62,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',143,'INV37_ST1_MNG',NULL,3,NULL,NULL,NULL,145,1,1079.71,NULL,NULL,NULL,NULL,0,0,94,0,'10.00',1137.14,0,'5.50',NULL),(105,'2012-10-05 15:02:58','497912',147,'jean123',0,0,789.68,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,947.62,0,NULL,NULL),(106,'2012-10-23 00:50:29','83967',18,'Curtain Cloth Hippo',94,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',151,'INV38_ST1_MNG',1,3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,93,0,NULL,387.59,0,NULL,NULL),(107,'2012-10-23 10:16:58','83967',18,'Curtain Cloth Hippo',93,0,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',153,'INV39_ST1_MNG',3,3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,90,0,NULL,387.59,0,NULL,NULL),(108,'2012-10-23 10:16:58','719768',20,'Esprit Umbrella 2',33,0,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',153,'INV39_ST1_MNG',1,3,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,32,0,NULL,1040.85,0,NULL,NULL),(109,'2012-10-23 10:24:21','464158',156,'Ashirwad',100,0,158.69,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,96,NULL,174.56,0,'14.50',NULL),(110,'2012-10-23 10:26:01','464158',156,'Ashirwad',100,0,158.69,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',157,'INV40_ST1_MNG',4,3,174.56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,96,0,NULL,174.56,0,NULL,NULL),(111,'2012-10-23 10:32:18','89318',159,'Brisk Farm',0,0,23.80,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,26.18,0,NULL,NULL),(112,'2012-10-23 10:36:26','Ashirwad',156,'Ashirwad',96,36,158.69,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,95,0,NULL,0.00,35,NULL,NULL),(113,'2012-10-23 10:38:28','464158',156,'Ashirwad',95,0,158.69,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',157,'INV40_ST1_MNG ',NULL,3,NULL,NULL,NULL,161,1,199.87,NULL,NULL,NULL,NULL,0,0,96,0,'0.00',174.56,0,'14.50',NULL);

/*Table structure for table `vtiger_invitees` */

DROP TABLE IF EXISTS `vtiger_invitees`;

CREATE TABLE `vtiger_invitees` (
  `activityid` int(19) NOT NULL,
  `inviteeid` int(19) NOT NULL,
  PRIMARY KEY  (`activityid`,`inviteeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invitees` */

/*Table structure for table `vtiger_invoice` */

DROP TABLE IF EXISTS `vtiger_invoice`;

CREATE TABLE `vtiger_invoice` (
  `invoiceid` int(19) NOT NULL default '0',
  `subject` varchar(100) default NULL,
  `salesorderid` int(19) default NULL,
  `customerno` varchar(100) default NULL,
  `contactid` int(19) default NULL,
  `notes` varchar(100) default NULL,
  `invoicedate` date default NULL,
  `duedate` date default NULL,
  `invoiceterms` varchar(100) default NULL,
  `type` varchar(100) default NULL,
  `adjustment` decimal(25,3) default NULL,
  `salescommission` decimal(25,3) default NULL,
  `exciseduty` decimal(25,3) default NULL,
  `subtotal` decimal(25,3) default NULL,
  `total` decimal(25,3) default NULL,
  `taxtype` varchar(25) default NULL,
  `discount_percent` decimal(25,3) default NULL,
  `discount_amount` decimal(25,3) default NULL,
  `s_h_amount` decimal(25,3) default NULL,
  `shipping` varchar(100) default NULL,
  `accountid` int(19) default NULL,
  `terms_conditions` text,
  `purchaseorder` varchar(200) default NULL,
  `invoicestatus` varchar(200) default NULL,
  `invoice_no` varchar(100) default NULL,
  `currency_id` int(19) NOT NULL default '1',
  `conversion_rate` decimal(10,3) NOT NULL default '1.000',
  `customername` varchar(100) default NULL,
  `mobile` varchar(50) default NULL,
  `salesorderno` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `cash` decimal(10,2) default '0.00',
  `credit` decimal(10,2) default '0.00',
  `card` decimal(10,2) default '0.00',
  `bankname` varchar(100) default NULL,
  `chq_date` date default NULL,
  `cheque_no` varchar(100) default NULL,
  `cheque_amt` decimal(10,2) default '0.00',
  `storeid` int(11) default NULL,
  PRIMARY KEY  (`invoiceid`),
  KEY `invoice_purchaseorderid_idx` (`invoiceid`),
  KEY `fk_2_vtiger_invoice` (`salesorderid`),
  CONSTRAINT `fk_2_vtiger_invoice` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoice` */

insert  into `vtiger_invoice`(`invoiceid`,`subject`,`salesorderid`,`customerno`,`contactid`,`notes`,`invoicedate`,`duedate`,`invoiceterms`,`type`,`adjustment`,`salescommission`,`exciseduty`,`subtotal`,`total`,`taxtype`,`discount_percent`,`discount_amount`,`s_h_amount`,`shipping`,`accountid`,`terms_conditions`,`purchaseorder`,`invoicestatus`,`invoice_no`,`currency_id`,`conversion_rate`,`customername`,`mobile`,`salesorderno`,`email`,`cash`,`credit`,`card`,`bankname`,`chq_date`,`cheque_no`,`cheque_amt`,`storeid`) values (24,NULL,NULL,NULL,NULL,NULL,'2012-07-03',NULL,NULL,'','0.000',NULL,NULL,'7083.440','7083.440',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV1_ST1_MNG',1,'1.000','','','','','7083.44','0.00','0.00','','0000-00-00','','0.00',3),(25,NULL,NULL,NULL,NULL,NULL,'2012-07-03',NULL,NULL,'','0.000',NULL,NULL,'2362.730','2362.730',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV2_ST1_MNG',1,'1.000','','','','','2362.73','0.00','0.00','','0000-00-00','','0.00',3),(29,NULL,NULL,NULL,NULL,NULL,'2012-07-04',NULL,NULL,'','0.000',NULL,NULL,'10383.660','10383.660',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV3_ST1_MNG',1,'1.000','','','','','10383.66','0.00','0.00','','0000-00-00','','0.00',3),(33,NULL,NULL,NULL,NULL,NULL,'2012-07-05',NULL,NULL,'','0.000',NULL,NULL,'2650.430','2650.430',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV4_ST1_MNG',1,'1.000','','','','','2650.43','0.00','0.00','','0000-00-00','','0.00',3),(34,NULL,NULL,NULL,NULL,NULL,'2012-07-05',NULL,NULL,'','0.000',NULL,NULL,'15793.550','15793.550',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV5_ST1_MNG',1,'1.000','Girish','9916024776','','','5793.55','10000.00','0.00','','0000-00-00','','0.00',3),(38,NULL,NULL,NULL,NULL,NULL,'2012-07-05',NULL,NULL,'','0.000',NULL,NULL,'2983.500','2983.500',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV6_ST1_MNG',1,'1.000','','','','','2983.50','0.00','0.00','','0000-00-00','','0.00',3),(39,NULL,NULL,NULL,NULL,NULL,'2012-07-05',NULL,NULL,'','0.000',NULL,NULL,'387.590','387.590',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV7_ST1_MNG',1,'1.000','','','','','387.59','0.00','0.00','','0000-00-00','','0.00',3),(40,NULL,NULL,NULL,NULL,NULL,'2012-07-05',NULL,NULL,'','0.000',NULL,NULL,'387.590','387.590',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV8_ST1_MNG',1,'1.000','','','','','387.59','0.00','0.00','','0000-00-00','','0.00',3),(56,NULL,NULL,NULL,NULL,NULL,'2012-07-16',NULL,NULL,'','0.000',NULL,NULL,'8842.580','8842.580',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV9_ST1_MNG',1,'1.000','','','','','8842.58','0.00','0.00','','0000-00-00','','0.00',3),(57,NULL,NULL,NULL,NULL,NULL,'2012-07-18',NULL,NULL,'','0.000',NULL,NULL,'6564.260','6564.260',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV10_ST1_MNG',1,'1.000','Sumit','9876544343','','rr@rr.com','4564.26','2000.00','0.00','','0000-00-00','','0.00',3),(62,NULL,NULL,NULL,NULL,NULL,'2012-07-25',NULL,NULL,'','0.000',NULL,NULL,'3831.790','3831.790',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV11_ST1_MNG',1,'1.000','Swaroop Nayak','9916023654','','test@test.com','1831.79','2000.00','0.00','','0000-00-00','','0.00',3),(65,NULL,NULL,NULL,NULL,NULL,'2012-07-25',NULL,NULL,'','0.000',NULL,NULL,'8557.250','8557.250',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV12_ST1_MNG',1,'1.000','Bajrang Singh','9916023654','','ss@ss.com','1557.25','4000.00','0.00','State Bank of India','2012-07-25','567001','3000.00',3),(68,NULL,NULL,NULL,NULL,NULL,'2012-07-28',NULL,NULL,'','0.000',NULL,NULL,'2650.430','2650.430',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV13_ST1_MNG',1,'1.000','Raju Khan','98765434','','dd@dd.com','1650.43','1000.00','0.00','','0000-00-00','','0.00',3),(71,NULL,NULL,NULL,NULL,NULL,'2012-07-28',NULL,NULL,'','0.000',NULL,NULL,'2650.430','2650.430',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV14_ST1_MNG',1,'1.000','Ashok Pincha','9916023654','','test@test.com','1150.43','1500.00','0.00','','0000-00-00','','0.00',3),(73,NULL,NULL,NULL,NULL,NULL,'2012-07-28',NULL,NULL,'','0.000',NULL,NULL,'2650.430','2650.430',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV15_ST1_MNG',1,'1.000','Ashok Pincha','9916023654','','test@test.com','1150.43','1500.00','0.00','','0000-00-00','','0.00',3),(75,NULL,NULL,NULL,NULL,NULL,'2012-07-28',NULL,NULL,'','0.000',NULL,NULL,'2650.430','2650.430',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV16_ST1_MNG',1,'1.000','Ashok Pincha','9916023654','','test@test.com','1150.43','1500.00','0.00','','0000-00-00','','0.00',3),(77,NULL,NULL,NULL,NULL,NULL,'2012-07-28',NULL,NULL,'','0.000',NULL,NULL,'5300.860','5300.860',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV17_ST1_MNG',1,'1.000','Golo Jupiter','9916023654','','surjan.neg1i@treewalker.in','1300.86','3000.00','0.00','HDFC Ltd','2012-07-28','234567','1000.00',3),(85,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'2000.000','2000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV18_ST1_MNG',1,'1.000','','','','','2000.00','0.00','0.00','','0000-00-00','','0.00',3),(86,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV19_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(87,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV20_ST1_MNG',1,'1.000','Golo Jupiter','9916023654','','nikhil.gupta@treewalker.in','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(88,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV21_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(89,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV22_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(90,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV23_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(92,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV24_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(93,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV25_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(94,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV26_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(95,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV27_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(96,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV28_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(97,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV29_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(98,NULL,NULL,NULL,NULL,NULL,'2012-08-06',NULL,NULL,'','0.000',NULL,NULL,'1000.000','1000.000',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV30_ST1_MNG',1,'1.000','','','','','1000.00','0.00','0.00','','0000-00-00','','0.00',3),(121,NULL,NULL,NULL,NULL,NULL,'2012-09-08',NULL,NULL,'','0.000',NULL,NULL,'17594.220','17594.220',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV31_ST1_MNG',1,'1.000','','','','','17594.22','0.00','0.00','','0000-00-00','','0.00',3),(124,NULL,NULL,NULL,NULL,NULL,'2012-09-08',NULL,NULL,'','0.000',NULL,NULL,'10234.050','10234.050',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV32_ST1_MNG',1,'1.000','','','','','10234.05','0.00','0.00','','0000-00-00','','0.00',3),(128,NULL,NULL,NULL,NULL,NULL,'2012-09-08',NULL,NULL,'','0.000',NULL,NULL,'16818.240','16818.240',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV33_ST1_MNG',1,'1.000','','','','','16818.24','0.00','0.00','','0000-00-00','','0.00',3),(129,NULL,NULL,NULL,NULL,NULL,'2012-09-08',NULL,NULL,'','0.000',NULL,NULL,'13220.020','13220.020',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV34_ST1_MNG',1,'1.000','Ashok Pincha','9916023654','','ravi@treewalker.in','9220.02','2000.00','0.00','State Bank of India','2012-09-12','234567','2000.00',3),(135,NULL,NULL,NULL,NULL,NULL,'2012-09-21',NULL,NULL,'','0.000',NULL,NULL,'31797.110','31797.110',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV35_ST1_MNG',1,'1.000','Ashok Pincha','9916023654','','','11797.11','10000.00','0.00','State Bank of India','2012-09-24','234567','10000.00',3),(142,NULL,NULL,NULL,NULL,NULL,'2012-10-05',NULL,NULL,'','0.000',NULL,NULL,'8730.410','8730.410',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV36_ST1_MNG',1,'1.000','','','','','8730.41','0.00','0.00','','0000-00-00','','0.00',3),(143,NULL,NULL,NULL,NULL,NULL,'2012-10-05',NULL,NULL,'','0.000',NULL,NULL,'3239.140','3239.140',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV37_ST1_MNG',1,'1.000','','','','','3239.14','0.00','0.00','','0000-00-00','','0.00',3),(151,NULL,NULL,NULL,NULL,NULL,'2012-10-23',NULL,NULL,'','0.000',NULL,NULL,'1162.770','1162.770',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV38_ST1_MNG',1,'1.000','','','','','1162.77','0.00','0.00','','0000-00-00','','0.00',3),(153,NULL,NULL,NULL,NULL,NULL,'2012-10-23',NULL,NULL,'','0.000',NULL,NULL,'2344.130','2344.130',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV39_ST1_MNG',1,'1.000','','','','','2344.13','0.00','0.00','','0000-00-00','','0.00',3),(157,NULL,NULL,NULL,NULL,NULL,'2012-10-23',NULL,NULL,'','0.000',NULL,NULL,'799.480','799.480',NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,'Paid','INV40_ST1_MNG',1,'1.000','','','','','799.48','0.00','0.00','','0000-00-00','','0.00',3);

/*Table structure for table `vtiger_invoice_recurring_info` */

DROP TABLE IF EXISTS `vtiger_invoice_recurring_info`;

CREATE TABLE `vtiger_invoice_recurring_info` (
  `salesorderid` int(11) default NULL,
  `recurring_frequency` varchar(200) default NULL,
  `start_period` date default NULL,
  `end_period` date default NULL,
  `last_recurring_date` date default NULL,
  `payment_duration` varchar(200) default NULL,
  `invoice_status` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoice_recurring_info` */

/*Table structure for table `vtiger_invoicebillads` */

DROP TABLE IF EXISTS `vtiger_invoicebillads`;

CREATE TABLE `vtiger_invoicebillads` (
  `invoicebilladdressid` int(19) NOT NULL default '0',
  `bill_city` varchar(30) default NULL,
  `bill_code` varchar(30) default NULL,
  `bill_country` varchar(30) default NULL,
  `bill_state` varchar(30) default NULL,
  `bill_street` varchar(250) default NULL,
  `bill_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`invoicebilladdressid`),
  CONSTRAINT `fk_1_vtiger_invoicebillads` FOREIGN KEY (`invoicebilladdressid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoicebillads` */

insert  into `vtiger_invoicebillads`(`invoicebilladdressid`,`bill_city`,`bill_code`,`bill_country`,`bill_state`,`bill_street`,`bill_pobox`) values (34,'Bangalore','560102','India','Karnataka','HSR',NULL),(57,'Bangalore','560102','India','Karnataka','asjsad',NULL),(62,'Bangalore','560102','India','Karnataka','asdad',NULL),(65,'Bangalore','560102','India','Katnatka','werewqrwq',NULL),(68,'Bangalore','560102','India','Karnataka','slkjfslf',NULL),(71,'Bangalore','560102','India','Karnataka','asdasdsa',NULL),(73,'Bangalore','560102','India','Karnataka','asdsad',NULL),(75,'Bangalore','560102','India','Karnataka','asdsad',NULL),(77,'Bangalore','560102','India','Karnataka','sadasd',NULL),(129,'Bangalore','560102','India','Karnatka','HSR',NULL),(135,'Bangalore','68978','India','Karnataka','hde',NULL);

/*Table structure for table `vtiger_invoicecf` */

DROP TABLE IF EXISTS `vtiger_invoicecf`;

CREATE TABLE `vtiger_invoicecf` (
  `invoiceid` int(19) NOT NULL default '0',
  `cf_637` varchar(100) default '',
  `cf_638` varchar(30) default '',
  `cf_639` varchar(100) default '',
  `cf_640` varchar(50) default '',
  PRIMARY KEY  (`invoiceid`),
  CONSTRAINT `fk_1_vtiger_invoicecf` FOREIGN KEY (`invoiceid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoicecf` */

insert  into `vtiger_invoicecf`(`invoiceid`,`cf_637`,`cf_638`,`cf_639`,`cf_640`) values (24,'','','',''),(25,'','','',''),(29,'','','',''),(33,'','','',''),(34,'','','',''),(38,'','','',''),(39,'','','',''),(40,'','','',''),(56,'','','',''),(57,'','','',''),(62,'','','',''),(65,'','','',''),(68,'','','',''),(71,'','','',''),(73,'','','',''),(75,'','','',''),(77,'','','',''),(85,'','','',''),(86,'','','',''),(87,'','','',''),(88,'','','',''),(89,'','','',''),(90,'','','',''),(92,'','','',''),(93,'','','',''),(94,'','','',''),(95,'','','',''),(96,'','','',''),(97,'','','',''),(98,'','','',''),(121,'','','',''),(124,'','','',''),(128,'','','',''),(129,'','','',''),(135,'','','',''),(142,'','','',''),(143,'','','',''),(151,'','','',''),(153,'','','',''),(157,'','','','');

/*Table structure for table `vtiger_invoiceshipads` */

DROP TABLE IF EXISTS `vtiger_invoiceshipads`;

CREATE TABLE `vtiger_invoiceshipads` (
  `invoiceshipaddressid` int(19) NOT NULL default '0',
  `ship_city` varchar(30) default NULL,
  `ship_code` varchar(30) default NULL,
  `ship_country` varchar(30) default NULL,
  `ship_state` varchar(30) default NULL,
  `ship_street` varchar(250) default NULL,
  `ship_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`invoiceshipaddressid`),
  CONSTRAINT `fk_1_vtiger_invoiceshipads` FOREIGN KEY (`invoiceshipaddressid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoiceshipads` */

insert  into `vtiger_invoiceshipads`(`invoiceshipaddressid`,`ship_city`,`ship_code`,`ship_country`,`ship_state`,`ship_street`,`ship_pobox`) values (34,'Bangalore','560102','India','Karnataka','HSR',NULL),(57,'Bangalore','560102','India','Karnataka','asjsad',NULL),(62,'Bangalore','560102','India','Karnataka','asdad',NULL),(65,'Bangalore','560102','India','Katnatka','werewqrwq',NULL),(68,'Bangalore','560102','India','Karnataka','slkjfslf',NULL),(71,'Bangalore','560102','India','Karnataka','asdasdsa',NULL),(73,'Bangalore','560102','India','Karnataka','asdsad',NULL),(75,'Bangalore','560102','India','Karnataka','asdsad',NULL),(77,'Bangalore','560102','India','Karnataka','sadasd',NULL),(129,'Bangalore','560102','India','Karnatka','HSR',NULL),(135,'Bangalore','68978','India','Karnataka','hde',NULL);

/*Table structure for table `vtiger_invoicestatus` */

DROP TABLE IF EXISTS `vtiger_invoicestatus`;

CREATE TABLE `vtiger_invoicestatus` (
  `invoicestatusid` int(19) NOT NULL auto_increment,
  `invoicestatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`invoicestatusid`),
  UNIQUE KEY `invoicestatus_invoiestatus_idx` (`invoicestatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoicestatus` */

insert  into `vtiger_invoicestatus`(`invoicestatusid`,`invoicestatus`,`presence`,`picklist_valueid`) values (1,'AutoCreated',0,92),(2,'Created',0,93),(3,'Approved',0,94),(4,'Sent',0,95),(5,'Credit Invoice',0,96),(6,'Paid',0,97);

/*Table structure for table `vtiger_invoicestatus_seq` */

DROP TABLE IF EXISTS `vtiger_invoicestatus_seq`;

CREATE TABLE `vtiger_invoicestatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoicestatus_seq` */

insert  into `vtiger_invoicestatus_seq`(`id`) values (6);

/*Table structure for table `vtiger_invoicestatushistory` */

DROP TABLE IF EXISTS `vtiger_invoicestatushistory`;

CREATE TABLE `vtiger_invoicestatushistory` (
  `historyid` int(19) NOT NULL auto_increment,
  `invoiceid` int(19) NOT NULL,
  `accountname` varchar(100) default NULL,
  `total` decimal(10,0) default NULL,
  `invoicestatus` varchar(200) default NULL,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`historyid`),
  KEY `invoicestatushistory_invoiceid_idx` (`invoiceid`),
  CONSTRAINT `fk_1_vtiger_invoicestatushistory` FOREIGN KEY (`invoiceid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_invoicestatushistory` */

/*Table structure for table `vtiger_language` */

DROP TABLE IF EXISTS `vtiger_language`;

CREATE TABLE `vtiger_language` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `prefix` varchar(10) default NULL,
  `label` varchar(30) default NULL,
  `lastupdated` datetime default NULL,
  `sequence` int(11) default NULL,
  `isdefault` int(1) default NULL,
  `active` int(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_language` */

insert  into `vtiger_language`(`id`,`name`,`prefix`,`label`,`lastupdated`,`sequence`,`isdefault`,`active`) values (1,'English','en_us','US English','2011-11-17 19:25:23',NULL,1,1),(2,'Deutsch','de_de','DE Deutsch','2011-11-17 19:28:33',NULL,0,1),(3,'Dutch','nl_nl','NL-Dutch','2011-11-17 19:28:33',NULL,0,1),(4,'French','fr_fr','Francais','2011-11-17 19:28:34',NULL,0,1),(5,'Hungarian','hu_hu','HU Magyar','2011-11-17 19:28:35',NULL,0,1),(6,'Spanish','es_es','ES Spanish','2011-11-17 19:29:08',NULL,0,1);

/*Table structure for table `vtiger_language_seq` */

DROP TABLE IF EXISTS `vtiger_language_seq`;

CREATE TABLE `vtiger_language_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_language_seq` */

insert  into `vtiger_language_seq`(`id`) values (6);

/*Table structure for table `vtiger_lar` */

DROP TABLE IF EXISTS `vtiger_lar`;

CREATE TABLE `vtiger_lar` (
  `larid` int(19) NOT NULL default '0',
  `name` varchar(50) NOT NULL,
  `createdby` int(19) NOT NULL default '0',
  `createdon` date NOT NULL,
  PRIMARY KEY  (`larid`),
  UNIQUE KEY `lar_name_idx` (`name`),
  KEY `lar_createdby_idx` (`createdby`),
  CONSTRAINT `fk_1_vtiger_lar` FOREIGN KEY (`createdby`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_lar` */

/*Table structure for table `vtiger_lead_view` */

DROP TABLE IF EXISTS `vtiger_lead_view`;

CREATE TABLE `vtiger_lead_view` (
  `lead_viewid` int(19) NOT NULL auto_increment,
  `lead_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`lead_viewid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_lead_view` */

insert  into `vtiger_lead_view`(`lead_viewid`,`lead_view`,`sortorderid`,`presence`) values (1,'Today',0,1),(2,'Last 2 Days',1,1),(3,'Last Week',2,1);

/*Table structure for table `vtiger_lead_view_seq` */

DROP TABLE IF EXISTS `vtiger_lead_view_seq`;

CREATE TABLE `vtiger_lead_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_lead_view_seq` */

insert  into `vtiger_lead_view_seq`(`id`) values (3);

/*Table structure for table `vtiger_leadacctrel` */

DROP TABLE IF EXISTS `vtiger_leadacctrel`;

CREATE TABLE `vtiger_leadacctrel` (
  `leadid` int(19) NOT NULL default '0',
  `accountid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`leadid`),
  KEY `leadacctrel_accountid_idx` (`accountid`),
  CONSTRAINT `fk_2_vtiger_leadacctrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadacctrel` */

/*Table structure for table `vtiger_leadaddress` */

DROP TABLE IF EXISTS `vtiger_leadaddress`;

CREATE TABLE `vtiger_leadaddress` (
  `leadaddressid` int(19) NOT NULL default '0',
  `city` varchar(30) default NULL,
  `code` varchar(30) default NULL,
  `state` varchar(30) default NULL,
  `pobox` varchar(30) default NULL,
  `country` varchar(30) default NULL,
  `phone` varchar(50) default NULL,
  `mobile` varchar(50) default NULL,
  `fax` varchar(50) default NULL,
  `lane` varchar(250) default NULL,
  `leadaddresstype` varchar(30) default 'Billing',
  PRIMARY KEY  (`leadaddressid`),
  CONSTRAINT `fk_1_vtiger_leadaddress` FOREIGN KEY (`leadaddressid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadaddress` */

insert  into `vtiger_leadaddress`(`leadaddressid`,`city`,`code`,`state`,`pobox`,`country`,`phone`,`mobile`,`fax`,`lane`,`leadaddresstype`) values (99,'Bangalore','560102','Karnatka','','India','919916024765','919916024765','','','Billing');

/*Table structure for table `vtiger_leadcontrel` */

DROP TABLE IF EXISTS `vtiger_leadcontrel`;

CREATE TABLE `vtiger_leadcontrel` (
  `leadid` int(19) NOT NULL default '0',
  `contactid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`leadid`),
  KEY `leadcontrel_contactid_idx` (`contactid`),
  CONSTRAINT `fk_2_vtiger_leadcontrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadcontrel` */

/*Table structure for table `vtiger_leaddetails` */

DROP TABLE IF EXISTS `vtiger_leaddetails`;

CREATE TABLE `vtiger_leaddetails` (
  `leadid` int(19) NOT NULL,
  `lead_no` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `interest` varchar(50) default NULL,
  `firstname` varchar(40) default NULL,
  `salutation` varchar(200) default NULL,
  `lastname` varchar(80) NOT NULL,
  `company` varchar(100) NOT NULL,
  `annualrevenue` int(19) default '0',
  `industry` varchar(200) default NULL,
  `campaign` varchar(30) default NULL,
  `rating` varchar(200) default NULL,
  `leadstatus` varchar(50) default NULL,
  `leadsource` varchar(200) default NULL,
  `converted` int(1) default '0',
  `designation` varchar(50) default 'SalesMan',
  `licencekeystatus` varchar(50) default NULL,
  `space` varchar(250) default NULL,
  `comments` text,
  `priority` varchar(50) default NULL,
  `demorequest` varchar(50) default NULL,
  `partnercontact` varchar(50) default NULL,
  `productversion` varchar(20) default NULL,
  `product` varchar(50) default NULL,
  `maildate` date default NULL,
  `nextstepdate` date default NULL,
  `fundingsituation` varchar(50) default NULL,
  `purpose` varchar(50) default NULL,
  `evaluationstatus` varchar(50) default NULL,
  `transferdate` date default NULL,
  `revenuetype` varchar(50) default NULL,
  `noofemployees` int(50) default NULL,
  `yahooid` varchar(100) default NULL,
  `assignleadchk` int(1) default '0',
  PRIMARY KEY  (`leadid`),
  KEY `leaddetails_converted_leadstatus_idx` (`converted`,`leadstatus`),
  CONSTRAINT `fk_1_vtiger_leaddetails` FOREIGN KEY (`leadid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leaddetails` */

insert  into `vtiger_leaddetails`(`leadid`,`lead_no`,`email`,`interest`,`firstname`,`salutation`,`lastname`,`company`,`annualrevenue`,`industry`,`campaign`,`rating`,`leadstatus`,`leadsource`,`converted`,`designation`,`licencekeystatus`,`space`,`comments`,`priority`,`demorequest`,`partnercontact`,`productversion`,`product`,`maildate`,`nextstepdate`,`fundingsituation`,`purpose`,`evaluationstatus`,`transferdate`,`revenuetype`,`noofemployees`,`yahooid`,`assignleadchk`) values (99,'LEA1','',NULL,'','Mr.','Gupta','Treewalker Technologies Pvt. Ltd.',0,'--None--',NULL,'--None--','--None--','--None--',0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0);

/*Table structure for table `vtiger_leadpotrel` */

DROP TABLE IF EXISTS `vtiger_leadpotrel`;

CREATE TABLE `vtiger_leadpotrel` (
  `leadid` int(19) NOT NULL default '0',
  `potentialid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`potentialid`),
  UNIQUE KEY `leadpotrel_leadid_idx` (`leadid`),
  CONSTRAINT `fk_2_vtiger_leadpotrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadpotrel` */

/*Table structure for table `vtiger_leadscf` */

DROP TABLE IF EXISTS `vtiger_leadscf`;

CREATE TABLE `vtiger_leadscf` (
  `leadid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`leadid`),
  CONSTRAINT `fk_1_vtiger_leadscf` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadscf` */

insert  into `vtiger_leadscf`(`leadid`) values (99);

/*Table structure for table `vtiger_leadsource` */

DROP TABLE IF EXISTS `vtiger_leadsource`;

CREATE TABLE `vtiger_leadsource` (
  `leadsourceid` int(19) NOT NULL auto_increment,
  `leadsource` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`leadsourceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadsource` */

insert  into `vtiger_leadsource`(`leadsourceid`,`leadsource`,`presence`,`picklist_valueid`) values (1,'--None--',1,98),(2,'Cold Call',1,99),(3,'Existing Customer',1,100),(4,'Self Generated',1,101),(5,'Employee',1,102),(6,'Partner',1,103),(7,'Public Relations',1,104),(8,'Direct Mail',1,105),(9,'Conference',1,106),(10,'Trade Show',1,107),(11,'Web Site',1,108),(12,'Word of mouth',1,109),(13,'Other',1,110);

/*Table structure for table `vtiger_leadsource_seq` */

DROP TABLE IF EXISTS `vtiger_leadsource_seq`;

CREATE TABLE `vtiger_leadsource_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadsource_seq` */

insert  into `vtiger_leadsource_seq`(`id`) values (13);

/*Table structure for table `vtiger_leadstage` */

DROP TABLE IF EXISTS `vtiger_leadstage`;

CREATE TABLE `vtiger_leadstage` (
  `leadstageid` int(19) NOT NULL auto_increment,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`leadstageid`),
  UNIQUE KEY `leadstage_stage_idx` (`stage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadstage` */

/*Table structure for table `vtiger_leadstatus` */

DROP TABLE IF EXISTS `vtiger_leadstatus`;

CREATE TABLE `vtiger_leadstatus` (
  `leadstatusid` int(19) NOT NULL auto_increment,
  `leadstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`leadstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadstatus` */

insert  into `vtiger_leadstatus`(`leadstatusid`,`leadstatus`,`presence`,`picklist_valueid`) values (1,'--None--',1,111),(2,'Attempted to Contact',1,112),(3,'Cold',1,113),(4,'Contact in Future',1,114),(5,'Contacted',1,115),(6,'Hot',1,116),(7,'Junk Lead',1,117),(8,'Lost Lead',1,118),(9,'Not Contacted',1,119),(10,'Pre Qualified',1,120),(11,'Qualified',1,121),(12,'Warm',1,122);

/*Table structure for table `vtiger_leadstatus_seq` */

DROP TABLE IF EXISTS `vtiger_leadstatus_seq`;

CREATE TABLE `vtiger_leadstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadstatus_seq` */

insert  into `vtiger_leadstatus_seq`(`id`) values (12);

/*Table structure for table `vtiger_leadsubdetails` */

DROP TABLE IF EXISTS `vtiger_leadsubdetails`;

CREATE TABLE `vtiger_leadsubdetails` (
  `leadsubscriptionid` int(19) NOT NULL default '0',
  `website` varchar(255) default NULL,
  `callornot` int(1) default '0',
  `readornot` int(1) default '0',
  `empct` int(10) default '0',
  PRIMARY KEY  (`leadsubscriptionid`),
  CONSTRAINT `fk_1_vtiger_leadsubdetails` FOREIGN KEY (`leadsubscriptionid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_leadsubdetails` */

insert  into `vtiger_leadsubdetails`(`leadsubscriptionid`,`website`,`callornot`,`readornot`,`empct`) values (99,'',0,0,0);

/*Table structure for table `vtiger_licencekeystatus` */

DROP TABLE IF EXISTS `vtiger_licencekeystatus`;

CREATE TABLE `vtiger_licencekeystatus` (
  `licencekeystatusid` int(19) NOT NULL auto_increment,
  `licencekeystatus` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`licencekeystatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_licencekeystatus` */

/*Table structure for table `vtiger_links` */

DROP TABLE IF EXISTS `vtiger_links`;

CREATE TABLE `vtiger_links` (
  `linkid` int(11) NOT NULL,
  `tabid` int(11) default NULL,
  `linktype` varchar(20) default NULL,
  `linklabel` varchar(30) default NULL,
  `linkurl` varchar(255) default NULL,
  `linkicon` varchar(100) default NULL,
  `sequence` int(11) default NULL,
  PRIMARY KEY  (`linkid`),
  KEY `link_tabidtype_idx` (`tabid`,`linktype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_links` */

insert  into `vtiger_links`(`linkid`,`tabid`,`linktype`,`linklabel`,`linkurl`,`linkicon`,`sequence`) values (1,6,'DETAILVIEWBASIC','LBL_ADD_NOTE','index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$','themes/images/bookMark.gif',0),(2,6,'DETAILVIEWBASIC','LBL_SHOW_ACCOUNT_HIERARCHY','index.php?module=Accounts&action=AccountHierarchy&accountid=$RECORD$','',0),(3,7,'DETAILVIEWBASIC','LBL_ADD_NOTE','index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$','themes/images/bookMark.gif',0),(4,4,'DETAILVIEWBASIC','LBL_ADD_NOTE','index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$','themes/images/bookMark.gif',0),(5,38,'HEADERSCRIPT','ModCommentsCommonHeaderScript','modules/ModComments/ModCommentsCommon.js','',0),(6,7,'DETAILVIEWWIDGET','DetailViewBlockCommentWidget','block://ModComments:modules/ModComments/ModComments.php','',0),(7,4,'DETAILVIEWWIDGET','DetailViewBlockCommentWidget','block://ModComments:modules/ModComments/ModComments.php','',0),(8,6,'DETAILVIEWWIDGET','DetailViewBlockCommentWidget','block://ModComments:modules/ModComments/ModComments.php','',0),(9,40,'DETAILVIEWBASIC','Add Note','index.php?module=Documents&action=EditView&return_module=ProjectTask&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$','',0),(10,40,'DETAILVIEWWIDGET','DetailViewBlockCommentWidget','block://ModComments:modules/ModComments/ModComments.php','',0),(11,41,'DETAILVIEWBASIC','Add Project Task','index.php?module=ProjectTask&action=EditView&projectid=$RECORD$&return_module=Project&return_action=DetailView&return_id=$RECORD$','',0),(12,41,'DETAILVIEWBASIC','Add Note','index.php?module=Documents&action=EditView&return_module=Project&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$','',1),(13,41,'DETAILVIEWWIDGET','DetailViewBlockCommentWidget','block://ModComments:modules/ModComments/ModComments.php','',0),(14,43,'DETAILVIEWBASIC','LBL_CHECK_STATUS','javascript:SMSNotifier.checkstatus($RECORD$)','themes/images/reload.gif',0),(23,44,'HEADERSCRIPT','ToolTip_HeaderScript','modules/Tooltip/TooltipHeaderScript.js','',0);

/*Table structure for table `vtiger_links_seq` */

DROP TABLE IF EXISTS `vtiger_links_seq`;

CREATE TABLE `vtiger_links_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_links_seq` */

insert  into `vtiger_links_seq`(`id`) values (23);

/*Table structure for table `vtiger_loginhistory` */

DROP TABLE IF EXISTS `vtiger_loginhistory`;

CREATE TABLE `vtiger_loginhistory` (
  `login_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(25) NOT NULL,
  `user_ip` varchar(25) NOT NULL,
  `logout_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `login_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `status` varchar(25) default NULL,
  PRIMARY KEY  (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_loginhistory` */

insert  into `vtiger_loginhistory`(`login_id`,`user_name`,`user_ip`,`logout_time`,`login_time`,`status`) values (1,'admin','127.0.0.1','2012-07-03 20:51:37','2012-07-03 11:31:43','Signed off'),(2,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-03 20:53:18','Signed in'),(3,'store1','127.0.0.1','0000-00-00 00:00:00','2012-07-03 21:26:52','Signed in'),(4,'admin','127.0.0.1','2012-07-04 15:59:14','2012-07-04 11:46:16','Signed off'),(5,'store1','127.0.0.1','2012-07-04 16:06:09','2012-07-04 15:59:41','Signed off'),(6,'admin','127.0.0.1','2012-07-04 16:01:48','2012-07-04 16:01:28','Signed off'),(7,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-04 16:01:57','Signed in'),(8,'admin','127.0.0.1','2012-07-04 21:08:13','2012-07-04 16:06:16','Signed off'),(9,'store1','127.0.0.1','0000-00-00 00:00:00','2012-07-04 16:22:35','Signed in'),(10,'store1','127.0.0.1','0000-00-00 00:00:00','2012-07-04 21:08:28','Signed in'),(11,'store1','127.0.0.1','0000-00-00 00:00:00','2012-07-05 12:36:18','Signed in'),(12,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-05 12:38:42','Signed in'),(13,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-07 00:56:20','Signed in'),(14,'admin','127.0.0.1','2012-07-07 08:40:00','2012-07-07 08:39:26','Signed off'),(15,'store1','127.0.0.1','0000-00-00 00:00:00','2012-07-07 08:40:18','Signed in'),(16,'admin','127.0.0.1','2012-07-16 13:42:05','2012-07-16 13:23:58','Signed off'),(17,'store1','127.0.0.1','2012-07-16 13:45:44','2012-07-16 13:42:26','Signed off'),(18,'admin','127.0.0.1','2012-07-16 19:29:25','2012-07-16 13:46:10','Signed off'),(19,'store1','127.0.0.1','2012-07-16 19:37:10','2012-07-16 19:29:42','Signed off'),(20,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-16 19:37:24','Signed in'),(21,'store1','127.0.0.1','2012-07-18 21:44:19','2012-07-18 21:12:59','Signed off'),(22,'admin','127.0.0.1','2012-07-18 21:44:58','2012-07-18 21:44:34','Signed off'),(23,'admin','127.0.0.1','2012-07-18 21:46:14','2012-07-18 21:45:48','Signed off'),(24,'admin','127.0.0.1','2012-07-18 21:47:18','2012-07-18 21:46:41','Signed off'),(25,'warehouse1','127.0.0.1','2012-07-18 16:51:07','2012-07-18 21:47:34','Signed off'),(26,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-18 16:51:13','Signed in'),(27,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-22 09:33:15','Signed in'),(28,'admin','127.0.0.1','2012-07-25 17:01:26','2012-07-25 17:01:17','Signed off'),(29,'admin','127.0.0.1','2012-07-25 17:13:05','2012-07-25 17:02:21','Signed off'),(30,'store1','127.0.0.1','2012-07-25 17:29:59','2012-07-25 17:13:12','Signed off'),(31,'admin','127.0.0.1','0000-00-00 00:00:00','2012-07-25 17:30:05','Signed in'),(32,'admin','127.0.0.1','2012-07-28 14:58:22','2012-07-28 14:55:07','Signed off'),(33,'store1','127.0.0.1','0000-00-00 00:00:00','2012-07-28 14:59:20','Signed in'),(34,'admin','127.0.0.1','0000-00-00 00:00:00','2012-08-02 20:24:08','Signed in'),(35,'admin','127.0.0.1','2012-08-03 23:22:04','2012-08-03 14:27:59','Signed off'),(36,'admin','127.0.0.1','2012-08-04 13:05:22','2012-08-04 12:57:40','Signed off'),(37,'admin','127.0.0.1','2012-08-05 22:59:36','2012-08-04 13:05:26','Signed off'),(38,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-05 22:59:44','Signed in'),(39,'admin','127.0.0.1','2012-08-06 11:50:42','2012-08-06 11:50:35','Signed off'),(40,'store1','127.0.0.1','2012-08-06 12:10:14','2012-08-06 11:50:49','Signed off'),(41,'admin','127.0.0.1','2012-08-06 12:54:27','2012-08-06 12:10:21','Signed off'),(42,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-06 12:54:33','Signed in'),(43,'admin','127.0.0.1','2012-08-06 17:06:30','2012-08-06 17:00:56','Signed off'),(44,'store1','127.0.0.1','2012-08-06 17:11:27','2012-08-06 17:06:36','Signed off'),(45,'store1','127.0.0.1','2012-08-06 23:03:16','2012-08-06 23:01:10','Signed off'),(46,'admin','127.0.0.1','2012-08-06 23:04:22','2012-08-06 23:03:21','Signed off'),(47,'store1','127.0.0.1','2012-08-06 23:05:03','2012-08-06 23:04:28','Signed off'),(48,'admin','127.0.0.1','2012-08-06 23:17:11','2012-08-06 23:05:07','Signed off'),(49,'store1','127.0.0.1','2012-08-07 13:37:59','2012-08-06 23:17:20','Signed off'),(50,'admin','127.0.0.1','0000-00-00 00:00:00','2012-08-07 13:38:04','Signed in'),(51,'admin','127.0.0.1','2012-08-07 16:24:45','2012-08-07 13:45:06','Signed off'),(52,'admin','127.0.0.1','2012-08-07 18:29:22','2012-08-07 18:28:35','Signed off'),(53,'store1','127.0.0.1','2012-08-07 18:29:56','2012-08-07 18:29:32','Signed off'),(54,'admin','127.0.0.1','0000-00-00 00:00:00','2012-08-07 18:30:01','Signed in'),(55,'admin','127.0.0.1','2012-08-08 12:39:50','2012-08-08 12:37:02','Signed off'),(56,'store1','127.0.0.1','2012-08-08 12:41:36','2012-08-08 12:39:58','Signed off'),(57,'admin','127.0.0.1','2012-08-08 18:05:19','2012-08-08 12:41:44','Signed off'),(58,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-08 18:05:28','Signed in'),(59,'admin','127.0.0.1','2012-08-14 11:37:38','2012-08-14 11:31:16','Signed off'),(60,'store1','127.0.0.1','2012-08-14 11:39:08','2012-08-14 11:37:45','Signed off'),(61,'admin','127.0.0.1','0000-00-00 00:00:00','2012-08-14 11:39:16','Signed in'),(62,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-17 01:04:20','Signed in'),(63,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-17 23:59:11','Signed in'),(64,'admin','127.0.0.1','2012-08-21 17:58:37','2012-08-21 17:58:23','Signed off'),(65,'admin','127.0.0.1','0000-00-00 00:00:00','2012-08-21 18:08:54','Signed in'),(66,'admin','127.0.0.1','2012-08-23 18:10:47','2012-08-23 18:04:06','Signed off'),(67,'store1','127.0.0.1','2012-08-23 18:19:54','2012-08-23 18:10:55','Signed off'),(68,'admin','127.0.0.1','0000-00-00 00:00:00','2012-08-23 18:23:14','Signed in'),(69,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-25 13:08:11','Signed in'),(70,'store1','127.0.0.1','0000-00-00 00:00:00','2012-08-28 01:11:25','Signed in'),(71,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-04 13:05:27','Signed in'),(72,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-06 15:23:27','Signed in'),(73,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-06 15:43:51','Signed in'),(74,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-07 17:23:09','Signed in'),(75,'store1','127.0.0.1','2012-09-08 16:32:32','2012-09-08 16:31:13','Signed off'),(76,'admin','127.0.0.1','2012-09-08 16:59:55','2012-09-08 16:32:38','Signed off'),(77,'admin','127.0.0.1','2012-09-08 17:03:15','2012-09-08 16:59:58','Signed off'),(78,'store1','127.0.0.1','2012-09-08 17:09:53','2012-09-08 17:03:22','Signed off'),(79,'store1','127.0.0.1','2012-09-08 17:12:24','2012-09-08 17:10:31','Signed off'),(80,'admin','127.0.0.1','2012-09-08 17:15:06','2012-09-08 17:12:30','Signed off'),(81,'store1','127.0.0.1','2012-09-08 17:38:19','2012-09-08 17:15:12','Signed off'),(82,'admin','127.0.0.1','2012-09-08 17:50:11','2012-09-08 17:43:48','Signed off'),(83,'store1','127.0.0.1','2012-09-08 17:57:53','2012-09-08 17:50:33','Signed off'),(84,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-08 17:58:00','Signed in'),(85,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-08 22:40:41','Signed in'),(86,'store1','127.0.0.1','2012-09-21 15:55:10','2012-09-21 13:56:03','Signed off'),(87,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-21 15:55:25','Signed in'),(88,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-24 23:30:56','Signed in'),(89,'admin','127.0.0.1','0000-00-00 00:00:00','2012-09-24 23:40:59','Signed in'),(90,'admin','127.0.0.1','2012-10-05 14:45:23','2012-10-05 14:34:48','Signed off'),(91,'store1','127.0.0.1','2012-10-05 14:51:29','2012-10-05 14:45:40','Signed off'),(92,'admin','127.0.0.1','2012-10-05 14:52:53','2012-10-05 14:51:35','Signed off'),(93,'store1','127.0.0.1','2012-10-05 15:00:55','2012-10-05 14:52:58','Signed off'),(94,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-05 15:01:00','Signed in'),(95,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-09 08:53:01','Signed in'),(96,'admin','127.0.0.1','2012-10-10 16:07:58','2012-10-10 16:04:00','Signed off'),(97,'store1','127.0.0.1','2012-10-10 16:14:36','2012-10-10 16:08:07','Signed off'),(98,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-10 16:14:42','Signed in'),(99,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-19 17:12:35','Signed in'),(100,'admin','127.0.0.1','2012-10-20 15:26:28','2012-10-20 15:24:01','Signed off'),(101,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-20 15:26:44','Signed in'),(102,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-22 00:16:25','Signed in'),(103,'admin','127.0.0.1','2012-10-22 12:49:36','2012-10-22 12:49:13','Signed off'),(104,'store1','127.0.0.1','2012-10-22 13:21:47','2012-10-22 12:49:45','Signed off'),(105,'store1','127.0.0.1','2012-10-22 23:38:16','2012-10-22 19:49:27','Signed off'),(106,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-22 23:38:22','Signed in'),(107,'admin','127.0.0.1','2012-10-23 00:28:45','2012-10-22 23:50:26','Signed off'),(108,'store1','127.0.0.1','0000-00-00 00:00:00','2012-10-23 00:28:57','Signed in'),(109,'admin','127.0.0.1','2012-10-23 10:10:26','2012-10-23 09:59:30','Signed off'),(110,'admin','127.0.0.1','2012-10-23 10:14:42','2012-10-23 10:10:47','Signed off'),(111,'store1','127.0.0.1','2012-10-23 10:17:56','2012-10-23 10:14:48','Signed off'),(112,'admin','127.0.0.1','2012-10-23 10:24:30','2012-10-23 10:18:02','Signed off'),(113,'store1','127.0.0.1','2012-10-23 10:26:17','2012-10-23 10:24:38','Signed off'),(114,'admin','127.0.0.1','2012-10-23 10:37:25','2012-10-23 10:26:23','Signed off'),(115,'store1','127.0.0.1','2012-10-23 10:39:14','2012-10-23 10:37:32','Signed off'),(116,'admin','127.0.0.1','2012-10-23 16:23:37','2012-10-23 10:39:21','Signed off'),(117,'admin','127.0.0.1','0000-00-00 00:00:00','2012-10-23 16:23:50','Signed in'),(118,'admin','127.0.0.1','0000-00-00 00:00:00','2012-12-24 17:23:49','Signed in');

/*Table structure for table `vtiger_mail_accounts` */

DROP TABLE IF EXISTS `vtiger_mail_accounts`;

CREATE TABLE `vtiger_mail_accounts` (
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `display_name` varchar(50) default NULL,
  `mail_id` varchar(50) default NULL,
  `account_name` varchar(50) default NULL,
  `mail_protocol` varchar(20) default NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(250) NOT NULL,
  `mail_servername` varchar(50) default NULL,
  `box_refresh` int(10) default NULL,
  `mails_per_page` int(10) default NULL,
  `ssltype` varchar(50) default NULL,
  `sslmeth` varchar(50) default NULL,
  `int_mailer` int(1) default '0',
  `status` varchar(10) default NULL,
  `set_default` int(2) default NULL,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mail_accounts` */

/*Table structure for table `vtiger_mail_accounts_seq` */

DROP TABLE IF EXISTS `vtiger_mail_accounts_seq`;

CREATE TABLE `vtiger_mail_accounts_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mail_accounts_seq` */

/*Table structure for table `vtiger_mailscanner` */

DROP TABLE IF EXISTS `vtiger_mailscanner`;

CREATE TABLE `vtiger_mailscanner` (
  `scannerid` int(11) NOT NULL auto_increment,
  `scannername` varchar(30) default NULL,
  `server` varchar(100) default NULL,
  `protocol` varchar(10) default NULL,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `ssltype` varchar(10) default NULL,
  `sslmethod` varchar(30) default NULL,
  `connecturl` varchar(255) default NULL,
  `searchfor` varchar(10) default NULL,
  `markas` varchar(10) default NULL,
  `isvalid` int(1) default NULL,
  PRIMARY KEY  (`scannerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mailscanner` */

/*Table structure for table `vtiger_mailscanner_actions` */

DROP TABLE IF EXISTS `vtiger_mailscanner_actions`;

CREATE TABLE `vtiger_mailscanner_actions` (
  `actionid` int(11) NOT NULL auto_increment,
  `scannerid` int(11) default NULL,
  `actiontype` varchar(10) default NULL,
  `module` varchar(30) default NULL,
  `lookup` varchar(30) default NULL,
  `sequence` int(11) default NULL,
  PRIMARY KEY  (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mailscanner_actions` */

/*Table structure for table `vtiger_mailscanner_folders` */

DROP TABLE IF EXISTS `vtiger_mailscanner_folders`;

CREATE TABLE `vtiger_mailscanner_folders` (
  `folderid` int(11) NOT NULL auto_increment,
  `scannerid` int(11) default NULL,
  `foldername` varchar(255) default NULL,
  `lastscan` varchar(30) default NULL,
  `rescan` int(1) default NULL,
  `enabled` int(1) default NULL,
  PRIMARY KEY  (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mailscanner_folders` */

/*Table structure for table `vtiger_mailscanner_ids` */

DROP TABLE IF EXISTS `vtiger_mailscanner_ids`;

CREATE TABLE `vtiger_mailscanner_ids` (
  `scannerid` int(11) default NULL,
  `messageid` text,
  `crmid` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mailscanner_ids` */

/*Table structure for table `vtiger_mailscanner_ruleactions` */

DROP TABLE IF EXISTS `vtiger_mailscanner_ruleactions`;

CREATE TABLE `vtiger_mailscanner_ruleactions` (
  `ruleid` int(11) default NULL,
  `actionid` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mailscanner_ruleactions` */

/*Table structure for table `vtiger_mailscanner_rules` */

DROP TABLE IF EXISTS `vtiger_mailscanner_rules`;

CREATE TABLE `vtiger_mailscanner_rules` (
  `ruleid` int(11) NOT NULL auto_increment,
  `scannerid` int(11) default NULL,
  `fromaddress` varchar(255) default NULL,
  `toaddress` varchar(255) default NULL,
  `subjectop` varchar(20) default NULL,
  `subject` varchar(255) default NULL,
  `bodyop` varchar(20) default NULL,
  `body` varchar(255) default NULL,
  `matchusing` varchar(5) default NULL,
  `sequence` int(11) default NULL,
  PRIMARY KEY  (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_mailscanner_rules` */

/*Table structure for table `vtiger_manufacturer` */

DROP TABLE IF EXISTS `vtiger_manufacturer`;

CREATE TABLE `vtiger_manufacturer` (
  `manufacturerid` int(19) NOT NULL auto_increment,
  `manufacturer` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`manufacturerid`),
  UNIQUE KEY `manufacturer_manufacturer_idx` (`manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_manufacturer` */

insert  into `vtiger_manufacturer`(`manufacturerid`,`manufacturer`,`presence`,`picklist_valueid`) values (1,'--None--',1,123),(2,'AltvetPet Inc.',1,124),(3,'LexPon Inc.',1,125),(4,'MetBeat Corp',1,126);

/*Table structure for table `vtiger_manufacturer_seq` */

DROP TABLE IF EXISTS `vtiger_manufacturer_seq`;

CREATE TABLE `vtiger_manufacturer_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_manufacturer_seq` */

insert  into `vtiger_manufacturer_seq`(`id`) values (4);

/*Table structure for table `vtiger_mobile_alerts` */

DROP TABLE IF EXISTS `vtiger_mobile_alerts`;

CREATE TABLE `vtiger_mobile_alerts` (
  `id` int(11) NOT NULL auto_increment,
  `handler_path` varchar(500) default NULL,
  `handler_class` varchar(50) default NULL,
  `sequence` int(11) default NULL,
  `deleted` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_mobile_alerts` */

insert  into `vtiger_mobile_alerts`(`id`,`handler_path`,`handler_class`,`sequence`,`deleted`) values (1,'modules/Mobile/api/ws/models/alerts/IdleTicketsOfMine.php','Mobile_WS_AlertModel_IdleTicketsOfMine',NULL,0),(2,'modules/Mobile/api/ws/models/alerts/NewTicketOfMine.php','Mobile_WS_AlertModel_NewTicketOfMine',NULL,0),(3,'modules/Mobile/api/ws/models/alerts/PendingTicketsOfMine.php','Mobile_WS_AlertModel_PendingTicketsOfMine',NULL,0),(4,'modules/Mobile/api/ws/models/alerts/PotentialsDueIn5Days.php','Mobile_WS_AlertModel_PotentialsDueIn5Days',NULL,0),(5,'modules/Mobile/api/ws/models/alerts/EventsOfMineToday.php','Mobile_WS_AlertModel_EventsOfMineToday',NULL,0);

/*Table structure for table `vtiger_modcomments` */

DROP TABLE IF EXISTS `vtiger_modcomments`;

CREATE TABLE `vtiger_modcomments` (
  `modcommentsid` int(11) default NULL,
  `commentcontent` text,
  `related_to` varchar(100) NOT NULL,
  `parent_comments` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_modcomments` */

/*Table structure for table `vtiger_modcommentscf` */

DROP TABLE IF EXISTS `vtiger_modcommentscf`;

CREATE TABLE `vtiger_modcommentscf` (
  `modcommentsid` int(11) NOT NULL,
  PRIMARY KEY  (`modcommentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_modcommentscf` */

/*Table structure for table `vtiger_modentity_num` */

DROP TABLE IF EXISTS `vtiger_modentity_num`;

CREATE TABLE `vtiger_modentity_num` (
  `num_id` int(19) NOT NULL,
  `semodule` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL default '',
  `start_id` varchar(50) NOT NULL,
  `cur_id` varchar(50) NOT NULL,
  `active` varchar(2) NOT NULL,
  PRIMARY KEY  (`num_id`),
  UNIQUE KEY `num_idx` (`num_id`),
  KEY `semodule_active_idx` (`semodule`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_modentity_num` */

insert  into `vtiger_modentity_num`(`num_id`,`semodule`,`prefix`,`start_id`,`cur_id`,`active`) values (1,'Leads','LEA','1','2','1'),(2,'Accounts','ACC','1','1','1'),(3,'Campaigns','CAM','1','1','1'),(4,'Contacts','CON','1','5','1'),(5,'Potentials','POT','1','1','1'),(6,'HelpDesk','TT','1','1','1'),(7,'Quotes','QUO','1','1','1'),(8,'SalesOrder','SO','1','1','1'),(9,'PurchaseOrder','PO','1','5','1'),(10,'Invoice','INV','1','41','1'),(11,'Products','PRO','1','21','1'),(12,'Vendors','VEN','1','2','1'),(13,'PriceBooks','PB','1','1','1'),(14,'Faq','FAQ','1','1','1'),(15,'Documents','DOC','1','1','1'),(16,'ServiceContracts','SERCON','1','1','1'),(17,'Services','SER','1','1','1');

/*Table structure for table `vtiger_modentity_num_seq` */

DROP TABLE IF EXISTS `vtiger_modentity_num_seq`;

CREATE TABLE `vtiger_modentity_num_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_modentity_num_seq` */

insert  into `vtiger_modentity_num_seq`(`id`) values (17);

/*Table structure for table `vtiger_moduleowners` */

DROP TABLE IF EXISTS `vtiger_moduleowners`;

CREATE TABLE `vtiger_moduleowners` (
  `tabid` int(19) NOT NULL default '0',
  `user_id` varchar(11) NOT NULL,
  PRIMARY KEY  (`tabid`),
  KEY `moduleowners_tabid_user_id_idx` (`tabid`,`user_id`),
  CONSTRAINT `fk_1_vtiger_moduleowners` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_moduleowners` */

insert  into `vtiger_moduleowners`(`tabid`,`user_id`) values (2,'1'),(4,'1'),(6,'1'),(7,'1'),(8,'1'),(9,'1'),(10,'1'),(13,'1'),(14,'1'),(15,'1'),(18,'1'),(19,'1'),(20,'1'),(21,'1'),(22,'1'),(23,'1'),(25,'1'),(26,'1');

/*Table structure for table `vtiger_notebook_contents` */

DROP TABLE IF EXISTS `vtiger_notebook_contents`;

CREATE TABLE `vtiger_notebook_contents` (
  `userid` int(19) NOT NULL,
  `notebookid` int(19) NOT NULL,
  `contents` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_notebook_contents` */

/*Table structure for table `vtiger_notes` */

DROP TABLE IF EXISTS `vtiger_notes`;

CREATE TABLE `vtiger_notes` (
  `notesid` int(19) NOT NULL default '0',
  `note_no` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `filename` varchar(200) default NULL,
  `notecontent` text,
  `folderid` int(19) NOT NULL default '1',
  `filetype` varchar(50) default NULL,
  `filelocationtype` varchar(5) default NULL,
  `filedownloadcount` int(19) default NULL,
  `filestatus` int(19) default NULL,
  `filesize` int(19) NOT NULL default '0',
  `fileversion` varchar(50) default NULL,
  PRIMARY KEY  (`notesid`),
  KEY `notes_title_idx` (`title`),
  KEY `notes_notesid_idx` (`notesid`),
  CONSTRAINT `fk_1_vtiger_notes` FOREIGN KEY (`notesid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_notes` */

/*Table structure for table `vtiger_notescf` */

DROP TABLE IF EXISTS `vtiger_notescf`;

CREATE TABLE `vtiger_notescf` (
  `notesid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`notesid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_notescf` */

/*Table structure for table `vtiger_notificationscheduler` */

DROP TABLE IF EXISTS `vtiger_notificationscheduler`;

CREATE TABLE `vtiger_notificationscheduler` (
  `schedulednotificationid` int(19) NOT NULL auto_increment,
  `schedulednotificationname` varchar(200) default NULL,
  `active` int(1) default NULL,
  `notificationsubject` varchar(200) default NULL,
  `notificationbody` text,
  `label` varchar(50) default NULL,
  `type` varchar(10) default NULL,
  PRIMARY KEY  (`schedulednotificationid`),
  UNIQUE KEY `notificationscheduler_schedulednotificationname_idx` (`schedulednotificationname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_notificationscheduler` */

insert  into `vtiger_notificationscheduler`(`schedulednotificationid`,`schedulednotificationname`,`active`,`notificationsubject`,`notificationbody`,`label`,`type`) values (1,'LBL_TASK_NOTIFICATION_DESCRITPION',1,'Task Delay Notification','Tasks delayed beyond 24 hrs ','LBL_TASK_NOTIFICATION',NULL),(2,'LBL_BIG_DEAL_DESCRIPTION',1,'Big Deal notification','Success! A big deal has been won! ','LBL_BIG_DEAL',NULL),(3,'LBL_TICKETS_DESCRIPTION',1,'Pending Tickets notification','Ticket pending please ','LBL_PENDING_TICKETS',NULL),(4,'LBL_MANY_TICKETS_DESCRIPTION',1,'Too many tickets Notification','Too many tickets pending against this entity ','LBL_MANY_TICKETS',NULL),(5,'LBL_START_DESCRIPTION',1,'Support Start Notification','10','LBL_START_NOTIFICATION','select'),(6,'LBL_SUPPORT_DESCRIPTION',1,'Support ending please','11','LBL_SUPPORT_NOTICIATION','select'),(7,'LBL_SUPPORT_DESCRIPTION_MONTH',1,'Support ending please','12','LBL_SUPPORT_NOTICIATION_MONTH','select'),(8,'LBL_ACTIVITY_REMINDER_DESCRIPTION',1,'Activity Reminder Notification','This is a reminder notification for the Activity','LBL_ACTIVITY_NOTIFICATION',NULL);

/*Table structure for table `vtiger_notificationscheduler_seq` */

DROP TABLE IF EXISTS `vtiger_notificationscheduler_seq`;

CREATE TABLE `vtiger_notificationscheduler_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_notificationscheduler_seq` */

insert  into `vtiger_notificationscheduler_seq`(`id`) values (8);

/*Table structure for table `vtiger_opportunity_type` */

DROP TABLE IF EXISTS `vtiger_opportunity_type`;

CREATE TABLE `vtiger_opportunity_type` (
  `opptypeid` int(19) NOT NULL auto_increment,
  `opportunity_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`opptypeid`),
  UNIQUE KEY `opportunity_type_opportunity_type_idx` (`opportunity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_opportunity_type` */

insert  into `vtiger_opportunity_type`(`opptypeid`,`opportunity_type`,`presence`,`picklist_valueid`) values (1,'--None--',1,127),(2,'Existing Business',1,128),(3,'New Business',1,129);

/*Table structure for table `vtiger_opportunity_type_seq` */

DROP TABLE IF EXISTS `vtiger_opportunity_type_seq`;

CREATE TABLE `vtiger_opportunity_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_opportunity_type_seq` */

insert  into `vtiger_opportunity_type_seq`(`id`) values (3);

/*Table structure for table `vtiger_opportunitystage` */

DROP TABLE IF EXISTS `vtiger_opportunitystage`;

CREATE TABLE `vtiger_opportunitystage` (
  `potstageid` int(19) NOT NULL auto_increment,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  `probability` decimal(3,2) default '0.00',
  PRIMARY KEY  (`potstageid`),
  UNIQUE KEY `opportunitystage_stage_idx` (`stage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_opportunitystage` */

/*Table structure for table `vtiger_org_share_action2tab` */

DROP TABLE IF EXISTS `vtiger_org_share_action2tab`;

CREATE TABLE `vtiger_org_share_action2tab` (
  `share_action_id` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  PRIMARY KEY  (`share_action_id`,`tabid`),
  KEY `fk_2_vtiger_org_share_action2tab` (`tabid`),
  CONSTRAINT `fk_2_vtiger_org_share_action2tab` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_org_share_action2tab` */

insert  into `vtiger_org_share_action2tab`(`share_action_id`,`tabid`) values (0,2),(1,2),(2,2),(3,2),(0,4),(1,4),(2,4),(3,4),(0,6),(1,6),(2,6),(3,6),(0,7),(1,7),(2,7),(3,7),(0,8),(1,8),(2,8),(3,8),(0,9),(1,9),(2,9),(3,9),(0,10),(1,10),(2,10),(3,10),(0,13),(1,13),(2,13),(3,13),(0,16),(1,16),(2,16),(3,16),(0,20),(1,20),(2,20),(3,20),(0,21),(1,21),(2,21),(3,21),(0,22),(1,22),(2,22),(3,22),(0,23),(1,23),(2,23),(3,23),(0,26),(1,26),(2,26),(3,26),(0,31),(1,31),(2,31),(3,31),(0,32),(1,32),(2,32),(3,32),(0,33),(1,33),(2,33),(3,33),(0,35),(1,35),(2,35),(3,35),(0,38),(1,38),(2,38),(3,38),(0,39),(1,39),(2,39),(3,39),(0,40),(1,40),(2,40),(3,40),(0,41),(1,41),(2,41),(3,41),(0,43),(1,43),(2,43),(3,43),(0,48),(1,48),(2,48),(3,48),(0,49),(1,49),(2,49),(3,49),(0,50),(1,50),(2,50),(3,50),(0,51),(1,51),(2,51),(3,51),(0,52),(1,52),(2,52),(3,52),(0,53),(1,53),(2,53),(3,53),(0,54),(1,54),(2,54),(3,54),(0,55),(1,55),(2,55),(3,55),(0,56),(1,56),(2,56),(3,56),(0,57),(1,57),(2,57),(3,57),(0,58),(1,58),(2,58),(3,58),(0,60),(1,60),(2,60),(3,60),(0,61),(1,61),(2,61),(3,61),(0,62),(1,62),(2,62),(3,62);

/*Table structure for table `vtiger_org_share_action_mapping` */

DROP TABLE IF EXISTS `vtiger_org_share_action_mapping`;

CREATE TABLE `vtiger_org_share_action_mapping` (
  `share_action_id` int(19) NOT NULL,
  `share_action_name` varchar(200) default NULL,
  PRIMARY KEY  (`share_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_org_share_action_mapping` */

insert  into `vtiger_org_share_action_mapping`(`share_action_id`,`share_action_name`) values (0,'Public: Read Only'),(1,'Public: Read, Create/Edit'),(2,'Public: Read, Create/Edit, Delete'),(3,'Private'),(4,'Hide Details'),(5,'Hide Details and Add Events'),(6,'Show Details'),(7,'Show Details and Add Events');

/*Table structure for table `vtiger_organizationdetails` */

DROP TABLE IF EXISTS `vtiger_organizationdetails`;

CREATE TABLE `vtiger_organizationdetails` (
  `organizationname` varchar(60) NOT NULL,
  `address` varchar(150) default NULL,
  `city` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `code` varchar(30) default NULL,
  `phone` varchar(30) default NULL,
  `fax` varchar(30) default NULL,
  `website` varchar(100) default NULL,
  `logoname` varchar(50) default NULL,
  `logo` text,
  `tin_number` varchar(100) NOT NULL,
  `cst` varchar(100) NOT NULL,
  PRIMARY KEY  (`organizationname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_organizationdetails` */

insert  into `vtiger_organizationdetails`(`organizationname`,`address`,`city`,`state`,`country`,`code`,`phone`,`fax`,`website`,`logoname`,`logo`,`tin_number`,`cst`) values ('Vinayka Furnishing','127/69 hsr layout sector -2 ','Guhwati','Assam','India','5432178','+91-44-5202-1990','+91-44-5202-1990','www.vinayaka.in','vtiger-crm-logo.jpg',NULL,'99999999999','12222221212');

/*Table structure for table `vtiger_ownernotify` */

DROP TABLE IF EXISTS `vtiger_ownernotify`;

CREATE TABLE `vtiger_ownernotify` (
  `crmid` int(19) default NULL,
  `smownerid` int(19) default NULL,
  `flag` int(3) default NULL,
  KEY `ownernotify_crmid_flag_idx` (`crmid`,`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ownernotify` */

insert  into `vtiger_ownernotify`(`crmid`,`smownerid`,`flag`) values (345,1,NULL);

/*Table structure for table `vtiger_parenttab` */

DROP TABLE IF EXISTS `vtiger_parenttab`;

CREATE TABLE `vtiger_parenttab` (
  `parenttabid` int(19) NOT NULL,
  `parenttab_label` varchar(100) NOT NULL,
  `sequence` int(10) NOT NULL,
  `visible` int(2) NOT NULL default '0',
  PRIMARY KEY  (`parenttabid`),
  KEY `parenttab_parenttabid_parenttabl_label_visible_idx` (`parenttabid`,`parenttab_label`,`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_parenttab` */

insert  into `vtiger_parenttab`(`parenttabid`,`parenttab_label`,`sequence`,`visible`) values (1,'My Home Page',1,0),(2,'Marketing',2,0),(3,'Sales',3,0),(4,'Support',4,0),(5,'Analytics',5,0),(6,'Inventory',6,0),(7,'Tools',7,0),(8,'Settings',8,0),(9,'Barcode',9,0),(10,'Purchase',10,0),(11,'Deliverychallan',11,0),(12,'CrystalReport',12,0);

/*Table structure for table `vtiger_parenttabrel` */

DROP TABLE IF EXISTS `vtiger_parenttabrel`;

CREATE TABLE `vtiger_parenttabrel` (
  `parenttabid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sequence` int(3) NOT NULL,
  KEY `parenttabrel_tabid_parenttabid_idx` (`tabid`,`parenttabid`),
  KEY `fk_2_vtiger_parenttabrel` (`parenttabid`),
  CONSTRAINT `fk_1_vtiger_parenttabrel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE,
  CONSTRAINT `fk_2_vtiger_parenttabrel` FOREIGN KEY (`parenttabid`) REFERENCES `vtiger_parenttab` (`parenttabid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_parenttabrel` */

insert  into `vtiger_parenttabrel`(`parenttabid`,`tabid`,`sequence`) values (1,28,4),(1,3,1),(3,7,1),(3,6,2),(3,4,3),(3,2,4),(3,20,5),(3,22,6),(3,23,7),(3,19,8),(3,8,9),(4,13,1),(4,15,2),(4,6,3),(4,4,4),(4,8,5),(5,1,2),(5,25,1),(6,14,5),(10,18,1),(7,24,1),(7,27,2),(7,8,3),(2,26,1),(2,6,2),(2,4,3),(2,28,4),(4,28,7),(2,7,5),(2,9,6),(4,9,8),(2,8,8),(3,9,11),(7,31,4),(4,32,9),(6,33,3),(6,35,9),(7,38,5),(4,39,10),(4,40,11),(4,41,12),(7,42,6),(7,43,7),(9,48,1),(1,9,2),(6,49,3),(3,50,12),(10,21,3),(3,51,13),(10,52,4),(3,53,14),(3,54,15),(6,55,11),(6,56,1),(11,57,13),(10,58,2),(12,59,16),(10,60,5),(10,61,6),(8,62,1),(6,48,2);

/*Table structure for table `vtiger_payment_duration` */

DROP TABLE IF EXISTS `vtiger_payment_duration`;

CREATE TABLE `vtiger_payment_duration` (
  `payment_duration_id` int(11) default NULL,
  `payment_duration` varchar(200) default NULL,
  `sortorderid` int(11) default NULL,
  `presence` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_payment_duration` */

insert  into `vtiger_payment_duration`(`payment_duration_id`,`payment_duration`,`sortorderid`,`presence`) values (1,'Net 30 days',0,1),(2,'Net 45 days',1,1),(3,'Net 60 days',2,1);

/*Table structure for table `vtiger_payment_duration_seq` */

DROP TABLE IF EXISTS `vtiger_payment_duration_seq`;

CREATE TABLE `vtiger_payment_duration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_payment_duration_seq` */

insert  into `vtiger_payment_duration_seq`(`id`) values (3);

/*Table structure for table `vtiger_pbxmanager` */

DROP TABLE IF EXISTS `vtiger_pbxmanager`;

CREATE TABLE `vtiger_pbxmanager` (
  `pbxmanagerid` int(11) default NULL,
  `callfrom` varchar(255) default NULL,
  `callto` varchar(255) default NULL,
  `timeofcall` varchar(255) default NULL,
  `status` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_pbxmanager` */

/*Table structure for table `vtiger_picklist` */

DROP TABLE IF EXISTS `vtiger_picklist`;

CREATE TABLE `vtiger_picklist` (
  `picklistid` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY  (`picklistid`),
  UNIQUE KEY `picklist_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_picklist` */

insert  into `vtiger_picklist`(`picklistid`,`name`) values (1,'accounttype'),(2,'activitytype'),(37,'assetstatus'),(3,'campaignstatus'),(4,'campaigntype'),(5,'carrier'),(46,'cf_610'),(48,'cf_612'),(49,'cf_781'),(50,'cf_786'),(33,'contract_priority'),(32,'contract_status'),(34,'contract_type'),(6,'eventstatus'),(7,'expectedresponse'),(8,'faqcategories'),(9,'faqstatus'),(10,'glacct'),(11,'industry'),(12,'invoicestatus'),(13,'leadsource'),(14,'leadstatus'),(15,'manufacturer'),(16,'opportunity_type'),(17,'postatus'),(18,'productcategory'),(45,'progress'),(38,'projectmilestonetype'),(44,'projectpriority'),(42,'projectstatus'),(40,'projecttaskpriority'),(41,'projecttaskprogress'),(39,'projecttasktype'),(43,'projecttype'),(19,'quotestage'),(20,'rating'),(21,'sales_stage'),(22,'salutationtype'),(36,'servicecategory'),(35,'service_usageunit'),(23,'sostatus'),(24,'taskpriority'),(25,'taskstatus'),(26,'ticketcategories'),(27,'ticketpriorities'),(28,'ticketseverities'),(29,'ticketstatus'),(31,'tracking_unit'),(30,'usageunit');

/*Table structure for table `vtiger_picklist_seq` */

DROP TABLE IF EXISTS `vtiger_picklist_seq`;

CREATE TABLE `vtiger_picklist_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_picklist_seq` */

insert  into `vtiger_picklist_seq`(`id`) values (50);

/*Table structure for table `vtiger_picklistvalues_seq` */

DROP TABLE IF EXISTS `vtiger_picklistvalues_seq`;

CREATE TABLE `vtiger_picklistvalues_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_picklistvalues_seq` */

insert  into `vtiger_picklistvalues_seq`(`id`) values (304);

/*Table structure for table `vtiger_po_pr_item_mapping` */

DROP TABLE IF EXISTS `vtiger_po_pr_item_mapping`;

CREATE TABLE `vtiger_po_pr_item_mapping` (
  `po_pr_item_mapping_id` int(11) NOT NULL auto_increment,
  `poid` int(11) default NULL,
  `prid` varchar(100) default NULL,
  `productid` int(11) default NULL,
  `qty` int(11) default NULL,
  `warehouseid` int(11) default NULL,
  `status` varchar(25) default NULL,
  PRIMARY KEY  (`po_pr_item_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_po_pr_item_mapping` */

insert  into `vtiger_po_pr_item_mapping`(`po_pr_item_mapping_id`,`poid`,`prid`,`productid`,`qty`,`warehouseid`,`status`) values (1,101,'NP077461',55,2,2,'Open'),(2,133,'NP418464',132,100,2,'Received Shipment'),(3,148,'NP59296',147,100,2,'Open'),(4,160,'NP005034',159,20,2,'Open');

/*Table structure for table `vtiger_pobillads` */

DROP TABLE IF EXISTS `vtiger_pobillads`;

CREATE TABLE `vtiger_pobillads` (
  `pobilladdressid` int(19) NOT NULL default '0',
  `bill_city` varchar(30) default NULL,
  `bill_code` varchar(30) default NULL,
  `bill_country` varchar(30) default NULL,
  `bill_state` varchar(30) default NULL,
  `bill_street` varchar(250) default NULL,
  `bill_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`pobilladdressid`),
  CONSTRAINT `fk_1_vtiger_pobillads` FOREIGN KEY (`pobilladdressid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_pobillads` */

insert  into `vtiger_pobillads`(`pobilladdressid`,`bill_city`,`bill_code`,`bill_country`,`bill_state`,`bill_street`,`bill_pobox`) values (101,'Bangalore','','India','Karnataka','15th cross',''),(133,'Bangalore','','India','Karnataka','15th cross',''),(148,'Bangalore','','India','Karnataka','15th cross',''),(160,'Bangalore','','India','Karnataka','15th cross','');

/*Table structure for table `vtiger_portal` */

DROP TABLE IF EXISTS `vtiger_portal`;

CREATE TABLE `vtiger_portal` (
  `portalid` int(19) NOT NULL,
  `portalname` varchar(200) NOT NULL,
  `portalurl` varchar(255) NOT NULL,
  `sequence` int(3) NOT NULL,
  `setdefault` int(3) NOT NULL default '0',
  PRIMARY KEY  (`portalid`),
  KEY `portal_portalname_idx` (`portalname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_portal` */

insert  into `vtiger_portal`(`portalid`,`portalname`,`portalurl`,`sequence`,`setdefault`) values (1,'Vtiger','http://vtiger.com',0,0),(2,'Vtiger Blogs','http://blogs.vtiger.com',0,0),(3,'Vtiger Forums','http://forums.vtiger.com',0,0),(4,'VtigerForge','http://vtigerforge.com',0,0),(5,'Vtiger Docs','http://wiki.vtiger.com',0,0);

/*Table structure for table `vtiger_portal_seq` */

DROP TABLE IF EXISTS `vtiger_portal_seq`;

CREATE TABLE `vtiger_portal_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_portal_seq` */

insert  into `vtiger_portal_seq`(`id`) values (5);

/*Table structure for table `vtiger_portalinfo` */

DROP TABLE IF EXISTS `vtiger_portalinfo`;

CREATE TABLE `vtiger_portalinfo` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) default NULL,
  `user_password` varchar(30) default NULL,
  `type` varchar(5) default NULL,
  `last_login_time` datetime default NULL,
  `login_time` datetime default NULL,
  `logout_time` datetime default NULL,
  `isactive` int(1) default NULL,
  PRIMARY KEY  (`id`),
  CONSTRAINT `fk_1_vtiger_portalinfo` FOREIGN KEY (`id`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_portalinfo` */

/*Table structure for table `vtiger_poshipads` */

DROP TABLE IF EXISTS `vtiger_poshipads`;

CREATE TABLE `vtiger_poshipads` (
  `poshipaddressid` int(19) NOT NULL default '0',
  `ship_city` varchar(30) default NULL,
  `ship_code` varchar(30) default NULL,
  `ship_country` varchar(30) default NULL,
  `ship_state` varchar(30) default NULL,
  `ship_street` varchar(250) default NULL,
  `ship_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`poshipaddressid`),
  CONSTRAINT `fk_1_vtiger_poshipads` FOREIGN KEY (`poshipaddressid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_poshipads` */

insert  into `vtiger_poshipads`(`poshipaddressid`,`ship_city`,`ship_code`,`ship_country`,`ship_state`,`ship_street`,`ship_pobox`) values (101,'Bangalore','','India','Karnataka','15th cross',''),(133,'Bangalore','','India','Karnataka','15th cross',''),(148,'Bangalore','','India','Karnataka','15th cross',''),(160,'Bangalore','','India','Karnataka','15th cross','');

/*Table structure for table `vtiger_postatus` */

DROP TABLE IF EXISTS `vtiger_postatus`;

CREATE TABLE `vtiger_postatus` (
  `postatusid` int(19) NOT NULL auto_increment,
  `postatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`postatusid`),
  UNIQUE KEY `postatus_postatus_idx` (`postatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_postatus` */

insert  into `vtiger_postatus`(`postatusid`,`postatus`,`presence`,`picklist_valueid`) values (1,'Created',0,130),(4,'Cancelled',0,133),(5,'Received Shipment',0,134);

/*Table structure for table `vtiger_postatus_seq` */

DROP TABLE IF EXISTS `vtiger_postatus_seq`;

CREATE TABLE `vtiger_postatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_postatus_seq` */

insert  into `vtiger_postatus_seq`(`id`) values (5);

/*Table structure for table `vtiger_postatushistory` */

DROP TABLE IF EXISTS `vtiger_postatushistory`;

CREATE TABLE `vtiger_postatushistory` (
  `historyid` int(19) NOT NULL auto_increment,
  `purchaseorderid` int(19) NOT NULL,
  `vendorname` varchar(100) default NULL,
  `total` decimal(10,0) default NULL,
  `postatus` varchar(200) default NULL,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`historyid`),
  KEY `postatushistory_purchaseorderid_idx` (`purchaseorderid`),
  CONSTRAINT `fk_1_vtiger_postatushistory` FOREIGN KEY (`purchaseorderid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_postatushistory` */

/*Table structure for table `vtiger_potcompetitorrel` */

DROP TABLE IF EXISTS `vtiger_potcompetitorrel`;

CREATE TABLE `vtiger_potcompetitorrel` (
  `potentialid` int(19) NOT NULL,
  `competitorid` int(19) NOT NULL,
  PRIMARY KEY  (`potentialid`,`competitorid`),
  KEY `potcompetitorrel_potentialid_idx` (`potentialid`),
  KEY `potcompetitorrel_competitorid_idx` (`competitorid`),
  CONSTRAINT `fk_2_vtiger_potcompetitorrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_potcompetitorrel` */

/*Table structure for table `vtiger_potential` */

DROP TABLE IF EXISTS `vtiger_potential`;

CREATE TABLE `vtiger_potential` (
  `potentialid` int(19) NOT NULL default '0',
  `potential_no` varchar(100) NOT NULL,
  `related_to` int(19) default NULL,
  `potentialname` varchar(120) NOT NULL,
  `amount` decimal(14,2) default '0.00',
  `currency` varchar(20) default NULL,
  `closingdate` date default NULL,
  `typeofrevenue` varchar(50) default NULL,
  `nextstep` varchar(100) default NULL,
  `private` int(1) default '0',
  `probability` decimal(7,3) default '0.000',
  `campaignid` int(19) default NULL,
  `sales_stage` varchar(200) default NULL,
  `potentialtype` varchar(200) default NULL,
  `leadsource` varchar(200) default NULL,
  `productid` int(50) default NULL,
  `productversion` varchar(50) default NULL,
  `quotationref` varchar(50) default NULL,
  `partnercontact` varchar(50) default NULL,
  `remarks` varchar(50) default NULL,
  `runtimefee` int(19) default '0',
  `followupdate` date default NULL,
  `evaluationstatus` varchar(50) default NULL,
  `description` text,
  `forecastcategory` int(19) default '0',
  `outcomeanalysis` int(19) default '0',
  PRIMARY KEY  (`potentialid`),
  KEY `potential_relatedto_idx` (`related_to`),
  KEY `potentail_sales_stage_idx` (`sales_stage`),
  KEY `potentail_sales_stage_amount_idx` (`amount`,`sales_stage`),
  CONSTRAINT `fk_1_vtiger_potential` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_potential` */

/*Table structure for table `vtiger_potentialscf` */

DROP TABLE IF EXISTS `vtiger_potentialscf`;

CREATE TABLE `vtiger_potentialscf` (
  `potentialid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`potentialid`),
  CONSTRAINT `fk_1_vtiger_potentialscf` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_potentialscf` */

/*Table structure for table `vtiger_potstagehistory` */

DROP TABLE IF EXISTS `vtiger_potstagehistory`;

CREATE TABLE `vtiger_potstagehistory` (
  `historyid` int(19) NOT NULL auto_increment,
  `potentialid` int(19) NOT NULL,
  `amount` decimal(10,0) default NULL,
  `stage` varchar(100) default NULL,
  `probability` decimal(7,3) default NULL,
  `expectedrevenue` decimal(10,0) default NULL,
  `closedate` date default NULL,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`historyid`),
  KEY `potstagehistory_potentialid_idx` (`potentialid`),
  CONSTRAINT `fk_1_vtiger_potstagehistory` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_potstagehistory` */

/*Table structure for table `vtiger_prdelivery` */

DROP TABLE IF EXISTS `vtiger_prdelivery`;

CREATE TABLE `vtiger_prdelivery` (
  `prdeliveryid` int(11) default NULL,
  `prid` int(11) default NULL,
  `warehouseid` int(11) default NULL,
  `duedate` date default NULL,
  `status` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_prdelivery` */

/*Table structure for table `vtiger_prdeliverycf` */

DROP TABLE IF EXISTS `vtiger_prdeliverycf`;

CREATE TABLE `vtiger_prdeliverycf` (
  `prdeliveryid` int(11) NOT NULL,
  PRIMARY KEY  (`prdeliveryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_prdeliverycf` */

/*Table structure for table `vtiger_prdeliverygrouprel` */

DROP TABLE IF EXISTS `vtiger_prdeliverygrouprel`;

CREATE TABLE `vtiger_prdeliverygrouprel` (
  `prdeliveryid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`prdeliveryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_prdeliverygrouprel` */

/*Table structure for table `vtiger_pricebook` */

DROP TABLE IF EXISTS `vtiger_pricebook`;

CREATE TABLE `vtiger_pricebook` (
  `pricebookid` int(19) NOT NULL default '0',
  `pricebook_no` varchar(100) NOT NULL,
  `bookname` varchar(100) default NULL,
  `active` int(1) default NULL,
  `currency_id` int(19) NOT NULL default '1',
  PRIMARY KEY  (`pricebookid`),
  CONSTRAINT `fk_1_vtiger_pricebook` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_pricebook` */

/*Table structure for table `vtiger_pricebookcf` */

DROP TABLE IF EXISTS `vtiger_pricebookcf`;

CREATE TABLE `vtiger_pricebookcf` (
  `pricebookid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`pricebookid`),
  CONSTRAINT `fk_1_vtiger_pricebookcf` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_pricebook` (`pricebookid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_pricebookcf` */

/*Table structure for table `vtiger_pricebookproductrel` */

DROP TABLE IF EXISTS `vtiger_pricebookproductrel`;

CREATE TABLE `vtiger_pricebookproductrel` (
  `pricebookid` int(19) NOT NULL,
  `productid` int(19) NOT NULL,
  `listprice` decimal(25,3) default NULL,
  `usedcurrency` int(11) NOT NULL default '1',
  PRIMARY KEY  (`pricebookid`,`productid`),
  KEY `pricebookproductrel_pricebookid_idx` (`pricebookid`),
  KEY `pricebookproductrel_productid_idx` (`productid`),
  CONSTRAINT `fk_1_vtiger_pricebookproductrel` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_pricebook` (`pricebookid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_pricebookproductrel` */

/*Table structure for table `vtiger_priority` */

DROP TABLE IF EXISTS `vtiger_priority`;

CREATE TABLE `vtiger_priority` (
  `priorityid` int(19) NOT NULL auto_increment,
  `priority` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`priorityid`),
  UNIQUE KEY `priority_priority_idx` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_priority` */

/*Table structure for table `vtiger_productcategory` */

DROP TABLE IF EXISTS `vtiger_productcategory`;

CREATE TABLE `vtiger_productcategory` (
  `productcategoryid` int(19) NOT NULL auto_increment,
  `productcategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`productcategoryid`),
  UNIQUE KEY `productcategory_productcategory_idx` (`productcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_productcategory` */

insert  into `vtiger_productcategory`(`productcategoryid`,`productcategory`,`presence`,`picklist_valueid`) values (1,'--None--',1,135),(2,'Hardware',1,136),(3,'Software',1,137),(4,'CRM Applications',1,138);

/*Table structure for table `vtiger_productcategory_seq` */

DROP TABLE IF EXISTS `vtiger_productcategory_seq`;

CREATE TABLE `vtiger_productcategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_productcategory_seq` */

insert  into `vtiger_productcategory_seq`(`id`) values (4);

/*Table structure for table `vtiger_productcf` */

DROP TABLE IF EXISTS `vtiger_productcf`;

CREATE TABLE `vtiger_productcf` (
  `productid` int(19) NOT NULL default '0',
  `cf_833` decimal(5,2) default NULL,
  `cf_834` decimal(5,2) default NULL,
  `cf_835` decimal(5,2) default NULL,
  PRIMARY KEY  (`productid`),
  CONSTRAINT `fk_1_vtiger_productcf` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_productcf` */

insert  into `vtiger_productcf`(`productid`,`cf_833`,`cf_834`,`cf_835`) values (18,NULL,NULL,NULL),(19,NULL,NULL,NULL),(20,NULL,NULL,NULL),(21,NULL,NULL,NULL),(22,NULL,NULL,NULL),(23,NULL,NULL,NULL),(55,NULL,NULL,NULL),(80,NULL,NULL,NULL),(106,NULL,NULL,NULL),(110,NULL,NULL,NULL),(117,NULL,NULL,NULL),(118,NULL,NULL,NULL),(119,NULL,NULL,NULL),(120,NULL,NULL,NULL),(127,NULL,NULL,NULL),(132,NULL,NULL,NULL),(140,NULL,NULL,NULL),(147,NULL,NULL,NULL),(156,NULL,NULL,NULL),(159,NULL,NULL,NULL);

/*Table structure for table `vtiger_productcollaterals` */

DROP TABLE IF EXISTS `vtiger_productcollaterals`;

CREATE TABLE `vtiger_productcollaterals` (
  `productid` int(11) NOT NULL,
  `date_entered` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `data` longblob,
  `description` text,
  `filename` varchar(50) default NULL,
  `filesize` varchar(50) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  PRIMARY KEY  (`productid`),
  KEY `productcollaterals_productid_filename_idx` (`productid`,`filename`),
  CONSTRAINT `fk_1_vtiger_productcollaterals` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_productcollaterals` */

/*Table structure for table `vtiger_productcurrencyrel` */

DROP TABLE IF EXISTS `vtiger_productcurrencyrel`;

CREATE TABLE `vtiger_productcurrencyrel` (
  `productid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `converted_price` decimal(25,2) default NULL,
  `actual_price` decimal(25,2) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_productcurrencyrel` */

insert  into `vtiger_productcurrencyrel`(`productid`,`currencyid`,`converted_price`,`actual_price`) values (39,1,'0.00','947.17'),(40,1,'0.00','2042.50'),(41,1,'0.00','99475.00'),(42,1,'0.00','395.00'),(43,1,'0.00','2845.25'),(44,1,'0.00','522.50'),(45,1,'0.00','2921.25'),(46,1,'0.00','3253.75'),(47,1,'0.00','774.17'),(48,1,'0.00','595.00'),(59,1,'0.00','500.00'),(60,1,'0.00','1000.00'),(61,1,'0.00','5000.00'),(38,1,'0.00','1040.25'),(37,1,'0.00','77849.13'),(75,1,'0.00','5000.00'),(76,1,'0.00','1200.00'),(77,1,'0.00','10000.00'),(78,1,'0.00','6000.00'),(93,1,'0.00','1000.00'),(93,1,'0.00','1000.00'),(93,1,'0.00','1000.00'),(93,1,'0.00','1000.00'),(93,1,'0.00','1000.00'),(93,1,'0.00','1000.00'),(93,1,'0.00','1000.00'),(94,1,'0.00','0.00'),(93,1,'0.00','1000.00'),(94,1,'0.00','0.00'),(93,1,'0.00','1000.00'),(94,1,'0.00','0.00'),(93,1,'0.00','1000.00'),(97,1,'0.00','500.00'),(108,1,'0.00','500.00'),(111,1,'0.00','600.00'),(113,1,'0.00','1000.00'),(126,1,'0.00','250.00'),(127,1,'0.00','48.25'),(128,1,'0.00','450.00'),(74,1,'0.00','12000.00'),(135,1,'0.00','2500.00'),(136,1,'0.00','3000.00'),(142,1,'0.00','2500.00'),(143,1,'0.00','3000.00'),(144,1,'0.00','1000.00'),(145,1,'0.00','500.00'),(125,1,'0.00','500.00'),(177,1,'0.00','500.00'),(179,1,'0.00','200.00'),(204,1,'0.00','1000.00'),(205,1,'0.00','500.00'),(206,1,'0.00','200.00'),(207,1,'0.00','150.00'),(208,1,'0.00','100.00'),(341,1,'0.00','0.00'),(313,1,'0.00','0.00'),(336,1,'0.00','0.00'),(350,1,'0.00','0.00'),(358,1,'0.00','0.00'),(360,1,'0.00','0.00'),(362,1,'0.00','0.00'),(363,1,'0.00','0.00'),(364,1,'0.00','0.00'),(365,1,'0.00','0.00'),(366,1,'0.00','0.00'),(367,1,'0.00','0.00'),(369,1,'0.00','0.00'),(370,1,'0.00','0.00'),(372,1,'0.00','1150.00'),(374,1,'0.00','0.00'),(377,1,'0.00','0.00'),(379,1,'0.00','172.50'),(381,1,'0.00','0.00'),(385,1,'0.00','0.00'),(387,1,'0.00','575.00'),(389,1,'0.00','0.00'),(392,1,'0.00','0.00'),(394,1,'0.00','0.00'),(396,1,'0.00','0.00'),(397,1,'0.00','0.00'),(401,1,'0.00','0.00'),(403,1,'0.00','0.00'),(405,1,'0.00','0.00'),(406,1,'0.00','0.00'),(408,1,'0.00','0.00'),(399,1,'0.00','0.00'),(383,1,'0.00','575.00'),(410,1,'0.00','1875.00'),(508,1,'0.00','165.00'),(509,1,'0.00','208.00'),(510,1,'0.00','287.50'),(511,1,'0.00','360.00'),(512,1,'0.00','1250.00'),(535,1,'0.00','165.00'),(537,1,'0.00','165.00'),(548,1,'0.00','110.00'),(549,1,'0.00','165.00'),(560,1,'0.00','110.00'),(561,1,'0.00','52.50'),(562,1,'0.00','11.00'),(613,1,'0.00','157.50'),(614,1,'0.00','55.00'),(615,1,'0.00','62.40'),(616,1,'0.00','110.00'),(617,1,'0.00','126.00'),(618,1,'0.00','210.00'),(619,1,'0.00','262.50'),(620,1,'0.00','468.00'),(621,1,'0.00','510.00'),(627,1,'0.00','550.00'),(652,1,'0.00','110.00'),(663,1,'0.00','1100.00'),(665,1,'0.00','110.00'),(668,1,'0.00','110.00'),(674,1,'0.00','176.00'),(676,1,'0.00','1380.00'),(678,1,'0.00','2300.00'),(700,1,'0.00','1150.00'),(701,1,'0.00','1440.00'),(704,1,'0.00','5500.00'),(705,1,'0.00','1150.00'),(708,1,'0.00','1875.00'),(709,1,'0.00','2875.00'),(722,1,'0.00','110.00'),(723,1,'0.00','575.00'),(724,1,'0.00','525.00'),(739,1,'0.00','110.00'),(745,1,'0.00','180.00'),(18,1,'0.00','387.59'),(19,1,'0.00','2729.58'),(20,1,'0.00','1040.85'),(21,1,'0.00','833.31'),(22,1,'0.00','2524.22'),(23,1,'0.00','2472.30'),(80,1,'0.00','952.38'),(106,1,'0.00','909.09'),(110,1,'0.00','909.09'),(117,1,'0.00','9090.91'),(118,1,'0.00','1904.76'),(119,1,'0.00','1180.91'),(120,1,'0.00','1319.92'),(127,1,'0.00','48.25'),(140,1,'0.00','1137.14'),(156,1,'0.00','174.56');

/*Table structure for table `vtiger_products` */

DROP TABLE IF EXISTS `vtiger_products`;

CREATE TABLE `vtiger_products` (
  `productid` int(11) NOT NULL,
  `product_no` varchar(100) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `barcode` varchar(255) default NULL,
  `warehouse_id` varchar(25) default '',
  `productcode` varchar(40) default NULL,
  `productcategory` varchar(200) default NULL,
  `manufacturer` varchar(200) default NULL,
  `qty_per_unit` decimal(11,2) default '0.00',
  `cost` decimal(12,2) default '0.00',
  `unit_price` decimal(12,2) default '0.00',
  `discount` decimal(25,2) default '0.00',
  `netprice` float(25,2) default '0.00',
  `vat` float(12,2) default NULL,
  `service` float(12,2) default NULL,
  `frequency` varchar(100) default NULL,
  `weight` decimal(11,3) default NULL,
  `pack_size` int(11) default NULL,
  `sales_start_date` date default NULL,
  `sales_end_date` date default NULL,
  `start_date` date default NULL,
  `expiry_date` date default NULL,
  `cost_factor` int(11) default NULL,
  `commissionrate` decimal(7,3) default NULL,
  `commissionmethod` varchar(50) default NULL,
  `discontinued` int(1) NOT NULL default '0',
  `usageunit` varchar(200) default NULL,
  `handler` int(11) default NULL,
  `reorderlevel` int(11) default NULL,
  `website` varchar(100) default NULL,
  `taxclass` varchar(200) default NULL,
  `mfr_part_no` varchar(200) default NULL,
  `vendor_part_no` varchar(200) default NULL,
  `serialno` varchar(200) default NULL,
  `qtyinstock` decimal(11,2) default NULL,
  `productsheet` varchar(200) default NULL,
  `qtyindemand` int(11) default NULL,
  `glacct` varchar(200) default NULL,
  `vendor_id` int(11) default NULL,
  `imagename` text,
  `currency_id` int(19) NOT NULL default '1',
  `product_markup` decimal(12,2) default '0.00',
  `product_withcform` decimal(12,2) default '0.00',
  `product_withoutcform` decimal(12,2) default '0.00',
  PRIMARY KEY  (`productid`),
  UNIQUE KEY `barcode` (`barcode`),
  CONSTRAINT `fk_1_vtiger_products` FOREIGN KEY (`productid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_products` */

insert  into `vtiger_products`(`productid`,`product_no`,`productname`,`barcode`,`warehouse_id`,`productcode`,`productcategory`,`manufacturer`,`qty_per_unit`,`cost`,`unit_price`,`discount`,`netprice`,`vat`,`service`,`frequency`,`weight`,`pack_size`,`sales_start_date`,`sales_end_date`,`start_date`,`expiry_date`,`cost_factor`,`commissionrate`,`commissionmethod`,`discontinued`,`usageunit`,`handler`,`reorderlevel`,`website`,`taxclass`,`mfr_part_no`,`vendor_part_no`,`serialno`,`qtyinstock`,`productsheet`,`qtyindemand`,`glacct`,`vendor_id`,`imagename`,`currency_id`,`product_markup`,`product_withcform`,`product_withoutcform`) values (18,'PRO1','Curtain Cloth Hippo','83967','',NULL,'Curtain Cloth',NULL,'0.00','298.15','387.59','0.00',387.59,0.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Meter',NULL,20,NULL,NULL,NULL,NULL,NULL,'90.00',NULL,NULL,NULL,NULL,'',1,'30.00','0.00','0.00'),(19,'PRO2','Tomtailor  90*108','81879','',NULL,'Bedsheet',NULL,'0.00','2274.65','2729.58','0.00',2866.06,5.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Pieces',NULL,5,NULL,NULL,NULL,NULL,NULL,'29.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(20,'PRO3','Esprit Umbrella 2','719768','',NULL,'Umbrella',NULL,'0.00','800.65','1040.85','0.00',1181.36,13.50,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'32.00',NULL,NULL,NULL,NULL,'',1,'30.00','0.00','0.00'),(21,'PRO4','Esprit Umbrella 1','988836','',NULL,'Umbrella',NULL,'0.00','666.65','833.31','0.00',945.81,13.50,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,5,NULL,NULL,NULL,NULL,NULL,'7.00',NULL,NULL,NULL,NULL,'',1,'25.00','0.00','0.00'),(22,'PRO5','Esprit Bedsheet 90','739838','',NULL,'Bedsheet',NULL,'0.00','2294.75','2524.22','0.00',2650.43,5.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'90.00',NULL,NULL,NULL,NULL,'',1,'10.00','0.00','0.00'),(23,'PRO6','Esprit Bedsheet 108','51778','',NULL,'Bedsheet',NULL,'0.00','2060.25','2472.30','0.00',2595.91,5.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,5,NULL,NULL,NULL,NULL,NULL,'18.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(55,'PRO7','lcd holder','95653','',NULL,'Bedsheet',NULL,'0.00','10000.00','12000.00','0.00',12600.00,5.00,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,1,'0.00','0.00','0.00'),(80,'PRO8','cur123','8583','',NULL,'Dining Mat',NULL,'0.00','793.65','952.38','0.00',1000.00,5.00,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'87.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(106,'PRO9','Glass Table','838299','',NULL,'glass',NULL,'0.00','757.58','909.09','0.00',1000.00,10.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'100.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(110,'PRO10','Boat 123','245963','',NULL,'Boat tools',NULL,'0.00','757.58','909.09','0.00',1000.00,10.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,20,NULL,NULL,NULL,NULL,NULL,'100.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(117,'PRO11','Red glass','437953','',NULL,'glass',NULL,'0.00','7575.76','9090.91','0.00',10000.00,10.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,20,NULL,NULL,NULL,NULL,NULL,'93.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(118,'PRO12','Asian Blue Towel','6613','',NULL,'Towel',NULL,'0.00','1587.30','1904.76','0.00',2000.00,5.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'45.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(119,'PRO13','Stering','749214','',NULL,'Boat tools',NULL,'0.00','984.09','1180.91','0.00',1299.00,10.00,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'95.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(120,'PRO14','Royal Sofaset','596533','',NULL,'Furniture',NULL,'0.00','1015.32','1319.92','0.00',1499.00,13.50,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,20,NULL,NULL,NULL,NULL,NULL,'96.00',NULL,NULL,NULL,NULL,'',1,'30.00','0.00','0.00'),(127,'PRO15','Haldiram 500 gm','11538','',NULL,'Namkeen',NULL,'0.00','43.86','48.25','0.00',55.00,14.00,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,20,NULL,NULL,NULL,NULL,NULL,'92.00',NULL,NULL,NULL,NULL,'',1,'10.00','0.00','0.00'),(132,'PRO16','xyz123','448','',NULL,'Namkeen',NULL,'0.00','50.00','56.10','0.00',63.95,14.00,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100.00',NULL,NULL,NULL,NULL,NULL,1,'10.00','2.00','0.00'),(140,'PRO17','Wrangler Blue','32598','',NULL,'Jeans',NULL,'0.00','947.62','1137.14','0.00',1200.00,5.50,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'94.00',NULL,NULL,NULL,NULL,'',1,'20.00','0.00','0.00'),(147,'PRO18','jean123','497912','',NULL,'Jeans',NULL,'0.00','789.68','947.62','0.00',1000.00,5.50,NULL,'sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,1,'0.00','0.00','0.00'),(156,'PRO19','Ashirwad','464158','',NULL,'Atta',NULL,'0.00','158.69','174.56','0.00',200.00,14.50,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Box',NULL,10,NULL,NULL,NULL,NULL,NULL,'96.00',NULL,NULL,NULL,NULL,'',1,'10.00','0.00','0.00'),(159,'PRO20','Brisk Farm','89318','',NULL,'Atta',NULL,'0.00','23.80','26.18','0.00',30.00,14.50,NULL,'fm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,1,'0.00','0.00','0.00');

/*Table structure for table `vtiger_producttaxrel` */

DROP TABLE IF EXISTS `vtiger_producttaxrel`;

CREATE TABLE `vtiger_producttaxrel` (
  `productid` int(11) NOT NULL,
  `taxid` int(3) NOT NULL,
  `taxpercentage` decimal(7,3) default NULL,
  KEY `producttaxrel_productid_idx` (`productid`),
  KEY `producttaxrel_taxid_idx` (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_producttaxrel` */

insert  into `vtiger_producttaxrel`(`productid`,`taxid`,`taxpercentage`) values (52,1,'4.500'),(52,3,'12.500');

/*Table structure for table `vtiger_profile` */

DROP TABLE IF EXISTS `vtiger_profile`;

CREATE TABLE `vtiger_profile` (
  `profileid` int(10) NOT NULL auto_increment,
  `profilename` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY  (`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile` */

insert  into `vtiger_profile`(`profileid`,`profilename`,`description`) values (1,'Administrator','Admin Profile'),(2,'Sales Profile','Profile Related to Sales'),(3,'Support Profile','Profile Related to Support'),(4,'Guest Profile','Guest Profile for Test Users'),(5,'Inventory Profile','Inventory Profile');

/*Table structure for table `vtiger_profile2field` */

DROP TABLE IF EXISTS `vtiger_profile2field`;

CREATE TABLE `vtiger_profile2field` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) default NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) default NULL,
  `readonly` int(19) default NULL,
  PRIMARY KEY  (`profileid`,`fieldid`),
  KEY `profile2field_profileid_tabid_fieldname_idx` (`profileid`,`tabid`),
  KEY `profile2field_tabid_profileid_idx` (`tabid`,`profileid`),
  KEY `profile2field_visible_profileid_idx` (`visible`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile2field` */

insert  into `vtiger_profile2field`(`profileid`,`tabid`,`fieldid`,`visible`,`readonly`) values (1,6,1,0,1),(1,6,2,0,1),(1,6,3,0,1),(1,6,4,0,1),(1,6,5,0,1),(1,6,6,0,1),(1,6,7,0,1),(1,6,8,0,1),(1,6,9,0,1),(1,6,10,0,1),(1,6,11,0,1),(1,6,12,0,1),(1,6,13,0,1),(1,6,14,0,1),(1,6,15,0,1),(1,6,16,0,1),(1,6,17,0,1),(1,6,18,0,1),(1,6,19,0,1),(1,6,20,0,1),(1,6,21,0,1),(1,6,22,0,1),(1,6,23,0,1),(1,6,24,0,1),(1,6,25,0,1),(1,6,26,0,1),(1,6,27,0,1),(1,6,28,0,1),(1,6,29,0,1),(1,6,30,0,1),(1,6,31,0,1),(1,6,32,0,1),(1,6,33,0,1),(1,6,34,0,1),(1,6,35,0,1),(1,7,36,0,1),(1,7,37,0,1),(1,7,38,0,1),(1,7,39,0,1),(1,7,40,0,1),(1,7,41,0,1),(1,7,42,0,1),(1,7,43,0,1),(1,7,44,0,1),(1,7,45,0,1),(1,7,46,0,1),(1,7,47,0,1),(1,7,48,0,1),(1,7,49,0,1),(1,7,50,0,1),(1,7,51,0,1),(1,7,52,0,1),(1,7,53,0,1),(1,7,54,0,1),(1,7,55,0,1),(1,7,56,0,1),(1,7,57,0,1),(1,7,58,0,1),(1,7,59,0,1),(1,7,60,0,1),(1,7,61,0,1),(1,7,62,0,1),(1,7,63,0,1),(1,4,64,0,1),(1,4,65,0,1),(1,4,66,0,1),(1,4,67,0,1),(1,4,68,0,1),(1,4,69,0,1),(1,4,70,0,1),(1,4,71,0,1),(1,4,72,0,1),(1,4,73,0,1),(1,4,74,0,1),(1,4,75,0,1),(1,4,76,0,1),(1,4,77,0,1),(1,4,78,0,1),(1,4,79,0,1),(1,4,80,0,1),(1,4,81,0,1),(1,4,82,0,1),(1,4,83,0,1),(1,4,84,0,1),(1,4,85,0,1),(1,4,86,0,1),(1,4,87,0,1),(1,4,88,0,1),(1,4,89,0,1),(1,4,90,0,1),(1,4,91,0,1),(1,4,92,0,1),(1,4,93,0,1),(1,4,94,0,1),(1,4,95,0,1),(1,4,96,0,1),(1,4,97,0,1),(1,4,98,0,1),(1,4,99,0,1),(1,4,100,0,1),(1,4,101,0,1),(1,4,102,0,1),(1,4,103,0,1),(1,4,104,0,1),(1,4,105,0,1),(1,4,106,0,1),(1,2,107,0,1),(1,2,108,0,1),(1,2,109,0,1),(1,2,110,0,1),(1,2,111,0,1),(1,2,112,0,1),(1,2,113,0,1),(1,2,114,0,1),(1,2,115,0,1),(1,2,116,0,1),(1,2,117,0,1),(1,2,118,0,1),(1,2,119,0,1),(1,2,120,0,1),(1,2,121,0,1),(1,26,122,0,1),(1,26,123,0,1),(1,26,124,0,1),(1,26,125,0,1),(1,26,126,0,1),(1,26,127,0,1),(1,26,128,0,1),(1,26,129,0,1),(1,26,130,0,1),(1,26,131,0,1),(1,26,132,0,1),(1,26,133,0,1),(1,26,134,0,1),(1,26,135,0,1),(1,26,136,0,1),(1,26,137,0,1),(1,26,138,0,1),(1,26,139,0,1),(1,26,140,0,1),(1,26,141,0,1),(1,26,142,0,1),(1,26,143,0,1),(1,26,144,0,1),(1,26,145,0,1),(1,4,146,0,1),(1,6,147,0,1),(1,7,148,0,1),(1,26,149,0,1),(1,13,150,0,1),(1,13,151,0,1),(1,13,152,0,1),(1,13,153,0,1),(1,13,154,0,1),(1,13,155,0,1),(1,13,156,0,1),(1,13,157,0,1),(1,13,158,0,1),(1,13,159,0,1),(1,13,160,0,1),(1,13,161,0,1),(1,13,162,0,1),(1,13,163,0,1),(1,13,164,0,1),(1,13,165,0,1),(1,13,166,0,1),(1,14,167,0,1),(1,14,168,0,1),(1,14,169,0,1),(1,14,170,0,1),(1,14,171,0,1),(1,14,172,0,1),(1,14,173,0,1),(1,14,174,0,1),(1,14,175,0,1),(1,14,176,0,1),(1,14,177,0,1),(1,14,178,0,1),(1,14,179,0,1),(1,14,180,0,1),(1,14,181,0,1),(1,14,182,0,1),(1,14,183,0,1),(1,14,184,0,1),(1,14,185,0,1),(1,14,186,0,1),(1,14,187,0,1),(1,14,188,0,1),(1,14,189,0,1),(1,14,190,0,1),(1,14,191,0,1),(1,14,192,0,1),(1,14,193,0,1),(1,14,194,0,1),(1,14,195,0,1),(1,14,196,0,1),(1,8,197,0,1),(1,8,198,0,1),(1,8,199,0,1),(1,8,200,0,1),(1,8,201,0,1),(1,8,202,0,1),(1,8,209,0,1),(1,8,210,0,1),(1,10,211,0,1),(1,10,212,0,1),(1,10,213,0,1),(1,10,214,0,1),(1,10,215,0,1),(1,10,216,0,1),(1,10,217,0,1),(1,10,218,0,1),(1,10,219,0,1),(1,10,220,0,1),(1,10,221,0,1),(1,9,222,0,1),(1,9,223,0,1),(1,9,224,0,1),(1,9,225,0,1),(1,9,226,0,1),(1,9,227,0,1),(1,9,228,0,1),(1,9,229,0,1),(1,9,230,0,1),(1,9,231,0,1),(1,9,232,0,1),(1,9,233,0,1),(1,9,234,0,1),(1,9,235,0,1),(1,9,236,0,1),(1,9,237,0,1),(1,9,238,0,1),(1,9,239,0,1),(1,9,240,0,1),(1,9,241,0,1),(1,9,242,0,1),(1,9,243,0,1),(1,9,244,0,1),(1,16,245,0,1),(1,16,246,0,1),(1,16,247,0,1),(1,16,248,0,1),(1,16,249,0,1),(1,16,250,0,1),(1,16,251,0,1),(1,16,252,0,1),(1,16,253,0,1),(1,16,254,0,1),(1,16,255,0,1),(1,16,256,0,1),(1,16,257,0,1),(1,16,258,0,1),(1,16,259,0,1),(1,16,260,0,1),(1,16,261,0,1),(1,16,262,0,1),(1,16,263,0,1),(1,16,264,0,1),(1,16,265,0,1),(1,16,266,0,1),(1,15,267,0,1),(1,15,268,0,1),(1,15,269,0,1),(1,15,270,0,1),(1,15,271,0,1),(1,15,272,0,1),(1,15,273,0,1),(1,15,274,0,1),(1,15,275,0,1),(1,18,276,0,1),(1,18,277,0,1),(1,18,278,0,1),(1,18,279,0,1),(1,18,280,0,1),(1,18,281,0,1),(1,18,282,0,1),(1,18,283,0,1),(1,18,284,0,1),(1,18,285,0,1),(1,18,286,0,1),(1,18,287,0,1),(1,18,288,0,1),(1,18,289,0,1),(1,18,290,0,1),(1,18,291,0,1),(1,19,292,0,1),(1,19,293,0,1),(1,19,294,0,1),(1,19,295,0,1),(1,19,296,0,1),(1,19,297,0,1),(1,19,298,0,1),(1,20,299,0,1),(1,20,300,0,1),(1,20,301,0,1),(1,20,302,0,1),(1,20,303,0,1),(1,20,304,0,1),(1,20,305,0,1),(1,20,306,0,1),(1,20,307,0,1),(1,20,308,0,1),(1,20,309,0,1),(1,20,310,0,1),(1,20,311,0,1),(1,20,312,0,1),(1,20,313,0,1),(1,20,314,0,1),(1,20,315,0,1),(1,20,316,0,1),(1,20,317,0,1),(1,20,318,0,1),(1,20,319,0,1),(1,20,320,0,1),(1,20,321,0,1),(1,20,322,0,1),(1,20,323,0,1),(1,20,324,0,1),(1,20,325,0,1),(1,20,326,0,1),(1,20,327,0,1),(1,20,328,0,1),(1,20,329,0,1),(1,20,330,0,1),(1,20,331,0,1),(1,20,332,0,1),(1,20,333,0,1),(1,20,334,0,1),(1,21,335,0,1),(1,21,336,0,1),(1,21,337,0,1),(1,21,338,0,1),(1,21,339,0,1),(1,21,340,0,1),(1,21,341,0,1),(1,21,342,0,1),(1,21,343,0,1),(1,21,344,0,1),(1,21,345,0,1),(1,21,346,0,1),(1,21,347,0,1),(1,21,348,0,1),(1,21,349,0,1),(1,21,350,0,1),(1,21,351,0,1),(1,21,352,0,1),(1,21,353,0,1),(1,21,354,0,1),(1,21,355,0,1),(1,21,356,0,1),(1,21,357,0,1),(1,21,358,0,1),(1,21,359,0,1),(1,21,360,0,1),(1,21,361,0,1),(1,21,362,0,1),(1,21,363,0,1),(1,21,364,0,1),(1,21,365,0,1),(1,21,366,0,1),(1,21,367,0,1),(1,21,368,0,1),(1,21,369,0,1),(1,21,370,0,1),(1,21,371,0,1),(1,22,372,0,1),(1,22,373,0,1),(1,22,374,0,1),(1,22,375,0,1),(1,22,376,0,1),(1,22,377,0,1),(1,22,378,0,1),(1,22,379,0,1),(1,22,380,0,1),(1,22,381,0,1),(1,22,382,0,1),(1,22,383,0,1),(1,22,384,0,1),(1,22,385,0,1),(1,22,386,0,1),(1,22,387,0,1),(1,22,388,0,1),(1,22,389,0,1),(1,22,390,0,1),(1,22,391,0,1),(1,22,392,0,1),(1,22,393,0,1),(1,22,394,0,1),(1,22,395,0,1),(1,22,396,0,1),(1,22,397,0,1),(1,22,398,0,1),(1,22,399,0,1),(1,22,400,0,1),(1,22,401,0,1),(1,22,402,0,1),(1,22,403,0,1),(1,22,404,0,1),(1,22,405,0,1),(1,22,406,0,1),(1,22,407,0,1),(1,22,408,0,1),(1,22,409,0,1),(1,22,410,0,1),(1,22,411,0,1),(1,22,412,0,1),(1,22,413,0,1),(1,22,414,0,1),(1,22,415,0,1),(1,22,416,0,1),(1,22,417,0,1),(1,23,418,0,1),(1,23,419,0,1),(1,23,420,0,1),(1,23,421,0,1),(1,23,422,0,1),(1,23,423,0,1),(1,23,424,0,1),(1,23,425,0,1),(1,23,426,0,1),(1,23,427,0,1),(1,23,428,0,1),(1,23,429,0,1),(1,23,430,0,1),(1,23,431,0,1),(1,23,432,0,1),(1,23,433,0,1),(1,23,434,0,1),(1,23,435,0,1),(1,23,436,0,1),(1,23,437,0,1),(1,23,438,0,1),(1,23,439,0,1),(1,23,440,0,1),(1,23,441,0,1),(1,23,442,0,1),(1,23,443,0,1),(1,23,444,0,1),(1,23,445,0,1),(1,23,446,0,1),(1,23,447,0,1),(1,23,448,0,1),(1,23,449,0,1),(1,23,450,0,1),(1,23,451,0,1),(1,23,452,0,1),(1,23,453,0,1),(1,23,454,0,1),(1,23,455,0,1),(1,10,493,0,1),(1,10,494,0,1),(1,10,495,0,1),(1,10,496,0,1),(1,10,497,0,1),(1,10,498,0,1),(1,31,499,0,1),(1,31,500,0,1),(1,31,501,0,1),(1,31,502,0,1),(1,32,505,0,1),(1,32,506,0,1),(1,32,507,0,1),(1,32,508,0,1),(1,32,509,0,1),(1,32,510,0,1),(1,32,511,0,1),(1,32,512,0,1),(1,32,513,0,1),(1,32,514,0,1),(1,32,515,0,1),(1,32,516,0,1),(1,32,517,0,1),(1,32,518,0,1),(1,32,519,0,1),(1,32,520,0,1),(1,32,521,0,1),(1,32,522,0,1),(1,33,523,0,1),(1,33,524,0,1),(1,33,525,0,1),(1,33,526,0,1),(1,33,527,0,1),(1,33,528,0,1),(1,33,529,0,1),(1,33,530,0,1),(1,33,531,0,1),(1,33,532,0,1),(1,33,533,0,1),(1,33,534,0,1),(1,33,535,0,1),(1,33,536,0,1),(1,33,537,0,1),(1,33,538,0,1),(1,33,539,0,1),(1,33,540,0,1),(1,35,541,0,1),(1,35,542,0,1),(1,35,543,0,1),(1,35,544,0,1),(1,35,545,0,1),(1,35,546,0,1),(1,35,547,0,1),(1,35,548,0,1),(1,35,549,0,1),(1,35,550,0,1),(1,35,551,0,1),(1,35,552,0,1),(1,35,553,0,1),(1,35,554,0,1),(1,35,555,0,1),(1,35,556,0,1),(1,38,557,0,1),(1,38,558,0,1),(1,38,559,0,1),(1,38,560,0,1),(1,38,561,0,1),(1,38,562,0,1),(1,38,563,0,1),(1,39,564,0,1),(1,39,565,0,1),(1,39,566,0,1),(1,39,567,0,1),(1,39,568,0,1),(1,39,569,0,1),(1,39,570,0,1),(1,39,571,0,1),(1,39,572,0,1),(1,40,573,0,1),(1,40,574,0,1),(1,40,575,0,1),(1,40,576,0,1),(1,40,577,0,1),(1,40,578,0,1),(1,40,579,0,1),(1,40,580,0,1),(1,40,581,0,1),(1,40,582,0,1),(1,40,583,0,1),(1,40,584,0,1),(1,40,585,0,1),(1,40,586,0,1),(1,41,587,0,1),(1,41,588,0,1),(1,41,589,0,1),(1,41,590,0,1),(1,41,591,0,1),(1,41,592,0,1),(1,41,593,0,1),(1,41,594,0,1),(1,41,595,0,1),(1,41,596,0,1),(1,41,597,0,1),(1,41,598,0,1),(1,41,599,0,1),(1,41,600,0,1),(1,41,601,0,1),(1,41,602,0,1),(1,43,603,0,1),(1,43,604,0,1),(1,43,605,0,1),(1,43,606,0,1),(1,14,611,0,1),(1,14,612,0,1),(1,14,613,0,1),(1,14,614,0,1),(1,14,616,0,1),(1,48,618,0,1),(1,48,619,0,1),(1,48,620,0,1),(1,48,621,0,1),(1,48,622,0,1),(1,48,623,0,1),(1,48,624,0,1),(1,48,625,0,1),(1,48,626,0,1),(1,48,627,0,1),(1,48,628,0,1),(1,48,629,0,1),(1,48,630,0,1),(1,48,631,0,1),(1,48,632,0,1),(1,48,633,0,1),(1,48,634,0,1),(1,48,635,0,1),(1,48,636,0,1),(1,23,637,0,1),(1,23,638,0,1),(1,23,639,0,1),(1,23,640,0,1),(1,49,641,0,1),(1,49,642,0,1),(1,49,643,0,1),(1,49,644,0,1),(1,49,645,0,1),(1,49,646,0,1),(1,49,647,0,1),(1,49,648,0,1),(1,49,649,0,1),(1,49,650,0,1),(1,49,651,0,1),(1,49,652,0,1),(1,49,653,0,1),(1,49,654,0,1),(1,49,655,0,1),(1,49,656,0,1),(1,49,657,0,1),(1,49,658,0,1),(1,49,659,0,1),(1,49,660,0,1),(1,49,661,0,1),(1,49,662,0,1),(1,49,663,0,1),(1,49,664,0,1),(1,49,665,0,1),(1,49,666,0,1),(1,49,667,0,1),(1,49,668,0,1),(1,49,669,0,1),(1,49,670,0,1),(1,49,671,0,1),(1,49,672,0,1),(1,49,673,0,1),(1,49,674,0,1),(1,49,675,0,1),(1,49,676,0,1),(1,49,677,0,1),(1,49,678,0,1),(1,49,679,0,1),(1,49,680,0,1),(1,49,681,0,1),(1,49,682,0,1),(1,49,683,0,1),(1,49,684,0,1),(1,49,685,0,1),(1,49,686,0,1),(1,49,687,0,1),(1,49,688,0,1),(1,49,689,0,1),(1,49,690,0,1),(1,49,691,0,1),(1,49,692,0,1),(1,14,694,0,1),(1,14,695,0,1),(1,50,696,0,1),(1,50,697,0,1),(1,50,698,0,1),(1,50,699,0,1),(1,50,700,0,1),(1,50,701,0,1),(1,50,702,0,1),(1,50,703,0,1),(1,50,704,0,1),(1,50,705,0,1),(1,50,706,0,1),(1,50,707,0,1),(1,14,708,0,1),(1,51,709,0,1),(1,51,710,0,1),(1,51,711,0,1),(1,51,712,0,1),(1,51,713,0,1),(1,51,714,0,1),(1,51,715,0,1),(1,51,716,0,1),(1,51,717,0,1),(1,51,718,0,1),(1,51,719,0,1),(1,51,720,0,1),(1,51,721,0,1),(1,52,722,0,1),(1,52,723,0,1),(1,52,724,0,1),(1,52,725,0,1),(1,52,726,0,1),(1,52,727,0,1),(1,52,728,0,1),(1,52,729,0,1),(1,52,730,0,1),(1,52,731,0,1),(1,53,732,0,1),(1,53,733,0,1),(1,53,734,0,1),(1,53,735,0,1),(1,53,736,0,1),(1,53,737,0,1),(1,53,738,0,1),(1,53,739,0,1),(1,53,740,0,1),(1,54,741,0,1),(1,54,742,0,1),(1,54,743,0,1),(1,54,744,0,1),(1,54,745,0,1),(1,54,746,0,1),(1,54,747,0,1),(1,54,748,0,1),(1,54,749,0,1),(1,54,750,0,1),(1,54,751,0,1),(1,54,752,0,1),(1,54,753,0,1),(1,54,754,0,1),(1,54,755,0,1),(1,54,756,0,1),(1,54,757,0,1),(1,54,758,0,1),(1,54,759,0,1),(1,54,760,0,1),(1,55,761,0,1),(1,55,762,0,1),(1,55,763,0,1),(1,55,764,0,1),(1,55,765,0,1),(1,55,766,0,1),(1,55,767,0,1),(1,56,768,0,1),(1,56,769,0,1),(1,56,770,0,1),(1,56,771,0,1),(1,56,772,0,1),(1,56,773,0,1),(1,56,774,0,1),(1,56,775,0,1),(1,56,776,0,1),(1,56,777,0,1),(1,56,778,0,1),(1,56,779,0,1),(1,48,780,0,1),(1,48,781,0,1),(1,56,782,0,1),(1,56,783,0,1),(1,48,784,0,1),(1,48,785,0,1),(1,49,786,0,1),(1,57,787,0,1),(1,57,788,0,1),(1,57,789,0,1),(1,57,790,0,1),(1,57,791,0,1),(1,57,792,0,1),(1,57,793,0,1),(1,57,794,0,1),(1,57,795,0,1),(1,57,796,0,1),(1,57,797,0,1),(1,57,798,0,1),(1,57,799,0,1),(1,58,800,0,1),(1,58,801,0,1),(1,58,802,0,1),(1,58,803,0,1),(1,58,804,0,1),(1,58,805,0,1),(1,58,806,0,1),(1,58,807,0,1),(1,58,808,0,1),(1,58,809,0,1),(1,58,810,0,1),(1,60,811,0,1),(1,60,812,0,1),(1,60,813,0,1),(1,61,814,0,1),(1,61,815,0,1),(1,61,816,0,1),(1,62,817,0,1),(1,62,818,0,1),(1,62,819,0,1),(1,62,820,0,1),(1,62,821,0,1),(1,62,822,0,1),(1,62,823,0,1),(1,62,824,0,1),(1,62,825,0,1),(1,62,826,0,1),(1,62,827,0,1),(1,62,828,0,1),(1,48,829,0,1),(1,48,830,0,1),(1,48,831,0,1),(1,48,832,0,1),(1,14,833,0,1),(1,14,834,0,1),(1,14,835,0,1),(2,6,1,0,1),(2,6,2,0,1),(2,6,3,0,1),(2,6,4,0,1),(2,6,5,0,1),(2,6,6,0,1),(2,6,7,0,1),(2,6,8,0,1),(2,6,9,0,1),(2,6,10,0,1),(2,6,11,0,1),(2,6,12,0,1),(2,6,13,0,1),(2,6,14,0,1),(2,6,15,0,1),(2,6,16,0,1),(2,6,17,0,1),(2,6,18,0,1),(2,6,19,0,1),(2,6,20,0,1),(2,6,21,0,1),(2,6,22,0,1),(2,6,23,0,1),(2,6,24,0,1),(2,6,25,0,1),(2,6,26,0,1),(2,6,27,0,1),(2,6,28,0,1),(2,6,29,0,1),(2,6,30,0,1),(2,6,31,0,1),(2,6,32,0,1),(2,6,33,0,1),(2,6,34,0,1),(2,6,35,0,1),(2,7,36,0,1),(2,7,37,0,1),(2,7,38,0,1),(2,7,39,0,1),(2,7,40,0,1),(2,7,41,0,1),(2,7,42,0,1),(2,7,43,0,1),(2,7,44,0,1),(2,7,45,0,1),(2,7,46,0,1),(2,7,47,0,1),(2,7,48,0,1),(2,7,49,0,1),(2,7,50,0,1),(2,7,51,0,1),(2,7,52,0,1),(2,7,53,0,1),(2,7,54,0,1),(2,7,55,0,1),(2,7,56,0,1),(2,7,57,0,1),(2,7,58,0,1),(2,7,59,0,1),(2,7,60,0,1),(2,7,61,0,1),(2,7,62,0,1),(2,7,63,0,1),(2,4,64,0,1),(2,4,65,0,1),(2,4,66,0,1),(2,4,67,0,1),(2,4,68,0,1),(2,4,69,0,1),(2,4,70,0,1),(2,4,71,0,1),(2,4,72,0,1),(2,4,73,0,1),(2,4,74,0,1),(2,4,75,0,1),(2,4,76,0,1),(2,4,77,0,1),(2,4,78,0,1),(2,4,79,0,1),(2,4,80,0,1),(2,4,81,0,1),(2,4,82,0,1),(2,4,83,0,1),(2,4,84,0,1),(2,4,85,0,1),(2,4,86,0,1),(2,4,87,0,1),(2,4,88,0,1),(2,4,89,0,1),(2,4,90,0,1),(2,4,91,0,1),(2,4,92,0,1),(2,4,93,0,1),(2,4,94,0,1),(2,4,95,0,1),(2,4,96,0,1),(2,4,97,0,1),(2,4,98,0,1),(2,4,99,0,1),(2,4,100,0,1),(2,4,101,0,1),(2,4,102,0,1),(2,4,103,0,1),(2,4,104,0,1),(2,4,105,0,1),(2,4,106,0,1),(2,2,107,0,1),(2,2,108,0,1),(2,2,109,0,1),(2,2,110,0,1),(2,2,111,0,1),(2,2,112,0,1),(2,2,113,0,1),(2,2,114,0,1),(2,2,115,0,1),(2,2,116,0,1),(2,2,117,0,1),(2,2,118,0,1),(2,2,119,0,1),(2,2,120,0,1),(2,2,121,0,1),(2,26,122,0,1),(2,26,123,0,1),(2,26,124,0,1),(2,26,125,0,1),(2,26,126,0,1),(2,26,127,0,1),(2,26,128,0,1),(2,26,129,0,1),(2,26,130,0,1),(2,26,131,0,1),(2,26,132,0,1),(2,26,133,0,1),(2,26,134,0,1),(2,26,135,0,1),(2,26,136,0,1),(2,26,137,0,1),(2,26,138,0,1),(2,26,139,0,1),(2,26,140,0,1),(2,26,141,0,1),(2,26,142,0,1),(2,26,143,0,1),(2,26,144,0,1),(2,26,145,0,1),(2,4,146,0,1),(2,6,147,0,1),(2,7,148,0,1),(2,26,149,0,1),(2,13,150,0,1),(2,13,151,0,1),(2,13,152,0,1),(2,13,153,0,1),(2,13,154,0,1),(2,13,155,0,1),(2,13,156,0,1),(2,13,157,0,1),(2,13,158,0,1),(2,13,159,0,1),(2,13,160,0,1),(2,13,161,0,1),(2,13,162,0,1),(2,13,163,0,1),(2,13,164,0,1),(2,13,165,0,1),(2,13,166,0,1),(2,14,167,0,1),(2,14,168,0,1),(2,14,169,0,1),(2,14,170,0,1),(2,14,171,0,1),(2,14,172,0,1),(2,14,173,0,1),(2,14,174,0,1),(2,14,175,0,1),(2,14,176,0,1),(2,14,177,0,1),(2,14,178,0,1),(2,14,179,0,1),(2,14,180,0,1),(2,14,181,0,1),(2,14,182,0,1),(2,14,183,0,1),(2,14,184,0,1),(2,14,185,0,1),(2,14,186,0,1),(2,14,187,0,1),(2,14,188,0,1),(2,14,189,0,1),(2,14,190,0,1),(2,14,191,0,1),(2,14,192,0,1),(2,14,193,0,1),(2,14,194,0,1),(2,14,195,0,1),(2,14,196,0,1),(2,8,197,0,1),(2,8,198,0,1),(2,8,199,0,1),(2,8,200,0,1),(2,8,201,0,1),(2,8,202,0,1),(2,8,209,0,1),(2,8,210,0,1),(2,10,211,0,1),(2,10,212,0,1),(2,10,213,0,1),(2,10,214,0,1),(2,10,215,0,1),(2,10,216,0,1),(2,10,217,0,1),(2,10,218,0,1),(2,10,219,0,1),(2,10,220,0,1),(2,10,221,0,1),(2,9,222,0,1),(2,9,223,0,1),(2,9,224,0,1),(2,9,225,0,1),(2,9,226,0,1),(2,9,227,0,1),(2,9,228,0,1),(2,9,229,0,1),(2,9,230,0,1),(2,9,231,0,1),(2,9,232,0,1),(2,9,233,0,1),(2,9,234,0,1),(2,9,235,0,1),(2,9,236,0,1),(2,9,237,0,1),(2,9,238,0,1),(2,9,239,0,1),(2,9,240,0,1),(2,9,241,0,1),(2,9,242,0,1),(2,9,243,0,1),(2,9,244,0,1),(2,16,245,0,1),(2,16,246,0,1),(2,16,247,0,1),(2,16,248,0,1),(2,16,249,0,1),(2,16,250,0,1),(2,16,251,0,1),(2,16,252,0,1),(2,16,253,0,1),(2,16,254,0,1),(2,16,255,0,1),(2,16,256,0,1),(2,16,257,0,1),(2,16,258,0,1),(2,16,259,0,1),(2,16,260,0,1),(2,16,261,0,1),(2,16,262,0,1),(2,16,263,0,1),(2,16,264,0,1),(2,16,265,0,1),(2,16,266,0,1),(2,15,267,0,1),(2,15,268,0,1),(2,15,269,0,1),(2,15,270,0,1),(2,15,271,0,1),(2,15,272,0,1),(2,15,273,0,1),(2,15,274,0,1),(2,15,275,0,1),(2,18,276,0,1),(2,18,277,0,1),(2,18,278,0,1),(2,18,279,0,1),(2,18,280,0,1),(2,18,281,0,1),(2,18,282,0,1),(2,18,283,0,1),(2,18,284,0,1),(2,18,285,1,1),(2,18,286,1,1),(2,18,287,1,1),(2,18,288,1,1),(2,18,289,1,1),(2,18,290,1,1),(2,18,291,0,1),(2,19,292,0,1),(2,19,293,0,1),(2,19,294,0,1),(2,19,295,0,1),(2,19,296,0,1),(2,19,297,0,1),(2,19,298,0,1),(2,20,299,0,1),(2,20,300,0,1),(2,20,301,0,1),(2,20,302,0,1),(2,20,303,0,1),(2,20,304,0,1),(2,20,305,0,1),(2,20,306,0,1),(2,20,307,0,1),(2,20,308,0,1),(2,20,309,0,1),(2,20,310,0,1),(2,20,311,0,1),(2,20,312,0,1),(2,20,313,0,1),(2,20,314,0,1),(2,20,315,0,1),(2,20,316,0,1),(2,20,317,0,1),(2,20,318,0,1),(2,20,319,0,1),(2,20,320,0,1),(2,20,321,0,1),(2,20,322,0,1),(2,20,323,0,1),(2,20,324,0,1),(2,20,325,0,1),(2,20,326,0,1),(2,20,327,0,1),(2,20,328,0,1),(2,20,329,0,1),(2,20,330,0,1),(2,20,331,0,1),(2,20,332,0,1),(2,20,333,0,1),(2,20,334,0,1),(2,21,335,0,1),(2,21,336,0,1),(2,21,337,0,1),(2,21,338,0,1),(2,21,339,0,1),(2,21,340,0,1),(2,21,341,0,1),(2,21,342,0,1),(2,21,343,0,1),(2,21,344,0,1),(2,21,345,0,1),(2,21,346,0,1),(2,21,347,0,1),(2,21,348,0,1),(2,21,349,0,1),(2,21,350,0,1),(2,21,351,0,1),(2,21,352,0,1),(2,21,353,0,1),(2,21,354,0,1),(2,21,355,0,1),(2,21,356,0,1),(2,21,357,0,1),(2,21,358,0,1),(2,21,359,0,1),(2,21,360,0,1),(2,21,361,0,1),(2,21,362,0,1),(2,21,363,0,1),(2,21,364,0,1),(2,21,365,0,1),(2,21,366,0,1),(2,21,367,0,1),(2,21,368,0,1),(2,21,369,0,1),(2,21,370,0,1),(2,21,371,0,1),(2,22,372,0,1),(2,22,373,0,1),(2,22,374,0,1),(2,22,375,0,1),(2,22,376,0,1),(2,22,377,0,1),(2,22,378,0,1),(2,22,379,0,1),(2,22,380,0,1),(2,22,381,0,1),(2,22,382,0,1),(2,22,383,0,1),(2,22,384,0,1),(2,22,385,0,1),(2,22,386,0,1),(2,22,387,0,1),(2,22,388,0,1),(2,22,389,0,1),(2,22,390,0,1),(2,22,391,0,1),(2,22,392,0,1),(2,22,393,0,1),(2,22,394,0,1),(2,22,395,0,1),(2,22,396,0,1),(2,22,397,0,1),(2,22,398,0,1),(2,22,399,0,1),(2,22,400,0,1),(2,22,401,0,1),(2,22,402,0,1),(2,22,403,0,1),(2,22,404,0,1),(2,22,405,0,1),(2,22,406,0,1),(2,22,407,0,1),(2,22,408,0,1),(2,22,409,0,1),(2,22,410,0,1),(2,22,411,0,1),(2,22,412,0,1),(2,22,413,0,1),(2,22,414,0,1),(2,22,415,0,1),(2,22,416,0,1),(2,22,417,0,1),(2,23,418,0,1),(2,23,419,0,1),(2,23,420,0,1),(2,23,421,0,1),(2,23,422,0,1),(2,23,423,0,1),(2,23,424,0,1),(2,23,425,0,1),(2,23,426,0,1),(2,23,427,0,1),(2,23,428,0,1),(2,23,429,0,1),(2,23,430,0,1),(2,23,431,0,1),(2,23,432,0,1),(2,23,433,0,1),(2,23,434,0,1),(2,23,435,0,1),(2,23,436,0,1),(2,23,437,0,1),(2,23,438,0,1),(2,23,439,0,1),(2,23,440,0,1),(2,23,441,0,1),(2,23,442,0,1),(2,23,443,0,1),(2,23,444,0,1),(2,23,445,0,1),(2,23,446,0,1),(2,23,447,0,1),(2,23,448,0,1),(2,23,449,0,1),(2,23,450,0,1),(2,23,451,0,1),(2,23,452,0,1),(2,23,453,0,1),(2,23,454,0,1),(2,23,455,0,1),(2,10,493,0,1),(2,10,494,0,1),(2,10,495,0,1),(2,10,496,0,1),(2,10,497,0,1),(2,10,498,0,1),(2,31,499,0,1),(2,31,500,0,1),(2,31,501,0,1),(2,31,502,0,1),(2,32,505,0,1),(2,32,506,0,1),(2,32,507,0,1),(2,32,508,0,1),(2,32,509,0,1),(2,32,510,0,1),(2,32,511,0,1),(2,32,512,0,1),(2,32,513,0,1),(2,32,514,0,1),(2,32,515,0,1),(2,32,516,0,1),(2,32,517,0,1),(2,32,518,0,1),(2,32,519,0,1),(2,32,520,0,1),(2,32,521,0,1),(2,32,522,0,1),(2,33,523,0,1),(2,33,524,0,1),(2,33,525,0,1),(2,33,526,0,1),(2,33,527,0,1),(2,33,528,0,1),(2,33,529,0,1),(2,33,530,0,1),(2,33,531,0,1),(2,33,532,0,1),(2,33,533,0,1),(2,33,534,0,1),(2,33,535,0,1),(2,33,536,0,1),(2,33,537,0,1),(2,33,538,0,1),(2,33,539,0,1),(2,33,540,0,1),(2,35,541,0,1),(2,35,542,0,1),(2,35,543,0,1),(2,35,544,0,1),(2,35,545,0,1),(2,35,546,0,1),(2,35,547,0,1),(2,35,548,0,1),(2,35,549,0,1),(2,35,550,0,1),(2,35,551,0,1),(2,35,552,0,1),(2,35,553,0,1),(2,35,554,0,1),(2,35,555,0,1),(2,35,556,0,1),(2,38,557,0,1),(2,38,558,0,1),(2,38,559,0,1),(2,38,560,0,1),(2,38,561,0,1),(2,38,562,0,1),(2,38,563,0,1),(2,39,564,0,1),(2,39,565,0,1),(2,39,566,0,1),(2,39,567,0,1),(2,39,568,0,1),(2,39,569,0,1),(2,39,570,0,1),(2,39,571,0,1),(2,39,572,0,1),(2,40,573,0,1),(2,40,574,0,1),(2,40,575,0,1),(2,40,576,0,1),(2,40,577,0,1),(2,40,578,0,1),(2,40,579,0,1),(2,40,580,0,1),(2,40,581,0,1),(2,40,582,0,1),(2,40,583,0,1),(2,40,584,0,1),(2,40,585,0,1),(2,40,586,0,1),(2,41,587,0,1),(2,41,588,0,1),(2,41,589,0,1),(2,41,590,0,1),(2,41,591,0,1),(2,41,592,0,1),(2,41,593,0,1),(2,41,594,0,1),(2,41,595,0,1),(2,41,596,0,1),(2,41,597,0,1),(2,41,598,0,1),(2,41,599,0,1),(2,41,600,0,1),(2,41,601,0,1),(2,41,602,0,1),(2,43,603,0,1),(2,43,604,0,1),(2,43,605,0,1),(2,43,606,0,1),(2,14,611,0,1),(2,14,612,0,1),(2,14,613,0,1),(2,14,614,0,1),(2,14,616,0,1),(2,48,618,0,1),(2,48,619,0,1),(2,48,620,0,1),(2,48,621,0,1),(2,48,622,0,1),(2,48,623,0,1),(2,48,624,0,1),(2,48,625,0,1),(2,48,626,0,1),(2,48,627,0,1),(2,48,628,0,1),(2,48,629,0,1),(2,48,630,0,1),(2,48,631,0,1),(2,48,632,0,1),(2,48,633,0,1),(2,48,634,0,1),(2,48,635,0,1),(2,48,636,0,1),(2,23,637,0,1),(2,23,638,0,1),(2,23,639,0,1),(2,23,640,0,1),(2,49,641,0,1),(2,49,642,0,1),(2,49,643,0,1),(2,49,644,0,1),(2,49,645,0,1),(2,49,646,0,1),(2,49,647,0,1),(2,49,648,0,1),(2,49,649,0,1),(2,49,650,0,1),(2,49,651,0,1),(2,49,652,0,1),(2,49,653,0,1),(2,49,654,0,1),(2,49,655,0,1),(2,49,656,0,1),(2,49,657,0,1),(2,49,658,0,1),(2,49,659,0,1),(2,49,660,0,1),(2,49,661,0,1),(2,49,662,0,1),(2,49,663,0,1),(2,49,664,0,1),(2,49,665,0,1),(2,49,666,0,1),(2,49,667,0,1),(2,49,668,0,1),(2,49,669,0,1),(2,49,670,0,1),(2,49,671,0,1),(2,49,672,0,1),(2,49,673,0,1),(2,49,674,0,1),(2,49,675,0,1),(2,49,676,0,1),(2,49,677,0,1),(2,49,678,0,1),(2,49,679,0,1),(2,49,680,0,1),(2,49,681,0,1),(2,49,682,0,1),(2,49,683,0,1),(2,49,684,0,1),(2,49,685,0,1),(2,49,686,0,1),(2,49,687,0,1),(2,49,688,0,1),(2,49,689,0,1),(2,49,690,0,1),(2,49,691,0,1),(2,49,692,0,1),(2,14,694,0,1),(2,14,695,0,1),(2,50,696,0,1),(2,50,697,0,1),(2,50,698,0,1),(2,50,699,0,1),(2,50,700,0,1),(2,50,701,0,1),(2,50,702,0,1),(2,50,703,0,1),(2,50,704,0,1),(2,50,705,0,1),(2,50,706,0,1),(2,50,707,0,1),(2,14,708,0,1),(2,51,709,0,1),(2,51,710,0,1),(2,51,711,0,1),(2,51,712,0,1),(2,51,713,0,1),(2,51,714,0,1),(2,51,715,0,1),(2,51,716,0,1),(2,51,717,0,1),(2,51,718,0,1),(2,51,719,0,1),(2,51,720,0,1),(2,51,721,0,1),(2,52,722,0,1),(2,52,723,0,1),(2,52,724,0,1),(2,52,725,0,1),(2,52,726,0,1),(2,52,727,0,1),(2,52,728,0,1),(2,52,729,0,1),(2,52,730,0,1),(2,52,731,0,1),(2,53,732,0,1),(2,53,733,0,1),(2,53,734,0,1),(2,53,735,0,1),(2,53,736,0,1),(2,53,737,0,1),(2,53,738,0,1),(2,53,739,0,1),(2,53,740,0,1),(2,54,741,0,1),(2,54,742,0,1),(2,54,743,0,1),(2,54,744,0,1),(2,54,745,0,1),(2,54,746,0,1),(2,54,747,0,1),(2,54,748,0,1),(2,54,749,0,1),(2,54,750,0,1),(2,54,751,0,1),(2,54,752,0,1),(2,54,753,0,1),(2,54,754,0,1),(2,54,755,0,1),(2,54,756,0,1),(2,54,757,0,1),(2,54,758,0,1),(2,54,759,0,1),(2,54,760,0,1),(2,55,761,0,1),(2,55,762,0,1),(2,55,763,0,1),(2,55,764,0,1),(2,55,765,0,1),(2,55,766,0,1),(2,55,767,0,1),(2,56,768,0,1),(2,56,769,0,1),(2,56,770,0,1),(2,56,771,0,1),(2,56,772,0,1),(2,56,773,0,1),(2,56,774,0,1),(2,56,775,0,1),(2,56,776,0,1),(2,56,777,0,1),(2,56,778,0,1),(2,56,779,0,1),(2,48,780,0,1),(2,48,781,0,1),(2,56,782,0,1),(2,56,783,0,1),(2,48,784,0,1),(2,48,785,0,1),(2,49,786,0,1),(2,57,787,0,1),(2,57,788,0,1),(2,57,789,0,1),(2,57,790,0,1),(2,57,791,0,1),(2,57,792,0,1),(2,57,793,0,1),(2,57,794,0,1),(2,57,795,0,1),(2,57,796,0,1),(2,57,797,0,1),(2,57,798,0,1),(2,57,799,0,1),(2,58,800,0,1),(2,58,801,0,1),(2,58,802,0,1),(2,58,803,0,1),(2,58,804,0,1),(2,58,805,0,1),(2,58,806,0,1),(2,58,807,0,1),(2,58,808,0,1),(2,58,809,0,1),(2,58,810,0,1),(2,60,811,0,1),(2,60,812,0,1),(2,60,813,0,1),(2,61,814,0,1),(2,61,815,0,1),(2,61,816,0,1),(2,62,817,0,1),(2,62,818,0,1),(2,62,819,0,1),(2,62,820,0,1),(2,62,821,0,1),(2,62,822,0,1),(2,62,823,0,1),(2,62,824,0,1),(2,62,825,0,1),(2,62,826,0,1),(2,62,827,0,1),(2,62,828,0,1),(2,48,829,0,1),(2,48,830,0,1),(2,48,831,0,1),(2,48,832,0,1),(2,14,833,0,1),(2,14,834,0,1),(2,14,835,0,1),(3,6,1,0,1),(3,6,2,0,1),(3,6,3,0,1),(3,6,4,0,1),(3,6,5,0,1),(3,6,6,0,1),(3,6,7,0,1),(3,6,8,0,1),(3,6,9,0,1),(3,6,10,0,1),(3,6,11,0,1),(3,6,12,0,1),(3,6,13,0,1),(3,6,14,0,1),(3,6,15,0,1),(3,6,16,0,1),(3,6,17,0,1),(3,6,18,0,1),(3,6,19,0,1),(3,6,20,0,1),(3,6,21,0,1),(3,6,22,0,1),(3,6,23,0,1),(3,6,24,0,1),(3,6,25,0,1),(3,6,26,0,1),(3,6,27,0,1),(3,6,28,0,1),(3,6,29,0,1),(3,6,30,0,1),(3,6,31,0,1),(3,6,32,0,1),(3,6,33,0,1),(3,6,34,0,1),(3,6,35,0,1),(3,7,36,0,1),(3,7,37,0,1),(3,7,38,0,1),(3,7,39,0,1),(3,7,40,0,1),(3,7,41,0,1),(3,7,42,0,1),(3,7,43,0,1),(3,7,44,0,1),(3,7,45,0,1),(3,7,46,0,1),(3,7,47,0,1),(3,7,48,0,1),(3,7,49,0,1),(3,7,50,0,1),(3,7,51,0,1),(3,7,52,0,1),(3,7,53,0,1),(3,7,54,0,1),(3,7,55,0,1),(3,7,56,0,1),(3,7,57,0,1),(3,7,58,0,1),(3,7,59,0,1),(3,7,60,0,1),(3,7,61,0,1),(3,7,62,0,1),(3,7,63,0,1),(3,4,64,0,1),(3,4,65,0,1),(3,4,66,0,1),(3,4,67,0,1),(3,4,68,0,1),(3,4,69,0,1),(3,4,70,0,1),(3,4,71,0,1),(3,4,72,0,1),(3,4,73,0,1),(3,4,74,0,1),(3,4,75,0,1),(3,4,76,0,1),(3,4,77,0,1),(3,4,78,0,1),(3,4,79,0,1),(3,4,80,0,1),(3,4,81,0,1),(3,4,82,0,1),(3,4,83,0,1),(3,4,84,0,1),(3,4,85,0,1),(3,4,86,0,1),(3,4,87,0,1),(3,4,88,0,1),(3,4,89,0,1),(3,4,90,0,1),(3,4,91,0,1),(3,4,92,0,1),(3,4,93,0,1),(3,4,94,0,1),(3,4,95,0,1),(3,4,96,0,1),(3,4,97,0,1),(3,4,98,0,1),(3,4,99,0,1),(3,4,100,0,1),(3,4,101,0,1),(3,4,102,0,1),(3,4,103,0,1),(3,4,104,0,1),(3,4,105,0,1),(3,4,106,0,1),(3,2,107,0,1),(3,2,108,0,1),(3,2,109,0,1),(3,2,110,0,1),(3,2,111,0,1),(3,2,112,0,1),(3,2,113,0,1),(3,2,114,0,1),(3,2,115,0,1),(3,2,116,0,1),(3,2,117,0,1),(3,2,118,0,1),(3,2,119,0,1),(3,2,120,0,1),(3,2,121,0,1),(3,26,122,0,1),(3,26,123,0,1),(3,26,124,0,1),(3,26,125,0,1),(3,26,126,0,1),(3,26,127,0,1),(3,26,128,0,1),(3,26,129,0,1),(3,26,130,0,1),(3,26,131,0,1),(3,26,132,0,1),(3,26,133,0,1),(3,26,134,0,1),(3,26,135,0,1),(3,26,136,0,1),(3,26,137,0,1),(3,26,138,0,1),(3,26,139,0,1),(3,26,140,0,1),(3,26,141,0,1),(3,26,142,0,1),(3,26,143,0,1),(3,26,144,0,1),(3,26,145,0,1),(3,4,146,0,1),(3,6,147,0,1),(3,7,148,0,1),(3,26,149,0,1),(3,13,150,0,1),(3,13,151,0,1),(3,13,152,0,1),(3,13,153,0,1),(3,13,154,0,1),(3,13,155,0,1),(3,13,156,0,1),(3,13,157,0,1),(3,13,158,0,1),(3,13,159,0,1),(3,13,160,0,1),(3,13,161,0,1),(3,13,162,0,1),(3,13,163,0,1),(3,13,164,0,1),(3,13,165,0,1),(3,13,166,0,1),(3,14,167,0,1),(3,14,168,0,1),(3,14,169,0,1),(3,14,170,0,1),(3,14,171,0,1),(3,14,172,0,1),(3,14,173,0,1),(3,14,174,0,1),(3,14,175,0,1),(3,14,176,0,1),(3,14,177,0,1),(3,14,178,0,1),(3,14,179,0,1),(3,14,180,0,1),(3,14,181,0,1),(3,14,182,0,1),(3,14,183,0,1),(3,14,184,0,1),(3,14,185,0,1),(3,14,186,0,1),(3,14,187,0,1),(3,14,188,0,1),(3,14,189,0,1),(3,14,190,0,1),(3,14,191,0,1),(3,14,192,0,1),(3,14,193,0,1),(3,14,194,0,1),(3,14,195,0,1),(3,14,196,0,1),(3,8,197,0,1),(3,8,198,0,1),(3,8,199,0,1),(3,8,200,0,1),(3,8,201,0,1),(3,8,202,0,1),(3,8,209,0,1),(3,8,210,0,1),(3,10,211,0,1),(3,10,212,0,1),(3,10,213,0,1),(3,10,214,0,1),(3,10,215,0,1),(3,10,216,0,1),(3,10,217,0,1),(3,10,218,0,1),(3,10,219,0,1),(3,10,220,0,1),(3,10,221,0,1),(3,9,222,0,1),(3,9,223,0,1),(3,9,224,0,1),(3,9,225,0,1),(3,9,226,0,1),(3,9,227,0,1),(3,9,228,0,1),(3,9,229,0,1),(3,9,230,0,1),(3,9,231,0,1),(3,9,232,0,1),(3,9,233,0,1),(3,9,234,0,1),(3,9,235,0,1),(3,9,236,0,1),(3,9,237,0,1),(3,9,238,0,1),(3,9,239,0,1),(3,9,240,0,1),(3,9,241,0,1),(3,9,242,0,1),(3,9,243,0,1),(3,9,244,0,1),(3,16,245,0,1),(3,16,246,0,1),(3,16,247,0,1),(3,16,248,0,1),(3,16,249,0,1),(3,16,250,0,1),(3,16,251,0,1),(3,16,252,0,1),(3,16,253,0,1),(3,16,254,0,1),(3,16,255,0,1),(3,16,256,0,1),(3,16,257,0,1),(3,16,258,0,1),(3,16,259,0,1),(3,16,260,0,1),(3,16,261,0,1),(3,16,262,0,1),(3,16,263,0,1),(3,16,264,0,1),(3,16,265,0,1),(3,16,266,0,1),(3,15,267,0,1),(3,15,268,0,1),(3,15,269,0,1),(3,15,270,0,1),(3,15,271,0,1),(3,15,272,0,1),(3,15,273,0,1),(3,15,274,0,1),(3,15,275,0,1),(3,18,276,0,1),(3,18,277,0,1),(3,18,278,0,1),(3,18,279,0,1),(3,18,280,0,1),(3,18,281,0,1),(3,18,282,0,1),(3,18,283,0,1),(3,18,284,0,1),(3,18,285,0,1),(3,18,286,0,1),(3,18,287,0,1),(3,18,288,0,1),(3,18,289,0,1),(3,18,290,0,1),(3,18,291,0,1),(3,19,292,0,1),(3,19,293,0,1),(3,19,294,0,1),(3,19,295,0,1),(3,19,296,0,1),(3,19,297,0,1),(3,19,298,0,1),(3,20,299,0,1),(3,20,300,0,1),(3,20,301,0,1),(3,20,302,0,1),(3,20,303,0,1),(3,20,304,0,1),(3,20,305,0,1),(3,20,306,0,1),(3,20,307,0,1),(3,20,308,0,1),(3,20,309,0,1),(3,20,310,0,1),(3,20,311,0,1),(3,20,312,0,1),(3,20,313,0,1),(3,20,314,0,1),(3,20,315,0,1),(3,20,316,0,1),(3,20,317,0,1),(3,20,318,0,1),(3,20,319,0,1),(3,20,320,0,1),(3,20,321,0,1),(3,20,322,0,1),(3,20,323,0,1),(3,20,324,0,1),(3,20,325,0,1),(3,20,326,0,1),(3,20,327,0,1),(3,20,328,0,1),(3,20,329,0,1),(3,20,330,0,1),(3,20,331,0,1),(3,20,332,0,1),(3,20,333,0,1),(3,20,334,0,1),(3,21,335,0,1),(3,21,336,0,1),(3,21,337,0,1),(3,21,338,0,1),(3,21,339,0,1),(3,21,340,0,1),(3,21,341,0,1),(3,21,342,0,1),(3,21,343,0,1),(3,21,344,0,1),(3,21,345,0,1),(3,21,346,0,1),(3,21,347,0,1),(3,21,348,0,1),(3,21,349,0,1),(3,21,350,0,1),(3,21,351,0,1),(3,21,352,0,1),(3,21,353,0,1),(3,21,354,0,1),(3,21,355,0,1),(3,21,356,0,1),(3,21,357,0,1),(3,21,358,0,1),(3,21,359,0,1),(3,21,360,0,1),(3,21,361,0,1),(3,21,362,0,1),(3,21,363,0,1),(3,21,364,0,1),(3,21,365,0,1),(3,21,366,0,1),(3,21,367,0,1),(3,21,368,0,1),(3,21,369,0,1),(3,21,370,0,1),(3,21,371,0,1),(3,22,372,0,1),(3,22,373,0,1),(3,22,374,0,1),(3,22,375,0,1),(3,22,376,0,1),(3,22,377,0,1),(3,22,378,0,1),(3,22,379,0,1),(3,22,380,0,1),(3,22,381,0,1),(3,22,382,0,1),(3,22,383,0,1),(3,22,384,0,1),(3,22,385,0,1),(3,22,386,0,1),(3,22,387,0,1),(3,22,388,0,1),(3,22,389,0,1),(3,22,390,0,1),(3,22,391,0,1),(3,22,392,0,1),(3,22,393,0,1),(3,22,394,0,1),(3,22,395,0,1),(3,22,396,0,1),(3,22,397,0,1),(3,22,398,0,1),(3,22,399,0,1),(3,22,400,0,1),(3,22,401,0,1),(3,22,402,0,1),(3,22,403,0,1),(3,22,404,0,1),(3,22,405,0,1),(3,22,406,0,1),(3,22,407,0,1),(3,22,408,0,1),(3,22,409,0,1),(3,22,410,0,1),(3,22,411,0,1),(3,22,412,0,1),(3,22,413,0,1),(3,22,414,0,1),(3,22,415,0,1),(3,22,416,0,1),(3,22,417,0,1),(3,23,418,0,1),(3,23,419,0,1),(3,23,420,0,1),(3,23,421,0,1),(3,23,422,0,1),(3,23,423,0,1),(3,23,424,0,1),(3,23,425,0,1),(3,23,426,0,1),(3,23,427,0,1),(3,23,428,0,1),(3,23,429,0,1),(3,23,430,0,1),(3,23,431,0,1),(3,23,432,0,1),(3,23,433,0,1),(3,23,434,0,1),(3,23,435,0,1),(3,23,436,0,1),(3,23,437,0,1),(3,23,438,0,1),(3,23,439,0,1),(3,23,440,0,1),(3,23,441,0,1),(3,23,442,0,1),(3,23,443,0,1),(3,23,444,0,1),(3,23,445,0,1),(3,23,446,0,1),(3,23,447,0,1),(3,23,448,0,1),(3,23,449,0,1),(3,23,450,0,1),(3,23,451,0,1),(3,23,452,0,1),(3,23,453,0,1),(3,23,454,0,1),(3,23,455,0,1),(3,10,493,0,1),(3,10,494,0,1),(3,10,495,0,1),(3,10,496,0,1),(3,10,497,0,1),(3,10,498,0,1),(3,31,499,0,1),(3,31,500,0,1),(3,31,501,0,1),(3,31,502,0,1),(3,32,505,0,1),(3,32,506,0,1),(3,32,507,0,1),(3,32,508,0,1),(3,32,509,0,1),(3,32,510,0,1),(3,32,511,0,1),(3,32,512,0,1),(3,32,513,0,1),(3,32,514,0,1),(3,32,515,0,1),(3,32,516,0,1),(3,32,517,0,1),(3,32,518,0,1),(3,32,519,0,1),(3,32,520,0,1),(3,32,521,0,1),(3,32,522,0,1),(3,33,523,0,1),(3,33,524,0,1),(3,33,525,0,1),(3,33,526,0,1),(3,33,527,0,1),(3,33,528,0,1),(3,33,529,0,1),(3,33,530,0,1),(3,33,531,0,1),(3,33,532,0,1),(3,33,533,0,1),(3,33,534,0,1),(3,33,535,0,1),(3,33,536,0,1),(3,33,537,0,1),(3,33,538,0,1),(3,33,539,0,1),(3,33,540,0,1),(3,35,541,0,1),(3,35,542,0,1),(3,35,543,0,1),(3,35,544,0,1),(3,35,545,0,1),(3,35,546,0,1),(3,35,547,0,1),(3,35,548,0,1),(3,35,549,0,1),(3,35,550,0,1),(3,35,551,0,1),(3,35,552,0,1),(3,35,553,0,1),(3,35,554,0,1),(3,35,555,0,1),(3,35,556,0,1),(3,38,557,0,1),(3,38,558,0,1),(3,38,559,0,1),(3,38,560,0,1),(3,38,561,0,1),(3,38,562,0,1),(3,38,563,0,1),(3,39,564,0,1),(3,39,565,0,1),(3,39,566,0,1),(3,39,567,0,1),(3,39,568,0,1),(3,39,569,0,1),(3,39,570,0,1),(3,39,571,0,1),(3,39,572,0,1),(3,40,573,0,1),(3,40,574,0,1),(3,40,575,0,1),(3,40,576,0,1),(3,40,577,0,1),(3,40,578,0,1),(3,40,579,0,1),(3,40,580,0,1),(3,40,581,0,1),(3,40,582,0,1),(3,40,583,0,1),(3,40,584,0,1),(3,40,585,0,1),(3,40,586,0,1),(3,41,587,0,1),(3,41,588,0,1),(3,41,589,0,1),(3,41,590,0,1),(3,41,591,0,1),(3,41,592,0,1),(3,41,593,0,1),(3,41,594,0,1),(3,41,595,0,1),(3,41,596,0,1),(3,41,597,0,1),(3,41,598,0,1),(3,41,599,0,1),(3,41,600,0,1),(3,41,601,0,1),(3,41,602,0,1),(3,43,603,0,1),(3,43,604,0,1),(3,43,605,0,1),(3,43,606,0,1),(3,14,611,0,1),(3,14,612,0,1),(3,14,613,0,1),(3,14,614,0,1),(3,14,616,0,1),(3,48,618,0,1),(3,48,619,0,1),(3,48,620,0,1),(3,48,621,0,1),(3,48,622,0,1),(3,48,623,0,1),(3,48,624,0,1),(3,48,625,0,1),(3,48,626,0,1),(3,48,627,0,1),(3,48,628,0,1),(3,48,629,0,1),(3,48,630,0,1),(3,48,631,0,1),(3,48,632,0,1),(3,48,633,0,1),(3,48,634,0,1),(3,48,635,0,1),(3,48,636,0,1),(3,23,637,0,1),(3,23,638,0,1),(3,23,639,0,1),(3,23,640,0,1),(3,49,641,0,1),(3,49,642,0,1),(3,49,643,0,1),(3,49,644,0,1),(3,49,645,0,1),(3,49,646,0,1),(3,49,647,0,1),(3,49,648,0,1),(3,49,649,0,1),(3,49,650,0,1),(3,49,651,0,1),(3,49,652,0,1),(3,49,653,0,1),(3,49,654,0,1),(3,49,655,0,1),(3,49,656,0,1),(3,49,657,0,1),(3,49,658,0,1),(3,49,659,0,1),(3,49,660,0,1),(3,49,661,0,1),(3,49,662,0,1),(3,49,663,0,1),(3,49,664,0,1),(3,49,665,0,1),(3,49,666,0,1),(3,49,667,0,1),(3,49,668,0,1),(3,49,669,0,1),(3,49,670,0,1),(3,49,671,0,1),(3,49,672,0,1),(3,49,673,0,1),(3,49,674,0,1),(3,49,675,0,1),(3,49,676,0,1),(3,49,677,0,1),(3,49,678,0,1),(3,49,679,0,1),(3,49,680,0,1),(3,49,681,0,1),(3,49,682,0,1),(3,49,683,0,1),(3,49,684,0,1),(3,49,685,0,1),(3,49,686,0,1),(3,49,687,0,1),(3,49,688,0,1),(3,49,689,0,1),(3,49,690,0,1),(3,49,691,0,1),(3,49,692,0,1),(3,14,694,0,1),(3,14,695,0,1),(3,50,696,0,1),(3,50,697,0,1),(3,50,698,0,1),(3,50,699,0,1),(3,50,700,0,1),(3,50,701,0,1),(3,50,702,0,1),(3,50,703,0,1),(3,50,704,0,1),(3,50,705,0,1),(3,50,706,0,1),(3,50,707,0,1),(3,14,708,0,1),(3,51,709,0,1),(3,51,710,0,1),(3,51,711,0,1),(3,51,712,0,1),(3,51,713,0,1),(3,51,714,0,1),(3,51,715,0,1),(3,51,716,0,1),(3,51,717,0,1),(3,51,718,0,1),(3,51,719,0,1),(3,51,720,0,1),(3,51,721,0,1),(3,52,722,0,1),(3,52,723,0,1),(3,52,724,0,1),(3,52,725,0,1),(3,52,726,0,1),(3,52,727,0,1),(3,52,728,0,1),(3,52,729,0,1),(3,52,730,0,1),(3,52,731,0,1),(3,53,732,0,1),(3,53,733,0,1),(3,53,734,0,1),(3,53,735,0,1),(3,53,736,0,1),(3,53,737,0,1),(3,53,738,0,1),(3,53,739,0,1),(3,53,740,0,1),(3,54,741,0,1),(3,54,742,0,1),(3,54,743,0,1),(3,54,744,0,1),(3,54,745,0,1),(3,54,746,0,1),(3,54,747,0,1),(3,54,748,0,1),(3,54,749,0,1),(3,54,750,0,1),(3,54,751,0,1),(3,54,752,0,1),(3,54,753,0,1),(3,54,754,0,1),(3,54,755,0,1),(3,54,756,0,1),(3,54,757,0,1),(3,54,758,0,1),(3,54,759,0,1),(3,54,760,0,1),(3,55,761,0,1),(3,55,762,0,1),(3,55,763,0,1),(3,55,764,0,1),(3,55,765,0,1),(3,55,766,0,1),(3,55,767,0,1),(3,56,768,0,1),(3,56,769,0,1),(3,56,770,0,1),(3,56,771,0,1),(3,56,772,0,1),(3,56,773,0,1),(3,56,774,0,1),(3,56,775,0,1),(3,56,776,0,1),(3,56,777,0,1),(3,56,778,0,1),(3,56,779,0,1),(3,48,780,0,1),(3,48,781,0,1),(3,56,782,0,1),(3,56,783,0,1),(3,48,784,0,1),(3,48,785,0,1),(3,49,786,0,1),(3,57,787,0,1),(3,57,788,0,1),(3,57,789,0,1),(3,57,790,0,1),(3,57,791,0,1),(3,57,792,0,1),(3,57,793,0,1),(3,57,794,0,1),(3,57,795,0,1),(3,57,796,0,1),(3,57,797,0,1),(3,57,798,0,1),(3,57,799,0,1),(3,58,800,0,1),(3,58,801,0,1),(3,58,802,0,1),(3,58,803,0,1),(3,58,804,0,1),(3,58,805,0,1),(3,58,806,0,1),(3,58,807,0,1),(3,58,808,0,1),(3,58,809,0,1),(3,58,810,0,1),(3,60,811,0,1),(3,60,812,0,1),(3,60,813,0,1),(3,61,814,0,1),(3,61,815,0,1),(3,61,816,0,1),(3,62,817,0,1),(3,62,818,0,1),(3,62,819,0,1),(3,62,820,0,1),(3,62,821,0,1),(3,62,822,0,1),(3,62,823,0,1),(3,62,824,0,1),(3,62,825,0,1),(3,62,826,0,1),(3,62,827,0,1),(3,62,828,0,1),(3,48,829,0,1),(3,48,830,0,1),(3,48,831,0,1),(3,48,832,0,1),(3,14,833,0,1),(3,14,834,0,1),(3,14,835,0,1),(4,6,1,0,1),(4,6,2,0,1),(4,6,3,0,1),(4,6,4,0,1),(4,6,5,0,1),(4,6,6,0,1),(4,6,7,0,1),(4,6,8,0,1),(4,6,9,0,1),(4,6,10,0,1),(4,6,11,0,1),(4,6,12,0,1),(4,6,13,0,1),(4,6,14,0,1),(4,6,15,0,1),(4,6,16,0,1),(4,6,17,0,1),(4,6,18,0,1),(4,6,19,0,1),(4,6,20,0,1),(4,6,21,0,1),(4,6,22,0,1),(4,6,23,0,1),(4,6,24,0,1),(4,6,25,0,1),(4,6,26,0,1),(4,6,27,0,1),(4,6,28,0,1),(4,6,29,0,1),(4,6,30,0,1),(4,6,31,0,1),(4,6,32,0,1),(4,6,33,0,1),(4,6,34,0,1),(4,6,35,0,1),(4,7,36,0,1),(4,7,37,0,1),(4,7,38,0,1),(4,7,39,0,1),(4,7,40,0,1),(4,7,41,0,1),(4,7,42,0,1),(4,7,43,0,1),(4,7,44,0,1),(4,7,45,0,1),(4,7,46,0,1),(4,7,47,0,1),(4,7,48,0,1),(4,7,49,0,1),(4,7,50,0,1),(4,7,51,0,1),(4,7,52,0,1),(4,7,53,0,1),(4,7,54,0,1),(4,7,55,0,1),(4,7,56,0,1),(4,7,57,0,1),(4,7,58,0,1),(4,7,59,0,1),(4,7,60,0,1),(4,7,61,0,1),(4,7,62,0,1),(4,7,63,0,1),(4,4,64,0,1),(4,4,65,0,1),(4,4,66,0,1),(4,4,67,0,1),(4,4,68,0,1),(4,4,69,0,1),(4,4,70,0,1),(4,4,71,0,1),(4,4,72,0,1),(4,4,73,0,1),(4,4,74,0,1),(4,4,75,0,1),(4,4,76,0,1),(4,4,77,0,1),(4,4,78,0,1),(4,4,79,0,1),(4,4,80,0,1),(4,4,81,0,1),(4,4,82,0,1),(4,4,83,0,1),(4,4,84,0,1),(4,4,85,0,1),(4,4,86,0,1),(4,4,87,0,1),(4,4,88,0,1),(4,4,89,0,1),(4,4,90,0,1),(4,4,91,0,1),(4,4,92,0,1),(4,4,93,0,1),(4,4,94,0,1),(4,4,95,0,1),(4,4,96,0,1),(4,4,97,0,1),(4,4,98,0,1),(4,4,99,0,1),(4,4,100,0,1),(4,4,101,0,1),(4,4,102,0,1),(4,4,103,0,1),(4,4,104,0,1),(4,4,105,0,1),(4,4,106,0,1),(4,2,107,0,1),(4,2,108,0,1),(4,2,109,0,1),(4,2,110,0,1),(4,2,111,0,1),(4,2,112,0,1),(4,2,113,0,1),(4,2,114,0,1),(4,2,115,0,1),(4,2,116,0,1),(4,2,117,0,1),(4,2,118,0,1),(4,2,119,0,1),(4,2,120,0,1),(4,2,121,0,1),(4,26,122,0,1),(4,26,123,0,1),(4,26,124,0,1),(4,26,125,0,1),(4,26,126,0,1),(4,26,127,0,1),(4,26,128,0,1),(4,26,129,0,1),(4,26,130,0,1),(4,26,131,0,1),(4,26,132,0,1),(4,26,133,0,1),(4,26,134,0,1),(4,26,135,0,1),(4,26,136,0,1),(4,26,137,0,1),(4,26,138,0,1),(4,26,139,0,1),(4,26,140,0,1),(4,26,141,0,1),(4,26,142,0,1),(4,26,143,0,1),(4,26,144,0,1),(4,26,145,0,1),(4,4,146,0,1),(4,6,147,0,1),(4,7,148,0,1),(4,26,149,0,1),(4,13,150,0,1),(4,13,151,0,1),(4,13,152,0,1),(4,13,153,0,1),(4,13,154,0,1),(4,13,155,0,1),(4,13,156,0,1),(4,13,157,0,1),(4,13,158,0,1),(4,13,159,0,1),(4,13,160,0,1),(4,13,161,0,1),(4,13,162,0,1),(4,13,163,0,1),(4,13,164,0,1),(4,13,165,0,1),(4,13,166,0,1),(4,14,167,0,1),(4,14,168,0,1),(4,14,169,0,1),(4,14,170,0,1),(4,14,171,0,1),(4,14,172,0,1),(4,14,173,0,1),(4,14,174,0,1),(4,14,175,0,1),(4,14,176,0,1),(4,14,177,0,1),(4,14,178,0,1),(4,14,179,0,1),(4,14,180,0,1),(4,14,181,0,1),(4,14,182,0,1),(4,14,183,0,1),(4,14,184,0,1),(4,14,185,0,1),(4,14,186,0,1),(4,14,187,0,1),(4,14,188,0,1),(4,14,189,0,1),(4,14,190,0,1),(4,14,191,0,1),(4,14,192,0,1),(4,14,193,0,1),(4,14,194,0,1),(4,14,195,0,1),(4,14,196,0,1),(4,8,197,0,1),(4,8,198,0,1),(4,8,199,0,1),(4,8,200,0,1),(4,8,201,0,1),(4,8,202,0,1),(4,8,209,0,1),(4,8,210,0,1),(4,10,211,0,1),(4,10,212,0,1),(4,10,213,0,1),(4,10,214,0,1),(4,10,215,0,1),(4,10,216,0,1),(4,10,217,0,1),(4,10,218,0,1),(4,10,219,0,1),(4,10,220,0,1),(4,10,221,0,1),(4,9,222,0,1),(4,9,223,0,1),(4,9,224,0,1),(4,9,225,0,1),(4,9,226,0,1),(4,9,227,0,1),(4,9,228,0,1),(4,9,229,0,1),(4,9,230,0,1),(4,9,231,0,1),(4,9,232,0,1),(4,9,233,0,1),(4,9,234,0,1),(4,9,235,0,1),(4,9,236,0,1),(4,9,237,0,1),(4,9,238,0,1),(4,9,239,0,1),(4,9,240,0,1),(4,9,241,0,1),(4,9,242,0,1),(4,9,243,0,1),(4,9,244,0,1),(4,16,245,0,1),(4,16,246,0,1),(4,16,247,0,1),(4,16,248,0,1),(4,16,249,0,1),(4,16,250,0,1),(4,16,251,0,1),(4,16,252,0,1),(4,16,253,0,1),(4,16,254,0,1),(4,16,255,0,1),(4,16,256,0,1),(4,16,257,0,1),(4,16,258,0,1),(4,16,259,0,1),(4,16,260,0,1),(4,16,261,0,1),(4,16,262,0,1),(4,16,263,0,1),(4,16,264,0,1),(4,16,265,0,1),(4,16,266,0,1),(4,15,267,0,1),(4,15,268,0,1),(4,15,269,0,1),(4,15,270,0,1),(4,15,271,0,1),(4,15,272,0,1),(4,15,273,0,1),(4,15,274,0,1),(4,15,275,0,1),(4,18,276,0,1),(4,18,277,0,1),(4,18,278,0,1),(4,18,279,0,1),(4,18,280,0,1),(4,18,281,0,1),(4,18,282,0,1),(4,18,283,0,1),(4,18,284,0,1),(4,18,285,0,1),(4,18,286,0,1),(4,18,287,0,1),(4,18,288,0,1),(4,18,289,0,1),(4,18,290,0,1),(4,18,291,0,1),(4,19,292,0,1),(4,19,293,0,1),(4,19,294,0,1),(4,19,295,0,1),(4,19,296,0,1),(4,19,297,0,1),(4,19,298,0,1),(4,20,299,0,1),(4,20,300,0,1),(4,20,301,0,1),(4,20,302,0,1),(4,20,303,0,1),(4,20,304,0,1),(4,20,305,0,1),(4,20,306,0,1),(4,20,307,0,1),(4,20,308,0,1),(4,20,309,0,1),(4,20,310,0,1),(4,20,311,0,1),(4,20,312,0,1),(4,20,313,0,1),(4,20,314,0,1),(4,20,315,0,1),(4,20,316,0,1),(4,20,317,0,1),(4,20,318,0,1),(4,20,319,0,1),(4,20,320,0,1),(4,20,321,0,1),(4,20,322,0,1),(4,20,323,0,1),(4,20,324,0,1),(4,20,325,0,1),(4,20,326,0,1),(4,20,327,0,1),(4,20,328,0,1),(4,20,329,0,1),(4,20,330,0,1),(4,20,331,0,1),(4,20,332,0,1),(4,20,333,0,1),(4,20,334,0,1),(4,21,335,0,1),(4,21,336,0,1),(4,21,337,0,1),(4,21,338,0,1),(4,21,339,0,1),(4,21,340,0,1),(4,21,341,0,1),(4,21,342,0,1),(4,21,343,0,1),(4,21,344,0,1),(4,21,345,0,1),(4,21,346,0,1),(4,21,347,0,1),(4,21,348,0,1),(4,21,349,0,1),(4,21,350,0,1),(4,21,351,0,1),(4,21,352,0,1),(4,21,353,0,1),(4,21,354,0,1),(4,21,355,0,1),(4,21,356,0,1),(4,21,357,0,1),(4,21,358,0,1),(4,21,359,0,1),(4,21,360,0,1),(4,21,361,0,1),(4,21,362,0,1),(4,21,363,0,1),(4,21,364,0,1),(4,21,365,0,1),(4,21,366,0,1),(4,21,367,0,1),(4,21,368,0,1),(4,21,369,0,1),(4,21,370,0,1),(4,21,371,0,1),(4,22,372,0,1),(4,22,373,0,1),(4,22,374,0,1),(4,22,375,0,1),(4,22,376,0,1),(4,22,377,0,1),(4,22,378,0,1),(4,22,379,0,1),(4,22,380,0,1),(4,22,381,0,1),(4,22,382,0,1),(4,22,383,0,1),(4,22,384,0,1),(4,22,385,0,1),(4,22,386,0,1),(4,22,387,0,1),(4,22,388,0,1),(4,22,389,0,1),(4,22,390,0,1),(4,22,391,0,1),(4,22,392,0,1),(4,22,393,0,1),(4,22,394,0,1),(4,22,395,0,1),(4,22,396,0,1),(4,22,397,0,1),(4,22,398,0,1),(4,22,399,0,1),(4,22,400,0,1),(4,22,401,0,1),(4,22,402,0,1),(4,22,403,0,1),(4,22,404,0,1),(4,22,405,0,1),(4,22,406,0,1),(4,22,407,0,1),(4,22,408,0,1),(4,22,409,0,1),(4,22,410,0,1),(4,22,411,0,1),(4,22,412,0,1),(4,22,413,0,1),(4,22,414,0,1),(4,22,415,0,1),(4,22,416,0,1),(4,22,417,0,1),(4,23,418,0,1),(4,23,419,0,1),(4,23,420,0,1),(4,23,421,0,1),(4,23,422,0,1),(4,23,423,0,1),(4,23,424,0,1),(4,23,425,0,1),(4,23,426,0,1),(4,23,427,0,1),(4,23,428,0,1),(4,23,429,0,1),(4,23,430,0,1),(4,23,431,0,1),(4,23,432,0,1),(4,23,433,0,1),(4,23,434,0,1),(4,23,435,0,1),(4,23,436,0,1),(4,23,437,0,1),(4,23,438,0,1),(4,23,439,0,1),(4,23,440,0,1),(4,23,441,0,1),(4,23,442,0,1),(4,23,443,0,1),(4,23,444,0,1),(4,23,445,0,1),(4,23,446,0,1),(4,23,447,0,1),(4,23,448,0,1),(4,23,449,0,1),(4,23,450,0,1),(4,23,451,0,1),(4,23,452,0,1),(4,23,453,0,1),(4,23,454,0,1),(4,23,455,0,1),(4,10,493,0,1),(4,10,494,0,1),(4,10,495,0,1),(4,10,496,0,1),(4,10,497,0,1),(4,10,498,0,1),(4,31,499,0,1),(4,31,500,0,1),(4,31,501,0,1),(4,31,502,0,1),(4,32,505,0,1),(4,32,506,0,1),(4,32,507,0,1),(4,32,508,0,1),(4,32,509,0,1),(4,32,510,0,1),(4,32,511,0,1),(4,32,512,0,1),(4,32,513,0,1),(4,32,514,0,1),(4,32,515,0,1),(4,32,516,0,1),(4,32,517,0,1),(4,32,518,0,1),(4,32,519,0,1),(4,32,520,0,1),(4,32,521,0,1),(4,32,522,0,1),(4,33,523,0,1),(4,33,524,0,1),(4,33,525,0,1),(4,33,526,0,1),(4,33,527,0,1),(4,33,528,0,1),(4,33,529,0,1),(4,33,530,0,1),(4,33,531,0,1),(4,33,532,0,1),(4,33,533,0,1),(4,33,534,0,1),(4,33,535,0,1),(4,33,536,0,1),(4,33,537,0,1),(4,33,538,0,1),(4,33,539,0,1),(4,33,540,0,1),(4,35,541,0,1),(4,35,542,0,1),(4,35,543,0,1),(4,35,544,0,1),(4,35,545,0,1),(4,35,546,0,1),(4,35,547,0,1),(4,35,548,0,1),(4,35,549,0,1),(4,35,550,0,1),(4,35,551,0,1),(4,35,552,0,1),(4,35,553,0,1),(4,35,554,0,1),(4,35,555,0,1),(4,35,556,0,1),(4,38,557,0,1),(4,38,558,0,1),(4,38,559,0,1),(4,38,560,0,1),(4,38,561,0,1),(4,38,562,0,1),(4,38,563,0,1),(4,39,564,0,1),(4,39,565,0,1),(4,39,566,0,1),(4,39,567,0,1),(4,39,568,0,1),(4,39,569,0,1),(4,39,570,0,1),(4,39,571,0,1),(4,39,572,0,1),(4,40,573,0,1),(4,40,574,0,1),(4,40,575,0,1),(4,40,576,0,1),(4,40,577,0,1),(4,40,578,0,1),(4,40,579,0,1),(4,40,580,0,1),(4,40,581,0,1),(4,40,582,0,1),(4,40,583,0,1),(4,40,584,0,1),(4,40,585,0,1),(4,40,586,0,1),(4,41,587,0,1),(4,41,588,0,1),(4,41,589,0,1),(4,41,590,0,1),(4,41,591,0,1),(4,41,592,0,1),(4,41,593,0,1),(4,41,594,0,1),(4,41,595,0,1),(4,41,596,0,1),(4,41,597,0,1),(4,41,598,0,1),(4,41,599,0,1),(4,41,600,0,1),(4,41,601,0,1),(4,41,602,0,1),(4,43,603,0,1),(4,43,604,0,1),(4,43,605,0,1),(4,43,606,0,1),(4,14,611,0,1),(4,14,612,0,1),(4,14,613,0,1),(4,14,614,0,1),(4,14,616,0,1),(4,48,618,0,1),(4,48,619,0,1),(4,48,620,0,1),(4,48,621,0,1),(4,48,622,0,1),(4,48,623,0,1),(4,48,624,0,1),(4,48,625,0,1),(4,48,626,0,1),(4,48,627,0,1),(4,48,628,0,1),(4,48,629,0,1),(4,48,630,0,1),(4,48,631,0,1),(4,48,632,0,1),(4,48,633,0,1),(4,48,634,0,1),(4,48,635,0,1),(4,48,636,0,1),(4,23,637,0,1),(4,23,638,0,1),(4,23,639,0,1),(4,23,640,0,1),(4,49,641,0,1),(4,49,642,0,1),(4,49,643,0,1),(4,49,644,0,1),(4,49,645,0,1),(4,49,646,0,1),(4,49,647,0,1),(4,49,648,0,1),(4,49,649,0,1),(4,49,650,0,1),(4,49,651,0,1),(4,49,652,0,1),(4,49,653,0,1),(4,49,654,0,1),(4,49,655,0,1),(4,49,656,0,1),(4,49,657,0,1),(4,49,658,0,1),(4,49,659,0,1),(4,49,660,0,1),(4,49,661,0,1),(4,49,662,0,1),(4,49,663,0,1),(4,49,664,0,1),(4,49,665,0,1),(4,49,666,0,1),(4,49,667,0,1),(4,49,668,0,1),(4,49,669,0,1),(4,49,670,0,1),(4,49,671,0,1),(4,49,672,0,1),(4,49,673,0,1),(4,49,674,0,1),(4,49,675,0,1),(4,49,676,0,1),(4,49,677,0,1),(4,49,678,0,1),(4,49,679,0,1),(4,49,680,0,1),(4,49,681,0,1),(4,49,682,0,1),(4,49,683,0,1),(4,49,684,0,1),(4,49,685,0,1),(4,49,686,0,1),(4,49,687,0,1),(4,49,688,0,1),(4,49,689,0,1),(4,49,690,0,1),(4,49,691,0,1),(4,49,692,0,1),(4,14,694,0,1),(4,14,695,0,1),(4,50,696,0,1),(4,50,697,0,1),(4,50,698,0,1),(4,50,699,0,1),(4,50,700,0,1),(4,50,701,0,1),(4,50,702,0,1),(4,50,703,0,1),(4,50,704,0,1),(4,50,705,0,1),(4,50,706,0,1),(4,50,707,0,1),(4,14,708,0,1),(4,51,709,0,1),(4,51,710,0,1),(4,51,711,0,1),(4,51,712,0,1),(4,51,713,0,1),(4,51,714,0,1),(4,51,715,0,1),(4,51,716,0,1),(4,51,717,0,1),(4,51,718,0,1),(4,51,719,0,1),(4,51,720,0,1),(4,51,721,0,1),(4,52,722,0,1),(4,52,723,0,1),(4,52,724,0,1),(4,52,725,0,1),(4,52,726,0,1),(4,52,727,0,1),(4,52,728,0,1),(4,52,729,0,1),(4,52,730,0,1),(4,52,731,0,1),(4,53,732,0,1),(4,53,733,0,1),(4,53,734,0,1),(4,53,735,0,1),(4,53,736,0,1),(4,53,737,0,1),(4,53,738,0,1),(4,53,739,0,1),(4,53,740,0,1),(4,54,741,0,1),(4,54,742,0,1),(4,54,743,0,1),(4,54,744,0,1),(4,54,745,0,1),(4,54,746,0,1),(4,54,747,0,1),(4,54,748,0,1),(4,54,749,0,1),(4,54,750,0,1),(4,54,751,0,1),(4,54,752,0,1),(4,54,753,0,1),(4,54,754,0,1),(4,54,755,0,1),(4,54,756,0,1),(4,54,757,0,1),(4,54,758,0,1),(4,54,759,0,1),(4,54,760,0,1),(4,55,761,0,1),(4,55,762,0,1),(4,55,763,0,1),(4,55,764,0,1),(4,55,765,0,1),(4,55,766,0,1),(4,55,767,0,1),(4,56,768,0,1),(4,56,769,0,1),(4,56,770,0,1),(4,56,771,0,1),(4,56,772,0,1),(4,56,773,0,1),(4,56,774,0,1),(4,56,775,0,1),(4,56,776,0,1),(4,56,777,0,1),(4,56,778,0,1),(4,56,779,0,1),(4,48,780,0,1),(4,48,781,0,1),(4,56,782,0,1),(4,56,783,0,1),(4,48,784,0,1),(4,48,785,0,1),(4,49,786,0,1),(4,57,787,0,1),(4,57,788,0,1),(4,57,789,0,1),(4,57,790,0,1),(4,57,791,0,1),(4,57,792,0,1),(4,57,793,0,1),(4,57,794,0,1),(4,57,795,0,1),(4,57,796,0,1),(4,57,797,0,1),(4,57,798,0,1),(4,57,799,0,1),(4,58,800,0,1),(4,58,801,0,1),(4,58,802,0,1),(4,58,803,0,1),(4,58,804,0,1),(4,58,805,0,1),(4,58,806,0,1),(4,58,807,0,1),(4,58,808,0,1),(4,58,809,0,1),(4,58,810,0,1),(4,60,811,0,1),(4,60,812,0,1),(4,60,813,0,1),(4,61,814,0,1),(4,61,815,0,1),(4,61,816,0,1),(4,62,817,0,1),(4,62,818,0,1),(4,62,819,0,1),(4,62,820,0,1),(4,62,821,0,1),(4,62,822,0,1),(4,62,823,0,1),(4,62,824,0,1),(4,62,825,0,1),(4,62,826,0,1),(4,62,827,0,1),(4,62,828,0,1),(4,48,829,0,1),(4,48,830,0,1),(4,48,831,0,1),(4,48,832,0,1),(4,14,833,0,1),(4,14,834,0,1),(4,14,835,0,1),(5,4,64,0,1),(5,4,65,0,1),(5,4,66,0,1),(5,4,67,0,1),(5,4,68,0,1),(5,4,69,0,1),(5,4,74,0,1),(5,4,78,0,1),(5,4,85,0,1),(5,4,88,0,1),(5,4,89,0,1),(5,4,90,0,1),(5,4,91,0,1),(5,4,92,0,1),(5,4,93,0,1),(5,4,94,0,1),(5,4,95,0,1),(5,4,96,0,1),(5,4,97,0,1),(5,4,98,0,1),(5,4,99,0,1),(5,4,100,0,1),(5,4,101,0,1),(5,4,102,0,1),(5,4,103,0,1),(5,4,104,0,1),(5,4,105,0,1),(5,4,106,0,1),(5,4,146,0,1),(5,14,167,0,1),(5,14,168,0,1),(5,14,172,0,1),(5,14,184,0,1),(5,14,185,0,1),(5,14,186,0,1),(5,14,189,0,1),(5,14,191,0,1),(5,14,192,0,1),(5,14,195,0,1),(5,14,196,0,1),(5,10,211,0,1),(5,10,212,0,1),(5,10,213,0,1),(5,10,214,0,1),(5,10,215,0,1),(5,10,216,0,1),(5,10,217,0,1),(5,10,218,0,1),(5,10,219,0,1),(5,10,220,0,1),(5,10,221,0,1),(5,16,245,0,1),(5,16,246,0,1),(5,16,247,0,1),(5,16,248,0,1),(5,16,249,0,1),(5,16,250,0,1),(5,16,251,0,1),(5,16,252,0,1),(5,16,253,0,1),(5,16,254,0,1),(5,16,255,0,1),(5,16,256,0,1),(5,16,257,0,1),(5,16,258,0,1),(5,16,259,0,1),(5,16,260,0,1),(5,16,261,0,1),(5,16,262,0,1),(5,16,263,0,1),(5,16,264,0,1),(5,16,265,0,1),(5,16,266,0,1),(5,23,422,0,1),(5,23,425,0,1),(5,23,428,0,1),(5,23,429,0,1),(5,23,430,0,1),(5,23,431,0,1),(5,23,432,0,1),(5,23,433,0,1),(5,23,435,0,1),(5,23,436,0,1),(5,23,439,0,1),(5,23,440,0,1),(5,23,441,0,1),(5,23,442,0,1),(5,23,443,0,1),(5,23,444,0,1),(5,23,445,0,1),(5,23,446,0,1),(5,23,447,0,1),(5,23,448,0,1),(5,23,449,0,1),(5,23,450,0,1),(5,23,455,0,1),(5,10,493,0,1),(5,10,494,0,1),(5,10,495,0,1),(5,10,496,0,1),(5,10,497,0,1),(5,10,498,0,1),(5,14,612,0,1),(5,14,613,0,1),(5,14,614,0,1),(5,14,616,0,1),(5,48,627,0,1),(5,48,628,0,1),(5,48,629,0,1),(5,48,630,0,1),(5,48,632,0,1),(5,48,633,0,1),(5,48,634,0,1),(5,48,635,0,1),(5,48,636,0,1),(5,23,637,0,1),(5,23,638,0,1),(5,23,639,0,1),(5,23,640,0,1),(5,49,680,0,1),(5,49,681,0,1),(5,49,682,0,1),(5,49,683,0,1),(5,49,684,0,1),(5,49,685,0,1),(5,49,686,0,1),(5,49,687,0,1),(5,49,688,0,1),(5,49,689,0,1),(5,49,690,0,1),(5,49,691,0,1),(5,49,692,0,1),(5,14,694,0,1),(5,14,708,0,1),(5,51,709,0,1),(5,51,710,0,1),(5,51,711,0,1),(5,51,712,0,1),(5,51,713,0,1),(5,51,714,0,1),(5,51,716,0,1),(5,51,717,0,1),(5,51,718,0,1),(5,51,719,0,1),(5,51,720,0,1),(5,51,721,0,1),(5,53,734,0,1),(5,53,735,0,1),(5,53,736,0,1),(5,53,737,0,1),(5,53,738,0,1),(5,53,739,0,1),(5,53,740,0,1),(5,54,752,0,1),(5,54,753,0,1),(5,54,754,0,1),(5,54,755,0,1),(5,54,756,0,1),(5,54,757,0,1),(5,54,758,0,1),(5,54,759,0,1),(5,54,760,0,1),(5,55,761,0,1),(5,55,762,0,1),(5,55,763,0,1),(5,55,764,0,1),(5,55,765,0,1),(5,55,766,0,1),(5,55,767,0,1),(5,56,774,0,1),(5,56,775,0,1),(5,56,776,0,1),(5,56,777,0,1),(5,56,778,0,1),(5,56,779,0,1),(5,48,780,0,1),(5,48,781,0,1),(5,56,782,0,1),(5,56,783,0,1),(5,48,784,0,1),(5,48,785,0,1),(5,49,786,0,1),(5,58,808,0,1),(5,58,809,0,1),(5,58,810,0,1),(5,60,811,0,1),(5,60,812,0,1),(5,60,813,0,1),(5,61,814,0,1),(5,61,815,0,1),(5,61,816,0,1),(5,62,817,0,1),(5,62,818,0,1),(5,62,819,0,1),(5,62,820,0,1),(5,62,821,0,1),(5,62,822,0,1),(5,62,823,0,1),(5,62,824,0,1),(5,62,825,0,1),(5,62,826,0,1),(5,62,827,0,1),(5,62,828,0,1),(5,48,829,0,1),(5,48,830,0,1),(5,48,831,0,1),(5,48,832,0,1),(5,14,833,0,1),(5,14,834,0,1),(5,14,835,0,1);

/*Table structure for table `vtiger_profile2globalpermissions` */

DROP TABLE IF EXISTS `vtiger_profile2globalpermissions`;

CREATE TABLE `vtiger_profile2globalpermissions` (
  `profileid` int(19) NOT NULL,
  `globalactionid` int(19) NOT NULL,
  `globalactionpermission` int(19) default NULL,
  PRIMARY KEY  (`profileid`,`globalactionid`),
  KEY `idx_profile2globalpermissions` (`profileid`,`globalactionid`),
  CONSTRAINT `fk_1_vtiger_profile2globalpermissions` FOREIGN KEY (`profileid`) REFERENCES `vtiger_profile` (`profileid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile2globalpermissions` */

insert  into `vtiger_profile2globalpermissions`(`profileid`,`globalactionid`,`globalactionpermission`) values (1,1,0),(1,2,0),(2,1,1),(2,2,1),(3,1,1),(3,2,1),(4,1,1),(4,2,1),(5,1,1),(5,2,1);

/*Table structure for table `vtiger_profile2standardpermissions` */

DROP TABLE IF EXISTS `vtiger_profile2standardpermissions`;

CREATE TABLE `vtiger_profile2standardpermissions` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) NOT NULL,
  `operation` int(10) NOT NULL,
  `permissions` int(1) default NULL,
  PRIMARY KEY  (`profileid`,`tabid`,`operation`),
  KEY `profile2standardpermissions_profileid_tabid_operation_idx` (`profileid`,`tabid`,`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile2standardpermissions` */

insert  into `vtiger_profile2standardpermissions`(`profileid`,`tabid`,`operation`,`permissions`) values (1,2,0,0),(1,2,1,0),(1,2,2,0),(1,2,3,0),(1,2,4,0),(1,4,0,0),(1,4,1,0),(1,4,2,0),(1,4,3,0),(1,4,4,0),(1,6,0,0),(1,6,1,0),(1,6,2,0),(1,6,3,0),(1,6,4,0),(1,7,0,0),(1,7,1,0),(1,7,2,0),(1,7,3,0),(1,7,4,0),(1,8,0,0),(1,8,1,0),(1,8,2,0),(1,8,3,0),(1,8,4,0),(1,9,0,0),(1,9,1,0),(1,9,2,0),(1,9,3,0),(1,9,4,0),(1,13,0,0),(1,13,1,0),(1,13,2,0),(1,13,3,0),(1,13,4,0),(1,14,0,0),(1,14,1,0),(1,14,2,0),(1,14,3,0),(1,14,4,0),(1,15,0,0),(1,15,1,0),(1,15,2,0),(1,15,3,0),(1,15,4,0),(1,16,0,0),(1,16,1,0),(1,16,2,0),(1,16,3,0),(1,16,4,0),(1,18,0,0),(1,18,1,0),(1,18,2,0),(1,18,3,0),(1,18,4,0),(1,19,0,0),(1,19,1,0),(1,19,2,0),(1,19,3,0),(1,19,4,0),(1,20,0,0),(1,20,1,0),(1,20,2,0),(1,20,3,0),(1,20,4,0),(1,21,0,0),(1,21,1,0),(1,21,2,0),(1,21,3,0),(1,21,4,0),(1,22,0,0),(1,22,1,0),(1,22,2,0),(1,22,3,0),(1,22,4,0),(1,23,0,0),(1,23,1,0),(1,23,2,0),(1,23,3,0),(1,23,4,0),(1,26,0,0),(1,26,1,0),(1,26,2,0),(1,26,3,0),(1,26,4,0),(1,31,0,0),(1,31,1,0),(1,31,2,0),(1,31,3,0),(1,31,4,0),(1,32,0,0),(1,32,1,0),(1,32,2,0),(1,32,3,0),(1,32,4,0),(1,33,0,0),(1,33,1,0),(1,33,2,0),(1,33,3,0),(1,33,4,0),(1,35,0,0),(1,35,1,0),(1,35,2,0),(1,35,3,0),(1,35,4,0),(1,38,0,0),(1,38,1,0),(1,38,2,0),(1,38,3,0),(1,38,4,0),(1,39,0,0),(1,39,1,0),(1,39,2,0),(1,39,3,0),(1,39,4,0),(1,40,0,0),(1,40,1,0),(1,40,2,0),(1,40,3,0),(1,40,4,0),(1,41,0,0),(1,41,1,0),(1,41,2,0),(1,41,3,0),(1,41,4,0),(1,43,0,0),(1,43,1,0),(1,43,2,0),(1,43,3,0),(1,43,4,0),(1,48,0,0),(1,48,1,0),(1,48,2,0),(1,48,3,0),(1,48,4,0),(1,49,0,0),(1,49,1,0),(1,49,2,0),(1,49,3,0),(1,49,4,0),(1,50,0,0),(1,50,1,0),(1,50,2,0),(1,50,3,0),(1,50,4,0),(1,51,0,0),(1,51,1,0),(1,51,2,0),(1,51,3,0),(1,51,4,0),(1,52,0,0),(1,52,1,0),(1,52,2,0),(1,52,3,0),(1,52,4,0),(1,53,0,0),(1,53,1,0),(1,53,2,0),(1,53,3,0),(1,53,4,0),(1,54,0,0),(1,54,1,0),(1,54,2,0),(1,54,3,0),(1,54,4,0),(1,55,0,0),(1,55,1,0),(1,55,2,0),(1,55,3,0),(1,55,4,0),(1,56,0,0),(1,56,1,0),(1,56,2,0),(1,56,3,0),(1,56,4,0),(1,57,0,0),(1,57,1,0),(1,57,2,0),(1,57,3,0),(1,57,4,0),(1,58,0,0),(1,58,1,0),(1,58,2,0),(1,58,3,0),(1,58,4,0),(1,60,0,0),(1,60,1,0),(1,60,2,0),(1,60,3,0),(1,60,4,0),(1,61,0,0),(1,61,1,0),(1,61,2,0),(1,61,3,0),(1,61,4,0),(1,62,0,0),(1,62,1,0),(1,62,2,0),(1,62,3,0),(1,62,4,0),(2,2,0,1),(2,2,1,1),(2,2,2,1),(2,2,3,1),(2,2,4,1),(2,4,0,0),(2,4,1,0),(2,4,2,0),(2,4,3,0),(2,4,4,0),(2,6,0,1),(2,6,1,1),(2,6,2,1),(2,6,3,1),(2,6,4,1),(2,7,0,1),(2,7,1,1),(2,7,2,1),(2,7,3,1),(2,7,4,1),(2,8,0,1),(2,8,1,1),(2,8,2,1),(2,8,3,1),(2,8,4,1),(2,9,0,1),(2,9,1,1),(2,9,2,1),(2,9,3,1),(2,9,4,1),(2,13,0,1),(2,13,1,1),(2,13,2,1),(2,13,3,1),(2,13,4,1),(2,14,0,0),(2,14,1,0),(2,14,2,0),(2,14,3,0),(2,14,4,0),(2,15,0,1),(2,15,1,1),(2,15,2,1),(2,15,3,1),(2,15,4,1),(2,16,0,1),(2,16,1,1),(2,16,2,1),(2,16,3,1),(2,16,4,1),(2,18,0,1),(2,18,1,1),(2,18,2,1),(2,18,3,1),(2,18,4,1),(2,19,0,1),(2,19,1,1),(2,19,2,1),(2,19,3,1),(2,19,4,1),(2,20,0,1),(2,20,1,1),(2,20,2,1),(2,20,3,1),(2,20,4,1),(2,21,0,1),(2,21,1,1),(2,21,2,1),(2,21,3,1),(2,21,4,1),(2,22,0,1),(2,22,1,1),(2,22,2,1),(2,22,3,1),(2,22,4,1),(2,23,0,0),(2,23,1,0),(2,23,2,0),(2,23,3,0),(2,23,4,0),(2,26,0,1),(2,26,1,1),(2,26,2,1),(2,26,3,1),(2,26,4,1),(2,31,0,1),(2,31,1,1),(2,31,2,1),(2,31,3,1),(2,31,4,1),(2,32,0,1),(2,32,1,1),(2,32,2,1),(2,32,3,1),(2,32,4,1),(2,33,0,1),(2,33,1,1),(2,33,2,1),(2,33,3,1),(2,33,4,1),(2,35,0,1),(2,35,1,1),(2,35,2,1),(2,35,3,1),(2,35,4,1),(2,38,0,1),(2,38,1,1),(2,38,2,1),(2,38,3,1),(2,38,4,1),(2,39,0,1),(2,39,1,1),(2,39,2,1),(2,39,3,1),(2,39,4,1),(2,40,0,1),(2,40,1,1),(2,40,2,1),(2,40,3,1),(2,40,4,1),(2,41,0,1),(2,41,1,1),(2,41,2,1),(2,41,3,1),(2,41,4,1),(2,43,0,1),(2,43,1,1),(2,43,2,1),(2,43,3,1),(2,43,4,1),(2,48,0,1),(2,48,1,1),(2,48,2,1),(2,48,3,1),(2,48,4,1),(2,49,0,1),(2,49,1,1),(2,49,2,1),(2,49,3,1),(2,49,4,1),(2,50,0,1),(2,50,1,1),(2,50,2,1),(2,50,3,1),(2,50,4,1),(2,51,0,0),(2,51,1,0),(2,51,2,0),(2,51,3,0),(2,51,4,0),(2,52,0,1),(2,52,1,1),(2,52,2,1),(2,52,3,1),(2,52,4,1),(2,53,0,0),(2,53,1,0),(2,53,2,0),(2,53,3,0),(2,53,4,0),(2,54,0,0),(2,54,1,0),(2,54,2,0),(2,54,3,0),(2,54,4,0),(2,55,0,1),(2,55,1,1),(2,55,2,1),(2,55,3,1),(2,55,4,1),(2,56,0,1),(2,56,1,1),(2,56,2,1),(2,56,3,1),(2,56,4,1),(2,57,0,0),(2,57,1,0),(2,57,2,0),(2,57,3,0),(2,57,4,0),(2,58,0,1),(2,58,1,1),(2,58,2,1),(2,58,3,1),(2,58,4,1),(2,60,0,1),(2,60,1,1),(2,60,2,1),(2,60,3,1),(2,60,4,1),(2,61,0,1),(2,61,1,1),(2,61,2,1),(2,61,3,1),(2,61,4,1),(2,62,0,0),(2,62,1,0),(2,62,2,0),(2,62,3,0),(2,62,4,0),(3,2,0,1),(3,2,1,1),(3,2,2,1),(3,2,3,0),(3,2,4,0),(3,4,0,0),(3,4,1,0),(3,4,2,0),(3,4,3,0),(3,4,4,0),(3,6,0,0),(3,6,1,0),(3,6,2,0),(3,6,3,0),(3,6,4,0),(3,7,0,0),(3,7,1,0),(3,7,2,0),(3,7,3,0),(3,7,4,0),(3,8,0,0),(3,8,1,0),(3,8,2,0),(3,8,3,0),(3,8,4,0),(3,9,0,0),(3,9,1,0),(3,9,2,0),(3,9,3,0),(3,9,4,0),(3,13,0,0),(3,13,1,0),(3,13,2,0),(3,13,3,0),(3,13,4,0),(3,14,0,0),(3,14,1,0),(3,14,2,0),(3,14,3,0),(3,14,4,0),(3,15,0,0),(3,15,1,0),(3,15,2,0),(3,15,3,0),(3,15,4,0),(3,16,0,0),(3,16,1,0),(3,16,2,0),(3,16,3,0),(3,16,4,0),(3,18,0,0),(3,18,1,0),(3,18,2,0),(3,18,3,0),(3,18,4,0),(3,19,0,0),(3,19,1,0),(3,19,2,0),(3,19,3,0),(3,19,4,0),(3,20,0,0),(3,20,1,0),(3,20,2,0),(3,20,3,0),(3,20,4,0),(3,21,0,0),(3,21,1,0),(3,21,2,0),(3,21,3,0),(3,21,4,0),(3,22,0,0),(3,22,1,0),(3,22,2,0),(3,22,3,0),(3,22,4,0),(3,23,0,0),(3,23,1,0),(3,23,2,0),(3,23,3,0),(3,23,4,0),(3,26,0,0),(3,26,1,0),(3,26,2,0),(3,26,3,0),(3,26,4,0),(3,31,0,0),(3,31,1,0),(3,31,2,0),(3,31,3,0),(3,31,4,0),(3,32,0,0),(3,32,1,0),(3,32,2,0),(3,32,3,0),(3,32,4,0),(3,33,0,0),(3,33,1,0),(3,33,2,0),(3,33,3,0),(3,33,4,0),(3,35,0,0),(3,35,1,0),(3,35,2,0),(3,35,3,0),(3,35,4,0),(3,38,0,0),(3,38,1,0),(3,38,2,0),(3,38,3,0),(3,38,4,0),(3,39,0,0),(3,39,1,0),(3,39,2,0),(3,39,3,0),(3,39,4,0),(3,40,0,0),(3,40,1,0),(3,40,2,0),(3,40,3,0),(3,40,4,0),(3,41,0,0),(3,41,1,0),(3,41,2,0),(3,41,3,0),(3,41,4,0),(3,43,0,0),(3,43,1,0),(3,43,2,0),(3,43,3,0),(3,43,4,0),(3,48,0,0),(3,48,1,0),(3,48,2,0),(3,48,3,0),(3,48,4,0),(3,49,0,0),(3,49,1,0),(3,49,2,0),(3,49,3,0),(3,49,4,0),(3,50,0,0),(3,50,1,0),(3,50,2,0),(3,50,3,0),(3,50,4,0),(3,51,0,0),(3,51,1,0),(3,51,2,0),(3,51,3,0),(3,51,4,0),(3,52,0,0),(3,52,1,0),(3,52,2,0),(3,52,3,0),(3,52,4,0),(3,53,0,0),(3,53,1,0),(3,53,2,0),(3,53,3,0),(3,53,4,0),(3,54,0,0),(3,54,1,0),(3,54,2,0),(3,54,3,0),(3,54,4,0),(3,55,0,0),(3,55,1,0),(3,55,2,0),(3,55,3,0),(3,55,4,0),(3,56,0,0),(3,56,1,0),(3,56,2,0),(3,56,3,0),(3,56,4,0),(3,57,0,0),(3,57,1,0),(3,57,2,0),(3,57,3,0),(3,57,4,0),(3,58,0,0),(3,58,1,0),(3,58,2,0),(3,58,3,0),(3,58,4,0),(3,60,0,0),(3,60,1,0),(3,60,2,0),(3,60,3,0),(3,60,4,0),(3,61,0,0),(3,61,1,0),(3,61,2,0),(3,61,3,0),(3,61,4,0),(3,62,0,0),(3,62,1,0),(3,62,2,0),(3,62,3,0),(3,62,4,0),(4,2,0,1),(4,2,1,1),(4,2,2,1),(4,2,3,0),(4,2,4,0),(4,4,0,1),(4,4,1,1),(4,4,2,1),(4,4,3,0),(4,4,4,0),(4,6,0,1),(4,6,1,1),(4,6,2,1),(4,6,3,0),(4,6,4,0),(4,7,0,1),(4,7,1,1),(4,7,2,1),(4,7,3,0),(4,7,4,0),(4,8,0,1),(4,8,1,1),(4,8,2,1),(4,8,3,0),(4,8,4,0),(4,9,0,1),(4,9,1,1),(4,9,2,1),(4,9,3,0),(4,9,4,0),(4,13,0,1),(4,13,1,1),(4,13,2,1),(4,13,3,0),(4,13,4,0),(4,14,0,1),(4,14,1,1),(4,14,2,1),(4,14,3,0),(4,14,4,0),(4,15,0,1),(4,15,1,1),(4,15,2,1),(4,15,3,0),(4,15,4,0),(4,16,0,1),(4,16,1,1),(4,16,2,1),(4,16,3,0),(4,16,4,0),(4,18,0,1),(4,18,1,1),(4,18,2,1),(4,18,3,0),(4,18,4,0),(4,19,0,1),(4,19,1,1),(4,19,2,1),(4,19,3,0),(4,19,4,0),(4,20,0,1),(4,20,1,1),(4,20,2,1),(4,20,3,0),(4,20,4,0),(4,21,0,1),(4,21,1,1),(4,21,2,1),(4,21,3,0),(4,21,4,0),(4,22,0,1),(4,22,1,1),(4,22,2,1),(4,22,3,0),(4,22,4,0),(4,23,0,1),(4,23,1,1),(4,23,2,1),(4,23,3,0),(4,23,4,0),(4,26,0,1),(4,26,1,1),(4,26,2,1),(4,26,3,0),(4,26,4,0),(4,31,0,0),(4,31,1,0),(4,31,2,0),(4,31,3,0),(4,31,4,0),(4,32,0,0),(4,32,1,0),(4,32,2,0),(4,32,3,0),(4,32,4,0),(4,33,0,0),(4,33,1,0),(4,33,2,0),(4,33,3,0),(4,33,4,0),(4,35,0,0),(4,35,1,0),(4,35,2,0),(4,35,3,0),(4,35,4,0),(4,38,0,0),(4,38,1,0),(4,38,2,0),(4,38,3,0),(4,38,4,0),(4,39,0,0),(4,39,1,0),(4,39,2,0),(4,39,3,0),(4,39,4,0),(4,40,0,0),(4,40,1,0),(4,40,2,0),(4,40,3,0),(4,40,4,0),(4,41,0,0),(4,41,1,0),(4,41,2,0),(4,41,3,0),(4,41,4,0),(4,43,0,0),(4,43,1,0),(4,43,2,0),(4,43,3,0),(4,43,4,0),(4,48,0,0),(4,48,1,0),(4,48,2,0),(4,48,3,0),(4,48,4,0),(4,49,0,0),(4,49,1,0),(4,49,2,0),(4,49,3,0),(4,49,4,0),(4,50,0,0),(4,50,1,0),(4,50,2,0),(4,50,3,0),(4,50,4,0),(4,51,0,0),(4,51,1,0),(4,51,2,0),(4,51,3,0),(4,51,4,0),(4,52,0,0),(4,52,1,0),(4,52,2,0),(4,52,3,0),(4,52,4,0),(4,53,0,0),(4,53,1,0),(4,53,2,0),(4,53,3,0),(4,53,4,0),(4,54,0,0),(4,54,1,0),(4,54,2,0),(4,54,3,0),(4,54,4,0),(4,55,0,0),(4,55,1,0),(4,55,2,0),(4,55,3,0),(4,55,4,0),(4,56,0,0),(4,56,1,0),(4,56,2,0),(4,56,3,0),(4,56,4,0),(4,57,0,0),(4,57,1,0),(4,57,2,0),(4,57,3,0),(4,57,4,0),(4,58,0,0),(4,58,1,0),(4,58,2,0),(4,58,3,0),(4,58,4,0),(4,60,0,0),(4,60,1,0),(4,60,2,0),(4,60,3,0),(4,60,4,0),(4,61,0,0),(4,61,1,0),(4,61,2,0),(4,61,3,0),(4,61,4,0),(4,62,0,0),(4,62,1,0),(4,62,2,0),(4,62,3,0),(4,62,4,0),(5,2,0,1),(5,2,1,1),(5,2,2,1),(5,2,3,1),(5,2,4,1),(5,4,0,1),(5,4,1,1),(5,4,2,1),(5,4,3,1),(5,4,4,1),(5,6,0,1),(5,6,1,1),(5,6,2,1),(5,6,3,1),(5,6,4,1),(5,7,0,1),(5,7,1,1),(5,7,2,1),(5,7,3,1),(5,7,4,1),(5,8,0,1),(5,8,1,1),(5,8,2,1),(5,8,3,1),(5,8,4,1),(5,9,0,1),(5,9,1,1),(5,9,2,1),(5,9,3,1),(5,9,4,1),(5,13,0,1),(5,13,1,1),(5,13,2,1),(5,13,3,1),(5,13,4,1),(5,14,0,0),(5,14,1,0),(5,14,2,0),(5,14,3,0),(5,14,4,0),(5,15,0,1),(5,15,1,1),(5,15,2,1),(5,15,3,1),(5,15,4,1),(5,16,0,1),(5,16,1,1),(5,16,2,1),(5,16,3,1),(5,16,4,1),(5,18,0,1),(5,18,1,1),(5,18,2,1),(5,18,3,1),(5,18,4,1),(5,19,0,1),(5,19,1,1),(5,19,2,1),(5,19,3,1),(5,19,4,1),(5,20,0,1),(5,20,1,1),(5,20,2,1),(5,20,3,1),(5,20,4,1),(5,21,0,1),(5,21,1,1),(5,21,2,1),(5,21,3,1),(5,21,4,1),(5,22,0,1),(5,22,1,1),(5,22,2,1),(5,22,3,1),(5,22,4,1),(5,23,0,1),(5,23,1,1),(5,23,2,1),(5,23,3,1),(5,23,4,1),(5,26,0,1),(5,26,1,1),(5,26,2,1),(5,26,3,1),(5,26,4,1),(5,31,0,1),(5,31,1,1),(5,31,2,1),(5,31,3,1),(5,31,4,1),(5,32,0,1),(5,32,1,1),(5,32,2,1),(5,32,3,1),(5,32,4,1),(5,33,0,1),(5,33,1,1),(5,33,2,1),(5,33,3,1),(5,33,4,1),(5,35,0,1),(5,35,1,1),(5,35,2,1),(5,35,3,1),(5,35,4,1),(5,38,0,1),(5,38,1,1),(5,38,2,1),(5,38,3,1),(5,38,4,1),(5,39,0,1),(5,39,1,1),(5,39,2,1),(5,39,3,1),(5,39,4,1),(5,40,0,1),(5,40,1,1),(5,40,2,1),(5,40,3,1),(5,40,4,1),(5,41,0,1),(5,41,1,1),(5,41,2,1),(5,41,3,1),(5,41,4,1),(5,43,0,1),(5,43,1,1),(5,43,2,1),(5,43,3,1),(5,43,4,1),(5,48,0,0),(5,48,1,0),(5,48,2,0),(5,48,3,0),(5,48,4,0),(5,49,0,0),(5,49,1,0),(5,49,2,0),(5,49,3,0),(5,49,4,0),(5,50,0,1),(5,50,1,1),(5,50,2,1),(5,50,3,1),(5,50,4,1),(5,51,0,1),(5,51,1,1),(5,51,2,1),(5,51,3,1),(5,51,4,1),(5,52,0,1),(5,52,1,1),(5,52,2,1),(5,52,3,1),(5,52,4,1),(5,53,0,1),(5,53,1,1),(5,53,2,1),(5,53,3,1),(5,53,4,1),(5,54,0,1),(5,54,1,1),(5,54,2,1),(5,54,3,1),(5,54,4,1),(5,55,0,0),(5,55,1,0),(5,55,2,0),(5,55,3,0),(5,55,4,0),(5,56,0,0),(5,56,1,0),(5,56,2,0),(5,56,3,0),(5,56,4,0),(5,57,0,0),(5,57,1,0),(5,57,2,0),(5,57,3,0),(5,57,4,0),(5,58,0,0),(5,58,1,0),(5,58,2,0),(5,58,3,0),(5,58,4,0),(5,60,0,0),(5,60,1,0),(5,60,2,0),(5,60,3,0),(5,60,4,0),(5,61,0,0),(5,61,1,0),(5,61,2,0),(5,61,3,0),(5,61,4,0),(5,62,0,0),(5,62,1,0),(5,62,2,0),(5,62,3,0),(5,62,4,0);

/*Table structure for table `vtiger_profile2tab` */

DROP TABLE IF EXISTS `vtiger_profile2tab`;

CREATE TABLE `vtiger_profile2tab` (
  `profileid` int(11) default NULL,
  `tabid` int(10) default NULL,
  `permissions` int(10) NOT NULL default '0',
  KEY `profile2tab_profileid_tabid_idx` (`profileid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile2tab` */

insert  into `vtiger_profile2tab`(`profileid`,`tabid`,`permissions`) values (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(1,13,0),(1,14,0),(1,15,0),(1,16,0),(1,18,0),(1,19,0),(1,20,0),(1,21,0),(1,22,0),(1,23,0),(1,24,0),(1,25,0),(1,26,0),(1,27,0),(2,1,0),(2,2,1),(2,3,0),(2,4,0),(2,6,1),(2,7,1),(2,8,1),(2,9,1),(2,10,1),(2,13,1),(2,14,0),(2,15,1),(2,16,1),(2,18,1),(2,19,1),(2,20,1),(2,21,1),(2,22,1),(2,23,0),(2,24,1),(2,25,1),(2,26,1),(2,27,1),(3,1,0),(3,2,0),(3,3,0),(3,4,0),(3,6,0),(3,7,0),(3,8,0),(3,9,0),(3,10,0),(3,13,0),(3,14,0),(3,15,0),(3,16,0),(3,18,0),(3,19,0),(3,20,0),(3,21,0),(3,22,0),(3,23,0),(3,24,0),(3,25,0),(3,26,0),(3,27,0),(4,1,0),(4,2,0),(4,3,0),(4,4,0),(4,6,0),(4,7,0),(4,8,0),(4,9,0),(4,10,0),(4,13,0),(4,14,0),(4,15,0),(4,16,0),(4,18,0),(4,19,0),(4,20,0),(4,21,0),(4,22,0),(4,23,0),(4,24,0),(4,25,0),(4,26,0),(4,27,0),(1,30,0),(2,30,1),(3,30,0),(4,30,0),(1,31,0),(2,31,1),(3,31,0),(4,31,0),(1,32,0),(2,32,1),(3,32,0),(4,32,0),(1,33,0),(2,33,1),(3,33,0),(4,33,0),(1,34,0),(2,34,1),(3,34,0),(4,34,0),(1,35,0),(2,35,1),(3,35,0),(4,35,0),(1,36,0),(2,36,1),(3,36,0),(4,36,0),(1,38,0),(2,38,1),(3,38,0),(4,38,0),(1,39,0),(2,39,1),(3,39,0),(4,39,0),(1,40,0),(2,40,1),(3,40,0),(4,40,0),(1,41,0),(2,41,1),(3,41,0),(4,41,0),(1,42,0),(2,42,1),(3,42,0),(4,42,0),(1,43,0),(2,43,1),(3,43,0),(4,43,0),(1,44,0),(2,44,1),(3,44,0),(4,44,0),(1,45,0),(2,45,1),(3,45,0),(4,45,0),(1,48,0),(2,48,1),(3,48,0),(4,48,0),(1,49,0),(2,49,1),(3,49,0),(4,49,0),(1,50,0),(2,50,1),(3,50,0),(4,50,0),(1,51,0),(2,51,0),(3,51,0),(4,51,0),(1,52,0),(2,52,1),(3,52,0),(4,52,0),(1,53,0),(2,53,0),(3,53,0),(4,53,0),(1,54,0),(2,54,0),(3,54,0),(4,54,0),(1,55,0),(2,55,1),(3,55,0),(4,55,0),(1,56,0),(2,56,1),(3,56,0),(4,56,0),(1,57,0),(2,57,0),(3,57,0),(4,57,0),(1,58,0),(2,58,1),(3,58,0),(4,58,0),(5,1,0),(5,2,1),(5,4,1),(5,6,1),(5,7,1),(5,8,1),(5,9,1),(5,16,1),(5,10,1),(5,13,1),(5,14,0),(5,15,1),(5,18,1),(5,19,1),(5,20,1),(5,21,1),(5,22,1),(5,23,1),(5,24,1),(5,25,1),(5,26,1),(5,27,1),(5,30,1),(5,31,1),(5,32,1),(5,33,1),(5,34,1),(5,35,1),(5,36,1),(5,38,1),(5,39,1),(5,40,1),(5,41,1),(5,42,1),(5,43,1),(5,44,1),(5,45,1),(5,48,0),(5,49,0),(5,50,1),(5,51,1),(5,52,1),(5,53,1),(5,54,1),(5,55,0),(5,56,0),(5,57,0),(5,58,0),(1,59,0),(2,59,0),(3,59,0),(4,59,0),(5,59,0),(1,60,0),(2,60,1),(3,60,0),(4,60,0),(5,60,0),(1,61,0),(2,61,1),(3,61,0),(4,61,0),(5,61,0),(1,62,0),(2,62,0),(3,62,0),(4,62,0),(5,62,0);

/*Table structure for table `vtiger_profile2utility` */

DROP TABLE IF EXISTS `vtiger_profile2utility`;

CREATE TABLE `vtiger_profile2utility` (
  `profileid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `permission` int(1) default NULL,
  PRIMARY KEY  (`profileid`,`tabid`,`activityid`),
  KEY `profile2utility_profileid_tabid_activityid_idx` (`profileid`,`tabid`,`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile2utility` */

insert  into `vtiger_profile2utility`(`profileid`,`tabid`,`activityid`,`permission`) values (1,2,5,0),(1,2,6,0),(1,2,10,0),(1,4,5,0),(1,4,6,0),(1,4,8,0),(1,4,10,0),(1,6,5,0),(1,6,6,0),(1,6,8,0),(1,6,10,0),(1,7,5,0),(1,7,6,0),(1,7,8,0),(1,7,9,0),(1,7,10,0),(1,8,6,0),(1,13,5,0),(1,13,6,0),(1,13,8,0),(1,13,10,0),(1,14,5,0),(1,14,6,0),(1,14,10,0),(1,18,5,0),(1,18,6,0),(1,18,10,0),(1,31,5,1),(1,31,6,1),(1,31,8,1),(1,32,5,0),(1,32,6,0),(1,32,10,0),(1,33,5,0),(1,33,6,0),(1,33,10,0),(1,35,5,0),(1,35,6,0),(1,35,10,0),(1,39,5,0),(1,39,6,0),(1,39,10,0),(1,40,5,0),(1,40,6,0),(1,40,10,0),(1,41,5,0),(1,41,6,0),(1,41,10,0),(1,48,5,0),(1,48,6,0),(1,48,8,0),(1,49,5,0),(1,49,6,0),(1,49,8,0),(1,50,5,0),(1,50,6,0),(1,50,8,0),(1,51,5,0),(1,51,6,0),(1,51,8,0),(1,52,5,0),(1,52,6,0),(1,52,8,0),(1,53,5,0),(1,53,6,0),(1,53,8,0),(1,54,5,0),(1,54,6,0),(1,54,8,0),(1,55,5,0),(1,55,6,0),(1,55,8,0),(1,56,5,0),(1,56,6,0),(1,56,8,0),(1,57,5,0),(1,57,6,0),(1,57,8,0),(1,58,5,0),(1,58,6,0),(1,58,8,0),(1,60,5,0),(1,60,6,0),(1,61,5,0),(1,61,6,0),(1,62,5,0),(1,62,6,0),(1,62,8,0),(2,2,5,1),(2,2,6,1),(2,2,10,0),(2,4,5,0),(2,4,6,0),(2,4,8,0),(2,4,10,0),(2,6,5,1),(2,6,6,1),(2,6,8,0),(2,6,10,0),(2,7,5,1),(2,7,6,1),(2,7,8,0),(2,7,9,0),(2,7,10,0),(2,8,6,1),(2,13,5,1),(2,13,6,1),(2,13,8,0),(2,13,10,0),(2,14,5,0),(2,14,6,0),(2,14,10,0),(2,18,5,0),(2,18,6,0),(2,18,10,0),(2,31,5,1),(2,31,6,1),(2,31,8,1),(2,32,5,0),(2,32,6,0),(2,32,10,0),(2,33,5,0),(2,33,6,0),(2,33,10,0),(2,35,5,0),(2,35,6,0),(2,35,10,0),(2,39,5,0),(2,39,6,0),(2,39,10,0),(2,40,5,0),(2,40,6,0),(2,40,10,0),(2,41,5,0),(2,41,6,0),(2,41,10,0),(2,48,5,0),(2,48,6,0),(2,48,8,0),(2,49,5,0),(2,49,6,0),(2,49,8,0),(2,50,5,0),(2,50,6,0),(2,50,8,0),(2,51,5,0),(2,51,6,0),(2,51,8,0),(2,52,5,0),(2,52,6,0),(2,52,8,0),(2,53,5,0),(2,53,6,0),(2,53,8,0),(2,54,5,0),(2,54,6,0),(2,54,8,0),(2,55,5,0),(2,55,6,0),(2,55,8,0),(2,56,5,0),(2,56,6,0),(2,56,8,0),(2,57,5,0),(2,57,6,0),(2,57,8,0),(2,58,5,0),(2,58,6,0),(2,58,8,0),(2,60,5,0),(2,60,6,0),(2,61,5,0),(2,61,6,0),(2,62,5,0),(2,62,6,0),(2,62,8,0),(3,2,5,1),(3,2,6,1),(3,2,10,0),(3,4,5,1),(3,4,6,1),(3,4,8,0),(3,4,10,0),(3,6,5,1),(3,6,6,1),(3,6,8,0),(3,6,10,0),(3,7,5,1),(3,7,6,1),(3,7,8,0),(3,7,9,0),(3,7,10,0),(3,8,6,1),(3,13,5,1),(3,13,6,1),(3,13,8,0),(3,13,10,0),(3,14,5,1),(3,14,6,1),(3,14,10,0),(3,18,5,1),(3,18,6,1),(3,18,10,0),(3,31,5,1),(3,31,6,1),(3,31,8,1),(3,32,5,0),(3,32,6,0),(3,32,10,0),(3,33,5,0),(3,33,6,0),(3,33,10,0),(3,35,5,0),(3,35,6,0),(3,35,10,0),(3,39,5,0),(3,39,6,0),(3,39,10,0),(3,40,5,0),(3,40,6,0),(3,40,10,0),(3,41,5,0),(3,41,6,0),(3,41,10,0),(3,48,5,0),(3,48,6,0),(3,48,8,0),(3,49,5,0),(3,49,6,0),(3,49,8,0),(3,50,5,0),(3,50,6,0),(3,50,8,0),(3,51,5,0),(3,51,6,0),(3,51,8,0),(3,52,5,0),(3,52,6,0),(3,52,8,0),(3,53,5,0),(3,53,6,0),(3,53,8,0),(3,54,5,0),(3,54,6,0),(3,54,8,0),(3,55,5,0),(3,55,6,0),(3,55,8,0),(3,56,5,0),(3,56,6,0),(3,56,8,0),(3,57,5,0),(3,57,6,0),(3,57,8,0),(3,58,5,0),(3,58,6,0),(3,58,8,0),(3,60,5,0),(3,60,6,0),(3,61,5,0),(3,61,6,0),(3,62,5,0),(3,62,6,0),(3,62,8,0),(4,2,5,1),(4,2,6,1),(4,2,10,0),(4,4,5,1),(4,4,6,1),(4,4,8,1),(4,4,10,0),(4,6,5,1),(4,6,6,1),(4,6,8,1),(4,6,10,0),(4,7,5,1),(4,7,6,1),(4,7,8,1),(4,7,9,0),(4,7,10,0),(4,8,6,1),(4,13,5,1),(4,13,6,1),(4,13,8,1),(4,13,10,0),(4,14,5,1),(4,14,6,1),(4,14,10,0),(4,18,5,1),(4,18,6,1),(4,18,10,0),(4,31,5,1),(4,31,6,1),(4,31,8,1),(4,32,5,0),(4,32,6,0),(4,32,10,0),(4,33,5,0),(4,33,6,0),(4,33,10,0),(4,35,5,0),(4,35,6,0),(4,35,10,0),(4,39,5,0),(4,39,6,0),(4,39,10,0),(4,40,5,0),(4,40,6,0),(4,40,10,0),(4,41,5,0),(4,41,6,0),(4,41,10,0),(4,48,5,0),(4,48,6,0),(4,48,8,0),(4,49,5,0),(4,49,6,0),(4,49,8,0),(4,50,5,0),(4,50,6,0),(4,50,8,0),(4,51,5,0),(4,51,6,0),(4,51,8,0),(4,52,5,0),(4,52,6,0),(4,52,8,0),(4,53,5,0),(4,53,6,0),(4,53,8,0),(4,54,5,0),(4,54,6,0),(4,54,8,0),(4,55,5,0),(4,55,6,0),(4,55,8,0),(4,56,5,0),(4,56,6,0),(4,56,8,0),(4,57,5,0),(4,57,6,0),(4,57,8,0),(4,58,5,0),(4,58,6,0),(4,58,8,0),(4,60,5,0),(4,60,6,0),(4,61,5,0),(4,61,6,0),(4,62,5,0),(4,62,6,0),(4,62,8,0),(5,2,5,0),(5,2,6,0),(5,2,10,0),(5,4,5,0),(5,4,6,0),(5,4,8,0),(5,4,10,0),(5,6,5,0),(5,6,6,0),(5,6,8,0),(5,6,10,0),(5,7,5,0),(5,7,6,0),(5,7,8,0),(5,7,9,0),(5,7,10,0),(5,8,6,0),(5,13,5,0),(5,13,6,0),(5,13,8,0),(5,13,10,0),(5,14,5,0),(5,14,6,0),(5,14,10,0),(5,18,5,0),(5,18,6,0),(5,18,10,0),(5,31,5,1),(5,31,6,1),(5,31,8,1),(5,32,5,0),(5,32,6,0),(5,32,10,0),(5,33,5,0),(5,33,6,0),(5,33,10,0),(5,35,5,0),(5,35,6,0),(5,35,10,0),(5,39,5,0),(5,39,6,0),(5,39,10,0),(5,40,5,0),(5,40,6,0),(5,40,10,0),(5,41,5,0),(5,41,6,0),(5,41,10,0),(5,48,5,0),(5,48,6,0),(5,48,8,0),(5,49,5,0),(5,49,6,0),(5,49,8,0),(5,50,5,0),(5,50,6,0),(5,50,8,0),(5,51,5,0),(5,51,6,0),(5,51,8,0),(5,52,5,0),(5,52,6,0),(5,52,8,0),(5,53,5,0),(5,53,6,0),(5,53,8,0),(5,54,5,0),(5,54,6,0),(5,54,8,0),(5,55,5,0),(5,55,6,0),(5,55,8,0),(5,56,5,0),(5,56,6,0),(5,56,8,0),(5,57,5,0),(5,57,6,0),(5,57,8,0),(5,58,5,0),(5,58,6,0),(5,58,8,0),(5,60,5,0),(5,60,6,0),(5,61,5,0),(5,61,6,0),(5,62,5,0),(5,62,6,0),(5,62,8,0);

/*Table structure for table `vtiger_profile_seq` */

DROP TABLE IF EXISTS `vtiger_profile_seq`;

CREATE TABLE `vtiger_profile_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_profile_seq` */

insert  into `vtiger_profile_seq`(`id`) values (5);

/*Table structure for table `vtiger_progress` */

DROP TABLE IF EXISTS `vtiger_progress`;

CREATE TABLE `vtiger_progress` (
  `progressid` int(11) NOT NULL auto_increment,
  `progress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`progressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_progress` */

insert  into `vtiger_progress`(`progressid`,`progress`,`presence`,`picklist_valueid`) values (1,'--none--',1,277),(2,'10%',1,278),(3,'20%',1,279),(4,'30%',1,280),(5,'40%',1,281),(6,'50%',1,282),(7,'60%',1,283),(8,'70%',1,284),(9,'80%',1,285),(10,'90%',1,286),(11,'100%',1,287);

/*Table structure for table `vtiger_progress_seq` */

DROP TABLE IF EXISTS `vtiger_progress_seq`;

CREATE TABLE `vtiger_progress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_progress_seq` */

insert  into `vtiger_progress_seq`(`id`) values (11);

/*Table structure for table `vtiger_project` */

DROP TABLE IF EXISTS `vtiger_project`;

CREATE TABLE `vtiger_project` (
  `projectid` int(11) default NULL,
  `projectname` varchar(255) default NULL,
  `project_no` varchar(100) default NULL,
  `startdate` date default NULL,
  `targetenddate` date default NULL,
  `actualenddate` date default NULL,
  `targetbudget` varchar(255) default NULL,
  `projecturl` varchar(255) default NULL,
  `projectstatus` varchar(100) default NULL,
  `projectpriority` varchar(100) default NULL,
  `projecttype` varchar(100) default NULL,
  `progress` varchar(100) default NULL,
  `linktoaccountscontacts` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_project` */

/*Table structure for table `vtiger_projectcf` */

DROP TABLE IF EXISTS `vtiger_projectcf`;

CREATE TABLE `vtiger_projectcf` (
  `projectid` int(11) NOT NULL,
  PRIMARY KEY  (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projectcf` */

/*Table structure for table `vtiger_projectmilestone` */

DROP TABLE IF EXISTS `vtiger_projectmilestone`;

CREATE TABLE `vtiger_projectmilestone` (
  `projectmilestoneid` int(11) NOT NULL,
  `projectmilestonename` varchar(255) default NULL,
  `projectmilestone_no` varchar(100) default NULL,
  `projectmilestonedate` varchar(255) default NULL,
  `projectid` varchar(100) default NULL,
  `projectmilestonetype` varchar(100) default NULL,
  PRIMARY KEY  (`projectmilestoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projectmilestone` */

/*Table structure for table `vtiger_projectmilestonecf` */

DROP TABLE IF EXISTS `vtiger_projectmilestonecf`;

CREATE TABLE `vtiger_projectmilestonecf` (
  `projectmilestoneid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projectmilestoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projectmilestonecf` */

/*Table structure for table `vtiger_projectmilestonetype` */

DROP TABLE IF EXISTS `vtiger_projectmilestonetype`;

CREATE TABLE `vtiger_projectmilestonetype` (
  `projectmilestonetypeid` int(11) NOT NULL auto_increment,
  `projectmilestonetype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projectmilestonetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projectmilestonetype` */

insert  into `vtiger_projectmilestonetype`(`projectmilestonetypeid`,`projectmilestonetype`,`presence`,`picklist_valueid`) values (1,'--none--',1,237),(2,'administrative',1,238),(3,'operative',1,239),(4,'other',1,240);

/*Table structure for table `vtiger_projectmilestonetype_seq` */

DROP TABLE IF EXISTS `vtiger_projectmilestonetype_seq`;

CREATE TABLE `vtiger_projectmilestonetype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projectmilestonetype_seq` */

insert  into `vtiger_projectmilestonetype_seq`(`id`) values (4);

/*Table structure for table `vtiger_projectpriority` */

DROP TABLE IF EXISTS `vtiger_projectpriority`;

CREATE TABLE `vtiger_projectpriority` (
  `projectpriorityid` int(11) NOT NULL auto_increment,
  `projectpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projectpriorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projectpriority` */

insert  into `vtiger_projectpriority`(`projectpriorityid`,`projectpriority`,`presence`,`picklist_valueid`) values (1,'--none--',1,273),(2,'low',1,274),(3,'normal',1,275),(4,'high',1,276);

/*Table structure for table `vtiger_projectpriority_seq` */

DROP TABLE IF EXISTS `vtiger_projectpriority_seq`;

CREATE TABLE `vtiger_projectpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projectpriority_seq` */

insert  into `vtiger_projectpriority_seq`(`id`) values (4);

/*Table structure for table `vtiger_projectstatus` */

DROP TABLE IF EXISTS `vtiger_projectstatus`;

CREATE TABLE `vtiger_projectstatus` (
  `projectstatusid` int(11) NOT NULL auto_increment,
  `projectstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projectstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projectstatus` */

insert  into `vtiger_projectstatus`(`projectstatusid`,`projectstatus`,`presence`,`picklist_valueid`) values (1,'--none--',1,260),(2,'prospecting',1,261),(3,'initiated',1,262),(4,'in progress',1,263),(5,'waiting for feedback',1,264),(6,'on hold',1,265),(7,'completed',1,266),(8,'delivered',1,267),(9,'archived',1,268);

/*Table structure for table `vtiger_projectstatus_seq` */

DROP TABLE IF EXISTS `vtiger_projectstatus_seq`;

CREATE TABLE `vtiger_projectstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projectstatus_seq` */

insert  into `vtiger_projectstatus_seq`(`id`) values (9);

/*Table structure for table `vtiger_projecttask` */

DROP TABLE IF EXISTS `vtiger_projecttask`;

CREATE TABLE `vtiger_projecttask` (
  `projecttaskid` int(11) NOT NULL,
  `projecttaskname` varchar(255) default NULL,
  `projecttask_no` varchar(100) default NULL,
  `projecttasktype` varchar(100) default NULL,
  `projecttaskpriority` varchar(100) default NULL,
  `projecttaskprogress` varchar(100) default NULL,
  `projecttaskhours` varchar(255) default NULL,
  `startdate` date default NULL,
  `enddate` date default NULL,
  `projectid` varchar(100) default NULL,
  `projecttasknumber` int(11) default NULL,
  PRIMARY KEY  (`projecttaskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projecttask` */

/*Table structure for table `vtiger_projecttaskcf` */

DROP TABLE IF EXISTS `vtiger_projecttaskcf`;

CREATE TABLE `vtiger_projecttaskcf` (
  `projecttaskid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projecttaskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projecttaskcf` */

/*Table structure for table `vtiger_projecttaskpriority` */

DROP TABLE IF EXISTS `vtiger_projecttaskpriority`;

CREATE TABLE `vtiger_projecttaskpriority` (
  `projecttaskpriorityid` int(11) NOT NULL auto_increment,
  `projecttaskpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projecttaskpriorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projecttaskpriority` */

insert  into `vtiger_projecttaskpriority`(`projecttaskpriorityid`,`projecttaskpriority`,`presence`,`picklist_valueid`) values (1,'--none--',1,245),(2,'low',1,246),(3,'normal',1,247),(4,'high',1,248);

/*Table structure for table `vtiger_projecttaskpriority_seq` */

DROP TABLE IF EXISTS `vtiger_projecttaskpriority_seq`;

CREATE TABLE `vtiger_projecttaskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projecttaskpriority_seq` */

insert  into `vtiger_projecttaskpriority_seq`(`id`) values (4);

/*Table structure for table `vtiger_projecttaskprogress` */

DROP TABLE IF EXISTS `vtiger_projecttaskprogress`;

CREATE TABLE `vtiger_projecttaskprogress` (
  `projecttaskprogressid` int(11) NOT NULL auto_increment,
  `projecttaskprogress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projecttaskprogressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projecttaskprogress` */

insert  into `vtiger_projecttaskprogress`(`projecttaskprogressid`,`projecttaskprogress`,`presence`,`picklist_valueid`) values (1,'--none--',1,249),(2,'10%',1,250),(3,'20%',1,251),(4,'30%',1,252),(5,'40%',1,253),(6,'50%',1,254),(7,'60%',1,255),(8,'70%',1,256),(9,'80%',1,257),(10,'90%',1,258),(11,'100%',1,259);

/*Table structure for table `vtiger_projecttaskprogress_seq` */

DROP TABLE IF EXISTS `vtiger_projecttaskprogress_seq`;

CREATE TABLE `vtiger_projecttaskprogress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projecttaskprogress_seq` */

insert  into `vtiger_projecttaskprogress_seq`(`id`) values (11);

/*Table structure for table `vtiger_projecttasktype` */

DROP TABLE IF EXISTS `vtiger_projecttasktype`;

CREATE TABLE `vtiger_projecttasktype` (
  `projecttasktypeid` int(11) NOT NULL auto_increment,
  `projecttasktype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projecttasktypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projecttasktype` */

insert  into `vtiger_projecttasktype`(`projecttasktypeid`,`projecttasktype`,`presence`,`picklist_valueid`) values (1,'--none--',1,241),(2,'administrative',1,242),(3,'operative',1,243),(4,'other',1,244);

/*Table structure for table `vtiger_projecttasktype_seq` */

DROP TABLE IF EXISTS `vtiger_projecttasktype_seq`;

CREATE TABLE `vtiger_projecttasktype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projecttasktype_seq` */

insert  into `vtiger_projecttasktype_seq`(`id`) values (4);

/*Table structure for table `vtiger_projecttype` */

DROP TABLE IF EXISTS `vtiger_projecttype`;

CREATE TABLE `vtiger_projecttype` (
  `projecttypeid` int(11) NOT NULL auto_increment,
  `projecttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projecttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_projecttype` */

insert  into `vtiger_projecttype`(`projecttypeid`,`projecttype`,`presence`,`picklist_valueid`) values (1,'--none--',1,269),(2,'administrative',1,270),(3,'operative',1,271),(4,'other',1,272);

/*Table structure for table `vtiger_projecttype_seq` */

DROP TABLE IF EXISTS `vtiger_projecttype_seq`;

CREATE TABLE `vtiger_projecttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_projecttype_seq` */

insert  into `vtiger_projecttype_seq`(`id`) values (4);

/*Table structure for table `vtiger_promotion` */

DROP TABLE IF EXISTS `vtiger_promotion`;

CREATE TABLE `vtiger_promotion` (
  `promotionid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `product_name` varchar(100) default NULL,
  `qty` double default NULL,
  `mrp` double default NULL,
  `vat` double default NULL,
  `service` decimal(10,0) default NULL,
  `netprice` double default NULL,
  `from_date` date default NULL,
  `to_date` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_promotion` */

/*Table structure for table `vtiger_promotioncf` */

DROP TABLE IF EXISTS `vtiger_promotioncf`;

CREATE TABLE `vtiger_promotioncf` (
  `promotionid` int(11) NOT NULL,
  PRIMARY KEY  (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_promotioncf` */

/*Table structure for table `vtiger_promotiongrouprel` */

DROP TABLE IF EXISTS `vtiger_promotiongrouprel`;

CREATE TABLE `vtiger_promotiongrouprel` (
  `promotionid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_promotiongrouprel` */

/*Table structure for table `vtiger_prreceive` */

DROP TABLE IF EXISTS `vtiger_prreceive`;

CREATE TABLE `vtiger_prreceive` (
  `prreceiveid` int(11) default NULL,
  `productid` int(11) default NULL,
  `warehouseid` int(11) default NULL,
  `duedate` date default NULL,
  `status` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_prreceive` */

/*Table structure for table `vtiger_prreceivecf` */

DROP TABLE IF EXISTS `vtiger_prreceivecf`;

CREATE TABLE `vtiger_prreceivecf` (
  `prreceiveid` int(11) NOT NULL,
  PRIMARY KEY  (`prreceiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_prreceivecf` */

/*Table structure for table `vtiger_prreceivegrouprel` */

DROP TABLE IF EXISTS `vtiger_prreceivegrouprel`;

CREATE TABLE `vtiger_prreceivegrouprel` (
  `prreceiveid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`prreceiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_prreceivegrouprel` */

/*Table structure for table `vtiger_purchaseorder` */

DROP TABLE IF EXISTS `vtiger_purchaseorder`;

CREATE TABLE `vtiger_purchaseorder` (
  `purchaseorderid` int(19) NOT NULL default '0',
  `ref_po_no` int(19) default '0',
  `subject` varchar(100) default NULL,
  `quoteid` int(19) default NULL,
  `vendorid` int(19) default NULL,
  `requisition_no` varchar(100) default NULL,
  `purchaseorder_no` varchar(100) default NULL,
  `tracking_no` varchar(100) default NULL,
  `contactid` int(19) default NULL,
  `duedate` date default NULL,
  `carrier` varchar(200) default NULL,
  `type` varchar(100) default NULL,
  `adjustment` decimal(25,3) default NULL,
  `salescommission` decimal(25,3) default NULL,
  `exciseduty` decimal(25,3) default NULL,
  `total` decimal(25,3) default NULL,
  `subtotal` decimal(25,3) default NULL,
  `taxtype` varchar(25) default NULL,
  `discount_percent` decimal(25,3) default NULL,
  `discount_amount` decimal(25,3) default NULL,
  `s_h_amount` decimal(25,3) default NULL,
  `service_percent` decimal(25,3) default NULL,
  `service_amount` decimal(25,3) default NULL,
  `terms_conditions` text,
  `postatus` varchar(200) default NULL,
  `warehouse` varchar(100) default NULL,
  `currency_id` int(19) NOT NULL default '1',
  `conversion_rate` decimal(10,3) NOT NULL default '1.000',
  PRIMARY KEY  (`purchaseorderid`),
  KEY `purchaseorder_vendorid_idx` (`vendorid`),
  KEY `purchaseorder_quoteid_idx` (`quoteid`),
  KEY `purchaseorder_contactid_idx` (`contactid`),
  CONSTRAINT `fk_4_vtiger_purchaseorder` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_purchaseorder` */

insert  into `vtiger_purchaseorder`(`purchaseorderid`,`ref_po_no`,`subject`,`quoteid`,`vendorid`,`requisition_no`,`purchaseorder_no`,`tracking_no`,`contactid`,`duedate`,`carrier`,`type`,`adjustment`,`salescommission`,`exciseduty`,`total`,`subtotal`,`taxtype`,`discount_percent`,`discount_amount`,`s_h_amount`,`service_percent`,`service_amount`,`terms_conditions`,`postatus`,`warehouse`,`currency_id`,`conversion_rate`) values (101,0,NULL,NULL,100,'','PO1',NULL,NULL,'2012-08-08',NULL,'+','0.000',NULL,NULL,'21000.000','21000.000','vat','0.000','0.000','0.000','0.000','0.000','1) All dispute subject to Guwahati Juridiction.','Created','2',1,'1.000'),(133,0,NULL,NULL,100,'','PO2',NULL,NULL,'2012-09-08',NULL,'+','0.000',NULL,NULL,'5100.000','5100.000','cst','0.000','0.000','0.000','0.000','0.000','1) All dispute subject to Guwahati Juridiction.','Received Shipment','2',1,'1.000'),(148,0,NULL,NULL,100,'','PO3',NULL,NULL,'2012-10-05',NULL,'+','0.000',NULL,NULL,'83345.000','83345.000','vat','0.000','0.000','0.000','0.000','0.000','1) All dispute subject to Guwahati Juridiction.','Created','2',1,'1.000'),(160,0,NULL,NULL,100,'','PO4',NULL,NULL,'2012-10-23',NULL,'+','0.000',NULL,NULL,'490.000','490.000','cst','0.000','0.000','0.000','0.000','0.000','1) All dispute subject to Guwahati Juridiction.','Created','2',1,'1.000');

/*Table structure for table `vtiger_purchaseordercf` */

DROP TABLE IF EXISTS `vtiger_purchaseordercf`;

CREATE TABLE `vtiger_purchaseordercf` (
  `purchaseorderid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`purchaseorderid`),
  CONSTRAINT `fk_1_vtiger_purchaseordercf` FOREIGN KEY (`purchaseorderid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_purchaseordercf` */

insert  into `vtiger_purchaseordercf`(`purchaseorderid`) values (101),(133),(148),(160);

/*Table structure for table `vtiger_purchaseorderreceived` */

DROP TABLE IF EXISTS `vtiger_purchaseorderreceived`;

CREATE TABLE `vtiger_purchaseorderreceived` (
  `poreceivedid` int(11) default '0',
  `productid` int(11) default NULL,
  `productname` varchar(50) default NULL,
  `actualqty` decimal(11,2) default NULL,
  `qtyreceived` decimal(11,2) default NULL,
  `balanceqty` decimal(11,2) default NULL,
  `cost` decimal(11,2) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_purchaseorderreceived` */

/*Table structure for table `vtiger_purchaseorderreceivedcf` */

DROP TABLE IF EXISTS `vtiger_purchaseorderreceivedcf`;

CREATE TABLE `vtiger_purchaseorderreceivedcf` (
  `poreceivedid` int(11) NOT NULL,
  PRIMARY KEY  (`poreceivedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_purchaseorderreceivedcf` */

/*Table structure for table `vtiger_purchaseorderreceivedgrouprel` */

DROP TABLE IF EXISTS `vtiger_purchaseorderreceivedgrouprel`;

CREATE TABLE `vtiger_purchaseorderreceivedgrouprel` (
  `poreceivedid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`poreceivedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_purchaseorderreceivedgrouprel` */

/*Table structure for table `vtiger_purchaserequest` */

DROP TABLE IF EXISTS `vtiger_purchaserequest`;

CREATE TABLE `vtiger_purchaserequest` (
  `purchaserequestid` int(11) NOT NULL auto_increment,
  `customprid` varchar(100) default NULL,
  `warehouseid` int(11) default NULL,
  `date` date default NULL,
  `status` varchar(20) default NULL,
  `linkto` varchar(100) default NULL,
  `comment` varchar(500) default NULL,
  PRIMARY KEY  (`purchaserequestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_purchaserequest` */

insert  into `vtiger_purchaserequest`(`purchaserequestid`,`customprid`,`warehouseid`,`date`,`status`,`linkto`,`comment`) values (1,'NP077461',2,'2012-07-16','Open',NULL,NULL),(2,'WH1_MNG41475',2,'2012-07-18','Open',NULL,'lksdjflks lksjf dsflj lksjdflkds flksjf lkdsjf dslkfjds f'),(3,'NP418464',2,'2012-09-08','Close',NULL,NULL),(4,'NP59296',2,'2012-10-05','Open',NULL,NULL),(5,'NP005034',2,'2012-10-23','Open',NULL,NULL);

/*Table structure for table `vtiger_purchaserequest_item` */

DROP TABLE IF EXISTS `vtiger_purchaserequest_item`;

CREATE TABLE `vtiger_purchaserequest_item` (
  `purchaserequestitemid` int(11) NOT NULL auto_increment,
  `customprid` varchar(100) default NULL,
  `productid` int(11) default NULL,
  `actualprqty` int(100) default NULL,
  `prqty` int(100) default NULL,
  `barcode` varchar(100) default NULL,
  `prqtyreceived` int(100) default NULL,
  `prqtybalance` int(100) default NULL,
  `status` varchar(100) default NULL,
  `deliverydate` date default NULL,
  `is_po_generated` smallint(1) default NULL,
  PRIMARY KEY  (`purchaserequestitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_purchaserequest_item` */

insert  into `vtiger_purchaserequest_item`(`purchaserequestitemid`,`customprid`,`productid`,`actualprqty`,`prqty`,`barcode`,`prqtyreceived`,`prqtybalance`,`status`,`deliverydate`,`is_po_generated`) values (1,'NP077461',55,2,2,'95653',0,2,'PO',NULL,NULL),(2,'WH1_MNG41475',21,10,15,'988836',0,10,'Open',NULL,NULL),(3,'NP418464',132,0,0,'448',100,0,'Allocated','2012-09-08',NULL),(4,'NP59296',147,100,100,'497912',0,100,'PO',NULL,NULL),(5,'NP005034',159,20,20,'89318',0,20,'PO',NULL,NULL);

/*Table structure for table `vtiger_purchaserequestcf` */

DROP TABLE IF EXISTS `vtiger_purchaserequestcf`;

CREATE TABLE `vtiger_purchaserequestcf` (
  `purchaserequestid` int(11) NOT NULL,
  `cf_807` date default NULL,
  `cf_808` date default NULL,
  `cf_809` varchar(100) default '',
  `cf_810` varchar(100) default '',
  PRIMARY KEY  (`purchaserequestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_purchaserequestcf` */

/*Table structure for table `vtiger_purchaserequestgrouprel` */

DROP TABLE IF EXISTS `vtiger_purchaserequestgrouprel`;

CREATE TABLE `vtiger_purchaserequestgrouprel` (
  `purchaserequestid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`purchaserequestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_purchaserequestgrouprel` */

/*Table structure for table `vtiger_quickview` */

DROP TABLE IF EXISTS `vtiger_quickview`;

CREATE TABLE `vtiger_quickview` (
  `fieldid` int(19) NOT NULL,
  `related_fieldid` int(19) NOT NULL,
  `sequence` int(19) NOT NULL,
  `currentview` int(19) NOT NULL,
  KEY `fk_1_vtiger_quickview` (`fieldid`),
  CONSTRAINT `fk_1_vtiger_quickview` FOREIGN KEY (`fieldid`) REFERENCES `vtiger_field` (`fieldid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_quickview` */

/*Table structure for table `vtiger_quotes` */

DROP TABLE IF EXISTS `vtiger_quotes`;

CREATE TABLE `vtiger_quotes` (
  `quoteid` int(19) NOT NULL default '0',
  `subject` varchar(100) default NULL,
  `potentialid` int(19) default NULL,
  `quotestage` varchar(200) default NULL,
  `validtill` date default NULL,
  `contactid` int(19) default NULL,
  `quote_no` varchar(100) default NULL,
  `subtotal` decimal(25,3) default NULL,
  `carrier` varchar(200) default NULL,
  `shipping` varchar(100) default NULL,
  `inventorymanager` int(19) default NULL,
  `type` varchar(100) default NULL,
  `adjustment` decimal(25,3) default NULL,
  `total` decimal(25,3) default NULL,
  `taxtype` varchar(25) default NULL,
  `discount_percent` decimal(25,3) default NULL,
  `discount_amount` decimal(25,3) default NULL,
  `s_h_amount` decimal(25,3) default NULL,
  `accountid` int(19) default NULL,
  `terms_conditions` text,
  `currency_id` int(19) NOT NULL default '1',
  `conversion_rate` decimal(10,3) NOT NULL default '1.000',
  PRIMARY KEY  (`quoteid`),
  KEY `quote_quotestage_idx` (`quotestage`),
  KEY `quotes_potentialid_idx` (`potentialid`),
  KEY `quotes_contactid_idx` (`contactid`),
  CONSTRAINT `fk_3_vtiger_quotes` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotes` */

/*Table structure for table `vtiger_quotesbillads` */

DROP TABLE IF EXISTS `vtiger_quotesbillads`;

CREATE TABLE `vtiger_quotesbillads` (
  `quotebilladdressid` int(19) NOT NULL default '0',
  `bill_city` varchar(30) default NULL,
  `bill_code` varchar(30) default NULL,
  `bill_country` varchar(30) default NULL,
  `bill_state` varchar(30) default NULL,
  `bill_street` varchar(250) default NULL,
  `bill_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`quotebilladdressid`),
  CONSTRAINT `fk_1_vtiger_quotesbillads` FOREIGN KEY (`quotebilladdressid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotesbillads` */

/*Table structure for table `vtiger_quotescf` */

DROP TABLE IF EXISTS `vtiger_quotescf`;

CREATE TABLE `vtiger_quotescf` (
  `quoteid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`quoteid`),
  CONSTRAINT `fk_1_vtiger_quotescf` FOREIGN KEY (`quoteid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotescf` */

/*Table structure for table `vtiger_quotesshipads` */

DROP TABLE IF EXISTS `vtiger_quotesshipads`;

CREATE TABLE `vtiger_quotesshipads` (
  `quoteshipaddressid` int(19) NOT NULL default '0',
  `ship_city` varchar(30) default NULL,
  `ship_code` varchar(30) default NULL,
  `ship_country` varchar(30) default NULL,
  `ship_state` varchar(30) default NULL,
  `ship_street` varchar(250) default NULL,
  `ship_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`quoteshipaddressid`),
  CONSTRAINT `fk_1_vtiger_quotesshipads` FOREIGN KEY (`quoteshipaddressid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotesshipads` */

/*Table structure for table `vtiger_quotestage` */

DROP TABLE IF EXISTS `vtiger_quotestage`;

CREATE TABLE `vtiger_quotestage` (
  `quotestageid` int(19) NOT NULL auto_increment,
  `quotestage` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`quotestageid`),
  UNIQUE KEY `quotestage_quotestage_idx` (`quotestage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotestage` */

insert  into `vtiger_quotestage`(`quotestageid`,`quotestage`,`presence`,`picklist_valueid`) values (1,'Created',0,139),(2,'Delivered',0,140),(3,'Reviewed',0,141),(4,'Accepted',0,142),(5,'Rejected',0,143);

/*Table structure for table `vtiger_quotestage_seq` */

DROP TABLE IF EXISTS `vtiger_quotestage_seq`;

CREATE TABLE `vtiger_quotestage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotestage_seq` */

insert  into `vtiger_quotestage_seq`(`id`) values (5);

/*Table structure for table `vtiger_quotestagehistory` */

DROP TABLE IF EXISTS `vtiger_quotestagehistory`;

CREATE TABLE `vtiger_quotestagehistory` (
  `historyid` int(19) NOT NULL auto_increment,
  `quoteid` int(19) NOT NULL,
  `accountname` varchar(100) default NULL,
  `total` decimal(10,0) default NULL,
  `quotestage` varchar(200) default NULL,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`historyid`),
  KEY `quotestagehistory_quoteid_idx` (`quoteid`),
  CONSTRAINT `fk_1_vtiger_quotestagehistory` FOREIGN KEY (`quoteid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_quotestagehistory` */

/*Table structure for table `vtiger_rating` */

DROP TABLE IF EXISTS `vtiger_rating`;

CREATE TABLE `vtiger_rating` (
  `rating_id` int(19) NOT NULL auto_increment,
  `rating` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_rating` */

insert  into `vtiger_rating`(`rating_id`,`rating`,`presence`,`picklist_valueid`) values (1,'--None--',1,144),(2,'Acquired',1,145),(3,'Active',1,146),(4,'Market Failed',1,147),(5,'Project Cancelled',1,148),(6,'Shutdown',1,149);

/*Table structure for table `vtiger_rating_seq` */

DROP TABLE IF EXISTS `vtiger_rating_seq`;

CREATE TABLE `vtiger_rating_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_rating_seq` */

insert  into `vtiger_rating_seq`(`id`) values (6);

/*Table structure for table `vtiger_recurring_frequency` */

DROP TABLE IF EXISTS `vtiger_recurring_frequency`;

CREATE TABLE `vtiger_recurring_frequency` (
  `recurring_frequency_id` int(11) default NULL,
  `recurring_frequency` varchar(200) default NULL,
  `sortorderid` int(11) default NULL,
  `presence` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_recurring_frequency` */

insert  into `vtiger_recurring_frequency`(`recurring_frequency_id`,`recurring_frequency`,`sortorderid`,`presence`) values (1,'--None--',0,1),(2,'Daily',1,1),(3,'Weekly',2,1),(4,'Monthly',3,1),(5,'Quarterly',4,1),(6,'Yearly',5,1);

/*Table structure for table `vtiger_recurring_frequency_seq` */

DROP TABLE IF EXISTS `vtiger_recurring_frequency_seq`;

CREATE TABLE `vtiger_recurring_frequency_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_recurring_frequency_seq` */

insert  into `vtiger_recurring_frequency_seq`(`id`) values (6);

/*Table structure for table `vtiger_recurringevents` */

DROP TABLE IF EXISTS `vtiger_recurringevents`;

CREATE TABLE `vtiger_recurringevents` (
  `recurringid` int(19) NOT NULL auto_increment,
  `activityid` int(19) NOT NULL,
  `recurringdate` date default NULL,
  `recurringtype` varchar(30) default NULL,
  `recurringfreq` int(19) default NULL,
  `recurringinfo` varchar(50) default NULL,
  PRIMARY KEY  (`recurringid`),
  KEY `fk_1_vtiger_recurringevents` (`activityid`),
  CONSTRAINT `fk_1_vtiger_recurringevents` FOREIGN KEY (`activityid`) REFERENCES `vtiger_activity` (`activityid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_recurringevents` */

/*Table structure for table `vtiger_recurringtype` */

DROP TABLE IF EXISTS `vtiger_recurringtype`;

CREATE TABLE `vtiger_recurringtype` (
  `recurringeventid` int(19) NOT NULL auto_increment,
  `recurringtype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`recurringeventid`),
  UNIQUE KEY `recurringtype_status_idx` (`recurringtype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_recurringtype` */

insert  into `vtiger_recurringtype`(`recurringeventid`,`recurringtype`,`sortorderid`,`presence`) values (1,'--None--',0,1),(2,'Daily',1,1),(3,'Weekly',2,1),(4,'Monthly',3,1),(5,'Yearly',4,1);

/*Table structure for table `vtiger_recurringtype_seq` */

DROP TABLE IF EXISTS `vtiger_recurringtype_seq`;

CREATE TABLE `vtiger_recurringtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_recurringtype_seq` */

insert  into `vtiger_recurringtype_seq`(`id`) values (5);

/*Table structure for table `vtiger_relatedlists` */

DROP TABLE IF EXISTS `vtiger_relatedlists`;

CREATE TABLE `vtiger_relatedlists` (
  `relation_id` int(19) NOT NULL,
  `tabid` int(10) default NULL,
  `related_tabid` int(10) default NULL,
  `name` varchar(100) default NULL,
  `sequence` int(10) default NULL,
  `label` varchar(100) default NULL,
  `presence` int(10) NOT NULL default '0',
  `actions` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`relation_id`),
  KEY `relatedlists_relation_id_idx` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_relatedlists` */

insert  into `vtiger_relatedlists`(`relation_id`,`tabid`,`related_tabid`,`name`,`sequence`,`label`,`presence`,`actions`) values (1,6,4,'get_contacts',1,'Contacts',0,'add'),(2,6,2,'get_opportunities',2,'Potentials',0,'add'),(3,6,20,'get_quotes',3,'Quotes',0,'add'),(4,6,22,'get_salesorder',4,'Sales Order',0,'add'),(5,6,23,'get_invoices',5,'Invoice',0,'add'),(6,6,9,'get_activities',6,'Activities',0,'add'),(7,6,10,'get_emails',7,'Emails',0,'add'),(8,6,9,'get_history',8,'Activity History',0,'add'),(9,6,8,'get_attachments',9,'Documents',0,'add,select'),(10,6,13,'get_tickets',10,'HelpDesk',0,'add'),(11,6,14,'get_products',11,'Products',0,'select'),(12,7,9,'get_activities',1,'Activities',0,'add'),(13,7,10,'get_emails',2,'Emails',0,'add'),(14,7,9,'get_history',3,'Activity History',0,'add'),(15,7,8,'get_attachments',4,'Documents',0,'add,select'),(16,7,14,'get_products',5,'Products',0,'select'),(17,7,26,'get_campaigns',6,'Campaigns',0,'select'),(18,4,2,'get_opportunities',1,'Potentials',0,'add'),(19,4,9,'get_activities',2,'Activities',0,'add'),(20,4,10,'get_emails',3,'Emails',0,'add'),(21,4,13,'get_tickets',4,'HelpDesk',0,'add'),(22,4,20,'get_quotes',5,'Quotes',0,'add'),(23,4,21,'get_purchase_orders',6,'Purchase Order',0,'add'),(24,4,22,'get_salesorder',7,'Sales Order',0,'add'),(25,4,14,'get_products',8,'Products',0,'select'),(26,4,9,'get_history',9,'Activity History',0,'add'),(27,4,8,'get_attachments',10,'Documents',0,'add,select'),(28,4,26,'get_campaigns',11,'Campaigns',0,'select'),(29,4,23,'get_invoices',12,'Invoice',0,'add'),(30,2,9,'get_activities',1,'Activities',0,'add'),(31,2,4,'get_contacts',2,'Contacts',0,'select'),(32,2,14,'get_products',3,'Products',0,'select'),(33,2,0,'get_stage_history',4,'Sales Stage History',0,''),(34,2,8,'get_attachments',5,'Documents',0,'add,select'),(35,2,20,'get_Quotes',6,'Quotes',0,'add'),(36,2,22,'get_salesorder',7,'Sales Order',0,'add'),(37,2,9,'get_history',8,'Activity History',0,''),(38,14,13,'get_tickets',1,'HelpDesk',0,'add'),(39,14,8,'get_attachments',3,'Documents',0,'add,select'),(40,14,20,'get_quotes',4,'Quotes',0,'add'),(41,14,21,'get_purchase_orders',5,'Purchase Order',0,'add'),(42,14,22,'get_salesorder',6,'Sales Order',0,'add'),(43,14,23,'get_invoices',7,'Invoice',0,'add'),(44,14,19,'get_product_pricebooks',8,'PriceBooks',0,'add'),(45,14,7,'get_leads',9,'Leads',0,'select'),(46,14,6,'get_accounts',10,'Accounts',0,'select'),(47,14,4,'get_contacts',11,'Contacts',0,'select'),(48,14,2,'get_opportunities',12,'Potentials',0,'select'),(49,14,14,'get_products',13,'Product Bundles',0,'add,select'),(50,14,14,'get_parent_products',14,'Parent Product',0,''),(51,10,4,'get_contacts',1,'Contacts',0,'select,bulkmail'),(52,10,0,'get_users',2,'Users',0,''),(53,10,8,'get_attachments',3,'Documents',0,'add,select'),(54,13,9,'get_activities',1,'Activities',0,'add,select'),(55,13,8,'get_attachments',2,'Documents',0,'add,select'),(56,13,0,'get_ticket_history',3,'Ticket History',0,''),(57,13,9,'get_history',4,'Activity History',0,''),(58,19,14,'get_pricebook_products',2,'Products',0,'select'),(59,18,14,'get_products',1,'Products',0,'add,select'),(60,18,21,'get_purchase_orders',2,'Purchase Order',0,'add'),(61,18,4,'get_contacts',3,'Contacts',0,'select'),(62,18,10,'get_emails',4,'Emails',0,'add'),(63,20,22,'get_salesorder',1,'Sales Order',0,''),(64,20,9,'get_activities',2,'Activities',0,'add'),(65,20,8,'get_attachments',3,'Documents',0,'add,select'),(66,20,9,'get_history',4,'Activity History',0,''),(67,20,0,'get_quotestagehistory',5,'Quote Stage History',0,''),(68,21,9,'get_activities',1,'Activities',0,'add'),(69,21,8,'get_attachments',2,'Documents',0,'add,select'),(70,21,9,'get_history',3,'Activity History',0,''),(71,21,0,'get_postatushistory',4,'PurchaseOrder Status History',0,''),(72,22,9,'get_activities',1,'Activities',0,'add'),(73,22,8,'get_attachments',2,'Documents',0,'add,select'),(74,22,23,'get_invoices',3,'Invoice',0,''),(75,22,9,'get_history',4,'Activity History',0,''),(76,22,0,'get_sostatushistory',5,'SalesOrder Status History',0,''),(77,23,9,'get_activities',1,'Activities',0,'add'),(78,23,8,'get_attachments',2,'Documents',0,'add,select'),(79,23,9,'get_history',3,'Activity History',0,''),(80,23,0,'get_invoicestatushistory',4,'Invoice Status History',0,''),(81,9,0,'get_users',1,'Users',0,''),(82,9,4,'get_contacts',2,'Contacts',0,''),(83,26,4,'get_contacts',1,'Contacts',0,'add,select'),(84,26,7,'get_leads',2,'Leads',0,'add,select'),(85,26,2,'get_opportunities',3,'Potentials',0,'add'),(86,26,9,'get_activities',4,'Activities',0,'add'),(87,6,26,'get_campaigns',13,'Campaigns',0,'select'),(88,26,6,'get_accounts',5,'Accounts',0,'add,select'),(89,15,8,'get_attachments',1,'Documents',0,'add,select'),(90,32,13,'get_related_list',1,'Service Requests',0,'ADD,SELECT'),(91,32,8,'get_attachments',2,'Documents',0,'ADD,SELECT'),(92,6,32,'get_dependents_list',14,'Service Contracts',0,'ADD'),(93,4,32,'get_dependents_list',13,'Service Contracts',0,'ADD'),(94,33,13,'get_related_list',1,'HelpDesk',0,'ADD,SELECT'),(95,33,20,'get_quotes',2,'Quotes',0,'ADD'),(96,33,21,'get_purchase_orders',3,'Purchase Order',0,'ADD'),(97,33,22,'get_salesorder',4,'Sales Order',0,'ADD'),(98,33,23,'get_invoices',5,'Invoice',0,'ADD'),(99,33,19,'get_service_pricebooks',6,'PriceBooks',0,'ADD'),(100,33,7,'get_related_list',7,'Leads',0,'SELECT'),(101,33,6,'get_related_list',8,'Accounts',0,'SELECT'),(102,33,4,'get_related_list',9,'Contacts',0,'SELECT'),(103,33,2,'get_related_list',10,'Potentials',0,'SELECT'),(104,33,8,'get_attachments',11,'Documents',0,'ADD,SELECT'),(105,13,33,'get_related_list',5,'Services',0,'SELECT'),(106,7,33,'get_related_list',7,'Services',0,'SELECT'),(107,6,33,'get_related_list',15,'Services',0,'SELECT'),(108,4,33,'get_related_list',14,'Services',0,'SELECT'),(109,2,33,'get_related_list',9,'Services',0,'SELECT'),(110,19,33,'get_pricebook_services',3,'Services',0,'SELECT'),(111,35,13,'get_related_list',1,'HelpDesk',0,'ADD,SELECT'),(112,35,8,'get_attachments',2,'Documents',0,'ADD,SELECT'),(113,6,35,'get_dependents_list',16,'Assets',0,'ADD'),(114,14,35,'get_dependents_list',15,'Assets',0,'ADD'),(115,23,35,'get_dependents_list',5,'Assets',0,'ADD'),(116,40,8,'get_attachments',1,'Documents',0,'ADD,SELECT'),(117,41,40,'get_dependents_list',1,'Project Tasks',0,'ADD,SELECT'),(118,41,39,'get_dependents_list',2,'Project Milestones',0,'ADD,SELECT'),(119,41,8,'get_attachments',3,'Documents',0,'ADD,SELECT'),(120,41,13,'get_related_list',4,'Trouble Tickets',0,'ADD,SELECT'),(121,41,0,'get_gantt_chart',5,'Charts',0,''),(122,6,41,'get_dependents_list',17,'Projects',0,'ADD,SELECT'),(123,4,41,'get_dependents_list',15,'Projects',0,'ADD,SELECT'),(124,13,41,'get_related_list',6,'Projects',0,'SELECT'),(125,43,6,'get_related_list',1,'Accounts',0,' '),(126,43,4,'get_related_list',2,'Contacts',0,' '),(127,43,7,'get_related_list',3,'Leads',0,' ');

/*Table structure for table `vtiger_relatedlists_rb` */

DROP TABLE IF EXISTS `vtiger_relatedlists_rb`;

CREATE TABLE `vtiger_relatedlists_rb` (
  `entityid` int(19) default NULL,
  `action` varchar(50) default NULL,
  `rel_table` varchar(200) default NULL,
  `rel_column` varchar(200) default NULL,
  `ref_column` varchar(200) default NULL,
  `related_crm_ids` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_relatedlists_rb` */

insert  into `vtiger_relatedlists_rb`(`entityid`,`action`,`rel_table`,`rel_column`,`ref_column`,`related_crm_ids`) values (126,'update','vtiger_crmentity','deleted','crmid',''),(126,'update','vtiger_crmentity','deleted','crmid',''),(129,'update','vtiger_crmentity','deleted','crmid',''),(129,'update','vtiger_crmentity','deleted','crmid',''),(604,'update','vtiger_crmentity','deleted','crmid','');

/*Table structure for table `vtiger_relatedlists_seq` */

DROP TABLE IF EXISTS `vtiger_relatedlists_seq`;

CREATE TABLE `vtiger_relatedlists_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_relatedlists_seq` */

insert  into `vtiger_relatedlists_seq`(`id`) values (129);

/*Table structure for table `vtiger_relcriteria` */

DROP TABLE IF EXISTS `vtiger_relcriteria`;

CREATE TABLE `vtiger_relcriteria` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) default '',
  `comparator` varchar(10) default '',
  `value` varchar(200) default '',
  `groupid` int(11) default '1',
  `column_condition` varchar(256) default 'and',
  PRIMARY KEY  (`queryid`,`columnindex`),
  KEY `relcriteria_queryid_idx` (`queryid`),
  CONSTRAINT `fk_1_vtiger_relcriteria` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_relcriteria` */

insert  into `vtiger_relcriteria`(`queryid`,`columnindex`,`columnname`,`comparator`,`value`,`groupid`,`column_condition`) values (1,0,'vtiger_accountContacts:accountname:Contacts_Account_Name:account_id:V','n','',1,'and'),(2,0,'vtiger_accountContacts:accountname:Contacts_Account_Name:account_id:V','e','',1,'and'),(3,0,'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V','n','',1,'and'),(7,0,'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V','e','Closed Won',1,'and'),(12,0,'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V','n','Closed',1,'and'),(15,0,'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V','n','Accepted',1,'and'),(15,1,'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V','n','Rejected',1,'and');

/*Table structure for table `vtiger_relcriteria_grouping` */

DROP TABLE IF EXISTS `vtiger_relcriteria_grouping`;

CREATE TABLE `vtiger_relcriteria_grouping` (
  `groupid` int(11) NOT NULL,
  `queryid` int(19) NOT NULL,
  `group_condition` varchar(256) default NULL,
  `condition_expression` text,
  PRIMARY KEY  (`groupid`,`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_relcriteria_grouping` */

insert  into `vtiger_relcriteria_grouping`(`groupid`,`queryid`,`group_condition`,`condition_expression`) values (1,1,'','0'),(1,2,'','0'),(1,3,'','0'),(1,7,'','0'),(1,12,'','0'),(1,15,'','0 and 1');

/*Table structure for table `vtiger_reminder_interval` */

DROP TABLE IF EXISTS `vtiger_reminder_interval`;

CREATE TABLE `vtiger_reminder_interval` (
  `reminder_intervalid` int(19) NOT NULL auto_increment,
  `reminder_interval` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL,
  `presence` int(1) NOT NULL,
  PRIMARY KEY  (`reminder_intervalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reminder_interval` */

insert  into `vtiger_reminder_interval`(`reminder_intervalid`,`reminder_interval`,`sortorderid`,`presence`) values (1,'None',0,1),(2,'1 Minute',1,1),(3,'5 Minutes',2,1),(4,'15 Minutes',3,1),(5,'30 Minutes',4,1),(6,'45 Minutes',5,1),(7,'1 Hour',6,1),(8,'1 Day',7,1);

/*Table structure for table `vtiger_reminder_interval_seq` */

DROP TABLE IF EXISTS `vtiger_reminder_interval_seq`;

CREATE TABLE `vtiger_reminder_interval_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reminder_interval_seq` */

insert  into `vtiger_reminder_interval_seq`(`id`) values (8);

/*Table structure for table `vtiger_report` */

DROP TABLE IF EXISTS `vtiger_report`;

CREATE TABLE `vtiger_report` (
  `reportid` int(19) NOT NULL,
  `folderid` int(19) NOT NULL,
  `reportname` varchar(100) default '',
  `description` varchar(250) default '',
  `reporttype` varchar(50) default '',
  `queryid` int(19) NOT NULL default '0',
  `state` varchar(50) default 'SAVED',
  `customizable` int(1) default '1',
  `category` int(11) default '1',
  `owner` int(11) default '1',
  `sharingtype` varchar(200) default 'Private',
  PRIMARY KEY  (`reportid`),
  KEY `report_queryid_idx` (`queryid`),
  KEY `report_folderid_idx` (`folderid`),
  CONSTRAINT `fk_2_vtiger_report` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_report` */

insert  into `vtiger_report`(`reportid`,`folderid`,`reportname`,`description`,`reporttype`,`queryid`,`state`,`customizable`,`category`,`owner`,`sharingtype`) values (1,1,'Contacts by Accounts','Contacts related to Accounts','tabular',1,'SAVED',1,1,1,'Public'),(2,1,'Contacts without Accounts','Contacts not related to Accounts','tabular',2,'SAVED',1,1,1,'Public'),(3,1,'Contacts by Potentials','Contacts related to Potentials','tabular',3,'SAVED',1,1,1,'Public'),(4,2,'Lead by Source','Lead by Source','summary',4,'SAVED',1,1,1,'Public'),(5,2,'Lead Status Report','Lead Status Report','summary',5,'SAVED',1,1,1,'Public'),(6,3,'Potential Pipeline','Potential Pipeline','summary',6,'SAVED',1,1,1,'Public'),(7,3,'Closed Potentials','Potential that have Won','tabular',7,'SAVED',1,1,1,'Public'),(8,4,'Last Month Activities','Last Month Activities','tabular',8,'SAVED',1,1,1,'Public'),(9,4,'This Month Activities','This Month Activities','tabular',9,'SAVED',1,1,1,'Public'),(10,5,'Tickets by Products','Tickets related to Products','tabular',10,'SAVED',1,1,1,'Public'),(11,5,'Tickets by Priority','Tickets by Priority','summary',11,'SAVED',1,1,1,'Public'),(12,5,'Open Tickets','Tickets that are Open','tabular',12,'SAVED',1,1,1,'Public'),(13,6,'Product Details','Product Detailed Report','tabular',13,'SAVED',1,1,1,'Public'),(14,6,'Products by Contacts','Products related to Contacts','tabular',14,'SAVED',1,1,1,'Public'),(15,7,'Open Quotes','Quotes that are Open','tabular',15,'SAVED',1,1,1,'Public'),(16,7,'Quotes Detailed Report','Quotes Detailed Report','tabular',16,'SAVED',1,1,1,'Public'),(17,8,'PurchaseOrder by Contacts','PurchaseOrder related to Contacts','tabular',17,'SAVED',1,1,1,'Public'),(18,8,'PurchaseOrder Detailed Report','PurchaseOrder Detailed Report','tabular',18,'SAVED',1,1,1,'Public'),(19,9,'Invoice Detailed Report','Invoice Detailed Report','tabular',19,'SAVED',1,1,1,'Public'),(20,10,'SalesOrder Detailed Report','SalesOrder Detailed Report','tabular',20,'SAVED',1,1,1,'Public'),(21,11,'Campaign Expectations and Actuals','Campaign Expectations and Actuals','tabular',21,'SAVED',1,1,1,'Public');

/*Table structure for table `vtiger_reportdatefilter` */

DROP TABLE IF EXISTS `vtiger_reportdatefilter`;

CREATE TABLE `vtiger_reportdatefilter` (
  `datefilterid` int(19) NOT NULL,
  `datecolumnname` varchar(250) default '',
  `datefilter` varchar(250) default '',
  `startdate` date default NULL,
  `enddate` date default NULL,
  PRIMARY KEY  (`datefilterid`),
  KEY `reportdatefilter_datefilterid_idx` (`datefilterid`),
  CONSTRAINT `fk_1_vtiger_reportdatefilter` FOREIGN KEY (`datefilterid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportdatefilter` */

insert  into `vtiger_reportdatefilter`(`datefilterid`,`datecolumnname`,`datefilter`,`startdate`,`enddate`) values (8,'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time','lastmonth','2005-05-01','2005-05-31'),(9,'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time','thismonth','2005-06-01','2005-06-30');

/*Table structure for table `vtiger_reportfilters` */

DROP TABLE IF EXISTS `vtiger_reportfilters`;

CREATE TABLE `vtiger_reportfilters` (
  `filterid` int(19) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportfilters` */

insert  into `vtiger_reportfilters`(`filterid`,`name`) values (1,'Private'),(2,'Public'),(3,'Shared');

/*Table structure for table `vtiger_reportfolder` */

DROP TABLE IF EXISTS `vtiger_reportfolder`;

CREATE TABLE `vtiger_reportfolder` (
  `folderid` int(19) NOT NULL auto_increment,
  `foldername` varchar(100) NOT NULL default '',
  `description` varchar(250) default '',
  `state` varchar(50) default 'SAVED',
  PRIMARY KEY  (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportfolder` */

insert  into `vtiger_reportfolder`(`folderid`,`foldername`,`description`,`state`) values (1,'Account and Contact Reports','Account and Contact Reports','SAVED'),(2,'Lead Reports','Lead Reports','SAVED'),(3,'Potential Reports','Potential Reports','SAVED'),(4,'Activity Reports','Activity Reports','SAVED'),(5,'HelpDesk Reports','HelpDesk Reports','SAVED'),(6,'Product Reports','Product Reports','SAVED'),(7,'Quote Reports','Quote Reports','SAVED'),(8,'PurchaseOrder Reports','PurchaseOrder Reports','SAVED'),(9,'Invoice Reports','Invoice Reports','SAVED'),(10,'SalesOrder Reports','SalesOrder Reports','SAVED'),(11,'Campaign Reports','Campaign Reports','SAVED');

/*Table structure for table `vtiger_reportmodules` */

DROP TABLE IF EXISTS `vtiger_reportmodules`;

CREATE TABLE `vtiger_reportmodules` (
  `reportmodulesid` int(19) NOT NULL,
  `primarymodule` varchar(50) NOT NULL default '',
  `secondarymodules` varchar(250) default '',
  PRIMARY KEY  (`reportmodulesid`),
  CONSTRAINT `fk_1_vtiger_reportmodules` FOREIGN KEY (`reportmodulesid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportmodules` */

insert  into `vtiger_reportmodules`(`reportmodulesid`,`primarymodule`,`secondarymodules`) values (1,'Contacts','Accounts'),(2,'Contacts','Accounts'),(3,'Contacts','Potentials'),(4,'Leads',''),(5,'Leads',''),(6,'Potentials',''),(7,'Potentials',''),(8,'Calendar',''),(9,'Calendar',''),(10,'HelpDesk','Products'),(11,'HelpDesk',''),(12,'HelpDesk',''),(13,'Products',''),(14,'Products','Contacts'),(15,'Quotes',''),(16,'Quotes',''),(17,'PurchaseOrder','Contacts'),(18,'PurchaseOrder',''),(19,'Invoice',''),(20,'SalesOrder',''),(21,'Campaigns','');

/*Table structure for table `vtiger_reports` */

DROP TABLE IF EXISTS `vtiger_reports`;

CREATE TABLE `vtiger_reports` (
  `id` int(11) NOT NULL auto_increment,
  `report_code` varchar(200) NOT NULL,
  `report_name` varchar(200) NOT NULL,
  `mod_name` varchar(200) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reports` */

insert  into `vtiger_reports`(`id`,`report_code`,`report_name`,`mod_name`,`is_deleted`) values (1,'IR','Inventory Report','CrystalReport',0),(2,'SR','Sales Report','CrystalReport',0),(3,'PR','Purchase Report','CrystalReport',0),(4,'PFR','Profitability Report','CrystalReport',0);

/*Table structure for table `vtiger_reports_group` */

DROP TABLE IF EXISTS `vtiger_reports_group`;

CREATE TABLE `vtiger_reports_group` (
  `id` int(11) NOT NULL auto_increment,
  `report_parent_code` varchar(200) NOT NULL,
  `report_name` varchar(200) NOT NULL,
  `query_code` text NOT NULL,
  `columns_total` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reports_group` */

insert  into `vtiger_reports_group`(`id`,`report_parent_code`,`report_name`,`query_code`,`columns_total`,`is_deleted`) values (1,'IR','Opening Stock','SELECT DATE_FORMAT(inventorytransaction.date,\'%d-%m-%Y\') AS Date ,vtiger_products.barcode, vtiger_products.productname, vtiger_products.cost AS cost, inventorytransaction.opening_stock_qty AS \'Opening Stock Qty\', (inventorytransaction.opening_stock_qty * vtiger_products.cost) AS \'Total Value\' FROM (select productid , opening_stock_qty,date from vtiger_inventorytransaction order by date ASC) as inventorytransaction \r\n inner join vtiger_products on vtiger_products.productid = inventorytransaction.productid',0,1),(2,'IR','Closing Stock','SELECT DATE_FORMAT(inventorytransaction.date,\'%d-%m-%Y\') AS Date ,vtiger_products.barcode, vtiger_products.productname, vtiger_products.cost AS cost, inventorytransaction.closing_stock AS \'Closing Stock Qty\', (inventorytransaction.closing_stock * vtiger_products.cost) AS \'Total Value\' FROM (select productid , closing_stock,date from vtiger_inventorytransaction order by date DESC) as inventorytransaction \r\n inner join vtiger_products on vtiger_products.productid = inventorytransaction.productid',10,1),(3,'IR','Stock Adjustment','SELECT DATE_FORMAT(vtiger_stockadjust.debitdate,\'%d-%m-%Y\') AS \'Date\', vtiger_warehouse.warehouse_name AS \'Warehouse/Store Name\',vtiger_stockadjust.product_name AS \'Product Name\', vtiger_stockadjust.stocktotal AS \'Total Stock In Qty.\',\r\nvtiger_stockadjust.adjustqty AS \'Adjusted Quantity\', vtiger_stockadjust.adj_comments AS \'Comments\'\r\nFROM vtiger_stockadjust \r\nINNER JOIN vtiger_warehouse ON vtiger_warehouse.warehouseid = vtiger_stockadjust.warehouse_store_id\r\n',0,0),(4,'IR','Stock Report','SELECT DATE_FORMAT(vtiger_crmentity.createdtime,\"%d-%m-%Y\") AS \'Date\', vtiger_products.productname AS \'Product Name\', \r\nvtiger_warehouse.warehouse_name AS \'Warehouse/Store Name\', vtiger_warehouse_stock.qty AS \'Quantity in Stock\', \r\nvtiger_products.cost AS \'Cost\' ,(vtiger_warehouse_stock.qty * vtiger_products.cost) AS \'Total Cost\'\r\nFROM vtiger_products\r\nINNER JOIN vtiger_warehouse_stock ON vtiger_warehouse_stock.productid = vtiger_products.productid\r\nINNER JOIN vtiger_warehouse ON vtiger_warehouse.warehouseid = vtiger_warehouse_stock.warehouseid\r\nINNER JOIN vtiger_crmentity ON vtiger_crmentity.crmid = vtiger_products.productid',0,0),(5,'SR','Customer Report','SELECT  vtiger_contactdetails.firstname AS \'Customer Name\', vtiger_contactdetails.email AS \'Email ID\', vtiger_contactdetails.mobile AS \'Mobile\',\r\nCONCAT(vtiger_contactaddress.mailingstreet,\' \',vtiger_contactaddress.mailingcity,\' \', vtiger_contactaddress.mailingstate,\' \', \r\nvtiger_contactaddress.mailingcountry,\' \', vtiger_contactaddress.mailingpobox,\' \') AS Address FROM vtiger_contactdetails \r\nINNER JOIN vtiger_contactaddress ON vtiger_contactaddress.contactaddressid = vtiger_contactdetails.contactid\r\nINNER JOIN vtiger_crmentity ON vtiger_contactdetails.contactid = vtiger_crmentity.crmid \r\nWHERE vtiger_crmentity.deleted=0 AND vtiger_contactdetails.contactid > 0\r\n',0,0),(6,'SR','Sales Register','SELECT DATE_FORMAT(vtiger_debtortransaction.date, \'%d-%m-%Y\') AS \'Date\' ,vtiger_debtortransaction.inv_no AS \'INV No.\', \r\nCASE WHEN (vtiger_debtortransaction.mode_of_payment != \"\" ) \r\nTHEN vtiger_debtortransaction.mode_of_payment \r\nELSE vtiger_debtortransaction.username \r\nEND AS \'Particulars\', \r\nvtiger_debtortransaction.grandtotal AS \'Gross Total\', vtiger_invoice.subtotal AS \'NetPrice\' , GROUP_CONCAT(vtiger_inventoryproductrel.quantity) AS \'quantity\', \r\nGROUP_CONCAT(vtiger_inventoryproductrel.listprice) AS \'cost\', GROUP_CONCAT(vtiger_inventoryproductrel.discount_amount) AS \'discount\', \r\nGROUP_CONCAT(vtiger_inventoryproductrel.vat) AS \'VAT\', GROUP_CONCAT(vtiger_inventoryproductrel.taxamount) AS \'Tax Amount\'\r\nFROM vtiger_debtortransaction\r\nINNER JOIN vtiger_invoice ON vtiger_invoice.invoiceid = vtiger_debtortransaction.invid\r\nINNER JOIN vtiger_inventoryproductrel ON vtiger_inventoryproductrel.id = vtiger_invoice.invoiceid',0,0),(7,'SR','Sundry Debtors','SELECT \r\nvtiger_debtortransaction.username AS \'Customer Name\',\r\nvtiger_debtortransaction.closingbalance AS \'Balance\'\r\nFROM vtiger_debtortransaction',0,0),(8,'SR','Ledger Account','SELECT * FROM vtiger_debtortransaction',0,0),(9,'SR','Cash Receipt','SELECT DATE_FORMAT(vtiger_debtortransaction.date, \'%d-%m-%Y\') AS \'Date\', vtiger_debtortransaction.inv_no AS \'Invoice Number\', \r\nvtiger_debtortransaction.grandtotal, vtiger_debtortransaction.mode_of_payment AS \'Payment Mode\', vtiger_debtortransaction.amt_received_by_cash AS \'Cash\', \r\nvtiger_debtortransaction.amt_received_by_card AS \'Card\', vtiger_debtortransaction.amt_received_by_check AS \'Check\', vtiger_debtortransaction.bank_name AS \'Bank Name\', \r\nDATE_FORMAT(vtiger_debtortransaction.check_date, \'%d-%m-%Y\') AS \'Check Date\', vtiger_debtortransaction.checkno AS \'Check Number\', vtiger_debtortransaction.modulename AS \'From\' FROM vtiger_debtortransaction \r\nWHERE vtiger_debtortransaction.mode_of_payment !=\"\"\r\n',0,0),(10,'SR','Clearence Sales','SELECT vtiger_clearance.barcode_id AS \'Barcode\', vtiger_clearance.product_name AS \'Product Name\',  vtiger_clearance.mrp AS \'Previous SellingPrice\', \r\nvtiger_clearance.discount AS \'Discount(%)\', vtiger_clearance.clearanceprice AS \'New SellingPrice\', vtiger_clearance.vat AS \'VAT(%)\', \r\nvtiger_clearance.newmrp AS \'New MRP\' FROM vtiger_clearance\r\nINNER JOIN vtiger_crmentity ON vtiger_crmentity.crmid = vtiger_clearance.productid\r\nWHERE vtiger_crmentity.deleted = 0',10,0),(11,'SR','Sales Return','SELECT TR.transaction_id, DATE_FORMAT(TR.date, \'%d-%m-%Y\') AS \'Date\', TR.invoice_no, TR.salesret_id, \r\nGROUP_CONCAT(TR.productid) AS \'productid\', \r\nGROUP_CONCAT(TR.sales_return_qty) AS \'quantity\', \r\nGROUP_CONCAT(TR.sales_return_cost) AS \'return_cost\', \r\nGROUP_CONCAT(TR.unitprice) AS \'cost\', \r\nGROUP_CONCAT(TR.discount) AS \'discount\',  \r\nGROUP_CONCAT(TR.vat) AS \'vat\'\r\nFROM vtiger_inventorytransaction AS TR',10,0),(12,'PR','Cancelled PO','SELECT DATE_FORMAT(vtiger_crmentity.createdtime,\'%d-%m-%Y\') AS \'Date\',DATE_FORMAT(vtiger_purchaseorder.duedate,\'%d-%m-%Y\') AS \'Due Date\',DATE_FORMAT(vtiger_crmentity.modifiedtime,\'%d-%m-%Y\') AS \'Cancelled Date\', vtiger_purchaseorder.purchaseorder_no AS \'PO Number\',\r\nvtiger_purchaseorder.requisition_no AS \'Ref. PO Number\', vtiger_products.productname AS \'Product Name\', vtiger_inventoryproductrel.quantity AS \'Requested Qty\',\r\nvtiger_inventoryproductrel.listprice AS \'Unit Price\',vtiger_inventoryproductrel.discount_percent AS \'Discount %\',\r\nCASE \r\n WHEN vtiger_inventoryproductrel.withcform = \'2\'\r\n  THEN vtiger_inventoryproductrel.vat\r\n WHEN vtiger_inventoryproductrel.withcform = \'1\'\r\n  THEN vtiger_inventoryproductrel.cstwithcform_per\r\n WHEN vtiger_inventoryproductrel.withcform = \'0\'    \r\n  THEN vtiger_inventoryproductrel.cstwithoutcform_per\r\n\r\nEND AS \'Tax\',\r\nvtiger_inventoryproductrel.netprice AS \'Net Price\', vtiger_vendor.vendorname AS \'Vendor Name\' FROM vtiger_purchaseorder,vtiger_products,vtiger_inventoryproductrel,vtiger_crmentity,vtiger_vendor \r\nWHERE  vtiger_purchaseorder.postatus = \"Cancelled\" AND vtiger_purchaseorder.purchaseorderid = vtiger_inventoryproductrel.id AND vtiger_crmentity.deleted = 0 \r\nAND vtiger_crmentity.crmid = vtiger_purchaseorder.purchaseorderid AND vtiger_inventoryproductrel.productid = vtiger_products.productid AND vtiger_vendor.vendorid = vtiger_purchaseorder.vendorid\r\n',10,0),(13,'PR','Vendor Report','SELECT vtiger_vendor.vendorname AS \'Vendor Name\', vtiger_vendor.phone, vtiger_vendor.email FROM vtiger_vendor,vtiger_crmentity\r\nWHERE \r\nvtiger_vendor.vendorid = vtiger_crmentity.crmid AND\r\nvtiger_crmentity.deleted = 0 ',10,1),(14,'PFR','Profit Analysis','SELECT DATE_FORMAT(vtiger_inventorytransaction.date, \'%d-%m-%Y\') AS \'Date\', vtiger_warehouse.warehouse_name AS \'Store Name\', vtiger_inventorytransaction.invoice_no AS \'Invoice Number\', \r\nvtiger_inventorytransaction.product_name AS \'Product Name\', vtiger_inventorytransaction.opening_cost AS \'Cost\',\r\nvtiger_inventorytransaction.unitprice AS \'Unit Price\', vtiger_inventorytransaction.sales_qty AS \'Quantity\' ,(vtiger_inventorytransaction.unitprice*sales_qty - vtiger_inventorytransaction.opening_cost*sales_qty) AS \"P/L (Rs.)\",\r\nFORMAT(((vtiger_inventorytransaction.unitprice*sales_qty - vtiger_inventorytransaction.opening_cost*sales_qty)/(vtiger_inventorytransaction.unitprice*sales_qty))*100,2) AS \"P/L (%)\"\r\nFROM vtiger_inventorytransaction\r\nINNER JOIN vtiger_warehouse ON vtiger_warehouse.warehouseid = vtiger_inventorytransaction.store_id\r\nWHERE vtiger_inventorytransaction.sales_qty != \"\"',0,0),(15,'IR','Stock Ledger','SELECT *  FROM vtiger_warehousestore_inventorytransaction',0,0),(16,'PR','Open PO','SELECT DATE_FORMAT(vtiger_crmentity.createdtime,\'%d-%m-%Y\') AS \'Date\',DATE_FORMAT(vtiger_purchaseorder.duedate,\'%d-%m-%Y\') AS \'Due Date\',vtiger_purchaseorder.purchaseorder_no AS \'PO Number\',\r\nvtiger_purchaseorder.requisition_no AS \'Ref. PO Number\', vtiger_products.productname AS \'Product Name\', vtiger_inventoryproductrel.quantity AS \'Requested Qty\',\r\nvtiger_inventoryproductrel.listprice AS \'Unit Price\',vtiger_inventoryproductrel.discount_percent AS \'Discount %\',\r\nCASE \r\n WHEN vtiger_inventoryproductrel.withcform = \'2\'\r\n  THEN vtiger_inventoryproductrel.vat\r\n WHEN vtiger_inventoryproductrel.withcform = \'1\'\r\n  THEN vtiger_inventoryproductrel.cstwithcform_per\r\n WHEN vtiger_inventoryproductrel.withcform = \'0\'    \r\n  THEN vtiger_inventoryproductrel.cstwithoutcform_per\r\n\r\nEND AS \'Tax\',\r\nvtiger_inventoryproductrel.netprice AS \'Net Price\', vtiger_vendor.vendorname AS \'Vendor\' FROM vtiger_purchaseorder,vtiger_products,vtiger_inventoryproductrel,vtiger_crmentity,vtiger_vendor \r\nWHERE  vtiger_purchaseorder.postatus = \"Created\" AND vtiger_purchaseorder.purchaseorderid = vtiger_inventoryproductrel.id AND vtiger_crmentity.deleted = 0 \r\nAND vtiger_crmentity.crmid = vtiger_purchaseorder.purchaseorderid AND vtiger_inventoryproductrel.productid = vtiger_products.productid AND vtiger_vendor.vendorid = vtiger_purchaseorder.vendorid',0,0),(17,'PR','Closed PO','SELECT DATE_FORMAT(vtiger_crmentity.createdtime,\'%d-%m-%Y\') AS \'Date\',DATE_FORMAT(vtiger_purchaseorder.duedate,\'%d-%m-%Y\') AS \'Due Date\',DATE_FORMAT(vtiger_crmentity.modifiedtime,\'%d-%m-%Y\') AS \'Closed PO Date\',vtiger_purchaseorder.purchaseorder_no AS \'PO Number\',\r\nvtiger_products.productname AS \'Product Name\', vtiger_inventoryproductrel.quantity AS \'Requested Qty\',\r\nvtiger_inventoryproductrel.listprice AS \'Unit Price\',vtiger_inventoryproductrel.discount_percent AS \'Discount %\',\r\nCASE \r\n WHEN vtiger_inventoryproductrel.withcform = \'2\'\r\n  THEN vtiger_inventoryproductrel.vat\r\n WHEN vtiger_inventoryproductrel.withcform = \'1\'\r\n  THEN vtiger_inventoryproductrel.cstwithcform_per\r\n WHEN vtiger_inventoryproductrel.withcform = \'0\'    \r\n  THEN vtiger_inventoryproductrel.cstwithoutcform_per\r\n\r\nEND AS \'Tax\',\r\nvtiger_inventoryproductrel.netprice AS \'Net Price\', vtiger_vendor.vendorname AS \'Vendor\' FROM vtiger_purchaseorder,vtiger_products,vtiger_inventoryproductrel,vtiger_crmentity,vtiger_vendor \r\nWHERE  vtiger_purchaseorder.postatus = \"Received Shipment\" AND vtiger_purchaseorder.purchaseorderid = vtiger_inventoryproductrel.id AND vtiger_crmentity.deleted = 0 \r\nAND vtiger_crmentity.crmid = vtiger_purchaseorder.purchaseorderid AND vtiger_inventoryproductrel.productid = vtiger_products.productid AND vtiger_vendor.vendorid = vtiger_purchaseorder.vendorid',0,0);

/*Table structure for table `vtiger_reportsharing` */

DROP TABLE IF EXISTS `vtiger_reportsharing`;

CREATE TABLE `vtiger_reportsharing` (
  `reportid` int(19) NOT NULL,
  `shareid` int(19) NOT NULL,
  `setype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportsharing` */

/*Table structure for table `vtiger_reportsortcol` */

DROP TABLE IF EXISTS `vtiger_reportsortcol`;

CREATE TABLE `vtiger_reportsortcol` (
  `sortcolid` int(19) NOT NULL,
  `reportid` int(19) NOT NULL,
  `columnname` varchar(250) default '',
  `sortorder` varchar(250) default 'Asc',
  PRIMARY KEY  (`sortcolid`,`reportid`),
  KEY `fk_1_vtiger_reportsortcol` (`reportid`),
  CONSTRAINT `fk_1_vtiger_reportsortcol` FOREIGN KEY (`reportid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportsortcol` */

insert  into `vtiger_reportsortcol`(`sortcolid`,`reportid`,`columnname`,`sortorder`) values (1,4,'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V','Ascending'),(1,5,'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V','Ascending'),(1,6,'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V','Ascending'),(1,11,'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V','Ascending');

/*Table structure for table `vtiger_reportsummary` */

DROP TABLE IF EXISTS `vtiger_reportsummary`;

CREATE TABLE `vtiger_reportsummary` (
  `reportsummaryid` int(19) NOT NULL,
  `summarytype` int(19) NOT NULL,
  `columnname` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`reportsummaryid`,`summarytype`,`columnname`),
  KEY `reportsummary_reportsummaryid_idx` (`reportsummaryid`),
  CONSTRAINT `fk_1_vtiger_reportsummary` FOREIGN KEY (`reportsummaryid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_reportsummary` */

/*Table structure for table `vtiger_revenuetype` */

DROP TABLE IF EXISTS `vtiger_revenuetype`;

CREATE TABLE `vtiger_revenuetype` (
  `revenuetypeid` int(19) NOT NULL auto_increment,
  `revenuetype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`revenuetypeid`),
  UNIQUE KEY `revenuetype_revenuetype_idx` (`revenuetype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_revenuetype` */

/*Table structure for table `vtiger_role` */

DROP TABLE IF EXISTS `vtiger_role`;

CREATE TABLE `vtiger_role` (
  `roleid` varchar(255) NOT NULL,
  `rolename` varchar(200) default NULL,
  `parentrole` varchar(255) default NULL,
  `depth` int(19) default NULL,
  `warehouseid` varchar(100) default NULL,
  `rolecode` varchar(200) NOT NULL,
  PRIMARY KEY  (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_role` */

insert  into `vtiger_role`(`roleid`,`rolename`,`parentrole`,`depth`,`warehouseid`,`rolecode`) values ('H1','Organisation','H1',0,'NULL','testing'),('H11','ST1_Manager','H1::H2::H3::H4::H11',4,'3','ST1_MNG'),('H16','ST2_Manager','H1::H2::H3::H4::H16',4,'4','ST2_MNG'),('H2','CEO','H1::H2',1,'NULL','testing'),('H3','Vice President','H1::H2::H3',2,'NULL','VP'),('H4','Sales Head','H1::H2::H3::H4',3,'ALLS','ST_HEAD'),('H5','Inventory Head','H1::H2::H3::H5',3,'ALLW','INV_HEAD'),('H8','WH1_Manager','H1::H2::H3::H5::H8',4,'2','WH1_MNG');

/*Table structure for table `vtiger_role2picklist` */

DROP TABLE IF EXISTS `vtiger_role2picklist`;

CREATE TABLE `vtiger_role2picklist` (
  `roleid` varchar(255) NOT NULL,
  `picklistvalueid` int(11) NOT NULL,
  `picklistid` int(11) NOT NULL,
  `sortid` int(11) default NULL,
  PRIMARY KEY  (`roleid`,`picklistvalueid`,`picklistid`),
  KEY `role2picklist_roleid_picklistid_idx` (`roleid`,`picklistid`,`picklistvalueid`),
  KEY `fk_2_vtiger_role2picklist` (`picklistid`),
  CONSTRAINT `fk_1_vtiger_role2picklist` FOREIGN KEY (`roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE,
  CONSTRAINT `fk_2_vtiger_role2picklist` FOREIGN KEY (`picklistid`) REFERENCES `vtiger_picklist` (`picklistid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_role2picklist` */

insert  into `vtiger_role2picklist`(`roleid`,`picklistvalueid`,`picklistid`,`sortid`) values ('H1',1,1,0),('H1',2,1,1),('H1',3,1,2),('H1',4,1,3),('H1',5,1,4),('H1',6,1,5),('H1',7,1,6),('H1',8,1,7),('H1',9,1,8),('H1',10,1,9),('H1',11,1,10),('H1',12,2,0),('H1',13,2,1),('H1',14,3,0),('H1',15,3,1),('H1',16,3,2),('H1',17,3,3),('H1',18,3,4),('H1',19,3,5),('H1',20,4,0),('H1',21,4,1),('H1',22,4,2),('H1',23,4,3),('H1',24,4,4),('H1',25,4,5),('H1',26,4,6),('H1',27,4,7),('H1',28,4,8),('H1',29,4,9),('H1',30,4,10),('H1',31,4,11),('H1',32,4,12),('H1',33,5,0),('H1',34,5,1),('H1',35,5,2),('H1',36,5,3),('H1',37,5,4),('H1',38,6,0),('H1',39,6,1),('H1',40,6,2),('H1',41,7,0),('H1',42,7,1),('H1',43,7,2),('H1',44,7,3),('H1',45,7,4),('H1',46,8,0),('H1',47,9,0),('H1',48,9,1),('H1',49,9,2),('H1',50,9,3),('H1',51,10,0),('H1',52,10,1),('H1',53,10,2),('H1',54,10,3),('H1',55,10,4),('H1',56,10,5),('H1',57,10,6),('H1',58,10,7),('H1',59,10,8),('H1',60,11,0),('H1',61,11,1),('H1',62,11,2),('H1',63,11,3),('H1',64,11,4),('H1',65,11,5),('H1',66,11,6),('H1',67,11,7),('H1',68,11,8),('H1',69,11,9),('H1',70,11,10),('H1',71,11,11),('H1',72,11,12),('H1',73,11,13),('H1',74,11,14),('H1',75,11,15),('H1',76,11,16),('H1',77,11,17),('H1',78,11,18),('H1',79,11,19),('H1',80,11,20),('H1',81,11,21),('H1',82,11,22),('H1',83,11,23),('H1',84,11,24),('H1',85,11,25),('H1',86,11,26),('H1',87,11,27),('H1',88,11,28),('H1',89,11,29),('H1',90,11,30),('H1',91,11,31),('H1',92,12,0),('H1',93,12,1),('H1',94,12,2),('H1',95,12,3),('H1',96,12,4),('H1',97,12,5),('H1',98,13,0),('H1',99,13,1),('H1',100,13,2),('H1',101,13,3),('H1',102,13,4),('H1',103,13,5),('H1',104,13,6),('H1',105,13,7),('H1',106,13,8),('H1',107,13,9),('H1',108,13,10),('H1',109,13,11),('H1',110,13,12),('H1',111,14,0),('H1',112,14,1),('H1',113,14,2),('H1',114,14,3),('H1',115,14,4),('H1',116,14,5),('H1',117,14,6),('H1',118,14,7),('H1',119,14,8),('H1',120,14,9),('H1',121,14,10),('H1',122,14,11),('H1',123,15,0),('H1',124,15,1),('H1',125,15,2),('H1',126,15,3),('H1',127,16,0),('H1',128,16,1),('H1',129,16,2),('H1',130,17,0),('H1',131,17,1),('H1',132,17,2),('H1',133,17,3),('H1',134,17,4),('H1',135,18,0),('H1',136,18,1),('H1',137,18,2),('H1',138,18,3),('H1',139,19,0),('H1',140,19,1),('H1',141,19,2),('H1',142,19,3),('H1',143,19,4),('H1',144,20,0),('H1',145,20,1),('H1',146,20,2),('H1',147,20,3),('H1',148,20,4),('H1',149,20,5),('H1',150,21,0),('H1',151,21,1),('H1',152,21,2),('H1',153,21,3),('H1',154,21,4),('H1',155,21,5),('H1',156,21,6),('H1',157,21,7),('H1',158,21,8),('H1',159,21,9),('H1',160,22,0),('H1',161,22,1),('H1',162,22,2),('H1',163,22,3),('H1',164,22,4),('H1',165,22,5),('H1',166,23,0),('H1',167,23,1),('H1',168,23,2),('H1',169,23,3),('H1',170,24,0),('H1',171,24,1),('H1',172,24,2),('H1',173,25,0),('H1',174,25,1),('H1',175,25,2),('H1',176,25,3),('H1',177,25,4),('H1',178,25,5),('H1',179,26,0),('H1',180,26,1),('H1',181,26,2),('H1',182,27,0),('H1',183,27,1),('H1',184,27,2),('H1',185,27,3),('H1',186,28,0),('H1',187,28,1),('H1',188,28,2),('H1',189,28,3),('H1',190,29,0),('H1',191,29,1),('H1',192,29,2),('H1',193,29,3),('H1',194,30,0),('H1',195,30,1),('H1',196,30,2),('H1',197,30,3),('H1',198,30,4),('H1',199,30,5),('H1',200,30,6),('H1',201,30,7),('H1',202,30,8),('H1',203,30,9),('H1',204,30,10),('H1',205,30,11),('H1',206,30,12),('H1',207,30,13),('H1',208,30,14),('H1',209,30,15),('H1',210,31,1),('H1',211,31,2),('H1',212,31,3),('H1',213,31,4),('H1',214,32,1),('H1',215,32,2),('H1',216,32,3),('H1',217,32,4),('H1',218,32,5),('H1',219,32,6),('H1',220,33,1),('H1',221,33,2),('H1',222,33,3),('H1',223,34,1),('H1',224,34,2),('H1',225,34,3),('H1',226,35,1),('H1',227,35,2),('H1',228,35,3),('H1',229,36,1),('H1',230,36,2),('H1',231,36,3),('H1',232,36,4),('H1',233,36,5),('H1',234,36,6),('H1',235,37,1),('H1',236,37,2),('H1',237,38,1),('H1',238,38,2),('H1',239,38,3),('H1',240,38,4),('H1',241,39,1),('H1',242,39,2),('H1',243,39,3),('H1',244,39,4),('H1',245,40,1),('H1',246,40,2),('H1',247,40,3),('H1',248,40,4),('H1',249,41,1),('H1',250,41,2),('H1',251,41,3),('H1',252,41,4),('H1',253,41,5),('H1',254,41,6),('H1',255,41,7),('H1',256,41,8),('H1',257,41,9),('H1',258,41,10),('H1',259,41,11),('H1',260,42,1),('H1',261,42,2),('H1',262,42,3),('H1',263,42,4),('H1',264,42,5),('H1',265,42,6),('H1',266,42,7),('H1',267,42,8),('H1',268,42,9),('H1',269,43,1),('H1',270,43,2),('H1',271,43,3),('H1',272,43,4),('H1',273,44,1),('H1',274,44,2),('H1',275,44,3),('H1',276,44,4),('H1',277,45,1),('H1',278,45,2),('H1',279,45,3),('H1',280,45,4),('H1',281,45,5),('H1',282,45,6),('H1',283,45,7),('H1',284,45,8),('H1',285,45,9),('H1',286,45,10),('H1',287,45,11),('H1',288,46,0),('H1',289,46,1),('H1',290,46,2),('H1',291,46,3),('H1',298,48,0),('H1',299,48,1),('H1',300,48,2),('H1',301,49,0),('H1',302,50,0),('H1',303,50,1),('H1',304,50,2),('H11',1,1,0),('H11',2,1,1),('H11',3,1,2),('H11',4,1,3),('H11',5,1,4),('H11',6,1,5),('H11',7,1,6),('H11',8,1,7),('H11',9,1,8),('H11',10,1,9),('H11',11,1,10),('H11',12,2,0),('H11',13,2,1),('H11',14,3,0),('H11',15,3,1),('H11',16,3,2),('H11',17,3,3),('H11',18,3,4),('H11',19,3,5),('H11',20,4,0),('H11',21,4,1),('H11',22,4,2),('H11',23,4,3),('H11',24,4,4),('H11',25,4,5),('H11',26,4,6),('H11',27,4,7),('H11',28,4,8),('H11',29,4,9),('H11',30,4,10),('H11',31,4,11),('H11',32,4,12),('H11',33,5,0),('H11',34,5,1),('H11',35,5,2),('H11',36,5,3),('H11',37,5,4),('H11',38,6,0),('H11',39,6,1),('H11',40,6,2),('H11',41,7,0),('H11',42,7,1),('H11',43,7,2),('H11',44,7,3),('H11',45,7,4),('H11',46,8,0),('H11',47,9,0),('H11',48,9,1),('H11',49,9,2),('H11',50,9,3),('H11',51,10,0),('H11',52,10,1),('H11',53,10,2),('H11',54,10,3),('H11',55,10,4),('H11',56,10,5),('H11',57,10,6),('H11',58,10,7),('H11',59,10,8),('H11',60,11,0),('H11',61,11,1),('H11',62,11,2),('H11',63,11,3),('H11',64,11,4),('H11',65,11,5),('H11',66,11,6),('H11',67,11,7),('H11',68,11,8),('H11',69,11,9),('H11',70,11,10),('H11',71,11,11),('H11',72,11,12),('H11',73,11,13),('H11',74,11,14),('H11',75,11,15),('H11',76,11,16),('H11',77,11,17),('H11',78,11,18),('H11',79,11,19),('H11',80,11,20),('H11',81,11,21),('H11',82,11,22),('H11',83,11,23),('H11',84,11,24),('H11',85,11,25),('H11',86,11,26),('H11',87,11,27),('H11',88,11,28),('H11',89,11,29),('H11',90,11,30),('H11',91,11,31),('H11',92,12,0),('H11',93,12,1),('H11',94,12,2),('H11',95,12,3),('H11',96,12,4),('H11',97,12,5),('H11',98,13,0),('H11',99,13,1),('H11',100,13,2),('H11',101,13,3),('H11',102,13,4),('H11',103,13,5),('H11',104,13,6),('H11',105,13,7),('H11',106,13,8),('H11',107,13,9),('H11',108,13,10),('H11',109,13,11),('H11',110,13,12),('H11',111,14,0),('H11',112,14,1),('H11',113,14,2),('H11',114,14,3),('H11',115,14,4),('H11',116,14,5),('H11',117,14,6),('H11',118,14,7),('H11',119,14,8),('H11',120,14,9),('H11',121,14,10),('H11',122,14,11),('H11',123,15,0),('H11',124,15,1),('H11',125,15,2),('H11',126,15,3),('H11',127,16,0),('H11',128,16,1),('H11',129,16,2),('H11',130,17,0),('H11',131,17,1),('H11',132,17,2),('H11',133,17,3),('H11',134,17,4),('H11',135,18,0),('H11',136,18,1),('H11',137,18,2),('H11',138,18,3),('H11',139,19,0),('H11',140,19,1),('H11',141,19,2),('H11',142,19,3),('H11',143,19,4),('H11',144,20,0),('H11',145,20,1),('H11',146,20,2),('H11',147,20,3),('H11',148,20,4),('H11',149,20,5),('H11',150,21,0),('H11',151,21,1),('H11',152,21,2),('H11',153,21,3),('H11',154,21,4),('H11',155,21,5),('H11',156,21,6),('H11',157,21,7),('H11',158,21,8),('H11',159,21,9),('H11',160,22,0),('H11',161,22,1),('H11',162,22,2),('H11',163,22,3),('H11',164,22,4),('H11',165,22,5),('H11',166,23,0),('H11',167,23,1),('H11',168,23,2),('H11',169,23,3),('H11',170,24,0),('H11',171,24,1),('H11',172,24,2),('H11',173,25,0),('H11',174,25,1),('H11',175,25,2),('H11',176,25,3),('H11',177,25,4),('H11',178,25,5),('H11',179,26,0),('H11',180,26,1),('H11',181,26,2),('H11',182,27,0),('H11',183,27,1),('H11',184,27,2),('H11',185,27,3),('H11',186,28,0),('H11',187,28,1),('H11',188,28,2),('H11',189,28,3),('H11',190,29,0),('H11',191,29,1),('H11',192,29,2),('H11',193,29,3),('H11',194,30,0),('H11',195,30,1),('H11',196,30,2),('H11',197,30,3),('H11',198,30,4),('H11',199,30,5),('H11',200,30,6),('H11',201,30,7),('H11',202,30,8),('H11',203,30,9),('H11',204,30,10),('H11',205,30,11),('H11',206,30,12),('H11',207,30,13),('H11',208,30,14),('H11',209,30,15),('H11',210,31,1),('H11',211,31,2),('H11',212,31,3),('H11',213,31,4),('H11',214,32,1),('H11',215,32,2),('H11',216,32,3),('H11',217,32,4),('H11',218,32,5),('H11',219,32,6),('H11',220,33,1),('H11',221,33,2),('H11',222,33,3),('H11',223,34,1),('H11',224,34,2),('H11',225,34,3),('H11',226,35,1),('H11',227,35,2),('H11',228,35,3),('H11',229,36,1),('H11',230,36,2),('H11',231,36,3),('H11',232,36,4),('H11',233,36,5),('H11',234,36,6),('H11',235,37,1),('H11',236,37,2),('H11',237,38,1),('H11',238,38,2),('H11',239,38,3),('H11',240,38,4),('H11',241,39,1),('H11',242,39,2),('H11',243,39,3),('H11',244,39,4),('H11',245,40,1),('H11',246,40,2),('H11',247,40,3),('H11',248,40,4),('H11',249,41,1),('H11',250,41,2),('H11',251,41,3),('H11',252,41,4),('H11',253,41,5),('H11',254,41,6),('H11',255,41,7),('H11',256,41,8),('H11',257,41,9),('H11',258,41,10),('H11',259,41,11),('H11',260,42,1),('H11',261,42,2),('H11',262,42,3),('H11',263,42,4),('H11',264,42,5),('H11',265,42,6),('H11',266,42,7),('H11',267,42,8),('H11',268,42,9),('H11',269,43,1),('H11',270,43,2),('H11',271,43,3),('H11',272,43,4),('H11',273,44,1),('H11',274,44,2),('H11',275,44,3),('H11',276,44,4),('H11',277,45,1),('H11',278,45,2),('H11',279,45,3),('H11',280,45,4),('H11',281,45,5),('H11',282,45,6),('H11',283,45,7),('H11',284,45,8),('H11',285,45,9),('H11',286,45,10),('H11',287,45,11),('H11',288,46,0),('H11',289,46,1),('H11',290,46,2),('H11',291,46,3),('H11',297,30,16),('H11',298,48,0),('H11',299,48,1),('H11',300,48,2),('H11',301,49,0),('H11',302,50,0),('H11',303,50,1),('H11',304,50,2),('H16',1,1,0),('H16',2,1,1),('H16',3,1,2),('H16',4,1,3),('H16',5,1,4),('H16',6,1,5),('H16',7,1,6),('H16',8,1,7),('H16',9,1,8),('H16',10,1,9),('H16',11,1,10),('H16',12,2,0),('H16',13,2,1),('H16',14,3,0),('H16',15,3,1),('H16',16,3,2),('H16',17,3,3),('H16',18,3,4),('H16',19,3,5),('H16',20,4,0),('H16',21,4,1),('H16',22,4,2),('H16',23,4,3),('H16',24,4,4),('H16',25,4,5),('H16',26,4,6),('H16',27,4,7),('H16',28,4,8),('H16',29,4,9),('H16',30,4,10),('H16',31,4,11),('H16',32,4,12),('H16',33,5,0),('H16',34,5,1),('H16',35,5,2),('H16',36,5,3),('H16',37,5,4),('H16',38,6,0),('H16',39,6,1),('H16',40,6,2),('H16',41,7,0),('H16',42,7,1),('H16',43,7,2),('H16',44,7,3),('H16',45,7,4),('H16',46,8,0),('H16',47,9,0),('H16',48,9,1),('H16',49,9,2),('H16',50,9,3),('H16',51,10,0),('H16',52,10,1),('H16',53,10,2),('H16',54,10,3),('H16',55,10,4),('H16',56,10,5),('H16',57,10,6),('H16',58,10,7),('H16',59,10,8),('H16',60,11,0),('H16',61,11,1),('H16',62,11,2),('H16',63,11,3),('H16',64,11,4),('H16',65,11,5),('H16',66,11,6),('H16',67,11,7),('H16',68,11,8),('H16',69,11,9),('H16',70,11,10),('H16',71,11,11),('H16',72,11,12),('H16',73,11,13),('H16',74,11,14),('H16',75,11,15),('H16',76,11,16),('H16',77,11,17),('H16',78,11,18),('H16',79,11,19),('H16',80,11,20),('H16',81,11,21),('H16',82,11,22),('H16',83,11,23),('H16',84,11,24),('H16',85,11,25),('H16',86,11,26),('H16',87,11,27),('H16',88,11,28),('H16',89,11,29),('H16',90,11,30),('H16',91,11,31),('H16',92,12,0),('H16',93,12,1),('H16',94,12,2),('H16',95,12,3),('H16',96,12,4),('H16',97,12,5),('H16',98,13,0),('H16',99,13,1),('H16',100,13,2),('H16',101,13,3),('H16',102,13,4),('H16',103,13,5),('H16',104,13,6),('H16',105,13,7),('H16',106,13,8),('H16',107,13,9),('H16',108,13,10),('H16',109,13,11),('H16',110,13,12),('H16',111,14,0),('H16',112,14,1),('H16',113,14,2),('H16',114,14,3),('H16',115,14,4),('H16',116,14,5),('H16',117,14,6),('H16',118,14,7),('H16',119,14,8),('H16',120,14,9),('H16',121,14,10),('H16',122,14,11),('H16',123,15,0),('H16',124,15,1),('H16',125,15,2),('H16',126,15,3),('H16',127,16,0),('H16',128,16,1),('H16',129,16,2),('H16',130,17,0),('H16',131,17,1),('H16',132,17,2),('H16',133,17,3),('H16',134,17,4),('H16',135,18,0),('H16',136,18,1),('H16',137,18,2),('H16',138,18,3),('H16',139,19,0),('H16',140,19,1),('H16',141,19,2),('H16',142,19,3),('H16',143,19,4),('H16',144,20,0),('H16',145,20,1),('H16',146,20,2),('H16',147,20,3),('H16',148,20,4),('H16',149,20,5),('H16',150,21,0),('H16',151,21,1),('H16',152,21,2),('H16',153,21,3),('H16',154,21,4),('H16',155,21,5),('H16',156,21,6),('H16',157,21,7),('H16',158,21,8),('H16',159,21,9),('H16',160,22,0),('H16',161,22,1),('H16',162,22,2),('H16',163,22,3),('H16',164,22,4),('H16',165,22,5),('H16',166,23,0),('H16',167,23,1),('H16',168,23,2),('H16',169,23,3),('H16',170,24,0),('H16',171,24,1),('H16',172,24,2),('H16',173,25,0),('H16',174,25,1),('H16',175,25,2),('H16',176,25,3),('H16',177,25,4),('H16',178,25,5),('H16',179,26,0),('H16',180,26,1),('H16',181,26,2),('H16',182,27,0),('H16',183,27,1),('H16',184,27,2),('H16',185,27,3),('H16',186,28,0),('H16',187,28,1),('H16',188,28,2),('H16',189,28,3),('H16',190,29,0),('H16',191,29,1),('H16',192,29,2),('H16',193,29,3),('H16',194,30,0),('H16',195,30,1),('H16',196,30,2),('H16',197,30,3),('H16',198,30,4),('H16',199,30,5),('H16',200,30,6),('H16',201,30,7),('H16',202,30,8),('H16',203,30,9),('H16',204,30,10),('H16',205,30,11),('H16',206,30,12),('H16',207,30,13),('H16',208,30,14),('H16',209,30,15),('H16',210,31,1),('H16',211,31,2),('H16',212,31,3),('H16',213,31,4),('H16',214,32,1),('H16',215,32,2),('H16',216,32,3),('H16',217,32,4),('H16',218,32,5),('H16',219,32,6),('H16',220,33,1),('H16',221,33,2),('H16',222,33,3),('H16',223,34,1),('H16',224,34,2),('H16',225,34,3),('H16',226,35,1),('H16',227,35,2),('H16',228,35,3),('H16',229,36,1),('H16',230,36,2),('H16',231,36,3),('H16',232,36,4),('H16',233,36,5),('H16',234,36,6),('H16',235,37,1),('H16',236,37,2),('H16',237,38,1),('H16',238,38,2),('H16',239,38,3),('H16',240,38,4),('H16',241,39,1),('H16',242,39,2),('H16',243,39,3),('H16',244,39,4),('H16',245,40,1),('H16',246,40,2),('H16',247,40,3),('H16',248,40,4),('H16',249,41,1),('H16',250,41,2),('H16',251,41,3),('H16',252,41,4),('H16',253,41,5),('H16',254,41,6),('H16',255,41,7),('H16',256,41,8),('H16',257,41,9),('H16',258,41,10),('H16',259,41,11),('H16',260,42,1),('H16',261,42,2),('H16',262,42,3),('H16',263,42,4),('H16',264,42,5),('H16',265,42,6),('H16',266,42,7),('H16',267,42,8),('H16',268,42,9),('H16',269,43,1),('H16',270,43,2),('H16',271,43,3),('H16',272,43,4),('H16',273,44,1),('H16',274,44,2),('H16',275,44,3),('H16',276,44,4),('H16',277,45,1),('H16',278,45,2),('H16',279,45,3),('H16',280,45,4),('H16',281,45,5),('H16',282,45,6),('H16',283,45,7),('H16',284,45,8),('H16',285,45,9),('H16',286,45,10),('H16',287,45,11),('H16',288,46,0),('H16',289,46,1),('H16',290,46,2),('H16',291,46,3),('H16',297,30,16),('H16',298,48,0),('H16',299,48,1),('H16',300,48,2),('H16',301,49,0),('H16',302,50,0),('H16',303,50,1),('H16',304,50,2),('H2',1,1,0),('H2',2,1,1),('H2',3,1,2),('H2',4,1,3),('H2',5,1,4),('H2',6,1,5),('H2',7,1,6),('H2',8,1,7),('H2',9,1,8),('H2',10,1,9),('H2',11,1,10),('H2',12,2,0),('H2',13,2,1),('H2',14,3,0),('H2',15,3,1),('H2',16,3,2),('H2',17,3,3),('H2',18,3,4),('H2',19,3,5),('H2',20,4,0),('H2',21,4,1),('H2',22,4,2),('H2',23,4,3),('H2',24,4,4),('H2',25,4,5),('H2',26,4,6),('H2',27,4,7),('H2',28,4,8),('H2',29,4,9),('H2',30,4,10),('H2',31,4,11),('H2',32,4,12),('H2',33,5,0),('H2',34,5,1),('H2',35,5,2),('H2',36,5,3),('H2',37,5,4),('H2',38,6,0),('H2',39,6,1),('H2',40,6,2),('H2',41,7,0),('H2',42,7,1),('H2',43,7,2),('H2',44,7,3),('H2',45,7,4),('H2',46,8,0),('H2',47,9,0),('H2',48,9,1),('H2',49,9,2),('H2',50,9,3),('H2',51,10,0),('H2',52,10,1),('H2',53,10,2),('H2',54,10,3),('H2',55,10,4),('H2',56,10,5),('H2',57,10,6),('H2',58,10,7),('H2',59,10,8),('H2',60,11,0),('H2',61,11,1),('H2',62,11,2),('H2',63,11,3),('H2',64,11,4),('H2',65,11,5),('H2',66,11,6),('H2',67,11,7),('H2',68,11,8),('H2',69,11,9),('H2',70,11,10),('H2',71,11,11),('H2',72,11,12),('H2',73,11,13),('H2',74,11,14),('H2',75,11,15),('H2',76,11,16),('H2',77,11,17),('H2',78,11,18),('H2',79,11,19),('H2',80,11,20),('H2',81,11,21),('H2',82,11,22),('H2',83,11,23),('H2',84,11,24),('H2',85,11,25),('H2',86,11,26),('H2',87,11,27),('H2',88,11,28),('H2',89,11,29),('H2',90,11,30),('H2',91,11,31),('H2',92,12,0),('H2',93,12,1),('H2',94,12,2),('H2',95,12,3),('H2',96,12,4),('H2',97,12,5),('H2',98,13,0),('H2',99,13,1),('H2',100,13,2),('H2',101,13,3),('H2',102,13,4),('H2',103,13,5),('H2',104,13,6),('H2',105,13,7),('H2',106,13,8),('H2',107,13,9),('H2',108,13,10),('H2',109,13,11),('H2',110,13,12),('H2',111,14,0),('H2',112,14,1),('H2',113,14,2),('H2',114,14,3),('H2',115,14,4),('H2',116,14,5),('H2',117,14,6),('H2',118,14,7),('H2',119,14,8),('H2',120,14,9),('H2',121,14,10),('H2',122,14,11),('H2',123,15,0),('H2',124,15,1),('H2',125,15,2),('H2',126,15,3),('H2',127,16,0),('H2',128,16,1),('H2',129,16,2),('H2',130,17,0),('H2',131,17,1),('H2',132,17,2),('H2',133,17,3),('H2',134,17,4),('H2',135,18,0),('H2',136,18,1),('H2',137,18,2),('H2',138,18,3),('H2',139,19,0),('H2',140,19,1),('H2',141,19,2),('H2',142,19,3),('H2',143,19,4),('H2',144,20,0),('H2',145,20,1),('H2',146,20,2),('H2',147,20,3),('H2',148,20,4),('H2',149,20,5),('H2',150,21,0),('H2',151,21,1),('H2',152,21,2),('H2',153,21,3),('H2',154,21,4),('H2',155,21,5),('H2',156,21,6),('H2',157,21,7),('H2',158,21,8),('H2',159,21,9),('H2',160,22,0),('H2',161,22,1),('H2',162,22,2),('H2',163,22,3),('H2',164,22,4),('H2',165,22,5),('H2',166,23,0),('H2',167,23,1),('H2',168,23,2),('H2',169,23,3),('H2',170,24,0),('H2',171,24,1),('H2',172,24,2),('H2',173,25,0),('H2',174,25,1),('H2',175,25,2),('H2',176,25,3),('H2',177,25,4),('H2',178,25,5),('H2',179,26,0),('H2',180,26,1),('H2',181,26,2),('H2',182,27,0),('H2',183,27,1),('H2',184,27,2),('H2',185,27,3),('H2',186,28,0),('H2',187,28,1),('H2',188,28,2),('H2',189,28,3),('H2',190,29,0),('H2',191,29,1),('H2',192,29,2),('H2',193,29,3),('H2',194,30,0),('H2',195,30,1),('H2',196,30,2),('H2',197,30,3),('H2',198,30,4),('H2',199,30,5),('H2',200,30,6),('H2',201,30,7),('H2',202,30,8),('H2',203,30,9),('H2',204,30,10),('H2',205,30,11),('H2',206,30,12),('H2',207,30,13),('H2',208,30,14),('H2',209,30,15),('H2',210,31,1),('H2',211,31,2),('H2',212,31,3),('H2',213,31,4),('H2',214,32,1),('H2',215,32,2),('H2',216,32,3),('H2',217,32,4),('H2',218,32,5),('H2',219,32,6),('H2',220,33,1),('H2',221,33,2),('H2',222,33,3),('H2',223,34,1),('H2',224,34,2),('H2',225,34,3),('H2',226,35,1),('H2',227,35,2),('H2',228,35,3),('H2',229,36,1),('H2',230,36,2),('H2',231,36,3),('H2',232,36,4),('H2',233,36,5),('H2',234,36,6),('H2',235,37,1),('H2',236,37,2),('H2',237,38,1),('H2',238,38,2),('H2',239,38,3),('H2',240,38,4),('H2',241,39,1),('H2',242,39,2),('H2',243,39,3),('H2',244,39,4),('H2',245,40,1),('H2',246,40,2),('H2',247,40,3),('H2',248,40,4),('H2',249,41,1),('H2',250,41,2),('H2',251,41,3),('H2',252,41,4),('H2',253,41,5),('H2',254,41,6),('H2',255,41,7),('H2',256,41,8),('H2',257,41,9),('H2',258,41,10),('H2',259,41,11),('H2',260,42,1),('H2',261,42,2),('H2',262,42,3),('H2',263,42,4),('H2',264,42,5),('H2',265,42,6),('H2',266,42,7),('H2',267,42,8),('H2',268,42,9),('H2',269,43,1),('H2',270,43,2),('H2',271,43,3),('H2',272,43,4),('H2',273,44,1),('H2',274,44,2),('H2',275,44,3),('H2',276,44,4),('H2',277,45,1),('H2',278,45,2),('H2',279,45,3),('H2',280,45,4),('H2',281,45,5),('H2',282,45,6),('H2',283,45,7),('H2',284,45,8),('H2',285,45,9),('H2',286,45,10),('H2',287,45,11),('H2',288,46,0),('H2',289,46,1),('H2',290,46,2),('H2',291,46,3),('H2',297,30,16),('H2',298,48,0),('H2',299,48,1),('H2',300,48,2),('H2',301,49,0),('H2',302,50,0),('H2',303,50,1),('H2',304,50,2),('H3',1,1,0),('H3',2,1,1),('H3',3,1,2),('H3',4,1,3),('H3',5,1,4),('H3',6,1,5),('H3',7,1,6),('H3',8,1,7),('H3',9,1,8),('H3',10,1,9),('H3',11,1,10),('H3',12,2,0),('H3',13,2,1),('H3',14,3,0),('H3',15,3,1),('H3',16,3,2),('H3',17,3,3),('H3',18,3,4),('H3',19,3,5),('H3',20,4,0),('H3',21,4,1),('H3',22,4,2),('H3',23,4,3),('H3',24,4,4),('H3',25,4,5),('H3',26,4,6),('H3',27,4,7),('H3',28,4,8),('H3',29,4,9),('H3',30,4,10),('H3',31,4,11),('H3',32,4,12),('H3',33,5,0),('H3',34,5,1),('H3',35,5,2),('H3',36,5,3),('H3',37,5,4),('H3',38,6,0),('H3',39,6,1),('H3',40,6,2),('H3',41,7,0),('H3',42,7,1),('H3',43,7,2),('H3',44,7,3),('H3',45,7,4),('H3',46,8,0),('H3',47,9,0),('H3',48,9,1),('H3',49,9,2),('H3',50,9,3),('H3',51,10,0),('H3',52,10,1),('H3',53,10,2),('H3',54,10,3),('H3',55,10,4),('H3',56,10,5),('H3',57,10,6),('H3',58,10,7),('H3',59,10,8),('H3',60,11,0),('H3',61,11,1),('H3',62,11,2),('H3',63,11,3),('H3',64,11,4),('H3',65,11,5),('H3',66,11,6),('H3',67,11,7),('H3',68,11,8),('H3',69,11,9),('H3',70,11,10),('H3',71,11,11),('H3',72,11,12),('H3',73,11,13),('H3',74,11,14),('H3',75,11,15),('H3',76,11,16),('H3',77,11,17),('H3',78,11,18),('H3',79,11,19),('H3',80,11,20),('H3',81,11,21),('H3',82,11,22),('H3',83,11,23),('H3',84,11,24),('H3',85,11,25),('H3',86,11,26),('H3',87,11,27),('H3',88,11,28),('H3',89,11,29),('H3',90,11,30),('H3',91,11,31),('H3',92,12,0),('H3',93,12,1),('H3',94,12,2),('H3',95,12,3),('H3',96,12,4),('H3',97,12,5),('H3',98,13,0),('H3',99,13,1),('H3',100,13,2),('H3',101,13,3),('H3',102,13,4),('H3',103,13,5),('H3',104,13,6),('H3',105,13,7),('H3',106,13,8),('H3',107,13,9),('H3',108,13,10),('H3',109,13,11),('H3',110,13,12),('H3',111,14,0),('H3',112,14,1),('H3',113,14,2),('H3',114,14,3),('H3',115,14,4),('H3',116,14,5),('H3',117,14,6),('H3',118,14,7),('H3',119,14,8),('H3',120,14,9),('H3',121,14,10),('H3',122,14,11),('H3',123,15,0),('H3',124,15,1),('H3',125,15,2),('H3',126,15,3),('H3',127,16,0),('H3',128,16,1),('H3',129,16,2),('H3',130,17,0),('H3',131,17,1),('H3',132,17,2),('H3',133,17,3),('H3',134,17,4),('H3',135,18,0),('H3',136,18,1),('H3',137,18,2),('H3',138,18,3),('H3',139,19,0),('H3',140,19,1),('H3',141,19,2),('H3',142,19,3),('H3',143,19,4),('H3',144,20,0),('H3',145,20,1),('H3',146,20,2),('H3',147,20,3),('H3',148,20,4),('H3',149,20,5),('H3',150,21,0),('H3',151,21,1),('H3',152,21,2),('H3',153,21,3),('H3',154,21,4),('H3',155,21,5),('H3',156,21,6),('H3',157,21,7),('H3',158,21,8),('H3',159,21,9),('H3',160,22,0),('H3',161,22,1),('H3',162,22,2),('H3',163,22,3),('H3',164,22,4),('H3',165,22,5),('H3',166,23,0),('H3',167,23,1),('H3',168,23,2),('H3',169,23,3),('H3',170,24,0),('H3',171,24,1),('H3',172,24,2),('H3',173,25,0),('H3',174,25,1),('H3',175,25,2),('H3',176,25,3),('H3',177,25,4),('H3',178,25,5),('H3',179,26,0),('H3',180,26,1),('H3',181,26,2),('H3',182,27,0),('H3',183,27,1),('H3',184,27,2),('H3',185,27,3),('H3',186,28,0),('H3',187,28,1),('H3',188,28,2),('H3',189,28,3),('H3',190,29,0),('H3',191,29,1),('H3',192,29,2),('H3',193,29,3),('H3',194,30,0),('H3',195,30,1),('H3',196,30,2),('H3',197,30,3),('H3',198,30,4),('H3',199,30,5),('H3',200,30,6),('H3',201,30,7),('H3',202,30,8),('H3',203,30,9),('H3',204,30,10),('H3',205,30,11),('H3',206,30,12),('H3',207,30,13),('H3',208,30,14),('H3',209,30,15),('H3',210,31,1),('H3',211,31,2),('H3',212,31,3),('H3',213,31,4),('H3',214,32,1),('H3',215,32,2),('H3',216,32,3),('H3',217,32,4),('H3',218,32,5),('H3',219,32,6),('H3',220,33,1),('H3',221,33,2),('H3',222,33,3),('H3',223,34,1),('H3',224,34,2),('H3',225,34,3),('H3',226,35,1),('H3',227,35,2),('H3',228,35,3),('H3',229,36,1),('H3',230,36,2),('H3',231,36,3),('H3',232,36,4),('H3',233,36,5),('H3',234,36,6),('H3',235,37,1),('H3',236,37,2),('H3',237,38,1),('H3',238,38,2),('H3',239,38,3),('H3',240,38,4),('H3',241,39,1),('H3',242,39,2),('H3',243,39,3),('H3',244,39,4),('H3',245,40,1),('H3',246,40,2),('H3',247,40,3),('H3',248,40,4),('H3',249,41,1),('H3',250,41,2),('H3',251,41,3),('H3',252,41,4),('H3',253,41,5),('H3',254,41,6),('H3',255,41,7),('H3',256,41,8),('H3',257,41,9),('H3',258,41,10),('H3',259,41,11),('H3',260,42,1),('H3',261,42,2),('H3',262,42,3),('H3',263,42,4),('H3',264,42,5),('H3',265,42,6),('H3',266,42,7),('H3',267,42,8),('H3',268,42,9),('H3',269,43,1),('H3',270,43,2),('H3',271,43,3),('H3',272,43,4),('H3',273,44,1),('H3',274,44,2),('H3',275,44,3),('H3',276,44,4),('H3',277,45,1),('H3',278,45,2),('H3',279,45,3),('H3',280,45,4),('H3',281,45,5),('H3',282,45,6),('H3',283,45,7),('H3',284,45,8),('H3',285,45,9),('H3',286,45,10),('H3',287,45,11),('H3',288,46,0),('H3',289,46,1),('H3',290,46,2),('H3',291,46,3),('H3',297,30,16),('H3',298,48,0),('H3',299,48,1),('H3',300,48,2),('H3',301,49,0),('H3',302,50,0),('H3',303,50,1),('H3',304,50,2),('H4',1,1,0),('H4',2,1,1),('H4',3,1,2),('H4',4,1,3),('H4',5,1,4),('H4',6,1,5),('H4',7,1,6),('H4',8,1,7),('H4',9,1,8),('H4',10,1,9),('H4',11,1,10),('H4',12,2,0),('H4',13,2,1),('H4',14,3,0),('H4',15,3,1),('H4',16,3,2),('H4',17,3,3),('H4',18,3,4),('H4',19,3,5),('H4',20,4,0),('H4',21,4,1),('H4',22,4,2),('H4',23,4,3),('H4',24,4,4),('H4',25,4,5),('H4',26,4,6),('H4',27,4,7),('H4',28,4,8),('H4',29,4,9),('H4',30,4,10),('H4',31,4,11),('H4',32,4,12),('H4',33,5,0),('H4',34,5,1),('H4',35,5,2),('H4',36,5,3),('H4',37,5,4),('H4',38,6,0),('H4',39,6,1),('H4',40,6,2),('H4',41,7,0),('H4',42,7,1),('H4',43,7,2),('H4',44,7,3),('H4',45,7,4),('H4',46,8,0),('H4',47,9,0),('H4',48,9,1),('H4',49,9,2),('H4',50,9,3),('H4',51,10,0),('H4',52,10,1),('H4',53,10,2),('H4',54,10,3),('H4',55,10,4),('H4',56,10,5),('H4',57,10,6),('H4',58,10,7),('H4',59,10,8),('H4',60,11,0),('H4',61,11,1),('H4',62,11,2),('H4',63,11,3),('H4',64,11,4),('H4',65,11,5),('H4',66,11,6),('H4',67,11,7),('H4',68,11,8),('H4',69,11,9),('H4',70,11,10),('H4',71,11,11),('H4',72,11,12),('H4',73,11,13),('H4',74,11,14),('H4',75,11,15),('H4',76,11,16),('H4',77,11,17),('H4',78,11,18),('H4',79,11,19),('H4',80,11,20),('H4',81,11,21),('H4',82,11,22),('H4',83,11,23),('H4',84,11,24),('H4',85,11,25),('H4',86,11,26),('H4',87,11,27),('H4',88,11,28),('H4',89,11,29),('H4',90,11,30),('H4',91,11,31),('H4',92,12,0),('H4',93,12,1),('H4',94,12,2),('H4',95,12,3),('H4',96,12,4),('H4',97,12,5),('H4',98,13,0),('H4',99,13,1),('H4',100,13,2),('H4',101,13,3),('H4',102,13,4),('H4',103,13,5),('H4',104,13,6),('H4',105,13,7),('H4',106,13,8),('H4',107,13,9),('H4',108,13,10),('H4',109,13,11),('H4',110,13,12),('H4',111,14,0),('H4',112,14,1),('H4',113,14,2),('H4',114,14,3),('H4',115,14,4),('H4',116,14,5),('H4',117,14,6),('H4',118,14,7),('H4',119,14,8),('H4',120,14,9),('H4',121,14,10),('H4',122,14,11),('H4',123,15,0),('H4',124,15,1),('H4',125,15,2),('H4',126,15,3),('H4',127,16,0),('H4',128,16,1),('H4',129,16,2),('H4',130,17,0),('H4',131,17,1),('H4',132,17,2),('H4',133,17,3),('H4',134,17,4),('H4',135,18,0),('H4',136,18,1),('H4',137,18,2),('H4',138,18,3),('H4',139,19,0),('H4',140,19,1),('H4',141,19,2),('H4',142,19,3),('H4',143,19,4),('H4',144,20,0),('H4',145,20,1),('H4',146,20,2),('H4',147,20,3),('H4',148,20,4),('H4',149,20,5),('H4',150,21,0),('H4',151,21,1),('H4',152,21,2),('H4',153,21,3),('H4',154,21,4),('H4',155,21,5),('H4',156,21,6),('H4',157,21,7),('H4',158,21,8),('H4',159,21,9),('H4',160,22,0),('H4',161,22,1),('H4',162,22,2),('H4',163,22,3),('H4',164,22,4),('H4',165,22,5),('H4',166,23,0),('H4',167,23,1),('H4',168,23,2),('H4',169,23,3),('H4',170,24,0),('H4',171,24,1),('H4',172,24,2),('H4',173,25,0),('H4',174,25,1),('H4',175,25,2),('H4',176,25,3),('H4',177,25,4),('H4',178,25,5),('H4',179,26,0),('H4',180,26,1),('H4',181,26,2),('H4',182,27,0),('H4',183,27,1),('H4',184,27,2),('H4',185,27,3),('H4',186,28,0),('H4',187,28,1),('H4',188,28,2),('H4',189,28,3),('H4',190,29,0),('H4',191,29,1),('H4',192,29,2),('H4',193,29,3),('H4',194,30,0),('H4',195,30,1),('H4',196,30,2),('H4',197,30,3),('H4',198,30,4),('H4',199,30,5),('H4',200,30,6),('H4',201,30,7),('H4',202,30,8),('H4',203,30,9),('H4',204,30,10),('H4',205,30,11),('H4',206,30,12),('H4',207,30,13),('H4',208,30,14),('H4',209,30,15),('H4',210,31,1),('H4',211,31,2),('H4',212,31,3),('H4',213,31,4),('H4',214,32,1),('H4',215,32,2),('H4',216,32,3),('H4',217,32,4),('H4',218,32,5),('H4',219,32,6),('H4',220,33,1),('H4',221,33,2),('H4',222,33,3),('H4',223,34,1),('H4',224,34,2),('H4',225,34,3),('H4',226,35,1),('H4',227,35,2),('H4',228,35,3),('H4',229,36,1),('H4',230,36,2),('H4',231,36,3),('H4',232,36,4),('H4',233,36,5),('H4',234,36,6),('H4',235,37,1),('H4',236,37,2),('H4',237,38,1),('H4',238,38,2),('H4',239,38,3),('H4',240,38,4),('H4',241,39,1),('H4',242,39,2),('H4',243,39,3),('H4',244,39,4),('H4',245,40,1),('H4',246,40,2),('H4',247,40,3),('H4',248,40,4),('H4',249,41,1),('H4',250,41,2),('H4',251,41,3),('H4',252,41,4),('H4',253,41,5),('H4',254,41,6),('H4',255,41,7),('H4',256,41,8),('H4',257,41,9),('H4',258,41,10),('H4',259,41,11),('H4',260,42,1),('H4',261,42,2),('H4',262,42,3),('H4',263,42,4),('H4',264,42,5),('H4',265,42,6),('H4',266,42,7),('H4',267,42,8),('H4',268,42,9),('H4',269,43,1),('H4',270,43,2),('H4',271,43,3),('H4',272,43,4),('H4',273,44,1),('H4',274,44,2),('H4',275,44,3),('H4',276,44,4),('H4',277,45,1),('H4',278,45,2),('H4',279,45,3),('H4',280,45,4),('H4',281,45,5),('H4',282,45,6),('H4',283,45,7),('H4',284,45,8),('H4',285,45,9),('H4',286,45,10),('H4',287,45,11),('H4',288,46,0),('H4',289,46,1),('H4',290,46,2),('H4',291,46,3),('H4',297,30,16),('H4',298,48,0),('H4',299,48,1),('H4',300,48,2),('H4',301,49,0),('H4',302,50,0),('H4',303,50,1),('H4',304,50,2),('H5',1,1,0),('H5',2,1,1),('H5',3,1,2),('H5',4,1,3),('H5',5,1,4),('H5',6,1,5),('H5',7,1,6),('H5',8,1,7),('H5',9,1,8),('H5',10,1,9),('H5',11,1,10),('H5',12,2,0),('H5',13,2,1),('H5',14,3,0),('H5',15,3,1),('H5',16,3,2),('H5',17,3,3),('H5',18,3,4),('H5',19,3,5),('H5',20,4,0),('H5',21,4,1),('H5',22,4,2),('H5',23,4,3),('H5',24,4,4),('H5',25,4,5),('H5',26,4,6),('H5',27,4,7),('H5',28,4,8),('H5',29,4,9),('H5',30,4,10),('H5',31,4,11),('H5',32,4,12),('H5',33,5,0),('H5',34,5,1),('H5',35,5,2),('H5',36,5,3),('H5',37,5,4),('H5',38,6,0),('H5',39,6,1),('H5',40,6,2),('H5',41,7,0),('H5',42,7,1),('H5',43,7,2),('H5',44,7,3),('H5',45,7,4),('H5',46,8,0),('H5',47,9,0),('H5',48,9,1),('H5',49,9,2),('H5',50,9,3),('H5',51,10,0),('H5',52,10,1),('H5',53,10,2),('H5',54,10,3),('H5',55,10,4),('H5',56,10,5),('H5',57,10,6),('H5',58,10,7),('H5',59,10,8),('H5',60,11,0),('H5',61,11,1),('H5',62,11,2),('H5',63,11,3),('H5',64,11,4),('H5',65,11,5),('H5',66,11,6),('H5',67,11,7),('H5',68,11,8),('H5',69,11,9),('H5',70,11,10),('H5',71,11,11),('H5',72,11,12),('H5',73,11,13),('H5',74,11,14),('H5',75,11,15),('H5',76,11,16),('H5',77,11,17),('H5',78,11,18),('H5',79,11,19),('H5',80,11,20),('H5',81,11,21),('H5',82,11,22),('H5',83,11,23),('H5',84,11,24),('H5',85,11,25),('H5',86,11,26),('H5',87,11,27),('H5',88,11,28),('H5',89,11,29),('H5',90,11,30),('H5',91,11,31),('H5',92,12,0),('H5',93,12,1),('H5',94,12,2),('H5',95,12,3),('H5',96,12,4),('H5',97,12,5),('H5',98,13,0),('H5',99,13,1),('H5',100,13,2),('H5',101,13,3),('H5',102,13,4),('H5',103,13,5),('H5',104,13,6),('H5',105,13,7),('H5',106,13,8),('H5',107,13,9),('H5',108,13,10),('H5',109,13,11),('H5',110,13,12),('H5',111,14,0),('H5',112,14,1),('H5',113,14,2),('H5',114,14,3),('H5',115,14,4),('H5',116,14,5),('H5',117,14,6),('H5',118,14,7),('H5',119,14,8),('H5',120,14,9),('H5',121,14,10),('H5',122,14,11),('H5',123,15,0),('H5',124,15,1),('H5',125,15,2),('H5',126,15,3),('H5',127,16,0),('H5',128,16,1),('H5',129,16,2),('H5',130,17,0),('H5',131,17,1),('H5',132,17,2),('H5',133,17,3),('H5',134,17,4),('H5',135,18,0),('H5',136,18,1),('H5',137,18,2),('H5',138,18,3),('H5',139,19,0),('H5',140,19,1),('H5',141,19,2),('H5',142,19,3),('H5',143,19,4),('H5',144,20,0),('H5',145,20,1),('H5',146,20,2),('H5',147,20,3),('H5',148,20,4),('H5',149,20,5),('H5',150,21,0),('H5',151,21,1),('H5',152,21,2),('H5',153,21,3),('H5',154,21,4),('H5',155,21,5),('H5',156,21,6),('H5',157,21,7),('H5',158,21,8),('H5',159,21,9),('H5',160,22,0),('H5',161,22,1),('H5',162,22,2),('H5',163,22,3),('H5',164,22,4),('H5',165,22,5),('H5',166,23,0),('H5',167,23,1),('H5',168,23,2),('H5',169,23,3),('H5',170,24,0),('H5',171,24,1),('H5',172,24,2),('H5',173,25,0),('H5',174,25,1),('H5',175,25,2),('H5',176,25,3),('H5',177,25,4),('H5',178,25,5),('H5',179,26,0),('H5',180,26,1),('H5',181,26,2),('H5',182,27,0),('H5',183,27,1),('H5',184,27,2),('H5',185,27,3),('H5',186,28,0),('H5',187,28,1),('H5',188,28,2),('H5',189,28,3),('H5',190,29,0),('H5',191,29,1),('H5',192,29,2),('H5',193,29,3),('H5',194,30,0),('H5',195,30,1),('H5',196,30,2),('H5',197,30,3),('H5',198,30,4),('H5',199,30,5),('H5',200,30,6),('H5',201,30,7),('H5',202,30,8),('H5',203,30,9),('H5',204,30,10),('H5',205,30,11),('H5',206,30,12),('H5',207,30,13),('H5',208,30,14),('H5',209,30,15),('H5',210,31,1),('H5',211,31,2),('H5',212,31,3),('H5',213,31,4),('H5',214,32,1),('H5',215,32,2),('H5',216,32,3),('H5',217,32,4),('H5',218,32,5),('H5',219,32,6),('H5',220,33,1),('H5',221,33,2),('H5',222,33,3),('H5',223,34,1),('H5',224,34,2),('H5',225,34,3),('H5',226,35,1),('H5',227,35,2),('H5',228,35,3),('H5',229,36,1),('H5',230,36,2),('H5',231,36,3),('H5',232,36,4),('H5',233,36,5),('H5',234,36,6),('H5',235,37,1),('H5',236,37,2),('H5',237,38,1),('H5',238,38,2),('H5',239,38,3),('H5',240,38,4),('H5',241,39,1),('H5',242,39,2),('H5',243,39,3),('H5',244,39,4),('H5',245,40,1),('H5',246,40,2),('H5',247,40,3),('H5',248,40,4),('H5',249,41,1),('H5',250,41,2),('H5',251,41,3),('H5',252,41,4),('H5',253,41,5),('H5',254,41,6),('H5',255,41,7),('H5',256,41,8),('H5',257,41,9),('H5',258,41,10),('H5',259,41,11),('H5',260,42,1),('H5',261,42,2),('H5',262,42,3),('H5',263,42,4),('H5',264,42,5),('H5',265,42,6),('H5',266,42,7),('H5',267,42,8),('H5',268,42,9),('H5',269,43,1),('H5',270,43,2),('H5',271,43,3),('H5',272,43,4),('H5',273,44,1),('H5',274,44,2),('H5',275,44,3),('H5',276,44,4),('H5',277,45,1),('H5',278,45,2),('H5',279,45,3),('H5',280,45,4),('H5',281,45,5),('H5',282,45,6),('H5',283,45,7),('H5',284,45,8),('H5',285,45,9),('H5',286,45,10),('H5',287,45,11),('H5',288,46,0),('H5',289,46,1),('H5',290,46,2),('H5',291,46,3),('H5',297,30,16),('H5',298,48,0),('H5',299,48,1),('H5',300,48,2),('H5',301,49,0),('H5',302,50,0),('H5',303,50,1),('H5',304,50,2),('H8',1,1,0),('H8',2,1,1),('H8',3,1,2),('H8',4,1,3),('H8',5,1,4),('H8',6,1,5),('H8',7,1,6),('H8',8,1,7),('H8',9,1,8),('H8',10,1,9),('H8',11,1,10),('H8',12,2,0),('H8',13,2,1),('H8',14,3,0),('H8',15,3,1),('H8',16,3,2),('H8',17,3,3),('H8',18,3,4),('H8',19,3,5),('H8',20,4,0),('H8',21,4,1),('H8',22,4,2),('H8',23,4,3),('H8',24,4,4),('H8',25,4,5),('H8',26,4,6),('H8',27,4,7),('H8',28,4,8),('H8',29,4,9),('H8',30,4,10),('H8',31,4,11),('H8',32,4,12),('H8',33,5,0),('H8',34,5,1),('H8',35,5,2),('H8',36,5,3),('H8',37,5,4),('H8',38,6,0),('H8',39,6,1),('H8',40,6,2),('H8',41,7,0),('H8',42,7,1),('H8',43,7,2),('H8',44,7,3),('H8',45,7,4),('H8',46,8,0),('H8',47,9,0),('H8',48,9,1),('H8',49,9,2),('H8',50,9,3),('H8',51,10,0),('H8',52,10,1),('H8',53,10,2),('H8',54,10,3),('H8',55,10,4),('H8',56,10,5),('H8',57,10,6),('H8',58,10,7),('H8',59,10,8),('H8',60,11,0),('H8',61,11,1),('H8',62,11,2),('H8',63,11,3),('H8',64,11,4),('H8',65,11,5),('H8',66,11,6),('H8',67,11,7),('H8',68,11,8),('H8',69,11,9),('H8',70,11,10),('H8',71,11,11),('H8',72,11,12),('H8',73,11,13),('H8',74,11,14),('H8',75,11,15),('H8',76,11,16),('H8',77,11,17),('H8',78,11,18),('H8',79,11,19),('H8',80,11,20),('H8',81,11,21),('H8',82,11,22),('H8',83,11,23),('H8',84,11,24),('H8',85,11,25),('H8',86,11,26),('H8',87,11,27),('H8',88,11,28),('H8',89,11,29),('H8',90,11,30),('H8',91,11,31),('H8',92,12,0),('H8',93,12,1),('H8',94,12,2),('H8',95,12,3),('H8',96,12,4),('H8',97,12,5),('H8',98,13,0),('H8',99,13,1),('H8',100,13,2),('H8',101,13,3),('H8',102,13,4),('H8',103,13,5),('H8',104,13,6),('H8',105,13,7),('H8',106,13,8),('H8',107,13,9),('H8',108,13,10),('H8',109,13,11),('H8',110,13,12),('H8',111,14,0),('H8',112,14,1),('H8',113,14,2),('H8',114,14,3),('H8',115,14,4),('H8',116,14,5),('H8',117,14,6),('H8',118,14,7),('H8',119,14,8),('H8',120,14,9),('H8',121,14,10),('H8',122,14,11),('H8',123,15,0),('H8',124,15,1),('H8',125,15,2),('H8',126,15,3),('H8',127,16,0),('H8',128,16,1),('H8',129,16,2),('H8',130,17,0),('H8',131,17,1),('H8',132,17,2),('H8',133,17,3),('H8',134,17,4),('H8',135,18,0),('H8',136,18,1),('H8',137,18,2),('H8',138,18,3),('H8',139,19,0),('H8',140,19,1),('H8',141,19,2),('H8',142,19,3),('H8',143,19,4),('H8',144,20,0),('H8',145,20,1),('H8',146,20,2),('H8',147,20,3),('H8',148,20,4),('H8',149,20,5),('H8',150,21,0),('H8',151,21,1),('H8',152,21,2),('H8',153,21,3),('H8',154,21,4),('H8',155,21,5),('H8',156,21,6),('H8',157,21,7),('H8',158,21,8),('H8',159,21,9),('H8',160,22,0),('H8',161,22,1),('H8',162,22,2),('H8',163,22,3),('H8',164,22,4),('H8',165,22,5),('H8',166,23,0),('H8',167,23,1),('H8',168,23,2),('H8',169,23,3),('H8',170,24,0),('H8',171,24,1),('H8',172,24,2),('H8',173,25,0),('H8',174,25,1),('H8',175,25,2),('H8',176,25,3),('H8',177,25,4),('H8',178,25,5),('H8',179,26,0),('H8',180,26,1),('H8',181,26,2),('H8',182,27,0),('H8',183,27,1),('H8',184,27,2),('H8',185,27,3),('H8',186,28,0),('H8',187,28,1),('H8',188,28,2),('H8',189,28,3),('H8',190,29,0),('H8',191,29,1),('H8',192,29,2),('H8',193,29,3),('H8',194,30,0),('H8',195,30,1),('H8',196,30,2),('H8',197,30,3),('H8',198,30,4),('H8',199,30,5),('H8',200,30,6),('H8',201,30,7),('H8',202,30,8),('H8',203,30,9),('H8',204,30,10),('H8',205,30,11),('H8',206,30,12),('H8',207,30,13),('H8',208,30,14),('H8',209,30,15),('H8',210,31,1),('H8',211,31,2),('H8',212,31,3),('H8',213,31,4),('H8',214,32,1),('H8',215,32,2),('H8',216,32,3),('H8',217,32,4),('H8',218,32,5),('H8',219,32,6),('H8',220,33,1),('H8',221,33,2),('H8',222,33,3),('H8',223,34,1),('H8',224,34,2),('H8',225,34,3),('H8',226,35,1),('H8',227,35,2),('H8',228,35,3),('H8',229,36,1),('H8',230,36,2),('H8',231,36,3),('H8',232,36,4),('H8',233,36,5),('H8',234,36,6),('H8',235,37,1),('H8',236,37,2),('H8',237,38,1),('H8',238,38,2),('H8',239,38,3),('H8',240,38,4),('H8',241,39,1),('H8',242,39,2),('H8',243,39,3),('H8',244,39,4),('H8',245,40,1),('H8',246,40,2),('H8',247,40,3),('H8',248,40,4),('H8',249,41,1),('H8',250,41,2),('H8',251,41,3),('H8',252,41,4),('H8',253,41,5),('H8',254,41,6),('H8',255,41,7),('H8',256,41,8),('H8',257,41,9),('H8',258,41,10),('H8',259,41,11),('H8',260,42,1),('H8',261,42,2),('H8',262,42,3),('H8',263,42,4),('H8',264,42,5),('H8',265,42,6),('H8',266,42,7),('H8',267,42,8),('H8',268,42,9),('H8',269,43,1),('H8',270,43,2),('H8',271,43,3),('H8',272,43,4),('H8',273,44,1),('H8',274,44,2),('H8',275,44,3),('H8',276,44,4),('H8',277,45,1),('H8',278,45,2),('H8',279,45,3),('H8',280,45,4),('H8',281,45,5),('H8',282,45,6),('H8',283,45,7),('H8',284,45,8),('H8',285,45,9),('H8',286,45,10),('H8',287,45,11),('H8',288,46,0),('H8',289,46,1),('H8',290,46,2),('H8',291,46,3),('H8',297,30,16),('H8',298,48,0),('H8',299,48,1),('H8',300,48,2),('H8',301,49,0),('H8',302,50,0),('H8',303,50,1),('H8',304,50,2);

/*Table structure for table `vtiger_role2profile` */

DROP TABLE IF EXISTS `vtiger_role2profile`;

CREATE TABLE `vtiger_role2profile` (
  `roleid` varchar(255) NOT NULL,
  `profileid` int(11) NOT NULL,
  PRIMARY KEY  (`roleid`,`profileid`),
  KEY `role2profile_roleid_profileid_idx` (`roleid`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_role2profile` */

insert  into `vtiger_role2profile`(`roleid`,`profileid`) values ('H11',2),('H16',2),('H2',1),('H3',2),('H3',5),('H4',2),('H5',5),('H8',5);

/*Table structure for table `vtiger_role_seq` */

DROP TABLE IF EXISTS `vtiger_role_seq`;

CREATE TABLE `vtiger_role_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_role_seq` */

insert  into `vtiger_role_seq`(`id`) values (16);

/*Table structure for table `vtiger_royality` */

DROP TABLE IF EXISTS `vtiger_royality`;

CREATE TABLE `vtiger_royality` (
  `royalityid` int(19) NOT NULL auto_increment,
  `royality_count` int(19) NOT NULL default '0',
  `royalityamount` decimal(19,2) NOT NULL,
  `from_date` date default NULL,
  `to_date` date default NULL,
  `deleted` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`royalityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_royality` */

/*Table structure for table `vtiger_royality_amount` */

DROP TABLE IF EXISTS `vtiger_royality_amount`;

CREATE TABLE `vtiger_royality_amount` (
  `id` int(19) NOT NULL auto_increment,
  `royality_count` int(19) NOT NULL default '0',
  `royalityamount` decimal(19,2) NOT NULL,
  `from_date` date default NULL,
  `to_date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_royality_amount` */

/*Table structure for table `vtiger_rss` */

DROP TABLE IF EXISTS `vtiger_rss`;

CREATE TABLE `vtiger_rss` (
  `rssid` int(19) NOT NULL,
  `rssurl` varchar(200) NOT NULL default '',
  `rsstitle` varchar(200) default NULL,
  `rsstype` int(10) default '0',
  `starred` int(1) default '0',
  PRIMARY KEY  (`rssid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_rss` */

insert  into `vtiger_rss`(`rssid`,`rssurl`,`rsstitle`,`rsstype`,`starred`) values (1,'http://forums.vtiger.com/rss.php?name=forums&file=rss','vtiger - Forums',0,0),(2,'http://trac.vtiger.com/cgi-bin/trac.cgi/report/8?format=rss&USER=anonymous','vtiger development - Active Tickets',0,0);

/*Table structure for table `vtiger_rss_seq` */

DROP TABLE IF EXISTS `vtiger_rss_seq`;

CREATE TABLE `vtiger_rss_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_rss_seq` */

insert  into `vtiger_rss_seq`(`id`) values (2);

/*Table structure for table `vtiger_sales_stage` */

DROP TABLE IF EXISTS `vtiger_sales_stage`;

CREATE TABLE `vtiger_sales_stage` (
  `sales_stage_id` int(19) NOT NULL auto_increment,
  `sales_stage` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`sales_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sales_stage` */

insert  into `vtiger_sales_stage`(`sales_stage_id`,`sales_stage`,`presence`,`picklist_valueid`) values (1,'Prospecting',1,150),(2,'Qualification',1,151),(3,'Needs Analysis',1,152),(4,'Value Proposition',1,153),(5,'Id. Decision Makers',1,154),(6,'Perception Analysis',1,155),(7,'Proposal/Price Quote',1,156),(8,'Negotiation/Review',1,157),(9,'Closed Won',0,158),(10,'Closed Lost',0,159);

/*Table structure for table `vtiger_sales_stage_seq` */

DROP TABLE IF EXISTS `vtiger_sales_stage_seq`;

CREATE TABLE `vtiger_sales_stage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sales_stage_seq` */

insert  into `vtiger_sales_stage_seq`(`id`) values (10);

/*Table structure for table `vtiger_salesman` */

DROP TABLE IF EXISTS `vtiger_salesman`;

CREATE TABLE `vtiger_salesman` (
  `id` int(19) NOT NULL auto_increment,
  `userid` int(19) NOT NULL default '0',
  `invoiceid` int(19) NOT NULL default '0',
  `amount` decimal(19,2) NOT NULL,
  `date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salesman` */

/*Table structure for table `vtiger_salesmanactivityrel` */

DROP TABLE IF EXISTS `vtiger_salesmanactivityrel`;

CREATE TABLE `vtiger_salesmanactivityrel` (
  `smid` int(19) NOT NULL default '0',
  `activityid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`smid`,`activityid`),
  KEY `salesmanactivityrel_activityid_idx` (`activityid`),
  KEY `salesmanactivityrel_smid_idx` (`smid`),
  CONSTRAINT `fk_2_vtiger_salesmanactivityrel` FOREIGN KEY (`smid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salesmanactivityrel` */

insert  into `vtiger_salesmanactivityrel`(`smid`,`activityid`) values (1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,232);

/*Table structure for table `vtiger_salesmanattachmentsrel` */

DROP TABLE IF EXISTS `vtiger_salesmanattachmentsrel`;

CREATE TABLE `vtiger_salesmanattachmentsrel` (
  `smid` int(19) NOT NULL default '0',
  `attachmentsid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`smid`,`attachmentsid`),
  KEY `salesmanattachmentsrel_smid_idx` (`smid`),
  KEY `salesmanattachmentsrel_attachmentsid_idx` (`attachmentsid`),
  CONSTRAINT `fk_2_vtiger_salesmanattachmentsrel` FOREIGN KEY (`attachmentsid`) REFERENCES `vtiger_attachments` (`attachmentsid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salesmanattachmentsrel` */

/*Table structure for table `vtiger_salesmanticketrel` */

DROP TABLE IF EXISTS `vtiger_salesmanticketrel`;

CREATE TABLE `vtiger_salesmanticketrel` (
  `smid` int(19) NOT NULL default '0',
  `id` int(19) NOT NULL default '0',
  PRIMARY KEY  (`smid`,`id`),
  KEY `salesmanticketrel_smid_idx` (`smid`),
  KEY `salesmanticketrel_id_idx` (`id`),
  CONSTRAINT `fk_2_vtiger_salesmanticketrel` FOREIGN KEY (`smid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salesmanticketrel` */

/*Table structure for table `vtiger_salesorder` */

DROP TABLE IF EXISTS `vtiger_salesorder`;

CREATE TABLE `vtiger_salesorder` (
  `salesorderid` int(19) NOT NULL default '0',
  `subject` varchar(100) default NULL,
  `potentialid` int(19) default NULL,
  `customerno` varchar(100) default NULL,
  `salesorder_no` varchar(100) default NULL,
  `quoteid` int(19) default NULL,
  `vendorterms` varchar(100) default NULL,
  `contactid` int(19) default NULL,
  `vendorid` int(19) default NULL,
  `duedate` date default NULL,
  `carrier` varchar(200) default NULL,
  `pending` varchar(200) default NULL,
  `type` varchar(100) default NULL,
  `adjustment` decimal(25,3) default NULL,
  `salescommission` decimal(25,3) default NULL,
  `exciseduty` decimal(25,3) default NULL,
  `total` decimal(25,3) default NULL,
  `subtotal` decimal(25,3) default NULL,
  `taxtype` varchar(25) default NULL,
  `discount_percent` decimal(25,3) default NULL,
  `discount_amount` decimal(25,3) default NULL,
  `s_h_amount` decimal(25,3) default NULL,
  `accountid` int(19) default NULL,
  `terms_conditions` text,
  `purchaseorder` varchar(200) default NULL,
  `sostatus` varchar(200) default NULL,
  `currency_id` int(19) NOT NULL default '1',
  `conversion_rate` decimal(10,3) NOT NULL default '1.000',
  `enable_recurring` int(11) default '0',
  PRIMARY KEY  (`salesorderid`),
  KEY `salesorder_vendorid_idx` (`vendorid`),
  KEY `salesorder_contactid_idx` (`contactid`),
  CONSTRAINT `fk_3_vtiger_salesorder` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salesorder` */

/*Table structure for table `vtiger_salesordercf` */

DROP TABLE IF EXISTS `vtiger_salesordercf`;

CREATE TABLE `vtiger_salesordercf` (
  `salesorderid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`salesorderid`),
  CONSTRAINT `fk_1_vtiger_salesordercf` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salesordercf` */

/*Table structure for table `vtiger_salesret` */

DROP TABLE IF EXISTS `vtiger_salesret`;

CREATE TABLE `vtiger_salesret` (
  `salesid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `customername` varchar(100) default NULL,
  `mobile` varchar(50) default NULL,
  `email` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_salesret` */

insert  into `vtiger_salesret`(`salesid`,`invoiceid`,`customername`,`mobile`,`email`) values (26,24,'','',''),(27,24,'','',''),(28,25,'','',''),(30,29,'','',''),(31,29,'','',''),(37,34,'Girish','9916024776',''),(41,34,'Girish','9916024776',''),(42,34,'Girish','9916024776',''),(43,34,'Girish','9916024776',''),(44,38,'','',''),(45,38,'','',''),(46,40,'','',''),(47,29,'','',''),(48,24,'','',''),(49,25,'','',''),(50,38,'','',''),(51,38,'','',''),(52,33,'','',''),(53,39,'','',''),(67,65,'Bajrang Singh','9916023654','ss@ss.com'),(145,143,'','',''),(161,157,'','','');

/*Table structure for table `vtiger_salesretcf` */

DROP TABLE IF EXISTS `vtiger_salesretcf`;

CREATE TABLE `vtiger_salesretcf` (
  `salesid` int(11) NOT NULL,
  PRIMARY KEY  (`salesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_salesretcf` */

insert  into `vtiger_salesretcf`(`salesid`) values (26),(27),(28),(30),(31),(37),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(67),(145),(161);

/*Table structure for table `vtiger_salesretgrouprel` */

DROP TABLE IF EXISTS `vtiger_salesretgrouprel`;

CREATE TABLE `vtiger_salesretgrouprel` (
  `salesid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`salesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_salesretgrouprel` */

/*Table structure for table `vtiger_salutationtype` */

DROP TABLE IF EXISTS `vtiger_salutationtype`;

CREATE TABLE `vtiger_salutationtype` (
  `salutationid` int(19) NOT NULL auto_increment,
  `salutationtype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`salutationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salutationtype` */

insert  into `vtiger_salutationtype`(`salutationid`,`salutationtype`,`presence`,`picklist_valueid`) values (1,'--None--',1,160),(2,'Mr.',1,161),(3,'Ms.',1,162),(4,'Mrs.',1,163),(5,'Dr.',1,164),(6,'Prof.',1,165);

/*Table structure for table `vtiger_salutationtype_seq` */

DROP TABLE IF EXISTS `vtiger_salutationtype_seq`;

CREATE TABLE `vtiger_salutationtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_salutationtype_seq` */

insert  into `vtiger_salutationtype_seq`(`id`) values (6);

/*Table structure for table `vtiger_seactivityrel` */

DROP TABLE IF EXISTS `vtiger_seactivityrel`;

CREATE TABLE `vtiger_seactivityrel` (
  `crmid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL,
  PRIMARY KEY  (`crmid`,`activityid`),
  KEY `seactivityrel_activityid_idx` (`activityid`),
  KEY `seactivityrel_crmid_idx` (`crmid`),
  CONSTRAINT `fk_2_vtiger_seactivityrel` FOREIGN KEY (`crmid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_seactivityrel` */

/*Table structure for table `vtiger_seactivityrel_seq` */

DROP TABLE IF EXISTS `vtiger_seactivityrel_seq`;

CREATE TABLE `vtiger_seactivityrel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_seactivityrel_seq` */

insert  into `vtiger_seactivityrel_seq`(`id`) values (1);

/*Table structure for table `vtiger_seattachmentsrel` */

DROP TABLE IF EXISTS `vtiger_seattachmentsrel`;

CREATE TABLE `vtiger_seattachmentsrel` (
  `crmid` int(19) NOT NULL default '0',
  `attachmentsid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`crmid`,`attachmentsid`),
  KEY `seattachmentsrel_attachmentsid_idx` (`attachmentsid`),
  KEY `seattachmentsrel_crmid_idx` (`crmid`),
  KEY `seattachmentsrel_attachmentsid_crmid_idx` (`attachmentsid`,`crmid`),
  CONSTRAINT `fk_2_vtiger_seattachmentsrel` FOREIGN KEY (`crmid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_seattachmentsrel` */

insert  into `vtiger_seattachmentsrel`(`crmid`,`attachmentsid`) values (106,107),(110,111),(140,141);

/*Table structure for table `vtiger_selectcolumn` */

DROP TABLE IF EXISTS `vtiger_selectcolumn`;

CREATE TABLE `vtiger_selectcolumn` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL default '0',
  `columnname` varchar(250) default '',
  PRIMARY KEY  (`queryid`,`columnindex`),
  KEY `selectcolumn_queryid_idx` (`queryid`),
  CONSTRAINT `fk_1_vtiger_selectcolumn` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_selectcolumn` */

insert  into `vtiger_selectcolumn`(`queryid`,`columnindex`,`columnname`) values (1,0,'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),(1,1,'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),(1,2,'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),(1,3,'vtiger_accountContacts:accountname:Contacts_Account_Name:account_id:V'),(1,4,'vtiger_account:industry:Accounts_industry:industry:V'),(1,5,'vtiger_contactdetails:email:Contacts_Email:email:E'),(2,0,'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),(2,1,'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),(2,2,'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),(2,3,'vtiger_accountContacts:accountname:Contacts_Account_Name:account_id:V'),(2,4,'vtiger_account:industry:Accounts_industry:industry:V'),(2,5,'vtiger_contactdetails:email:Contacts_Email:email:E'),(3,0,'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),(3,1,'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),(3,2,'vtiger_accountContacts:accountname:Contacts_Account_Name:account_id:V'),(3,3,'vtiger_contactdetails:email:Contacts_Email:email:E'),(3,4,'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),(3,5,'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),(4,0,'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),(4,1,'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),(4,2,'vtiger_leaddetails:company:Leads_Company:company:V'),(4,3,'vtiger_leaddetails:email:Leads_Email:email:E'),(4,4,'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),(5,0,'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),(5,1,'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),(5,2,'vtiger_leaddetails:company:Leads_Company:company:V'),(5,3,'vtiger_leaddetails:email:Leads_Email:email:E'),(5,4,'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),(5,5,'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V'),(6,0,'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),(6,1,'vtiger_potential:amount:Potentials_Amount:amount:N'),(6,2,'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),(6,3,'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),(6,4,'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),(7,0,'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),(7,1,'vtiger_potential:amount:Potentials_Amount:amount:N'),(7,2,'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),(7,3,'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),(7,4,'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),(8,0,'vtiger_activity:subject:Calendar_Subject:subject:V'),(8,1,'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),(8,2,'vtiger_activity:status:Calendar_Status:taskstatus:V'),(8,3,'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),(8,4,'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),(9,0,'vtiger_activity:subject:Calendar_Subject:subject:V'),(9,1,'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),(9,2,'vtiger_activity:status:Calendar_Status:taskstatus:V'),(9,3,'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),(9,4,'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),(10,0,'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),(10,1,'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),(10,2,'vtiger_products:productname:Products_Product_Name:productname:V'),(10,3,'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),(10,4,'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),(10,5,'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),(11,0,'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),(11,1,'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),(11,2,'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),(11,3,'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),(11,4,'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),(11,5,'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),(12,0,'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),(12,1,'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),(12,2,'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),(12,3,'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),(12,4,'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),(12,5,'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),(13,0,'vtiger_products:productname:Products_Product_Name:productname:V'),(13,1,'vtiger_products:productcode:Products_Product_Code:productcode:V'),(13,2,'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),(13,3,'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),(13,4,'vtiger_products:website:Products_Website:website:V'),(13,5,'vtiger_vendorRelProducts:vendorname:Products_Vendor_Name:vendor_id:I'),(13,6,'vtiger_products:mfr_part_no:Products_Mfr_PartNo:mfr_part_no:V'),(14,0,'vtiger_products:productname:Products_Product_Name:productname:V'),(14,1,'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),(14,2,'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),(14,3,'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),(14,4,'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),(14,5,'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),(15,0,'vtiger_quotes:subject:Quotes_Subject:subject:V'),(15,1,'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),(15,2,'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),(15,3,'vtiger_contactdetailsQuotes:lastname:Quotes_Contact_Name:contact_id:V'),(15,4,'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),(15,5,'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),(16,0,'vtiger_quotes:subject:Quotes_Subject:subject:V'),(16,1,'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),(16,2,'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),(16,3,'vtiger_contactdetailsQuotes:lastname:Quotes_Contact_Name:contact_id:V'),(16,4,'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),(16,5,'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),(16,6,'vtiger_quotes:carrier:Quotes_Carrier:carrier:V'),(16,7,'vtiger_quotes:shipping:Quotes_Shipping:shipping:V'),(17,0,'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),(17,1,'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),(17,2,'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),(17,3,'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),(17,4,'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),(17,5,'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),(17,6,'vtiger_contactdetails:email:Contacts_Email:email:E'),(18,0,'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),(18,1,'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),(18,2,'vtiger_purchaseorder:requisition_no:PurchaseOrder_Requisition_No:requisition_no:V'),(18,3,'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),(18,4,'vtiger_contactdetailsPurchaseOrder:lastname:PurchaseOrder_Contact_Name:contact_id:I'),(18,5,'vtiger_purchaseorder:carrier:PurchaseOrder_Carrier:carrier:V'),(18,6,'vtiger_purchaseorder:salescommission:PurchaseOrder_Sales_Commission:salescommission:N'),(18,7,'vtiger_purchaseorder:exciseduty:PurchaseOrder_Excise_Duty:exciseduty:N'),(18,8,'vtiger_usersPurchaseOrder:user_name:PurchaseOrder_Assigned_To:assigned_user_id:V'),(19,0,'vtiger_invoice:subject:Invoice_Subject:subject:V'),(19,1,'vtiger_invoice:salesorderid:Invoice_Sales_Order:salesorder_id:I'),(19,2,'vtiger_invoice:customerno:Invoice_Customer_No:customerno:V'),(19,3,'vtiger_invoice:exciseduty:Invoice_Excise_Duty:exciseduty:N'),(19,4,'vtiger_invoice:salescommission:Invoice_Sales_Commission:salescommission:N'),(19,5,'vtiger_accountInvoice:accountname:Invoice_Account_Name:account_id:I'),(20,0,'vtiger_salesorder:subject:SalesOrder_Subject:subject:V'),(20,1,'vtiger_quotesSalesOrder:subject:SalesOrder_Quote_Name:quote_id:I'),(20,2,'vtiger_contactdetailsSalesOrder:lastname:SalesOrder_Contact_Name:contact_id:I'),(20,3,'vtiger_salesorder:duedate:SalesOrder_Due_Date:duedate:D'),(20,4,'vtiger_salesorder:carrier:SalesOrder_Carrier:carrier:V'),(20,5,'vtiger_salesorder:sostatus:SalesOrder_Status:sostatus:V'),(20,6,'vtiger_accountSalesOrder:accountname:SalesOrder_Account_Name:account_id:I'),(20,7,'vtiger_salesorder:salescommission:SalesOrder_Sales_Commission:salescommission:N'),(20,8,'vtiger_salesorder:exciseduty:SalesOrder_Excise_Duty:exciseduty:N'),(20,9,'vtiger_usersSalesOrder:user_name:SalesOrder_Assigned_To:assigned_user_id:V'),(21,0,'vtiger_campaign:campaignname:Campaigns_Campaign_Name:campaignname:V'),(21,1,'vtiger_campaign:campaigntype:Campaigns_Campaign_Type:campaigntype:V'),(21,2,'vtiger_campaign:targetaudience:Campaigns_Target_Audience:targetaudience:V'),(21,3,'vtiger_campaign:budgetcost:Campaigns_Budget_Cost:budgetcost:I'),(21,4,'vtiger_campaign:actualcost:Campaigns_Actual_Cost:actualcost:I'),(21,5,'vtiger_campaign:expectedrevenue:Campaigns_Expected_Revenue:expectedrevenue:I'),(21,6,'vtiger_campaign:expectedsalescount:Campaigns_Expected_Sales_Count:expectedsalescount:N'),(21,7,'vtiger_campaign:actualsalescount:Campaigns_Actual_Sales_Count:actualsalescount:N'),(21,8,'vtiger_usersCampaigns:user_name:Campaigns_Assigned_To:assigned_user_id:V');

/*Table structure for table `vtiger_selectquery` */

DROP TABLE IF EXISTS `vtiger_selectquery`;

CREATE TABLE `vtiger_selectquery` (
  `queryid` int(19) NOT NULL,
  `startindex` int(19) default '0',
  `numofobjects` int(19) default '0',
  PRIMARY KEY  (`queryid`),
  KEY `selectquery_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_selectquery` */

insert  into `vtiger_selectquery`(`queryid`,`startindex`,`numofobjects`) values (1,0,0),(2,0,0),(3,0,0),(4,0,0),(5,0,0),(6,0,0),(7,0,0),(8,0,0),(9,0,0),(10,0,0),(11,0,0),(12,0,0),(13,0,0),(14,0,0),(15,0,0),(16,0,0),(17,0,0),(18,0,0),(19,0,0),(20,0,0),(21,0,0);

/*Table structure for table `vtiger_selectquery_seq` */

DROP TABLE IF EXISTS `vtiger_selectquery_seq`;

CREATE TABLE `vtiger_selectquery_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_selectquery_seq` */

insert  into `vtiger_selectquery_seq`(`id`) values (21);

/*Table structure for table `vtiger_senotesrel` */

DROP TABLE IF EXISTS `vtiger_senotesrel`;

CREATE TABLE `vtiger_senotesrel` (
  `crmid` int(19) NOT NULL default '0',
  `notesid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`crmid`,`notesid`),
  KEY `senotesrel_notesid_idx` (`notesid`),
  KEY `senotesrel_crmid_idx` (`crmid`),
  CONSTRAINT `fk_2_vtiger_senotesrel` FOREIGN KEY (`notesid`) REFERENCES `vtiger_notes` (`notesid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_senotesrel` */

/*Table structure for table `vtiger_seproductsrel` */

DROP TABLE IF EXISTS `vtiger_seproductsrel`;

CREATE TABLE `vtiger_seproductsrel` (
  `crmid` int(19) NOT NULL default '0',
  `productid` int(19) NOT NULL default '0',
  `setype` varchar(30) NOT NULL,
  PRIMARY KEY  (`crmid`,`productid`),
  KEY `seproductsrel_productid_idx` (`productid`),
  KEY `seproductrel_crmid_idx` (`crmid`),
  CONSTRAINT `fk_2_vtiger_seproductsrel` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_seproductsrel` */

/*Table structure for table `vtiger_service` */

DROP TABLE IF EXISTS `vtiger_service`;

CREATE TABLE `vtiger_service` (
  `serviceid` int(11) NOT NULL,
  `service_no` varchar(100) NOT NULL,
  `servicename` varchar(50) NOT NULL,
  `servicecategory` varchar(200) default NULL,
  `qty_per_unit` decimal(11,2) default '0.00',
  `unit_price` decimal(25,2) default NULL,
  `sales_start_date` date default NULL,
  `sales_end_date` date default NULL,
  `start_date` date default NULL,
  `expiry_date` date default NULL,
  `discontinued` int(1) NOT NULL default '0',
  `service_usageunit` varchar(200) default NULL,
  `handler` int(11) default NULL,
  `website` varchar(100) default NULL,
  `taxclass` varchar(200) default NULL,
  `currency_id` int(19) NOT NULL default '1',
  `commissionrate` decimal(7,3) default NULL,
  PRIMARY KEY  (`serviceid`),
  CONSTRAINT `fk_1_vtiger_service` FOREIGN KEY (`serviceid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_service` */

/*Table structure for table `vtiger_service_usageunit` */

DROP TABLE IF EXISTS `vtiger_service_usageunit`;

CREATE TABLE `vtiger_service_usageunit` (
  `service_usageunitid` int(11) NOT NULL auto_increment,
  `service_usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`service_usageunitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_service_usageunit` */

insert  into `vtiger_service_usageunit`(`service_usageunitid`,`service_usageunit`,`presence`,`picklist_valueid`) values (1,'Hours',1,226),(2,'Days',1,227),(3,'Incidents',1,228);

/*Table structure for table `vtiger_service_usageunit_seq` */

DROP TABLE IF EXISTS `vtiger_service_usageunit_seq`;

CREATE TABLE `vtiger_service_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_service_usageunit_seq` */

insert  into `vtiger_service_usageunit_seq`(`id`) values (3);

/*Table structure for table `vtiger_servicecategory` */

DROP TABLE IF EXISTS `vtiger_servicecategory`;

CREATE TABLE `vtiger_servicecategory` (
  `servicecategoryid` int(11) NOT NULL auto_increment,
  `servicecategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`servicecategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_servicecategory` */

insert  into `vtiger_servicecategory`(`servicecategoryid`,`servicecategory`,`presence`,`picklist_valueid`) values (1,'--None--',1,229),(2,'Support',1,230),(3,'Installation',1,231),(4,'Migration',1,232),(5,'Customization',1,233),(6,'Training',1,234);

/*Table structure for table `vtiger_servicecategory_seq` */

DROP TABLE IF EXISTS `vtiger_servicecategory_seq`;

CREATE TABLE `vtiger_servicecategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_servicecategory_seq` */

insert  into `vtiger_servicecategory_seq`(`id`) values (6);

/*Table structure for table `vtiger_servicecf` */

DROP TABLE IF EXISTS `vtiger_servicecf`;

CREATE TABLE `vtiger_servicecf` (
  `serviceid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_servicecf` */

/*Table structure for table `vtiger_servicecontracts` */

DROP TABLE IF EXISTS `vtiger_servicecontracts`;

CREATE TABLE `vtiger_servicecontracts` (
  `servicecontractsid` int(11) default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `sc_related_to` int(11) default NULL,
  `tracking_unit` varchar(100) default NULL,
  `total_units` decimal(5,2) default NULL,
  `used_units` decimal(5,2) default NULL,
  `subject` varchar(100) default NULL,
  `due_date` date default NULL,
  `planned_duration` varchar(256) default NULL,
  `actual_duration` varchar(256) default NULL,
  `contract_status` varchar(200) default NULL,
  `priority` varchar(200) default NULL,
  `contract_type` varchar(200) default NULL,
  `progress` decimal(5,2) default NULL,
  `contract_no` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_servicecontracts` */

/*Table structure for table `vtiger_servicecontractscf` */

DROP TABLE IF EXISTS `vtiger_servicecontractscf`;

CREATE TABLE `vtiger_servicecontractscf` (
  `servicecontractsid` int(11) NOT NULL,
  PRIMARY KEY  (`servicecontractsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_servicecontractscf` */

/*Table structure for table `vtiger_seticketsrel` */

DROP TABLE IF EXISTS `vtiger_seticketsrel`;

CREATE TABLE `vtiger_seticketsrel` (
  `crmid` int(19) NOT NULL default '0',
  `ticketid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`crmid`,`ticketid`),
  KEY `seticketsrel_crmid_idx` (`crmid`),
  KEY `seticketsrel_ticketid_idx` (`ticketid`),
  CONSTRAINT `fk_2_vtiger_seticketsrel` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_seticketsrel` */

/*Table structure for table `vtiger_settings_blocks` */

DROP TABLE IF EXISTS `vtiger_settings_blocks`;

CREATE TABLE `vtiger_settings_blocks` (
  `blockid` int(19) NOT NULL,
  `label` varchar(250) default NULL,
  `sequence` int(19) default NULL,
  PRIMARY KEY  (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_settings_blocks` */

insert  into `vtiger_settings_blocks`(`blockid`,`label`,`sequence`) values (1,'LBL_MODULE_MANAGER',1),(2,'LBL_USER_MANAGEMENT',2),(3,'LBL_STUDIO',3),(4,'LBL_COMMUNICATION_TEMPLATES',4),(5,'LBL_OTHER_SETTINGS',5);

/*Table structure for table `vtiger_settings_blocks_seq` */

DROP TABLE IF EXISTS `vtiger_settings_blocks_seq`;

CREATE TABLE `vtiger_settings_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_settings_blocks_seq` */

insert  into `vtiger_settings_blocks_seq`(`id`) values (5);

/*Table structure for table `vtiger_settings_field` */

DROP TABLE IF EXISTS `vtiger_settings_field`;

CREATE TABLE `vtiger_settings_field` (
  `fieldid` int(19) NOT NULL,
  `blockid` int(19) default NULL,
  `name` varchar(250) default NULL,
  `iconpath` varchar(300) default NULL,
  `description` text,
  `linkto` text,
  `sequence` int(19) default NULL,
  `active` int(19) default '0',
  PRIMARY KEY  (`fieldid`),
  KEY `fk_1_vtiger_settings_field` (`blockid`),
  CONSTRAINT `fk_1_vtiger_settings_field` FOREIGN KEY (`blockid`) REFERENCES `vtiger_settings_blocks` (`blockid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_settings_field` */

insert  into `vtiger_settings_field`(`fieldid`,`blockid`,`name`,`iconpath`,`description`,`linkto`,`sequence`,`active`) values (1,2,'LBL_USERS','ico-users.gif','LBL_USER_DESCRIPTION','index.php?module=Administration&action=index&parenttab=Settings',1,0),(2,2,'LBL_ROLES','ico-roles.gif','LBL_ROLE_DESCRIPTION','index.php?module=Settings&action=listroles&parenttab=Settings',2,0),(3,2,'LBL_PROFILES','ico-profile.gif','LBL_PROFILE_DESCRIPTION','index.php?module=Settings&action=ListProfiles&parenttab=Settings',3,0),(4,2,'USERGROUPLIST','ico-groups.gif','LBL_GROUP_DESCRIPTION','index.php?module=Settings&action=listgroups&parenttab=Settings',4,1),(5,2,'LBL_SHARING_ACCESS','shareaccess.gif','LBL_SHARING_ACCESS_DESCRIPTION','index.php?module=Settings&action=OrgSharingDetailView&parenttab=Settings',5,0),(6,2,'LBL_FIELDS_ACCESS','orgshar.gif','LBL_SHARING_FIELDS_DESCRIPTION','index.php?module=Settings&action=DefaultFieldPermissions&parenttab=Settings',6,1),(7,2,'LBL_AUDIT_TRAIL','audit.gif','LBL_AUDIT_DESCRIPTION','index.php?module=Settings&action=AuditTrailList&parenttab=Settings',7,1),(8,2,'LBL_LOGIN_HISTORY_DETAILS','set-IcoLoginHistory.gif','LBL_LOGIN_HISTORY_DESCRIPTION','index.php?module=Settings&action=ListLoginHistory&parenttab=Settings',8,0),(9,3,'VTLIB_LBL_MODULE_MANAGER','vtlib_modmng.gif','VTLIB_LBL_MODULE_MANAGER_DESCRIPTION','index.php?module=Settings&action=ModuleManager&parenttab=Settings',1,1),(10,3,'LBL_PICKLIST_EDITOR','picklist.gif','LBL_PICKLIST_DESCRIPTION','index.php?module=PickList&action=PickList&parenttab=Settings',2,1),(11,4,'EMAILTEMPLATES','ViewTemplate.gif','LBL_EMAIL_TEMPLATE_DESCRIPTION','index.php?module=Settings&action=listemailtemplates&parenttab=Settings',3,0),(12,4,'LBL_MAIL_MERGE','mailmarge.gif','LBL_MAIL_MERGE_DESCRIPTION','index.php?module=Settings&action=listwordtemplates&parenttab=Settings',4,1),(13,4,'NOTIFICATIONSCHEDULERS','notification.gif','LBL_NOTIF_SCHED_DESCRIPTION','index.php?module=Settings&action=listnotificationschedulers&parenttab=Settings',1,1),(14,4,'INVENTORYNOTIFICATION','inventory.gif','LBL_INV_NOTIF_DESCRIPTION','index.php?module=Settings&action=listinventorynotifications&parenttab=Settings',2,0),(15,4,'LBL_COMPANY_DETAILS','company.gif','LBL_COMPANY_DESCRIPTION','index.php?module=Settings&action=OrganizationConfig&parenttab=Settings',3,0),(16,5,'LBL_MAIL_SERVER_SETTINGS','ogmailserver.gif','LBL_MAIL_SERVER_DESCRIPTION','index.php?module=Settings&action=EmailConfig&parenttab=Settings',4,0),(17,5,'LBL_BACKUP_SERVER_SETTINGS','backupserver.gif','LBL_BACKUP_SERVER_DESCRIPTION','index.php?module=Settings&action=BackupServerConfig&parenttab=Settings',5,0),(18,5,'LBL_ASSIGN_MODULE_OWNERS','assign.gif','LBL_MODULE_OWNERS_DESCRIPTION','index.php?module=Settings&action=ListModuleOwners&parenttab=Settings',6,1),(19,5,'LBL_CURRENCY_SETTINGS','currency.gif','LBL_CURRENCY_DESCRIPTION','index.php?module=Settings&action=CurrencyListView&parenttab=Settings',1,1),(20,5,'LBL_TAX_SETTINGS','taxConfiguration.gif','LBL_TAX_DESCRIPTION','index.php?module=Settings&action=TaxConfig&parenttab=Settings',2,0),(21,5,'LBL_SYSTEM_INFO','system.gif','LBL_SYSTEM_DESCRIPTION','index.php?module=System&action=listsysconfig&parenttab=Settings',3,1),(22,5,'LBL_PROXY_SETTINGS','proxy.gif','LBL_PROXY_DESCRIPTION','index.php?module=Settings&action=ProxyServerConfig&parenttab=Settings',4,1),(23,5,'LBL_ANNOUNCEMENT','announ.gif','LBL_ANNOUNCEMENT_DESCRIPTION','index.php?module=Settings&action=Announcements&parenttab=Settings',5,0),(24,5,'LBL_DEFAULT_MODULE_VIEW','set-IcoTwoTabConfig.gif','LBL_DEFAULT_MODULE_VIEW_DESC','index.php?module=Settings&action=DefModuleView&parenttab=Settings',6,1),(25,5,'INVENTORYTERMSANDCONDITIONS','terms.gif','LBL_INV_TANDC_DESCRIPTION','index.php?module=Settings&action=OrganizationTermsandConditions&parenttab=Settings',7,0),(26,5,'LBL_CUSTOMIZE_MODENT_NUMBER','settingsInvNumber.gif','LBL_CUSTOMIZE_MODENT_NUMBER_DESCRIPTION','index.php?module=Settings&action=CustomModEntityNo&parenttab=Settings',8,0),(27,5,'LBL_MAIL_SCANNER','mailScanner.gif','LBL_MAIL_SCANNER_DESCRIPTION','index.php?module=Settings&action=MailScanner&parenttab=Settings',9,1),(28,5,'LBL_LIST_WORKFLOWS','settingsWorkflow.png','LBL_LIST_WORKFLOWS_DESCRIPTION','index.php?module=com_vtiger_workflow&action=workflowlist&parenttab=Settings',10,1),(29,1,'LBL_WORKFLOW_LIST','settingsWorkflow.png','LBL_AVAILABLE_WORKLIST_LIST','index.php?module=com_vtiger_workflow&action=workflowlist',1,1),(30,5,'LBL_CUSTOMER_PORTAL','portal_icon.png','PORTAL_EXTENSION_DESCRIPTION','index.php?module=CustomerPortal&action=index&parenttab=Settings',11,1),(31,1,'LBL_FIELDFORMULAS','modules/FieldFormulas/resources/FieldFormulas.png','LBL_FIELDFORMULAS_DESCRIPTION','index.php?module=FieldFormulas&action=index&parenttab=Settings',12,0),(32,1,'LBL_TOOLTIP_MANAGEMENT','quickview.png','LBL_TOOLTIP_MANAGEMENT_DESCRIPTION','index.php?module=Tooltip&action=QuickView&parenttab=Settings',NULL,0),(33,2,'LBL_WAREHOUSE_DETAILS','set-warehouse.gif','LBL_WAREHOUSE_HISTORY_DESCRIPTION','index.php?module=Settings&action=ListWarehouse&parenttab=Settings',9,0),(34,5,'LBL_LIFO_FIFO_DETAILS','picklist.gif','LBL_STOCK_LIFO_FIFO_DESCRIPTION','index.php?module=Settings&action=StockStatus&parenttab=Settings',9,0);

/*Table structure for table `vtiger_settings_field_seq` */

DROP TABLE IF EXISTS `vtiger_settings_field_seq`;

CREATE TABLE `vtiger_settings_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_settings_field_seq` */

insert  into `vtiger_settings_field_seq`(`id`) values (32);

/*Table structure for table `vtiger_sharedcalendar` */

DROP TABLE IF EXISTS `vtiger_sharedcalendar`;

CREATE TABLE `vtiger_sharedcalendar` (
  `userid` int(19) NOT NULL,
  `sharedid` int(19) NOT NULL,
  PRIMARY KEY  (`userid`,`sharedid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sharedcalendar` */

/*Table structure for table `vtiger_shippingtaxinfo` */

DROP TABLE IF EXISTS `vtiger_shippingtaxinfo`;

CREATE TABLE `vtiger_shippingtaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) default NULL,
  `taxlabel` varchar(50) default NULL,
  `percentage` decimal(7,3) default NULL,
  `deleted` int(1) default NULL,
  PRIMARY KEY  (`taxid`),
  KEY `shippingtaxinfo_taxname_idx` (`taxname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_shippingtaxinfo` */

insert  into `vtiger_shippingtaxinfo`(`taxid`,`taxname`,`taxlabel`,`percentage`,`deleted`) values (1,'shtax1','VAT','4.500',0),(2,'shtax2','Sales','10.000',0),(3,'shtax3','Service','12.500',0);

/*Table structure for table `vtiger_shippingtaxinfo_seq` */

DROP TABLE IF EXISTS `vtiger_shippingtaxinfo_seq`;

CREATE TABLE `vtiger_shippingtaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_shippingtaxinfo_seq` */

insert  into `vtiger_shippingtaxinfo_seq`(`id`) values (3);

/*Table structure for table `vtiger_smsnotifier` */

DROP TABLE IF EXISTS `vtiger_smsnotifier`;

CREATE TABLE `vtiger_smsnotifier` (
  `smsnotifierid` int(11) default NULL,
  `message` text,
  `status` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_smsnotifier` */

/*Table structure for table `vtiger_smsnotifier_servers` */

DROP TABLE IF EXISTS `vtiger_smsnotifier_servers`;

CREATE TABLE `vtiger_smsnotifier_servers` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(255) default NULL,
  `isactive` int(1) default NULL,
  `providertype` varchar(50) default NULL,
  `username` varchar(255) default NULL,
  `parameters` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_smsnotifier_servers` */

/*Table structure for table `vtiger_smsnotifier_status` */

DROP TABLE IF EXISTS `vtiger_smsnotifier_status`;

CREATE TABLE `vtiger_smsnotifier_status` (
  `smsnotifierid` int(11) default NULL,
  `tonumber` varchar(20) default NULL,
  `status` varchar(10) default NULL,
  `smsmessageid` varchar(50) default NULL,
  `needlookup` int(1) default '1',
  `statusid` int(11) NOT NULL auto_increment,
  `statusmessage` varchar(100) default NULL,
  PRIMARY KEY  (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_smsnotifier_status` */

/*Table structure for table `vtiger_smsnotifiercf` */

DROP TABLE IF EXISTS `vtiger_smsnotifiercf`;

CREATE TABLE `vtiger_smsnotifiercf` (
  `smsnotifierid` int(11) NOT NULL,
  PRIMARY KEY  (`smsnotifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_smsnotifiercf` */

/*Table structure for table `vtiger_soapservice` */

DROP TABLE IF EXISTS `vtiger_soapservice`;

CREATE TABLE `vtiger_soapservice` (
  `id` int(19) default NULL,
  `type` varchar(25) default NULL,
  `sessionid` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_soapservice` */

/*Table structure for table `vtiger_sobillads` */

DROP TABLE IF EXISTS `vtiger_sobillads`;

CREATE TABLE `vtiger_sobillads` (
  `sobilladdressid` int(19) NOT NULL default '0',
  `bill_city` varchar(30) default NULL,
  `bill_code` varchar(30) default NULL,
  `bill_country` varchar(30) default NULL,
  `bill_state` varchar(30) default NULL,
  `bill_street` varchar(250) default NULL,
  `bill_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`sobilladdressid`),
  CONSTRAINT `fk_1_vtiger_sobillads` FOREIGN KEY (`sobilladdressid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sobillads` */

/*Table structure for table `vtiger_soshipads` */

DROP TABLE IF EXISTS `vtiger_soshipads`;

CREATE TABLE `vtiger_soshipads` (
  `soshipaddressid` int(19) NOT NULL default '0',
  `ship_city` varchar(30) default NULL,
  `ship_code` varchar(30) default NULL,
  `ship_country` varchar(30) default NULL,
  `ship_state` varchar(30) default NULL,
  `ship_street` varchar(250) default NULL,
  `ship_pobox` varchar(30) default NULL,
  PRIMARY KEY  (`soshipaddressid`),
  CONSTRAINT `fk_1_vtiger_soshipads` FOREIGN KEY (`soshipaddressid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_soshipads` */

/*Table structure for table `vtiger_sostatus` */

DROP TABLE IF EXISTS `vtiger_sostatus`;

CREATE TABLE `vtiger_sostatus` (
  `sostatusid` int(19) NOT NULL auto_increment,
  `sostatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`sostatusid`),
  UNIQUE KEY `sostatus_sostatus_idx` (`sostatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sostatus` */

insert  into `vtiger_sostatus`(`sostatusid`,`sostatus`,`presence`,`picklist_valueid`) values (1,'Created',0,166),(2,'Approved',0,167),(3,'Delivered',0,168),(4,'Cancelled',0,169);

/*Table structure for table `vtiger_sostatus_seq` */

DROP TABLE IF EXISTS `vtiger_sostatus_seq`;

CREATE TABLE `vtiger_sostatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sostatus_seq` */

insert  into `vtiger_sostatus_seq`(`id`) values (4);

/*Table structure for table `vtiger_sostatushistory` */

DROP TABLE IF EXISTS `vtiger_sostatushistory`;

CREATE TABLE `vtiger_sostatushistory` (
  `historyid` int(19) NOT NULL auto_increment,
  `salesorderid` int(19) NOT NULL,
  `accountname` varchar(100) default NULL,
  `total` decimal(10,0) default NULL,
  `sostatus` varchar(200) default NULL,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`historyid`),
  KEY `sostatushistory_salesorderid_idx` (`salesorderid`),
  CONSTRAINT `fk_1_vtiger_sostatushistory` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_sostatushistory` */

/*Table structure for table `vtiger_status` */

DROP TABLE IF EXISTS `vtiger_status`;

CREATE TABLE `vtiger_status` (
  `statusid` int(19) NOT NULL auto_increment,
  `status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_status` */

insert  into `vtiger_status`(`statusid`,`status`,`presence`,`picklist_valueid`) values (1,'Active',0,1),(2,'Inactive',1,1);

/*Table structure for table `vtiger_status_seq` */

DROP TABLE IF EXISTS `vtiger_status_seq`;

CREATE TABLE `vtiger_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_status_seq` */

insert  into `vtiger_status_seq`(`id`) values (2);

/*Table structure for table `vtiger_stockadjust` */

DROP TABLE IF EXISTS `vtiger_stockadjust`;

CREATE TABLE `vtiger_stockadjust` (
  `stockadjusttid` int(11) NOT NULL auto_increment,
  `warehouse_store_id` int(11) default NULL,
  `productid` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `stocktotal` int(11) NOT NULL,
  `adjustqty` int(11) NOT NULL,
  `debitdate` date default NULL,
  `adj_comments` varchar(200) NOT NULL,
  PRIMARY KEY  (`stockadjusttid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_stockadjust` */

insert  into `vtiger_stockadjust`(`stockadjusttid`,`warehouse_store_id`,`productid`,`product_name`,`stocktotal`,`adjustqty`,`debitdate`,`adj_comments`) values (1,3,18,'Curtain Cloth Hippo',18,3,'2012-08-21','Due to rain'),(2,3,18,'Curtain Cloth Hippo',15,3,'2012-08-23','due to rain'),(3,3,156,'Ashirwad',35,1,'2012-10-23','Due to rain');

/*Table structure for table `vtiger_stockadjustcf` */

DROP TABLE IF EXISTS `vtiger_stockadjustcf`;

CREATE TABLE `vtiger_stockadjustcf` (
  `stockadjustid` int(11) NOT NULL,
  PRIMARY KEY  (`stockadjustid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_stockadjustcf` */

/*Table structure for table `vtiger_stockadjustgrouprel` */

DROP TABLE IF EXISTS `vtiger_stockadjustgrouprel`;

CREATE TABLE `vtiger_stockadjustgrouprel` (
  `stockadjustid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`stockadjustid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_stockadjustgrouprel` */

/*Table structure for table `vtiger_systems` */

DROP TABLE IF EXISTS `vtiger_systems`;

CREATE TABLE `vtiger_systems` (
  `id` int(19) NOT NULL,
  `server` varchar(100) default NULL,
  `server_port` int(19) default NULL,
  `server_username` varchar(100) default NULL,
  `server_password` varchar(100) default NULL,
  `server_type` varchar(20) default NULL,
  `smtp_auth` varchar(5) default NULL,
  `server_path` varchar(256) default NULL,
  `from_email_field` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_systems` */

/*Table structure for table `vtiger_systems_seq` */

DROP TABLE IF EXISTS `vtiger_systems_seq`;

CREATE TABLE `vtiger_systems_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_systems_seq` */

/*Table structure for table `vtiger_tab` */

DROP TABLE IF EXISTS `vtiger_tab`;

CREATE TABLE `vtiger_tab` (
  `tabid` int(19) NOT NULL default '0',
  `name` varchar(25) NOT NULL,
  `presence` int(19) NOT NULL default '1',
  `tabsequence` int(10) default NULL,
  `tablabel` varchar(25) NOT NULL,
  `modifiedby` int(19) default NULL,
  `modifiedtime` int(19) default NULL,
  `customized` int(19) default NULL,
  `ownedby` int(19) default NULL,
  `isentitytype` int(11) NOT NULL default '1',
  `version` varchar(10) default NULL,
  PRIMARY KEY  (`tabid`),
  UNIQUE KEY `tab_name_idx` (`name`),
  KEY `tab_modifiedby_idx` (`modifiedby`),
  KEY `tab_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tab` */

insert  into `vtiger_tab`(`tabid`,`name`,`presence`,`tabsequence`,`tablabel`,`modifiedby`,`modifiedtime`,`customized`,`ownedby`,`isentitytype`,`version`) values (1,'Dashboard',1,12,'Dashboards',NULL,NULL,0,1,0,NULL),(2,'Potentials',1,7,'Potentials',NULL,NULL,0,0,1,NULL),(3,'Home',0,1,'Home',NULL,NULL,0,1,0,NULL),(4,'Contacts',0,6,'Contacts',NULL,NULL,0,0,1,NULL),(6,'Accounts',1,5,'Accounts',NULL,NULL,0,0,1,NULL),(7,'Leads',1,4,'Leads',NULL,NULL,0,0,1,NULL),(8,'Documents',1,9,'Documents',NULL,NULL,0,0,1,NULL),(9,'Calendar',1,3,'Calendar',NULL,NULL,0,0,1,NULL),(10,'Emails',0,10,'Emails',NULL,NULL,0,1,1,NULL),(13,'HelpDesk',1,11,'HelpDesk',NULL,NULL,0,0,1,NULL),(14,'Products',0,8,'Products',NULL,NULL,0,1,1,NULL),(15,'Faq',1,14,'Faq',NULL,NULL,0,1,1,NULL),(16,'Events',2,13,'Events',NULL,NULL,0,0,1,NULL),(18,'Vendors',0,15,'Vendors',NULL,NULL,0,1,1,NULL),(19,'PriceBooks',1,16,'PriceBooks',NULL,NULL,0,1,1,NULL),(20,'Quotes',1,17,'Quotes',NULL,NULL,0,0,1,NULL),(21,'PurchaseOrder',0,18,'PurchaseOrder',NULL,NULL,0,0,1,NULL),(22,'SalesOrder',1,19,'SalesOrder',NULL,NULL,0,0,1,NULL),(23,'Invoice',0,20,'Invoice',NULL,NULL,0,0,1,NULL),(24,'Rss',1,21,'Rss',NULL,NULL,0,1,0,NULL),(25,'Reports',1,22,'Reports',NULL,NULL,0,1,0,NULL),(26,'Campaigns',1,23,'Campaigns',NULL,NULL,0,0,1,NULL),(27,'Portal',1,24,'Portal',NULL,NULL,0,1,0,NULL),(28,'Webmails',1,25,'Webmails',NULL,NULL,0,1,1,NULL),(29,'Users',0,26,'Users',NULL,NULL,0,1,0,NULL),(30,'Mobile',0,27,'Mobile',NULL,NULL,1,0,0,'1.2.1'),(31,'PBXManager',1,28,'PBXManager',NULL,NULL,0,0,1,'1.3'),(32,'ServiceContracts',1,29,'Service Contracts',NULL,NULL,0,0,1,'1.2'),(33,'Services',1,30,'Services',NULL,NULL,0,1,1,'1.2'),(34,'SangrahBackup',0,31,'Vtiger Backup',NULL,NULL,0,0,0,'1.0'),(35,'Assets',1,32,'Assets',NULL,NULL,0,0,1,'1.1'),(36,'CustomerPortal',0,33,'CustomerPortal',NULL,NULL,0,0,0,'1.2'),(37,'FieldFormulas',0,34,'Field Formulas',NULL,NULL,0,0,0,'1.2'),(38,'ModComments',1,35,'Comments',NULL,NULL,0,0,1,'1.1'),(39,'ProjectMilestone',1,36,'ProjectMilestone',NULL,NULL,0,0,1,'1.9'),(40,'ProjectTask',1,37,'ProjectTask',NULL,NULL,0,0,1,'1.9'),(41,'Project',1,38,'Project',NULL,NULL,0,0,1,'1.9'),(42,'RecycleBin',1,39,'Recycle Bin',NULL,NULL,0,0,0,'1.1'),(43,'SMSNotifier',1,40,'SMSNotifier',NULL,NULL,0,0,1,'1.1'),(44,'Tooltip',0,41,'Tool Tip',NULL,NULL,0,0,0,'1.1'),(45,'Webforms',0,42,'Webforms',NULL,NULL,0,0,0,'0.2'),(48,'Barcode',0,48,'Barcode',NULL,NULL,1,0,1,'0'),(49,'Warehouse',0,49,'Warehouse',NULL,NULL,1,0,1,'0'),(50,'Promotionalsale',1,50,'Promotional Sale',NULL,NULL,1,0,1,'0'),(51,'ClearanceSale',0,51,'ClearanceSale',NULL,NULL,1,0,1,'0'),(52,'PurchaseOrderReceived',0,52,'PO Receive',NULL,NULL,1,0,1,'0'),(53,'SalesReturn',0,53,'SalesReturn',NULL,NULL,1,0,1,'0'),(54,'Cashreceipt',0,54,'Cashreceipt',NULL,NULL,1,0,1,'0'),(55,'Stockadjustment',0,55,'Stockadjustment',NULL,NULL,1,0,1,'0'),(56,'Category',0,56,'Category',NULL,NULL,1,0,1,'0'),(57,'Deliverychallan',0,57,'Deliverychallan',NULL,NULL,1,0,1,'0'),(58,'PurchaseRequest',0,58,'Purchase Request',NULL,NULL,1,0,1,'0'),(59,'CrystalReport',0,59,'CrystalReport',NULL,NULL,1,0,0,'0'),(60,'PRDelivery',1,60,'PRDelivery',NULL,NULL,1,0,1,'0'),(61,'PRReceive',1,61,'PRReceive',NULL,NULL,1,0,1,'0'),(62,'EmailSettings',0,62,'EmailSettings',NULL,NULL,1,0,1,'0');

/*Table structure for table `vtiger_tab_info` */

DROP TABLE IF EXISTS `vtiger_tab_info`;

CREATE TABLE `vtiger_tab_info` (
  `tabid` int(19) default NULL,
  `prefname` varchar(256) default NULL,
  `prefvalue` varchar(256) default NULL,
  KEY `fk_1_vtiger_tab_info` (`tabid`),
  CONSTRAINT `fk_1_vtiger_tab_info` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tab_info` */

insert  into `vtiger_tab_info`(`tabid`,`prefname`,`prefvalue`) values (30,'vtiger_min_version','5.1.0'),(31,'vtiger_min_version','5.1.0'),(31,'vtiger_max_version','5.*'),(32,'vtiger_min_version','5.1.0'),(32,'vtiger_max_version','5.*'),(33,'vtiger_min_version','5.1.0'),(33,'vtiger_max_version','5.*'),(34,'vtiger_min_version','5.1.0'),(35,'vtiger_min_version','5.1.0'),(35,'vtiger_max_version','5.*'),(36,'vtiger_min_version','5.1.0'),(36,'vtiger_max_version','5.*'),(37,'vtiger_min_version','5.1.0'),(37,'vtiger_max_version','5.*'),(38,'vtiger_min_version','5.1.0'),(38,'vtiger_max_version','5.*'),(39,'vtiger_min_version','5.2.0'),(40,'vtiger_min_version','5.2.0'),(41,'vtiger_min_version','5.2.0'),(42,'vtiger_min_version','5.1.0'),(42,'vtiger_max_version','5.*'),(43,'vtiger_min_version','5.1.0'),(43,'vtiger_max_version','5.*'),(44,'vtiger_min_version','5.1.0'),(44,'vtiger_max_version','5.*'),(45,'vtiger_min_version','5.1.0'),(45,'vtiger_max_version','5.*'),(48,'vtiger_min_version','5.1.0'),(49,'vtiger_min_version','5.1.0'),(50,'vtiger_min_version','5.1.0'),(51,'vtiger_min_version','5.1.0'),(52,'vtiger_min_version','5.1.0'),(53,'vtiger_min_version','5.1.0'),(54,'vtiger_min_version','5.1.0'),(55,'vtiger_min_version','5.1.0'),(56,'vtiger_min_version','5.1.0'),(57,'vtiger_min_version','5.1.0'),(58,'vtiger_min_version','5.1.0'),(59,'vtiger_min_version','5.1.0'),(60,'vtiger_min_version','5.1.0'),(61,'vtiger_min_version','5.1.0'),(62,'vtiger_min_version','5.1.0');

/*Table structure for table `vtiger_taskpriority` */

DROP TABLE IF EXISTS `vtiger_taskpriority`;

CREATE TABLE `vtiger_taskpriority` (
  `taskpriorityid` int(19) NOT NULL auto_increment,
  `taskpriority` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`taskpriorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_taskpriority` */

insert  into `vtiger_taskpriority`(`taskpriorityid`,`taskpriority`,`presence`,`picklist_valueid`) values (1,'High',1,170),(2,'Medium',1,171),(3,'Low',1,172);

/*Table structure for table `vtiger_taskpriority_seq` */

DROP TABLE IF EXISTS `vtiger_taskpriority_seq`;

CREATE TABLE `vtiger_taskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_taskpriority_seq` */

insert  into `vtiger_taskpriority_seq`(`id`) values (3);

/*Table structure for table `vtiger_taskstatus` */

DROP TABLE IF EXISTS `vtiger_taskstatus`;

CREATE TABLE `vtiger_taskstatus` (
  `taskstatusid` int(19) NOT NULL auto_increment,
  `taskstatus` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`taskstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_taskstatus` */

insert  into `vtiger_taskstatus`(`taskstatusid`,`taskstatus`,`presence`,`picklist_valueid`) values (1,'Not Started',0,173),(2,'In Progress',0,174),(3,'Completed',0,175),(4,'Pending Input',0,176),(5,'Deferred',0,177),(6,'Planned',0,178);

/*Table structure for table `vtiger_taskstatus_seq` */

DROP TABLE IF EXISTS `vtiger_taskstatus_seq`;

CREATE TABLE `vtiger_taskstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_taskstatus_seq` */

insert  into `vtiger_taskstatus_seq`(`id`) values (6);

/*Table structure for table `vtiger_taxclass` */

DROP TABLE IF EXISTS `vtiger_taxclass`;

CREATE TABLE `vtiger_taxclass` (
  `taxclassid` int(19) NOT NULL auto_increment,
  `taxclass` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`taxclassid`),
  UNIQUE KEY `taxclass_carrier_idx` (`taxclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_taxclass` */

insert  into `vtiger_taxclass`(`taxclassid`,`taxclass`,`sortorderid`,`presence`) values (1,'SalesTax',0,1),(2,'Vat',1,1);

/*Table structure for table `vtiger_taxclass_seq` */

DROP TABLE IF EXISTS `vtiger_taxclass_seq`;

CREATE TABLE `vtiger_taxclass_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_taxclass_seq` */

insert  into `vtiger_taxclass_seq`(`id`) values (2);

/*Table structure for table `vtiger_templatecode` */

DROP TABLE IF EXISTS `vtiger_templatecode`;

CREATE TABLE `vtiger_templatecode` (
  `templatecodeid` int(11) NOT NULL auto_increment,
  `templatecode` varchar(100) default NULL,
  `subject` varchar(100) default NULL,
  `body` varchar(100) default NULL,
  PRIMARY KEY  (`templatecodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_templatecode` */

insert  into `vtiger_templatecode`(`templatecodeid`,`templatecode`,`subject`,`body`) values (1,'PR_REQ_SEND','Purchase Request Send',NULL),(2,'PR_APPROVED','Purchase Request Approved',NULL),(3,'PR_REQ_CANCELLED','Purchase Request Cancelled',NULL),(4,'PO_REQ_SEND','PurchaseOrder Request Send',NULL),(5,'PR_REV_REQ_SEND','Revised PurchaseRequest For PurchaseRequest ID : - ',NULL),(6,'PO_CANCELLED','PO Cancelled',NULL),(7,'PO_REV_SEND','Revised PurchaseOrder For PO No. : - ',NULL),(8,'PR_DEL','Purchase Request Delivery',NULL),(9,'PR_REC','Purchase Request Received',NULL),(10,'CRE_USER','User Login Details',NULL),(11,'SEND_DC','Delivery challan Details',NULL),(12,'CRE_CUS','Thanks for Shopping with us',NULL);

/*Table structure for table `vtiger_ticketcategories` */

DROP TABLE IF EXISTS `vtiger_ticketcategories`;

CREATE TABLE `vtiger_ticketcategories` (
  `ticketcategories_id` int(19) NOT NULL auto_increment,
  `ticketcategories` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '0',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`ticketcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketcategories` */

insert  into `vtiger_ticketcategories`(`ticketcategories_id`,`ticketcategories`,`presence`,`picklist_valueid`) values (1,'Big Problem',1,179),(2,'Small Problem',1,180),(3,'Other Problem',1,181);

/*Table structure for table `vtiger_ticketcategories_seq` */

DROP TABLE IF EXISTS `vtiger_ticketcategories_seq`;

CREATE TABLE `vtiger_ticketcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketcategories_seq` */

insert  into `vtiger_ticketcategories_seq`(`id`) values (3);

/*Table structure for table `vtiger_ticketcf` */

DROP TABLE IF EXISTS `vtiger_ticketcf`;

CREATE TABLE `vtiger_ticketcf` (
  `ticketid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`ticketid`),
  CONSTRAINT `fk_1_vtiger_ticketcf` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketcf` */

/*Table structure for table `vtiger_ticketcomments` */

DROP TABLE IF EXISTS `vtiger_ticketcomments`;

CREATE TABLE `vtiger_ticketcomments` (
  `commentid` int(19) NOT NULL auto_increment,
  `ticketid` int(19) default NULL,
  `comments` text,
  `ownerid` int(19) NOT NULL default '0',
  `ownertype` varchar(10) default NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`commentid`),
  KEY `ticketcomments_ticketid_idx` (`ticketid`),
  CONSTRAINT `fk_1_vtiger_ticketcomments` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketcomments` */

/*Table structure for table `vtiger_ticketpriorities` */

DROP TABLE IF EXISTS `vtiger_ticketpriorities`;

CREATE TABLE `vtiger_ticketpriorities` (
  `ticketpriorities_id` int(19) NOT NULL auto_increment,
  `ticketpriorities` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '0',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`ticketpriorities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketpriorities` */

insert  into `vtiger_ticketpriorities`(`ticketpriorities_id`,`ticketpriorities`,`presence`,`picklist_valueid`) values (1,'Low',1,182),(2,'Normal',1,183),(3,'High',1,184),(4,'Urgent',1,185);

/*Table structure for table `vtiger_ticketpriorities_seq` */

DROP TABLE IF EXISTS `vtiger_ticketpriorities_seq`;

CREATE TABLE `vtiger_ticketpriorities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketpriorities_seq` */

insert  into `vtiger_ticketpriorities_seq`(`id`) values (4);

/*Table structure for table `vtiger_ticketseverities` */

DROP TABLE IF EXISTS `vtiger_ticketseverities`;

CREATE TABLE `vtiger_ticketseverities` (
  `ticketseverities_id` int(19) NOT NULL auto_increment,
  `ticketseverities` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '0',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`ticketseverities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketseverities` */

insert  into `vtiger_ticketseverities`(`ticketseverities_id`,`ticketseverities`,`presence`,`picklist_valueid`) values (1,'Minor',1,186),(2,'Major',1,187),(3,'Feature',1,188),(4,'Critical',1,189);

/*Table structure for table `vtiger_ticketseverities_seq` */

DROP TABLE IF EXISTS `vtiger_ticketseverities_seq`;

CREATE TABLE `vtiger_ticketseverities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketseverities_seq` */

insert  into `vtiger_ticketseverities_seq`(`id`) values (4);

/*Table structure for table `vtiger_ticketstatus` */

DROP TABLE IF EXISTS `vtiger_ticketstatus`;

CREATE TABLE `vtiger_ticketstatus` (
  `ticketstatus_id` int(19) NOT NULL auto_increment,
  `ticketstatus` varchar(200) default NULL,
  `presence` int(1) NOT NULL default '0',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`ticketstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketstatus` */

insert  into `vtiger_ticketstatus`(`ticketstatus_id`,`ticketstatus`,`presence`,`picklist_valueid`) values (1,'Open',0,190),(2,'In Progress',0,191),(3,'Wait For Response',0,192),(4,'Closed',0,193);

/*Table structure for table `vtiger_ticketstatus_seq` */

DROP TABLE IF EXISTS `vtiger_ticketstatus_seq`;

CREATE TABLE `vtiger_ticketstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketstatus_seq` */

insert  into `vtiger_ticketstatus_seq`(`id`) values (4);

/*Table structure for table `vtiger_ticketstracktime` */

DROP TABLE IF EXISTS `vtiger_ticketstracktime`;

CREATE TABLE `vtiger_ticketstracktime` (
  `ticket_id` int(11) NOT NULL default '0',
  `supporter_id` int(11) NOT NULL default '0',
  `minutes` int(11) default '0',
  `date_logged` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ticket_id`),
  KEY `ticketstracktime_ticket_id_idx` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ticketstracktime` */

/*Table structure for table `vtiger_tmp_read_group_rel_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_read_group_rel_sharing_per`;

CREATE TABLE `vtiger_tmp_read_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`),
  KEY `tmp_read_group_rel_sharing_per_userid_sharedgroupid_tabid` (`userid`,`sharedgroupid`,`tabid`),
  CONSTRAINT `fk_4_vtiger_tmp_read_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_read_group_rel_sharing_per` */

/*Table structure for table `vtiger_tmp_read_group_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_read_group_sharing_per`;

CREATE TABLE `vtiger_tmp_read_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`sharedgroupid`),
  KEY `tmp_read_group_sharing_per_userid_sharedgroupid_idx` (`userid`,`sharedgroupid`),
  CONSTRAINT `fk_3_vtiger_tmp_read_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_read_group_sharing_per` */

/*Table structure for table `vtiger_tmp_read_user_rel_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_read_user_rel_sharing_per`;

CREATE TABLE `vtiger_tmp_read_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`relatedtabid`,`shareduserid`),
  KEY `tmp_read_user_rel_sharing_per_userid_shared_reltabid_idx` (`userid`,`shareduserid`,`relatedtabid`),
  CONSTRAINT `fk_4_vtiger_tmp_read_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_read_user_rel_sharing_per` */

/*Table structure for table `vtiger_tmp_read_user_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_read_user_sharing_per`;

CREATE TABLE `vtiger_tmp_read_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`shareduserid`),
  KEY `tmp_read_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`),
  CONSTRAINT `fk_3_vtiger_tmp_read_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_read_user_sharing_per` */

/*Table structure for table `vtiger_tmp_write_group_rel_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_write_group_rel_sharing_per`;

CREATE TABLE `vtiger_tmp_write_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`),
  KEY `tmp_write_group_rel_sharing_per_userid_sharedgroupid_tabid_idx` (`userid`,`sharedgroupid`,`tabid`),
  CONSTRAINT `fk_4_vtiger_tmp_write_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_write_group_rel_sharing_per` */

/*Table structure for table `vtiger_tmp_write_group_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_write_group_sharing_per`;

CREATE TABLE `vtiger_tmp_write_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`sharedgroupid`),
  KEY `tmp_write_group_sharing_per_UK1` (`userid`,`sharedgroupid`),
  CONSTRAINT `fk_3_vtiger_tmp_write_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_write_group_sharing_per` */

/*Table structure for table `vtiger_tmp_write_user_rel_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_write_user_rel_sharing_per`;

CREATE TABLE `vtiger_tmp_write_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`relatedtabid`,`shareduserid`),
  KEY `tmp_write_user_rel_sharing_per_userid_sharduserid_tabid_idx` (`userid`,`shareduserid`,`tabid`),
  CONSTRAINT `fk_4_vtiger_tmp_write_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_write_user_rel_sharing_per` */

/*Table structure for table `vtiger_tmp_write_user_sharing_per` */

DROP TABLE IF EXISTS `vtiger_tmp_write_user_sharing_per`;

CREATE TABLE `vtiger_tmp_write_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`,`shareduserid`),
  KEY `tmp_write_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`),
  CONSTRAINT `fk_3_vtiger_tmp_write_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tmp_write_user_sharing_per` */

/*Table structure for table `vtiger_tracker` */

DROP TABLE IF EXISTS `vtiger_tracker`;

CREATE TABLE `vtiger_tracker` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` varchar(36) default NULL,
  `module_name` varchar(25) default NULL,
  `item_id` varchar(36) default NULL,
  `item_summary` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tracker` */

insert  into `vtiger_tracker`(`id`,`user_id`,`module_name`,`item_id`,`item_summary`) values (794,'30','Warehouse','718','J S RoadS Road'),(1941,'1','Category','154','Atta'),(1942,'1','Barcode','155','464158'),(1943,'1','Products','156','Ashirwad'),(1944,'1','PurchaseOrder','160',NULL),(1945,'1','Barcode','163','118847');

/*Table structure for table `vtiger_tracking_unit` */

DROP TABLE IF EXISTS `vtiger_tracking_unit`;

CREATE TABLE `vtiger_tracking_unit` (
  `tracking_unitid` int(11) NOT NULL auto_increment,
  `tracking_unit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tracking_unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_tracking_unit` */

insert  into `vtiger_tracking_unit`(`tracking_unitid`,`tracking_unit`,`presence`,`picklist_valueid`) values (1,'None',1,210),(2,'Hours',1,211),(3,'Days',1,212),(4,'Incidents',1,213);

/*Table structure for table `vtiger_tracking_unit_seq` */

DROP TABLE IF EXISTS `vtiger_tracking_unit_seq`;

CREATE TABLE `vtiger_tracking_unit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_tracking_unit_seq` */

insert  into `vtiger_tracking_unit_seq`(`id`) values (4);

/*Table structure for table `vtiger_troubletickets` */

DROP TABLE IF EXISTS `vtiger_troubletickets`;

CREATE TABLE `vtiger_troubletickets` (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) NOT NULL,
  `groupname` varchar(100) default NULL,
  `parent_id` varchar(100) default NULL,
  `product_id` varchar(100) default NULL,
  `priority` varchar(200) default NULL,
  `severity` varchar(200) default NULL,
  `status` varchar(200) default NULL,
  `category` varchar(200) default NULL,
  `title` varchar(255) NOT NULL,
  `solution` text,
  `update_log` text,
  `version_id` int(11) default NULL,
  `hours` varchar(200) default NULL,
  `days` varchar(200) default NULL,
  PRIMARY KEY  (`ticketid`),
  KEY `troubletickets_ticketid_idx` (`ticketid`),
  KEY `troubletickets_status_idx` (`status`),
  CONSTRAINT `fk_1_vtiger_troubletickets` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_troubletickets` */

/*Table structure for table `vtiger_usageunit` */

DROP TABLE IF EXISTS `vtiger_usageunit`;

CREATE TABLE `vtiger_usageunit` (
  `usageunitid` int(19) NOT NULL auto_increment,
  `usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL default '1',
  `picklist_valueid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`usageunitid`),
  UNIQUE KEY `usageunit_usageunit_idx` (`usageunit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_usageunit` */

insert  into `vtiger_usageunit`(`usageunitid`,`usageunit`,`presence`,`picklist_valueid`) values (1,'Box',1,194),(2,'Carton',1,195),(3,'Dozen',1,196),(8,'Meter',1,201),(9,'Pack',1,202),(11,'Pieces',1,204),(12,'Quantity',1,205),(14,'Sheet',1,207);

/*Table structure for table `vtiger_usageunit_seq` */

DROP TABLE IF EXISTS `vtiger_usageunit_seq`;

CREATE TABLE `vtiger_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_usageunit_seq` */

insert  into `vtiger_usageunit_seq`(`id`) values (17);

/*Table structure for table `vtiger_user2mergefields` */

DROP TABLE IF EXISTS `vtiger_user2mergefields`;

CREATE TABLE `vtiger_user2mergefields` (
  `userid` int(11) default NULL,
  `tabid` int(19) default NULL,
  `fieldid` int(19) default NULL,
  `visible` int(2) default NULL,
  KEY `userid_tabid_idx` (`userid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_user2mergefields` */

/*Table structure for table `vtiger_user2role` */

DROP TABLE IF EXISTS `vtiger_user2role`;

CREATE TABLE `vtiger_user2role` (
  `userid` int(11) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  PRIMARY KEY  (`userid`),
  KEY `user2role_roleid_idx` (`roleid`),
  CONSTRAINT `fk_2_vtiger_user2role` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_user2role` */

insert  into `vtiger_user2role`(`userid`,`roleid`) values (22,'H11'),(23,'H16'),(1,'H2'),(25,'H4'),(24,'H5'),(21,'H8');

/*Table structure for table `vtiger_user_module_preferences` */

DROP TABLE IF EXISTS `vtiger_user_module_preferences`;

CREATE TABLE `vtiger_user_module_preferences` (
  `userid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `default_cvid` int(19) NOT NULL,
  PRIMARY KEY  (`userid`,`tabid`),
  KEY `fk_2_vtiger_user_module_preferences` (`tabid`),
  CONSTRAINT `fk_2_vtiger_user_module_preferences` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_user_module_preferences` */

insert  into `vtiger_user_module_preferences`(`userid`,`tabid`,`default_cvid`) values (1,4,93),(1,14,53),(1,23,82),(1,48,58),(1,49,68),(1,50,71),(1,51,104),(1,53,92),(1,54,91),(1,55,105),(1,56,100),(1,57,103),(11,48,114);

/*Table structure for table `vtiger_users` */

DROP TABLE IF EXISTS `vtiger_users`;

CREATE TABLE `vtiger_users` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) default NULL,
  `user_password` varchar(128) default NULL,
  `user_hash` varchar(32) default NULL,
  `cal_color` varchar(25) default '#E6FAD8',
  `first_name` varchar(30) default NULL,
  `last_name` varchar(30) default NULL,
  `reports_to_id` varchar(36) default NULL,
  `is_admin` varchar(3) default '0',
  `currency_id` int(19) NOT NULL default '1',
  `description` text,
  `date_entered` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) default NULL,
  `title` varchar(50) default NULL,
  `department` varchar(50) default NULL,
  `phone_home` varchar(50) default NULL,
  `phone_mobile` varchar(50) default NULL,
  `phone_work` varchar(50) default NULL,
  `phone_other` varchar(50) default NULL,
  `phone_fax` varchar(50) default NULL,
  `email1` varchar(100) default NULL,
  `email2` varchar(100) default NULL,
  `yahoo_id` varchar(100) default NULL,
  `status` varchar(25) default NULL,
  `signature` varchar(250) default NULL,
  `address_street` varchar(150) default NULL,
  `address_city` varchar(100) default NULL,
  `address_state` varchar(100) default NULL,
  `address_country` varchar(25) default NULL,
  `address_postalcode` varchar(9) default NULL,
  `user_preferences` text,
  `tz` varchar(30) default NULL,
  `holidays` varchar(60) default NULL,
  `namedays` varchar(60) default NULL,
  `workdays` varchar(30) default NULL,
  `weekstart` int(11) default NULL,
  `date_format` varchar(200) default NULL,
  `hour_format` varchar(30) default 'am/pm',
  `start_hour` varchar(30) default '10:00',
  `end_hour` varchar(30) default '23:00',
  `activity_view` varchar(200) default 'Today',
  `lead_view` varchar(200) default 'Today',
  `imagename` varchar(250) default NULL,
  `deleted` int(1) NOT NULL default '0',
  `confirm_password` varchar(30) default NULL,
  `internal_mailer` varchar(3) NOT NULL default '1',
  `reminder_interval` varchar(100) default NULL,
  `reminder_next_time` varchar(100) default NULL,
  `crypt_type` varchar(20) NOT NULL default 'MD5',
  `accesskey` varchar(36) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_user_name_idx` (`user_name`),
  KEY `user_user_password_idx` (`user_password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_users` */

insert  into `vtiger_users`(`id`,`user_name`,`user_password`,`user_hash`,`cal_color`,`first_name`,`last_name`,`reports_to_id`,`is_admin`,`currency_id`,`description`,`date_entered`,`date_modified`,`modified_user_id`,`title`,`department`,`phone_home`,`phone_mobile`,`phone_work`,`phone_other`,`phone_fax`,`email1`,`email2`,`yahoo_id`,`status`,`signature`,`address_street`,`address_city`,`address_state`,`address_country`,`address_postalcode`,`user_preferences`,`tz`,`holidays`,`namedays`,`workdays`,`weekstart`,`date_format`,`hour_format`,`start_hour`,`end_hour`,`activity_view`,`lead_view`,`imagename`,`deleted`,`confirm_password`,`internal_mailer`,`reminder_interval`,`reminder_next_time`,`crypt_type`,`accesskey`) values (1,'admin','adpexzg3FUZAk','21232f297a57a5a743894a0e4a801fc3','#E6FAD8','','Administrator','','on',1,'','2012-07-03 11:45:21','0000-00-00 00:00:00',NULL,'','','','','','','','server@treewalker.in','','','Active','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'dd-mm-yyyy','am/pm','08:00','','This Week','Today','',0,'adoY/6Mlw8kqg','1','','2011-12-06 12:50','','w2DGn6SKK3uNxUf'),(21,'warehouse1','$1$wa$zEUs60c80FudcxdT//Bf2/','e10adc3949ba59abbe56e057f20f883e','#E6FAD8','warehouse1','warehouse1','','off',0,'','2012-07-18 21:47:09','0000-00-00 00:00:00',NULL,'','','','','','','','server@treewalker.in','','','Active','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'dd-mm-yyyy','','','','','','',0,'$1$wa0000000ejHVMPB0sNE2ACX2Z8','1','',NULL,'MD5','uFtk9JsU87Xbv1'),(22,'store1','$1$st$2jfTMTp6KDWsrLNoFYmfw1','e10adc3949ba59abbe56e057f20f883e','#E6FAD8','store1','store1','','off',0,'','2012-07-03 21:26:27','0000-00-00 00:00:00',NULL,'','','','','','','','server@treewalker.in','','','Active','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'dd-mm-yyyy','','','','','','',0,'$1$st0000000Psm543CQXEGBHoMmQW','1','',NULL,'MD5','86QXSmLVOyNiG1qb'),(23,'store2','$1$st0000000NseQdEPAsnZq3/A77KKlQ1',NULL,'#E6FAD8','store2','store2','','off',0,'','2012-07-03 11:48:09','0000-00-00 00:00:00',NULL,'','','','','','','','server@treewalker.in','','','Active','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'dd-mm-yyyy','','','','','','',0,'$1$st0000000NseQdEPAsnZq3/A77K','1','',NULL,'PHP5.3MD5','USG8m5FmiaF6FLoE'),(24,'whead1','$1$wh0000000oyN8hJrhfjIDsxqKZYbfA/',NULL,'#E6FAD8','whead1','whead1','','off',0,'','2012-07-03 11:49:44','0000-00-00 00:00:00',NULL,'','','','','','','','server@treewalker.in','','','Active','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'dd-mm-yyyy','','','','','','',0,'$1$wh0000000oyN8hJrhfjIDsxqKZY','1','',NULL,'PHP5.3MD5','ywgyYu9IecpfjgNu'),(25,'sthead','$1$st0000000X6aGI5WPSs7yxgZ1Rng6U0',NULL,'#E6FAD8','sthead','sthead','','off',0,'','2012-07-03 11:50:48','0000-00-00 00:00:00',NULL,'','','','','','','','server@treewalker.in','','','Active','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'dd-mm-yyyy','','','','','','',0,'$1$st0000000X6aGI5WPSs7yxgZ1Rn','1','',NULL,'PHP5.3MD5','ciNSzFj5iG1OTs6V');

/*Table structure for table `vtiger_users2group` */

DROP TABLE IF EXISTS `vtiger_users2group`;

CREATE TABLE `vtiger_users2group` (
  `groupid` int(19) NOT NULL,
  `userid` int(19) NOT NULL,
  PRIMARY KEY  (`groupid`,`userid`),
  KEY `users2group_groupname_uerid_idx` (`groupid`,`userid`),
  KEY `fk_2_vtiger_users2group` (`userid`),
  CONSTRAINT `fk_2_vtiger_users2group` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_users2group` */

insert  into `vtiger_users2group`(`groupid`,`userid`) values (3,1);

/*Table structure for table `vtiger_users_last_import` */

DROP TABLE IF EXISTS `vtiger_users_last_import`;

CREATE TABLE `vtiger_users_last_import` (
  `id` int(36) NOT NULL auto_increment,
  `assigned_user_id` varchar(36) default NULL,
  `bean_type` varchar(36) default NULL,
  `bean_id` varchar(36) default NULL,
  `deleted` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_users_last_import` */

/*Table structure for table `vtiger_users_seq` */

DROP TABLE IF EXISTS `vtiger_users_seq`;

CREATE TABLE `vtiger_users_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_users_seq` */

insert  into `vtiger_users_seq`(`id`) values (25);

/*Table structure for table `vtiger_usertype` */

DROP TABLE IF EXISTS `vtiger_usertype`;

CREATE TABLE `vtiger_usertype` (
  `usertypeid` int(19) NOT NULL auto_increment,
  `usertype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`usertypeid`),
  UNIQUE KEY `usertype_usertype_idx` (`usertype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_usertype` */

/*Table structure for table `vtiger_vendor` */

DROP TABLE IF EXISTS `vtiger_vendor`;

CREATE TABLE `vtiger_vendor` (
  `vendorid` int(19) NOT NULL default '0',
  `vendor_no` varchar(100) NOT NULL,
  `vendorname` varchar(100) default NULL,
  `phone` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `website` varchar(100) default NULL,
  `glacct` varchar(200) default NULL,
  `category` varchar(50) default NULL,
  `street` text,
  `city` varchar(30) default NULL,
  `state` varchar(30) default NULL,
  `pobox` varchar(30) default NULL,
  `postalcode` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `description` text,
  PRIMARY KEY  (`vendorid`),
  CONSTRAINT `fk_1_vtiger_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_vendor` */

insert  into `vtiger_vendor`(`vendorid`,`vendor_no`,`vendorname`,`phone`,`email`,`website`,`glacct`,`category`,`street`,`city`,`state`,`pobox`,`postalcode`,`country`,`description`) values (100,'VEN1','VENDOR_1','9876452312','nikhil.gupta@treewalker.in','','300-Sales-Software','sdsd','','','','','','',NULL);

/*Table structure for table `vtiger_vendorcf` */

DROP TABLE IF EXISTS `vtiger_vendorcf`;

CREATE TABLE `vtiger_vendorcf` (
  `vendorid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`vendorid`),
  CONSTRAINT `fk_1_vtiger_vendorcf` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_vendorcf` */

insert  into `vtiger_vendorcf`(`vendorid`) values (100);

/*Table structure for table `vtiger_vendorcontactrel` */

DROP TABLE IF EXISTS `vtiger_vendorcontactrel`;

CREATE TABLE `vtiger_vendorcontactrel` (
  `vendorid` int(19) NOT NULL default '0',
  `contactid` int(19) NOT NULL default '0',
  PRIMARY KEY  (`vendorid`,`contactid`),
  KEY `vendorcontactrel_vendorid_idx` (`vendorid`),
  KEY `vendorcontactrel_contact_idx` (`contactid`),
  CONSTRAINT `fk_2_vtiger_vendorcontactrel` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_vendorcontactrel` */

/*Table structure for table `vtiger_version` */

DROP TABLE IF EXISTS `vtiger_version`;

CREATE TABLE `vtiger_version` (
  `id` int(11) NOT NULL auto_increment,
  `old_version` varchar(30) default NULL,
  `current_version` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_version` */

insert  into `vtiger_version`(`id`,`old_version`,`current_version`) values (1,'5.2.1','5.2.1');

/*Table structure for table `vtiger_version_seq` */

DROP TABLE IF EXISTS `vtiger_version_seq`;

CREATE TABLE `vtiger_version_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_version_seq` */

insert  into `vtiger_version_seq`(`id`) values (1);

/*Table structure for table `vtiger_visibility` */

DROP TABLE IF EXISTS `vtiger_visibility`;

CREATE TABLE `vtiger_visibility` (
  `visibilityid` int(19) NOT NULL auto_increment,
  `visibility` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL default '0',
  `presence` int(1) NOT NULL default '1',
  PRIMARY KEY  (`visibilityid`),
  UNIQUE KEY `visibility_visibility_idx` (`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_visibility` */

insert  into `vtiger_visibility`(`visibilityid`,`visibility`,`sortorderid`,`presence`) values (1,'Private',0,1),(2,'Public',1,1);

/*Table structure for table `vtiger_visibility_seq` */

DROP TABLE IF EXISTS `vtiger_visibility_seq`;

CREATE TABLE `vtiger_visibility_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_visibility_seq` */

insert  into `vtiger_visibility_seq`(`id`) values (2);

/*Table structure for table `vtiger_warehouse` */

DROP TABLE IF EXISTS `vtiger_warehouse`;

CREATE TABLE `vtiger_warehouse` (
  `warehouseid` int(11) NOT NULL auto_increment,
  `warehouse_name` varchar(100) default NULL,
  `address1` varchar(100) default NULL,
  `address2` varchar(100) default NULL,
  `street` varchar(100) default NULL,
  `city` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `contact_person_name` varchar(100) default NULL,
  `mobile` varchar(100) default NULL,
  `landline` varchar(100) default NULL,
  `identifier` varchar(10) default NULL,
  `linkto` varchar(100) default NULL,
  `code` varchar(10) default NULL,
  PRIMARY KEY  (`warehouseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_warehouse` */

insert  into `vtiger_warehouse`(`warehouseid`,`warehouse_name`,`address1`,`address2`,`street`,`city`,`state`,`country`,`contact_person_name`,`mobile`,`landline`,`identifier`,`linkto`,`code`) values (2,'Warehouse1','Parangi Palya','test2','15th cross','Bangalore','Karnataka','India','Warehouse1','99999999','9999999999','WH',NULL,NULL),(3,'Store1','Parangi Palya','asdcas','17th','Bangalore','AMBAJI','India','Store1','99999999','423242','ST',NULL,NULL),(4,'Store2','Parangi Palya','asdcas','adfda','Bangalore','AMBAJI','sddssd','Store2','99999999','9999999999','ST',NULL,NULL);

/*Table structure for table `vtiger_warehouse_stock` */

DROP TABLE IF EXISTS `vtiger_warehouse_stock`;

CREATE TABLE `vtiger_warehouse_stock` (
  `warehousestockid` int(11) NOT NULL auto_increment,
  `warehouseid` int(11) default NULL,
  `productid` int(11) default NULL,
  `qty` int(11) default NULL,
  `reorder` int(11) default NULL,
  PRIMARY KEY  (`warehousestockid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_warehouse_stock` */

insert  into `vtiger_warehouse_stock`(`warehousestockid`,`warehouseid`,`productid`,`qty`,`reorder`) values (1,3,18,10,NULL),(2,4,18,20,NULL),(3,2,18,60,NULL),(4,3,19,9,NULL),(5,4,19,8,NULL),(6,2,19,12,NULL),(7,3,20,2,NULL),(8,4,20,10,NULL),(9,2,20,20,NULL),(10,3,21,2,NULL),(11,4,21,2,NULL),(12,2,21,3,NULL),(13,3,22,40,NULL),(14,4,22,30,NULL),(15,2,22,20,NULL),(16,3,23,3,NULL),(17,4,23,5,NULL),(18,2,23,10,NULL),(19,2,55,0,NULL),(20,3,55,0,NULL),(21,4,55,0,NULL),(22,3,80,66,NULL),(23,4,80,20,NULL),(24,2,80,0,NULL),(25,3,106,20,NULL),(26,4,106,40,NULL),(27,2,106,40,NULL),(28,3,110,30,NULL),(29,4,110,30,NULL),(30,2,110,40,NULL),(31,3,117,23,NULL),(32,4,117,30,NULL),(33,2,117,40,NULL),(34,3,118,15,NULL),(35,4,118,20,NULL),(36,2,118,10,NULL),(37,3,119,15,NULL),(38,4,119,20,NULL),(39,2,119,60,NULL),(40,3,120,26,NULL),(41,4,120,30,NULL),(42,2,120,40,NULL),(43,3,127,12,NULL),(44,4,127,20,NULL),(45,2,127,60,NULL),(46,2,132,100,NULL),(47,3,132,0,NULL),(48,4,132,0,NULL),(49,3,140,14,NULL),(50,4,140,40,NULL),(51,2,140,40,NULL),(52,2,147,0,NULL),(53,3,147,0,NULL),(54,4,147,0,NULL),(55,3,156,36,NULL),(56,4,156,40,NULL),(57,2,156,20,NULL),(58,2,159,0,NULL),(59,3,159,0,NULL),(60,4,159,0,NULL);

/*Table structure for table `vtiger_warehousecf` */

DROP TABLE IF EXISTS `vtiger_warehousecf`;

CREATE TABLE `vtiger_warehousecf` (
  `warehouseid` int(11) NOT NULL,
  PRIMARY KEY  (`warehouseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_warehousecf` */

insert  into `vtiger_warehousecf`(`warehouseid`) values (2),(3),(4);

/*Table structure for table `vtiger_warehousegrouprel` */

DROP TABLE IF EXISTS `vtiger_warehousegrouprel`;

CREATE TABLE `vtiger_warehousegrouprel` (
  `warehouseid` int(11) NOT NULL,
  `groupname` varchar(100) default NULL,
  PRIMARY KEY  (`warehouseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vtiger_warehousegrouprel` */

/*Table structure for table `vtiger_warehousestore_inventorytransaction` */

DROP TABLE IF EXISTS `vtiger_warehousestore_inventorytransaction`;

CREATE TABLE `vtiger_warehousestore_inventorytransaction` (
  `warehousestore_transaction_id` int(11) NOT NULL auto_increment,
  `date` datetime default NULL,
  `warehousestore_id` int(11) default NULL,
  `barcode` varchar(11) default NULL,
  `productid` int(11) default NULL,
  `product_name` varchar(25) default NULL,
  `opening_stock_qty` int(11) unsigned default NULL,
  `opening_cost` double(12,2) default NULL,
  `markup_per` double(12,2) default '0.00',
  `markup_amt` double(12,2) default '0.00',
  `poid` int(11) default NULL,
  `purchase_qty` int(11) default NULL,
  `purchase_cost` double(12,2) default NULL,
  `cstwithcform_per` decimal(12,2) default '0.00',
  `cstwithcform_amt` decimal(12,2) default '0.00',
  `cstwithoutcform_per` decimal(12,2) default '0.00',
  `cstwithoutcform_amt` decimal(12,2) default '0.00',
  `invoice_id` int(11) default NULL,
  `invoice_no` varchar(25) default NULL,
  `sales_qty` int(11) unsigned default NULL,
  `sales_cost` double(12,2) default NULL,
  `purchase_return_qty` int(10) unsigned default NULL,
  `purchase_return_cost` double(12,2) default NULL,
  `salesret_id` int(11) default NULL,
  `sales_return_qty` int(11) unsigned default NULL,
  `sales_return_cost` double(12,2) default NULL,
  `adjustment_qty` int(11) unsigned default NULL,
  `adjustment_cost` double(12,2) default NULL,
  `challan_id` int(11) default NULL,
  `challan_no` varchar(25) default NULL,
  `challan_qty_sent` int(11) NOT NULL default '0',
  `challan_qty_receive` int(11) NOT NULL default '0',
  `closing_stock` int(11) default NULL,
  `final_stock` int(11) default '0',
  `unitprice` double(12,2) default '0.00',
  `vat` double(12,2) default NULL,
  `vendor_id` int(11) default NULL,
  PRIMARY KEY  (`warehousestore_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_warehousestore_inventorytransaction` */

insert  into `vtiger_warehousestore_inventorytransaction`(`warehousestore_transaction_id`,`date`,`warehousestore_id`,`barcode`,`productid`,`product_name`,`opening_stock_qty`,`opening_cost`,`markup_per`,`markup_amt`,`poid`,`purchase_qty`,`purchase_cost`,`cstwithcform_per`,`cstwithcform_amt`,`cstwithoutcform_per`,`cstwithoutcform_amt`,`invoice_id`,`invoice_no`,`sales_qty`,`sales_cost`,`purchase_return_qty`,`purchase_return_cost`,`salesret_id`,`sales_return_qty`,`sales_return_cost`,`adjustment_qty`,`adjustment_cost`,`challan_id`,`challan_no`,`challan_qty_sent`,`challan_qty_receive`,`closing_stock`,`final_stock`,`unitprice`,`vat`,`vendor_id`) values (1,'2012-07-03 21:10:20',3,'83967',18,'Curtain Cloth Hippo',20,298.15,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,12,387.59,0.00,NULL),(2,'2012-07-03 21:10:20',4,'83967',18,'Curtain Cloth Hippo',20,298.15,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,387.59,0.00,NULL),(3,'2012-07-03 21:10:20',2,'83967',18,'Curtain Cloth Hippo',60,298.15,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,60,60,387.59,0.00,NULL),(4,'2012-07-03 21:11:13',3,'81879',19,'Tomtailor  90*108',10,2274.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,9,2729.58,5.00,NULL),(5,'2012-07-03 21:11:13',4,'81879',19,'Tomtailor  90*108',8,2274.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,8,8,2729.58,5.00,NULL),(6,'2012-07-03 21:11:13',2,'81879',19,'Tomtailor  90*108',12,2274.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,12,12,2729.58,5.00,NULL),(7,'2012-07-03 21:13:38',3,'719768',20,'Esprit Umbrella 2',10,800.65,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,0,1040.85,13.50,NULL),(8,'2012-07-03 21:13:38',4,'719768',20,'Esprit Umbrella 2',10,800.65,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,10,1040.85,13.50,NULL),(9,'2012-07-03 21:13:38',2,'719768',20,'Esprit Umbrella 2',20,800.65,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,1040.85,13.50,NULL),(10,'2012-07-03 21:14:09',3,'988836',21,'Esprit Umbrella 1',5,666.65,25.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,5,0,833.31,13.50,NULL),(11,'2012-07-03 21:14:09',4,'988836',21,'Esprit Umbrella 1',2,666.65,25.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,2,2,833.31,13.50,NULL),(12,'2012-07-03 21:14:09',2,'988836',21,'Esprit Umbrella 1',3,666.65,25.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,3,3,833.31,13.50,NULL),(13,'2012-07-03 21:14:51',3,'739838',22,'Esprit Bedsheet 90',50,2294.75,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,50,35,2524.22,5.00,NULL),(14,'2012-07-03 21:14:51',4,'739838',22,'Esprit Bedsheet 90',30,2294.75,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,30,2524.22,5.00,NULL),(15,'2012-07-03 21:14:51',2,'739838',22,'Esprit Bedsheet 90',20,2294.75,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,2524.22,5.00,NULL),(16,'2012-07-03 21:15:38',3,'51778',23,'Esprit Bedsheet 108',5,2060.25,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,5,0,2472.30,5.00,NULL),(17,'2012-07-03 21:15:38',4,'51778',23,'Esprit Bedsheet 108',5,2060.25,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,5,5,2472.30,5.00,NULL),(18,'2012-07-03 21:15:38',2,'51778',23,'Esprit Bedsheet 108',10,2060.25,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,10,2472.30,5.00,NULL),(19,'2012-07-03 21:45:09',3,NULL,23,'Esprit Bedsheet 108',5,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',2,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,3,0,2472.30,NULL,NULL),(20,'2012-07-03 21:45:09',3,NULL,21,'Esprit Umbrella 1',5,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',24,'INV1_ST1_MNG',2,833.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,3,0,833.31,NULL,NULL),(21,'2012-07-03 22:15:51',3,NULL,20,'Esprit Umbrella 2',10,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',25,'INV2_ST1_MNG',2,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,8,0,1040.85,NULL,NULL),(22,'2012-07-04 16:00:55',3,NULL,23,'Esprit Bedsheet 108',3,2060.25,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',29,'INV3_ST1_MNG',4,2472.30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,-1,0,2472.30,NULL,NULL),(23,'2012-07-05 00:24:36',3,NULL,22,'Esprit Bedsheet 90',50,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',33,'INV4_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,49,0,2524.22,NULL,NULL),(24,'2012-07-05 12:37:59',3,NULL,22,'Esprit Bedsheet 90',49,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',34,'INV5_ST1_MNG',4,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,45,0,2524.22,NULL,NULL),(25,'2012-07-05 16:29:35',3,NULL,18,'Curtain Cloth Hippo',20,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',38,'INV6_ST1_MNG',1,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,19,0,387.59,NULL,NULL),(26,'2012-07-05 16:31:25',3,NULL,18,'Curtain Cloth Hippo',19,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',39,'INV7_ST1_MNG',1,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,18,0,387.59,NULL,NULL),(27,'2012-07-05 16:35:29',3,NULL,18,'Curtain Cloth Hippo',18,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',40,'INV8_ST1_MNG',1,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,17,0,387.59,NULL,NULL),(28,'2012-07-16 13:26:40',2,'95653',55,NULL,0,10000.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(29,'2012-07-16 13:26:40',3,NULL,55,NULL,0,10000.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(30,'2012-07-16 13:26:40',4,NULL,55,NULL,0,10000.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(31,'2012-07-16 19:31:44',3,NULL,22,'Esprit Bedsheet 90',45,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',56,'INV9_ST1_MNG',2,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,43,0,2524.22,NULL,NULL),(32,'2012-07-16 19:31:44',3,NULL,21,'Esprit Umbrella 1',3,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',56,'INV9_ST1_MNG',1,833.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,2,0,833.31,NULL,NULL),(33,'2012-07-18 21:19:33',3,NULL,21,'Esprit Umbrella 1',2,666.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',57,'INV10_ST1_MNG',2,833.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,833.31,NULL,NULL),(34,'2012-07-25 17:16:42',3,NULL,22,'Esprit Bedsheet 90',43,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',62,'INV11_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,42,0,2524.22,NULL,NULL),(35,'2012-07-25 17:16:42',3,NULL,20,'Esprit Umbrella 2',8,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',62,'INV11_ST1_MNG',1,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,1040.85,NULL,NULL),(36,'2012-07-25 17:27:22',3,NULL,20,'Esprit Umbrella 2',7,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',65,'INV12_ST1_MNG',5,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,2,0,1040.85,NULL,NULL),(37,'2012-07-25 17:27:22',3,NULL,22,'Esprit Bedsheet 90',42,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',65,'INV12_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,41,0,2524.22,NULL,NULL),(38,'2012-07-28 15:54:56',3,NULL,22,'Esprit Bedsheet 90',41,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',68,'INV13_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,0,2524.22,NULL,NULL),(39,'2012-07-28 16:20:23',3,NULL,22,'Esprit Bedsheet 90',40,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',71,'INV14_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,39,0,2524.22,NULL,NULL),(40,'2012-07-28 16:22:40',3,NULL,22,'Esprit Bedsheet 90',39,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',73,'INV15_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,38,0,2524.22,NULL,NULL),(41,'2012-07-28 16:23:45',3,NULL,22,'Esprit Bedsheet 90',38,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',75,'INV16_ST1_MNG',1,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,37,0,2524.22,NULL,NULL),(42,'2012-07-28 16:24:35',3,NULL,22,'Esprit Bedsheet 90',37,2294.75,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',77,'INV17_ST1_MNG',2,2524.22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,35,0,2524.22,NULL,NULL),(43,'2012-08-02 20:29:52',3,'8583',80,'cur123',80,793.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,80,66,952.38,5.00,NULL),(44,'2012-08-02 20:29:52',4,'8583',80,'cur123',20,793.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,952.38,5.00,NULL),(45,'2012-08-02 20:29:52',2,'8583',80,'cur123',0,793.65,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,952.38,5.00,NULL),(46,'2012-08-06 11:51:44',3,NULL,80,'cur123',80,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',85,'INV18_ST1_MNG',2,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,78,0,952.38,NULL,NULL),(47,'2012-08-06 12:02:39',3,NULL,80,'cur123',78,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',86,'INV19_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,77,0,952.38,NULL,NULL),(48,'2012-08-06 12:56:01',3,NULL,80,'cur123',77,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',87,'INV20_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,76,0,952.38,NULL,NULL),(49,'2012-08-06 13:40:56',3,NULL,80,'cur123',76,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',88,'INV21_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,75,0,952.38,NULL,NULL),(50,'2012-08-06 13:42:07',3,NULL,80,'cur123',75,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',89,'INV22_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,74,0,952.38,NULL,NULL),(51,'2012-08-06 13:43:12',3,NULL,80,'cur123',74,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',90,'INV23_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,73,0,952.38,NULL,NULL),(52,'2012-08-06 23:01:53',3,NULL,80,'cur123',73,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',92,'INV24_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,72,0,952.38,NULL,NULL),(53,'2012-08-06 23:04:51',3,NULL,80,'cur123',72,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',93,'INV25_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,71,0,952.38,NULL,NULL),(54,'2012-08-06 23:17:39',3,NULL,80,'cur123',71,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',94,'INV26_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,70,0,952.38,NULL,NULL),(55,'2012-08-06 23:27:12',3,NULL,80,'cur123',70,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',95,'INV27_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,69,0,952.38,NULL,NULL),(56,'2012-08-06 23:31:39',3,NULL,80,'cur123',69,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',96,'INV28_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,68,0,952.38,NULL,NULL),(57,'2012-08-06 23:32:36',3,NULL,80,'cur123',68,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',97,'INV29_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,67,0,952.38,NULL,NULL),(58,'2012-08-06 23:35:13',3,NULL,80,'cur123',67,793.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',98,'INV30_ST1_MNG',1,952.38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,66,0,952.38,NULL,NULL),(59,'2012-08-21 18:19:00',3,'838299',106,'Glass Table',20,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,909.09,10.00,NULL),(60,'2012-08-21 18:19:00',4,'838299',106,'Glass Table',40,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,909.09,10.00,NULL),(61,'2012-08-21 18:19:00',2,'838299',106,'Glass Table',40,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,909.09,10.00,NULL),(62,'2012-08-21 18:20:33',3,'83967',18,'Curtain Cloth Hippo',17,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,0,0,14,0,0.00,NULL,NULL),(63,'2012-08-23 18:31:58',3,'245963',110,'Boat 123',30,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,30,909.09,10.00,NULL),(64,'2012-08-23 18:31:58',4,'245963',110,'Boat 123',30,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,30,909.09,10.00,NULL),(65,'2012-08-23 18:31:58',2,'245963',110,'Boat 123',40,757.58,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,909.09,10.00,NULL),(66,'2012-08-23 18:33:21',3,'83967',18,'Curtain Cloth Hippo',14,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,0,0,11,0,0.00,NULL,NULL),(67,'2012-09-08 17:00:48',3,'437953',117,'Red glass',30,7575.76,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,23,9090.91,10.00,NULL),(68,'2012-09-08 17:00:48',4,'437953',117,'Red glass',30,7575.76,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,30,9090.91,10.00,NULL),(69,'2012-09-08 17:00:48',2,'437953',117,'Red glass',40,7575.76,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,9090.91,10.00,NULL),(70,'2012-09-08 17:01:24',3,'6613',118,'Asian Blue Towel',20,1587.30,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,15,1904.76,5.00,NULL),(71,'2012-09-08 17:01:24',4,'6613',118,'Asian Blue Towel',20,1587.30,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,1904.76,5.00,NULL),(72,'2012-09-08 17:01:24',2,'6613',118,'Asian Blue Towel',10,1587.30,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,10,1904.76,5.00,NULL),(73,'2012-09-08 17:02:27',3,'749214',119,'Stering',20,984.09,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,15,1180.91,10.00,NULL),(74,'2012-09-08 17:02:27',4,'749214',119,'Stering',20,984.09,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,1180.91,10.00,NULL),(75,'2012-09-08 17:02:27',2,'749214',119,'Stering',60,984.09,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,60,60,1180.91,10.00,NULL),(76,'2012-09-08 17:03:09',3,'596533',120,'Royal Sofaset',30,1015.32,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,26,1319.92,13.50,NULL),(77,'2012-09-08 17:03:09',4,'596533',120,'Royal Sofaset',30,1015.32,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,30,30,1319.92,13.50,NULL),(78,'2012-09-08 17:03:09',2,'596533',120,'Royal Sofaset',40,1015.32,30.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,1319.92,13.50,NULL),(79,'2012-09-08 17:06:28',3,NULL,119,'Stering',20,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',2,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,18,0,1180.91,NULL,NULL),(80,'2012-09-08 17:06:28',3,NULL,120,'Royal Sofaset',30,1015.32,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',2,1319.92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,28,0,1319.92,NULL,NULL),(81,'2012-09-08 17:06:28',3,NULL,117,'Red glass',30,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',1,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,29,0,9090.91,NULL,NULL),(82,'2012-09-08 17:06:28',3,NULL,118,'Asian Blue Towel',20,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',121,'INV31_ST1_MNG',1,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,19,0,1904.76,NULL,NULL),(83,'2012-09-08 17:18:36',3,NULL,117,'Red glass',29,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',124,'INV32_ST1_MNG',1,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,28,0,9090.91,NULL,NULL),(84,'2012-09-08 17:18:36',3,NULL,119,'Stering',18,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',124,'INV32_ST1_MNG',1,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,17,0,1180.91,NULL,NULL),(85,'2012-09-08 17:49:56',3,'11538',127,'Haldiram 500 gm',20,43.86,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,12,48.25,14.00,NULL),(86,'2012-09-08 17:49:56',4,'11538',127,'Haldiram 500 gm',20,43.86,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,48.25,14.00,NULL),(87,'2012-09-08 17:49:56',2,'11538',127,'Haldiram 500 gm',60,43.86,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,60,60,48.25,14.00,NULL),(88,'2012-09-08 17:52:14',3,NULL,127,'Haldiram 500 gm',20,43.86,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',4,48.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,16,0,48.25,NULL,NULL),(89,'2012-09-08 17:52:14',3,NULL,117,'Red glass',28,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,27,0,9090.91,NULL,NULL),(90,'2012-09-08 17:52:14',3,NULL,118,'Asian Blue Towel',19,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,18,0,1904.76,NULL,NULL),(91,'2012-09-08 17:52:14',3,NULL,119,'Stering',17,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,16,0,1180.91,NULL,NULL),(92,'2012-09-08 17:52:14',3,NULL,120,'Royal Sofaset',28,1015.32,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,1319.92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,27,0,1319.92,NULL,NULL),(93,'2012-09-08 17:52:14',3,NULL,19,'Tomtailor  90*108',10,2274.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',128,'INV33_ST1_MNG',1,2729.58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,9,0,2729.58,NULL,NULL),(94,'2012-09-08 17:55:17',3,NULL,127,'Haldiram 500 gm',16,43.86,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',129,'INV34_ST1_MNG',4,48.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,12,0,48.25,NULL,NULL),(95,'2012-09-08 17:55:17',3,NULL,118,'Asian Blue Towel',18,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',129,'INV34_ST1_MNG',2,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,16,0,1904.76,NULL,NULL),(96,'2012-09-08 17:55:17',3,NULL,117,'Red glass',27,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',129,'INV34_ST1_MNG',1,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,26,0,9090.91,NULL,NULL),(97,'2012-09-08 18:04:58',2,'448',132,NULL,0,50.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(98,'2012-09-08 18:04:58',3,NULL,132,NULL,0,50.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(99,'2012-09-08 18:04:58',4,NULL,132,NULL,0,50.00,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(100,'2012-09-08 18:06:54',2,'448',132,'xyz123',0,50.00,10.00,0.00,133,100,50.00,'2.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,100,100,63.95,14.00,NULL),(101,'2012-09-21 14:11:09',3,NULL,117,'Red glass',26,7575.76,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',3,9090.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,23,0,9090.91,NULL,NULL),(102,'2012-09-21 14:11:09',3,NULL,118,'Asian Blue Towel',16,1587.30,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',1,1904.76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,15,0,1904.76,NULL,NULL),(103,'2012-09-21 14:11:09',3,NULL,119,'Stering',16,984.09,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',1,1180.91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,15,0,1180.91,NULL,NULL),(104,'2012-09-21 14:11:09',3,NULL,120,'Royal Sofaset',27,1015.32,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',135,'INV35_ST1_MNG',1,1319.92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,26,0,1319.92,NULL,NULL),(105,'2012-10-05 14:45:03',3,'32598',140,'Wrangler Blue',20,947.62,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,13,1137.14,5.50,NULL),(106,'2012-10-05 14:45:03',4,'32598',140,'Wrangler Blue',40,947.62,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,1137.14,5.50,NULL),(107,'2012-10-05 14:45:03',2,'32598',140,'Wrangler Blue',40,947.62,20.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,1137.14,5.50,NULL),(108,'2012-10-05 14:48:57',3,NULL,140,'Wrangler Blue',20,947.62,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',142,'INV36_ST1_MNG',4,1137.14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,16,0,1137.14,NULL,NULL),(109,'2012-10-05 14:48:57',3,NULL,20,'Esprit Umbrella 2',2,800.65,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',142,'INV36_ST1_MNG',3,1040.85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,-1,0,1040.85,NULL,NULL),(110,'2012-10-05 14:48:57',3,NULL,18,'Curtain Cloth Hippo',11,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',142,'INV36_ST1_MNG',1,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,0,387.59,NULL,NULL),(111,'2012-10-05 14:50:57',3,NULL,140,'Wrangler Blue',16,947.62,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',143,'INV37_ST1_MNG',3,1137.14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,13,0,1137.14,NULL,NULL),(112,'2012-10-05 15:02:58',2,'497912',147,NULL,0,789.68,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(113,'2012-10-05 15:02:58',3,NULL,147,NULL,0,789.68,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(114,'2012-10-05 15:02:58',4,NULL,147,NULL,0,789.68,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(115,'2012-10-23 00:50:29',3,NULL,18,'Curtain Cloth Hippo',10,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',151,'INV38_ST1_MNG',1,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,9,0,387.59,NULL,NULL),(116,'2012-10-23 10:16:58',3,NULL,18,'Curtain Cloth Hippo',9,298.15,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',153,'INV39_ST1_MNG',3,387.59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,6,0,387.59,NULL,NULL),(117,'2012-10-23 10:24:21',3,'464158',156,'Ashirwad',40,158.69,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,36,174.56,14.50,NULL),(118,'2012-10-23 10:24:21',4,'464158',156,'Ashirwad',40,158.69,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,40,40,174.56,14.50,NULL),(119,'2012-10-23 10:24:21',2,'464158',156,'Ashirwad',20,158.69,10.00,0.00,NULL,NULL,NULL,NULL,'0.00',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,20,20,174.56,14.50,NULL),(120,'2012-10-23 10:26:01',3,NULL,156,'Ashirwad',40,158.69,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',157,'INV40_ST1_MNG',4,174.56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,36,0,174.56,NULL,NULL),(121,'2012-10-23 10:32:18',2,'89318',159,NULL,0,23.80,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(122,'2012-10-23 10:32:18',3,NULL,159,NULL,0,23.80,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(123,'2012-10-23 10:32:18',4,NULL,159,NULL,0,23.80,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,NULL),(124,'2012-10-23 10:36:26',3,'464158',156,'Ashirwad',36,158.69,0.00,0.00,NULL,NULL,NULL,'0.00','0.00','0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,35,0,0.00,NULL,NULL);

/*Table structure for table `vtiger_wordtemplates` */

DROP TABLE IF EXISTS `vtiger_wordtemplates`;

CREATE TABLE `vtiger_wordtemplates` (
  `templateid` int(19) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `module` varchar(30) NOT NULL,
  `date_entered` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `parent_type` varchar(50) NOT NULL,
  `data` longblob,
  `description` text,
  `filesize` varchar(50) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `deleted` int(1) NOT NULL default '0',
  PRIMARY KEY  (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_wordtemplates` */

/*Table structure for table `vtiger_ws_entity` */

DROP TABLE IF EXISTS `vtiger_ws_entity`;

CREATE TABLE `vtiger_ws_entity` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_class` varchar(64) NOT NULL,
  `ismodule` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity` */

insert  into `vtiger_ws_entity`(`id`,`name`,`handler_path`,`handler_class`,`ismodule`) values (1,'Calendar','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(2,'Leads','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(3,'Accounts','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(4,'Contacts','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(5,'Potentials','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(6,'Products','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(7,'Documents','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(8,'Emails','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(9,'HelpDesk','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(10,'Faq','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(11,'Vendors','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(12,'PriceBooks','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(13,'Quotes','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(14,'PurchaseOrder','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(15,'SalesOrder','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(16,'Invoice','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(17,'Campaigns','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(18,'Events','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(19,'Users','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(20,'Groups','include/Webservices/VtigerActorOperation.php','VtigerActorOperation',0),(21,'Currency','include/Webservices/VtigerActorOperation.php','VtigerActorOperation',0),(22,'DocumentFolders','include/Webservices/VtigerActorOperation.php','VtigerActorOperation',0),(23,'PBXManager','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(24,'ServiceContracts','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(25,'Services','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(26,'Assets','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(27,'ModComments','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(28,'ProjectMilestone','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(29,'ProjectTask','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(30,'Project','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(31,'SMSNotifier','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(32,'Barcode','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(33,'Warehouse','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(34,'Promotionalsale','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(35,'ClearanceSale','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(36,'PurchaseOrderReceived','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(37,'SalesReturn','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(38,'Cashreceipt','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(39,'Stockadjustment','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(40,'Category','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(41,'Deliverychallan','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(42,'PurchaseRequest','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(43,'PRDelivery','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(44,'PRReceive','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1),(45,'EmailSettings','include/Webservices/VtigerModuleOperation.php','VtigerModuleOperation',1);

/*Table structure for table `vtiger_ws_entity_fieldtype` */

DROP TABLE IF EXISTS `vtiger_ws_entity_fieldtype`;

CREATE TABLE `vtiger_ws_entity_fieldtype` (
  `fieldtypeid` int(19) NOT NULL auto_increment,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `fieldtype` varchar(200) NOT NULL,
  PRIMARY KEY  (`fieldtypeid`),
  UNIQUE KEY `vtiger_idx_1_tablename_fieldname` (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity_fieldtype` */

insert  into `vtiger_ws_entity_fieldtype`(`fieldtypeid`,`table_name`,`field_name`,`fieldtype`) values (1,'vtiger_attachmentsfolder','createdby','reference');

/*Table structure for table `vtiger_ws_entity_fieldtype_seq` */

DROP TABLE IF EXISTS `vtiger_ws_entity_fieldtype_seq`;

CREATE TABLE `vtiger_ws_entity_fieldtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity_fieldtype_seq` */

insert  into `vtiger_ws_entity_fieldtype_seq`(`id`) values (1);

/*Table structure for table `vtiger_ws_entity_name` */

DROP TABLE IF EXISTS `vtiger_ws_entity_name`;

CREATE TABLE `vtiger_ws_entity_name` (
  `entity_id` int(11) NOT NULL,
  `name_fields` varchar(50) NOT NULL,
  `index_field` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity_name` */

insert  into `vtiger_ws_entity_name`(`entity_id`,`name_fields`,`index_field`,`table_name`) values (20,'groupname','groupid','vtiger_groups'),(21,'currency_name','id','vtiger_currency_info'),(22,'foldername','folderid','vtiger_attachmentsfolder');

/*Table structure for table `vtiger_ws_entity_referencetype` */

DROP TABLE IF EXISTS `vtiger_ws_entity_referencetype`;

CREATE TABLE `vtiger_ws_entity_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY  (`fieldtypeid`,`type`),
  CONSTRAINT `vtiger_fk_1_actors_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES `vtiger_ws_entity_fieldtype` (`fieldtypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity_referencetype` */

insert  into `vtiger_ws_entity_referencetype`(`fieldtypeid`,`type`) values (1,'Users');

/*Table structure for table `vtiger_ws_entity_seq` */

DROP TABLE IF EXISTS `vtiger_ws_entity_seq`;

CREATE TABLE `vtiger_ws_entity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity_seq` */

insert  into `vtiger_ws_entity_seq`(`id`) values (45);

/*Table structure for table `vtiger_ws_entity_tables` */

DROP TABLE IF EXISTS `vtiger_ws_entity_tables`;

CREATE TABLE `vtiger_ws_entity_tables` (
  `webservice_entity_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`webservice_entity_id`,`table_name`),
  CONSTRAINT `fk_1_vtiger_ws_actor_tables` FOREIGN KEY (`webservice_entity_id`) REFERENCES `vtiger_ws_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_entity_tables` */

insert  into `vtiger_ws_entity_tables`(`webservice_entity_id`,`table_name`) values (20,'vtiger_groups'),(21,'vtiger_currency_info'),(22,'vtiger_attachmentsfolder');

/*Table structure for table `vtiger_ws_fieldtype` */

DROP TABLE IF EXISTS `vtiger_ws_fieldtype`;

CREATE TABLE `vtiger_ws_fieldtype` (
  `fieldtypeid` int(19) NOT NULL auto_increment,
  `uitype` varchar(30) NOT NULL,
  `fieldtype` varchar(200) NOT NULL,
  PRIMARY KEY  (`fieldtypeid`),
  UNIQUE KEY `uitype_idx` (`uitype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_fieldtype` */

insert  into `vtiger_ws_fieldtype`(`fieldtypeid`,`uitype`,`fieldtype`) values (1,'15','picklist'),(2,'16','picklist'),(3,'19','text'),(4,'20','text'),(5,'21','text'),(6,'24','text'),(7,'3','autogenerated'),(8,'11','phone'),(9,'33','multipicklist'),(10,'17','url'),(11,'85','skype'),(12,'56','boolean'),(13,'156','boolean'),(14,'53','owner'),(15,'61','file'),(16,'28','file'),(17,'50','reference'),(18,'51','reference'),(19,'57','reference'),(20,'58','reference'),(21,'73','reference'),(22,'75','reference'),(23,'76','reference'),(24,'78','reference'),(25,'80','reference'),(26,'81','reference'),(27,'101','reference'),(28,'52','reference'),(29,'357','reference'),(30,'59','reference'),(31,'66','reference'),(32,'77','reference'),(33,'68','reference'),(34,'117','reference'),(35,'26','reference'),(36,'10','reference');

/*Table structure for table `vtiger_ws_operation` */

DROP TABLE IF EXISTS `vtiger_ws_operation`;

CREATE TABLE `vtiger_ws_operation` (
  `operationid` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_method` varchar(64) NOT NULL,
  `type` varchar(8) NOT NULL,
  `prelogin` int(3) NOT NULL,
  PRIMARY KEY  (`operationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_operation` */

insert  into `vtiger_ws_operation`(`operationid`,`name`,`handler_path`,`handler_method`,`type`,`prelogin`) values (1,'login','include/Webservices/Login.php','vtws_login','POST',1),(2,'retrieve','include/Webservices/Retrieve.php','vtws_retrieve','GET',0),(3,'create','include/Webservices/Create.php','vtws_create','POST',0),(4,'update','include/Webservices/Update.php','vtws_update','POST',0),(5,'delete','include/Webservices/Delete.php','vtws_delete','POST',0),(6,'sync','include/Webservices/GetUpdates.php','vtws_sync','GET',0),(7,'query','include/Webservices/Query.php','vtws_query','GET',0),(8,'logout','include/Webservices/Logout.php','vtws_logout','POST',0),(9,'listtypes','include/Webservices/ModuleTypes.php','vtws_listtypes','GET',0),(10,'getchallenge','include/Webservices/AuthToken.php','vtws_getchallenge','GET',1),(11,'describe','include/Webservices/DescribeObject.php','vtws_describe','GET',0),(12,'extendsession','include/Webservices/ExtendSession.php','vtws_extendSession','POST',1),(13,'convertlead','include/Webservices/ConvertLead.php','vtws_convertlead','POST',0),(14,'revise','include/Webservices/Revise.php','vtws_revise','POST',0),(15,'mobile.fetchallalerts','modules/Mobile/api/wsapi.php','mobile_ws_fetchAllAlerts','POST',0),(16,'mobile.alertdetailswithmessage','modules/Mobile/api/wsapi.php','mobile_ws_alertDetailsWithMessage','POST',0),(17,'mobile.fetchmodulefilters','modules/Mobile/api/wsapi.php','mobile_ws_fetchModuleFilters','POST',0),(18,'mobile.fetchrecord','modules/Mobile/api/wsapi.php','mobile_ws_fetchRecord','POST',0),(19,'mobile.fetchrecordwithgrouping','modules/Mobile/api/wsapi.php','mobile_ws_fetchRecordWithGrouping','POST',0),(20,'mobile.filterdetailswithcount','modules/Mobile/api/wsapi.php','mobile_ws_filterDetailsWithCount','POST',0),(21,'mobile.listmodulerecords','modules/Mobile/api/wsapi.php','mobile_ws_listModuleRecords','POST',0),(22,'mobile.saverecord','modules/Mobile/api/wsapi.php','mobile_ws_saveRecord','POST',0),(23,'mobile.syncModuleRecords','modules/Mobile/api/wsapi.php','mobile_ws_syncModuleRecords','POST',0),(24,'mobile.query','modules/Mobile/api/wsapi.php','mobile_ws_query','POST',0),(25,'mobile.querywithgrouping','modules/Mobile/api/wsapi.php','mobile_ws_queryWithGrouping','POST',0);

/*Table structure for table `vtiger_ws_operation_parameters` */

DROP TABLE IF EXISTS `vtiger_ws_operation_parameters`;

CREATE TABLE `vtiger_ws_operation_parameters` (
  `operationid` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY  (`operationid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_operation_parameters` */

insert  into `vtiger_ws_operation_parameters`(`operationid`,`name`,`type`,`sequence`) values (1,'accessKey','String',2),(1,'username','String',1),(2,'id','String',1),(3,'element','encoded',2),(3,'elementType','String',1),(4,'element','encoded',1),(5,'id','String',1),(6,'elementType','String',2),(6,'modifiedTime','DateTime',1),(7,'query','String',1),(8,'sessionName','String',1),(10,'username','String',1),(11,'elementType','String',1),(13,'accountName','String',3),(13,'assignedTo','String',2),(13,'avoidPotential','Boolean',4),(13,'leadId','String',1),(13,'potential','Encoded',5),(14,'element','Encoded',1),(16,'alertid','string',1),(17,'module','string',1),(18,'record','string',1),(19,'record','string',1),(20,'filterid','string',1),(21,'elements','encoded',1),(22,'module','string',1),(22,'record','string',2),(22,'values','encoded',3),(23,'module','string',1),(23,'page','string',3),(23,'syncToken','string',2),(24,'module','string',1),(24,'page','string',3),(24,'query','string',2),(25,'module','string',1),(25,'page','string',3),(25,'query','string',2);

/*Table structure for table `vtiger_ws_operation_seq` */

DROP TABLE IF EXISTS `vtiger_ws_operation_seq`;

CREATE TABLE `vtiger_ws_operation_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_operation_seq` */

insert  into `vtiger_ws_operation_seq`(`id`) values (25);

/*Table structure for table `vtiger_ws_referencetype` */

DROP TABLE IF EXISTS `vtiger_ws_referencetype`;

CREATE TABLE `vtiger_ws_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY  (`fieldtypeid`,`type`),
  CONSTRAINT `fk_1_vtiger_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES `vtiger_ws_fieldtype` (`fieldtypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_referencetype` */

insert  into `vtiger_ws_referencetype`(`fieldtypeid`,`type`) values (17,'Accounts'),(18,'Accounts'),(19,'Contacts'),(20,'Campaigns'),(21,'Accounts'),(22,'Vendors'),(23,'Potentials'),(24,'Quotes'),(25,'SalesOrder'),(26,'Vendors'),(27,'Users'),(28,'Users'),(29,'Accounts'),(29,'Contacts'),(29,'Leads'),(29,'Users'),(29,'Vendors'),(30,'Products'),(31,'Accounts'),(31,'HelpDesk'),(31,'Leads'),(31,'Potentials'),(32,'Users'),(33,'Accounts'),(33,'Contacts'),(34,'Currency'),(35,'DocumentFolders');

/*Table structure for table `vtiger_ws_userauthtoken` */

DROP TABLE IF EXISTS `vtiger_ws_userauthtoken`;

CREATE TABLE `vtiger_ws_userauthtoken` (
  `userid` int(19) NOT NULL,
  `token` varchar(36) NOT NULL,
  `expiretime` int(19) NOT NULL,
  PRIMARY KEY  (`userid`,`expiretime`),
  UNIQUE KEY `userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vtiger_ws_userauthtoken` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
