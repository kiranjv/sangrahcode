CREATE TABLE `vtiger_contactroyality` (
		`royalityid` int(19) NOT NULL DEFAULT '0',
        `contactid` int(19) NOT NULL DEFAULT '0',
		`royalitynumber` varchar(100) NOT NULL,
		`royalitycount` int(19) NOT NULL,
         PRIMARY KEY (`royalityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table `vtiger_contactroyality` change `royalityid` `royalityid` int(19) NOT NULL AUTO_INCREMENT;

CREATE TABLE `vtiger_royality_amount` (          
  `id` int(19) NOT NULL AUTO_INCREMENT,  
  `royality_count` int(19) NOT NULL DEFAULT '0',      
  `royalitynumber` varchar(100) NOT NULL,        
  `royalityamount` DECIMAL(19,2) NOT NULL,              
  PRIMARY KEY (`id`)                     
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table `vtiger_royality_amount` drop column `royalitynumber`;
alter table `vtiger_royality_amount` add column `from_date` date NULL after `royalityamount`, add column `to_date` date NULL after `from_date`;

rename table `vtiger_royality_amount` to `vtiger_royality`;
alter table `vtiger_royality` change `id` `royalityid` int(19) NOT NULL AUTO_INCREMENT;

alter table `vtiger_royality` add column `deleted` smallint(1) DEFAULT '0' NOT NULL after `to_date`;

alter table `stock_lifo_fifo` engine = InnoDB;
alter table `vtiger_delivery_products` engine = InnoDB;
alter table `vtiger_deliverychallan_status` engine = InnoDB;
alter table `vtiger_deliverychallan_transaction` engine = InnoDB;
alter table `vtiger_purchaserequest_item` engine = InnoDB;

CREATE TABLE `vtiger_salesman` (                         
   `id` int(19) NOT NULL AUTO_INCREMENT,          
   `userid` int(19) NOT NULL DEFAULT '0',         
   `invoiceid` int(19) NOT NULL DEFAULT '0',	
   `amount` decimal(19,2) NOT NULL,               
   `date` date DEFAULT NULL,                         
   
   PRIMARY KEY (`id`)                             
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 CREATE TABLE `vtiger_royality` (                         
                   `royalityid` int(19) NOT NULL AUTO_INCREMENT,          
                   `royality_count` int(19) NOT NULL DEFAULT '0',         
                   `royalityamount` decimal(19,2) NOT NULL,               
                   `from_date` date DEFAULT NULL,                         
                   `to_date` date DEFAULT NULL,                           
                   `deleted` smallint(1) NOT NULL DEFAULT '0',            
                   PRIMARY KEY (`royalityid`)                             
                 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1; 

