CREATE TABLE `com_vtiger_workflow_activatedonce` (`workflow_id` INT  NOT NULL DEFAULT 0,`entity_id` INT  NOT NULL DEFAULT 0,PRIMARY KEY (workflow_id,entity_id));

CREATE TABLE `com_vtiger_workflows` (`workflow_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`module_name` VARCHAR(100)  NULL DEFAULT NULL,`summary` VARCHAR(400)  NOT NULL ,`test` TEXT  NULL ,`execution_condition` INT  NOT NULL DEFAULT 0,`defaultworkflow` INT  NULL DEFAULT NULL);

CREATE TABLE `com_vtiger_workflows_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `com_vtiger_workflowtask_queue` (`task_id` INT  NULL DEFAULT NULL,`entity_id` VARCHAR(100)  NULL DEFAULT NULL,`do_after` INT  NULL DEFAULT NULL);

CREATE TABLE `com_vtiger_workflowtasks` (`task_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`workflow_id` INT  NULL DEFAULT NULL,`summary` VARCHAR(400)  NOT NULL ,`task` TEXT  NULL );

CREATE TABLE `com_vtiger_workflowtasks_entitymethod` (`workflowtasks_entitymethod_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`module_name` VARCHAR(100)  NULL DEFAULT NULL,`method_name` VARCHAR(100)  NULL DEFAULT NULL,`function_path` VARCHAR(400)  NULL DEFAULT NULL,`function_name` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `com_vtiger_workflowtasks_entitymethod_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `com_vtiger_workflowtasks_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `com_vtiger_workflowtemplates` (`template_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`module_name` VARCHAR(100)  NULL DEFAULT NULL,`title` VARCHAR(400)  NULL DEFAULT NULL,`template` TEXT  NULL );

CREATE TABLE `crmnow_pdf_fields` (`pdffieldid` INT PRIMARY KEY NOT NULL DEFAULT 0,`pdffieldname` VARCHAR(30)  NOT NULL ,`pdftablename` VARCHAR(30)  NOT NULL ,`quotes_g_enabled` INT  NOT NULL DEFAULT 0,`quotes_i_enabled` INT  NOT NULL DEFAULT 0,`po_g_enabled` INT  NOT NULL DEFAULT 0,`po_i_enabled` INT  NOT NULL DEFAULT 0,`so_g_enabled` INT  NOT NULL DEFAULT 0,`so_i_enabled` INT  NOT NULL DEFAULT 0,`invoice_g_enabled` INT  NOT NULL DEFAULT 0,`invoice_i_enabled` INT  NOT NULL DEFAULT 0);

CREATE TABLE `crmnow_pdfcolums_active` (`pdfcolumnactiveid` INT PRIMARY KEY NOT NULL DEFAULT 0,`pdfmodulname` VARCHAR(13)  NOT NULL DEFAULT '0',`pdftaxmode` VARCHAR(10)  NOT NULL DEFAULT '0',`position` VARCHAR(8)  NOT NULL DEFAULT '0',`ordercode` VARCHAR(8)  NOT NULL DEFAULT '0',`description` VARCHAR(8)  NOT NULL DEFAULT '0',`qty` VARCHAR(8)  NOT NULL DEFAULT '0',`unit` VARCHAR(8)  NOT NULL DEFAULT '0',`unitprice` VARCHAR(8)  NOT NULL DEFAULT '0',`discount` VARCHAR(8)  NOT NULL DEFAULT '0',`tax` VARCHAR(8)  NOT NULL DEFAULT '0',`linetotal` VARCHAR(8)  NOT NULL DEFAULT '0');

CREATE TABLE `crmnow_pdfcolums_sel` (`pdfcolumnselid` INT PRIMARY KEY NOT NULL DEFAULT 0,`pdfmodul` VARCHAR(13)  NOT NULL DEFAULT '0',`pdftaxmode` VARCHAR(10)  NOT NULL DEFAULT '0',`position` VARCHAR(7)  NOT NULL DEFAULT '0',`ordercode` VARCHAR(7)  NOT NULL DEFAULT '0',`description` VARCHAR(7)  NOT NULL DEFAULT '0',`qty` VARCHAR(7)  NOT NULL DEFAULT '0',`unit` VARCHAR(7)  NOT NULL DEFAULT '0',`unitprice` VARCHAR(7)  NOT NULL DEFAULT '0',`discount` VARCHAR(7)  NOT NULL DEFAULT '0',`tax` VARCHAR(7)  NOT NULL DEFAULT '0',`linetotal` VARCHAR(7)  NOT NULL DEFAULT '0');

CREATE TABLE `crmnow_pdfconfiguration` (`pdfid` INT PRIMARY KEY NOT NULL DEFAULT 0,`pdfmodul` VARCHAR(13)  NOT NULL ,`fontid` INT  NOT NULL DEFAULT 0,`fontsizebody` INT  NOT NULL DEFAULT 9,`fontsizeheader` INT  NOT NULL DEFAULT 9,`fontsizefooter` INT  NOT NULL DEFAULT 9,`fontsizeaddress` INT  NOT NULL DEFAULT 9,`dateused` INT  NOT NULL DEFAULT 0,`spaceheadline` INT  NOT NULL DEFAULT 1,`summaryradio` VARCHAR(5)  NOT NULL DEFAULT 'true',`gprodname` VARCHAR(5)  NOT NULL DEFAULT 'true',`gproddes` VARCHAR(5)  NOT NULL DEFAULT 'true',`gprodcom` VARCHAR(5)  NOT NULL DEFAULT 'true',`iprodname` VARCHAR(5)  NOT NULL DEFAULT 'true',`iproddes` VARCHAR(5)  NOT NULL DEFAULT 'true',`iprodcom` VARCHAR(5)  NOT NULL DEFAULT 'true',`pdflang` VARCHAR(5)  NOT NULL DEFAULT 'ge_de',`footerradio` VARCHAR(5)  NOT NULL DEFAULT 'true',`logoradio` VARCHAR(5)  NOT NULL DEFAULT 'true',`pageradio` VARCHAR(5)  NOT NULL DEFAULT 'true',`owner` VARCHAR(5)  NOT NULL DEFAULT 'true',`ownerphone` VARCHAR(5)  NOT NULL DEFAULT 'true',`poname` VARCHAR(5)  NOT NULL DEFAULT 'true',`clientid` VARCHAR(5)  NOT NULL DEFAULT 'true',`carrier` VARCHAR(5)  NOT NULL DEFAULT 'true');

CREATE TABLE `crmnow_pdffonts` (`fontid` INT PRIMARY KEY NOT NULL DEFAULT 0,`tcpdfname` VARCHAR(30)  NOT NULL ,`namedisplay` VARCHAR(50)  NOT NULL );

CREATE TABLE `salereturn_productdetail` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`salesreturn_id` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,`invoice_qty` FLOAT(25,2)  NOT NULL DEFAULT 0,`unitprice` FLOAT(25,2)  NOT NULL DEFAULT 0,`discount` FLOAT(10,2)  NULL DEFAULT 0,`vat` FLOAT(10,2)  NULL DEFAULT 0,`saleret_qty` FLOAT(25,2)  NOT NULL DEFAULT 0,`saleret_price` FLOAT(25,2)  NOT NULL DEFAULT 0);

CREATE TABLE `stock_lifo_fifo` (`status` VARCHAR(100)  NOT NULL );

CREATE TABLE `vtiger_account` (`accountid` INT PRIMARY KEY NOT NULL DEFAULT 0,`account_no` VARCHAR(100)  NOT NULL ,`accountname` VARCHAR(100)  NOT NULL ,`parentid` INT  NULL DEFAULT 0,`account_type` VARCHAR(200)  NULL DEFAULT NULL,`industry` VARCHAR(200)  NULL DEFAULT NULL,`annualrevenue` INT  NULL DEFAULT 0,`rating` VARCHAR(200)  NULL DEFAULT NULL,`ownership` VARCHAR(50)  NULL DEFAULT NULL,`siccode` VARCHAR(50)  NULL DEFAULT NULL,`tickersymbol` VARCHAR(30)  NULL DEFAULT NULL,`phone` VARCHAR(30)  NULL DEFAULT NULL,`otherphone` VARCHAR(30)  NULL DEFAULT NULL,`email1` VARCHAR(100)  NULL DEFAULT NULL,`email2` VARCHAR(100)  NULL DEFAULT NULL,`website` VARCHAR(100)  NULL DEFAULT NULL,`fax` VARCHAR(30)  NULL DEFAULT NULL,`employees` INT  NULL DEFAULT 0,`emailoptout` VARCHAR(3)  NULL DEFAULT '0',`notify_owner` VARCHAR(3)  NULL DEFAULT '0',CONSTRAINT `fk_1_vtiger_account` FOREIGN KEY (`accountid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_accountbillads` (`accountaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`bill_city` VARCHAR(30)  NULL DEFAULT NULL,`bill_code` VARCHAR(30)  NULL DEFAULT NULL,`bill_country` VARCHAR(30)  NULL DEFAULT NULL,`bill_state` VARCHAR(30)  NULL DEFAULT NULL,`bill_street` VARCHAR(250)  NULL DEFAULT NULL,`bill_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_accountbillads` FOREIGN KEY (`accountaddressid`) REFERENCES vtiger_account (`accountid`));

CREATE TABLE `vtiger_accountdepstatus` (`deploymentstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`deploymentstatus` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_accountownership` (`acctownershipid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`ownership` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_accountrating` (`accountratingid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`rating` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_accountregion` (`accountregionid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`region` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_accountscf` (`accountid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_accountscf` FOREIGN KEY (`accountid`) REFERENCES vtiger_account (`accountid`));

CREATE TABLE `vtiger_accountshipads` (`accountaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ship_city` VARCHAR(30)  NULL DEFAULT NULL,`ship_code` VARCHAR(30)  NULL DEFAULT NULL,`ship_country` VARCHAR(30)  NULL DEFAULT NULL,`ship_state` VARCHAR(30)  NULL DEFAULT NULL,`ship_pobox` VARCHAR(30)  NULL DEFAULT NULL,`ship_street` VARCHAR(250)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_accountshipads` FOREIGN KEY (`accountaddressid`) REFERENCES vtiger_account (`accountid`));

CREATE TABLE `vtiger_accounttype` (`accounttypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`accounttype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_accounttype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_actionmapping` (`actionid` INT  NOT NULL DEFAULT 0,`actionname` VARCHAR(200)  NOT NULL ,`securitycheck` INT  NULL DEFAULT NULL,PRIMARY KEY (actionid,actionname));

CREATE TABLE `vtiger_activity` (`activityid` INT PRIMARY KEY NOT NULL DEFAULT 0,`subject` VARCHAR(100)  NOT NULL ,`semodule` VARCHAR(20)  NULL DEFAULT NULL,`activitytype` VARCHAR(200)  NOT NULL ,`date_start` DATE  NOT NULL ,`due_date` DATE  NULL DEFAULT NULL,`time_start` VARCHAR(50)  NULL DEFAULT NULL,`time_end` VARCHAR(50)  NULL DEFAULT NULL,`sendnotification` VARCHAR(3)  NOT NULL DEFAULT '0',`duration_hours` VARCHAR(200)  NULL DEFAULT NULL,`duration_minutes` VARCHAR(200)  NULL DEFAULT NULL,`status` VARCHAR(200)  NULL DEFAULT NULL,`eventstatus` VARCHAR(200)  NULL DEFAULT NULL,`priority` VARCHAR(200)  NULL DEFAULT NULL,`location` VARCHAR(150)  NULL DEFAULT NULL,`notime` VARCHAR(3)  NOT NULL DEFAULT '0',`visibility` VARCHAR(50)  NOT NULL DEFAULT 'all',`recurringtype` VARCHAR(200)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_activity` FOREIGN KEY (`activityid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_activity_reminder` (`activity_id` INT  NOT NULL DEFAULT 0,`reminder_time` INT  NOT NULL DEFAULT 0,`reminder_sent` INT  NOT NULL DEFAULT 0,`recurringid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (activity_id,recurringid));

CREATE TABLE `vtiger_activity_reminder_popup` (`reminderid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`semodule` VARCHAR(100)  NOT NULL ,`recordid` INT  NOT NULL DEFAULT 0,`date_start` DATE  NOT NULL ,`time_start` VARCHAR(100)  NOT NULL ,`status` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_activity_view` (`activity_viewid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`activity_view` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_activity_view_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_activitycf` (`activityid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_activityproductrel` (`activityid` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (activityid,productid),CONSTRAINT `fk_2_vtiger_activityproductrel` FOREIGN KEY (`productid`) REFERENCES vtiger_products (`productid`));

CREATE TABLE `vtiger_activitytype` (`activitytypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`activitytype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_activitytype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_activsubtype` (`activesubtypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`activsubtype` VARCHAR(100)  NULL DEFAULT NULL,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_announcement` (`creatorid` INT PRIMARY KEY NOT NULL DEFAULT 0,`announcement` TEXT  NULL ,`title` VARCHAR(255)  NULL DEFAULT NULL,`time` TIMESTAMP  NOT NULL );

CREATE TABLE `vtiger_assets` (`assetsid` INT PRIMARY KEY NOT NULL DEFAULT 0,`asset_no` VARCHAR(30)  NOT NULL ,`account` INT  NOT NULL DEFAULT 0,`product` INT  NOT NULL DEFAULT 0,`serialnumber` VARCHAR(200)  NOT NULL ,`datesold` DATE  NOT NULL ,`dateinservice` DATE  NOT NULL ,`assetstatus` VARCHAR(200)  NULL DEFAULT 'In Service',`tagnumber` VARCHAR(300)  NULL DEFAULT NULL,`invoiceid` INT  NULL DEFAULT NULL,`shippingmethod` VARCHAR(200)  NULL DEFAULT NULL,`shippingtrackingnumber` VARCHAR(200)  NULL DEFAULT NULL,`assetname` VARCHAR(100)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_assets` FOREIGN KEY (`assetsid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_assetscf` (`assetsid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_assetstatus` (`assetstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`assetstatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_assetstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_asterisk` (`server` VARCHAR(30)  NULL DEFAULT NULL,`port` VARCHAR(30)  NULL DEFAULT NULL,`username` VARCHAR(50)  NULL DEFAULT NULL,`password` VARCHAR(50)  NULL DEFAULT NULL,`version` VARCHAR(50)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_asteriskextensions` (`userid` INT  NULL DEFAULT NULL,`asterisk_extension` VARCHAR(50)  NULL DEFAULT NULL,`use_asterisk` VARCHAR(3)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_asteriskincomingcalls` (`from_number` VARCHAR(50)  NULL DEFAULT NULL,`from_name` VARCHAR(50)  NULL DEFAULT NULL,`to_number` VARCHAR(50)  NULL DEFAULT NULL,`callertype` VARCHAR(30)  NULL DEFAULT NULL,`flag` INT  NULL DEFAULT NULL,`timer` INT  NULL DEFAULT NULL,`refuid` VARCHAR(255)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_asteriskincomingevents` (`uid` VARCHAR(255) PRIMARY KEY NOT NULL ,`channel` VARCHAR(100)  NULL DEFAULT NULL,`from_number` INT  NULL DEFAULT NULL,`from_name` VARCHAR(100)  NULL DEFAULT NULL,`to_number` INT  NULL DEFAULT NULL,`callertype` VARCHAR(100)  NULL DEFAULT NULL,`timer` INT  NULL DEFAULT NULL,`flag` VARCHAR(3)  NULL DEFAULT NULL,`pbxrecordid` INT  NULL DEFAULT NULL,`relcrmid` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_attachments` (`attachmentsid` INT PRIMARY KEY NOT NULL DEFAULT 0,`name` VARCHAR(255)  NOT NULL ,`description` TEXT  NULL ,`type` VARCHAR(100)  NULL DEFAULT NULL,`path` TEXT  NULL ,`subject` VARCHAR(255)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_attachments` FOREIGN KEY (`attachmentsid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_attachmentsfolder` (`folderid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`foldername` VARCHAR(200)  NOT NULL ,`description` VARCHAR(250)  NULL DEFAULT NULL,`createdby` INT  NOT NULL DEFAULT 0,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_attachmentsfolder_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_audit_trial` (`auditid` INT PRIMARY KEY NOT NULL DEFAULT 0,`userid` INT  NULL DEFAULT NULL,`module` VARCHAR(255)  NULL DEFAULT NULL,`action` VARCHAR(255)  NULL DEFAULT NULL,`recordid` VARCHAR(20)  NULL DEFAULT NULL,`actiondate` DATETIME  NULL DEFAULT NULL);

CREATE TABLE `vtiger_audit_trial_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_barcode` (`barcodeid` INTEGER  NOT NULL ,`companyname` VARCHAR(100)  NULL DEFAULT NULL,`barcode` VARCHAR(225)  NOT NULL ,`product_name` VARCHAR(225)  NULL DEFAULT NULL,`price` FLOAT(12,2)  NULL DEFAULT NULL,`vat` FLOAT(12,2)  NULL DEFAULT NULL,`service` FLOAT(12,2)  NULL DEFAULT NULL,`netprice` FLOAT(12,2)  NULL DEFAULT NULL,`filename` VARCHAR(100)  NOT NULL ,`category` INT  NOT NULL DEFAULT 0,`size` VARCHAR(100)  NULL DEFAULT NULL,`barcode_color` VARCHAR(100)  NULL DEFAULT NULL,`barcode_cost` FLOAT(12,2)  NULL DEFAULT NULL,`mark_up` FLOAT(12,2)  NULL DEFAULT NULL,`barcode_withcform` FLOAT(12,2)  NULL DEFAULT 0,`barcode_withoutcform` FLOAT(12,2)  NULL DEFAULT 0,PRIMARY KEY (barcodeid,barcode));

CREATE TABLE `vtiger_barcodecf` (`barcodeid` INT PRIMARY KEY NOT NULL DEFAULT 0,`cf_829` FLOAT(15,2)  NULL DEFAULT NULL,`cf_830` FLOAT(5,2)  NULL DEFAULT NULL,`cf_831` FLOAT(5,2)  NULL DEFAULT NULL,`cf_832` FLOAT(5,2)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_barcodegrouprel` (`barcodeid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_blocks` (`blockid` INT PRIMARY KEY NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`blocklabel` VARCHAR(100)  NOT NULL ,`sequence` INT  NULL DEFAULT NULL,`show_title` INT  NULL DEFAULT NULL,`visible` INT  NOT NULL DEFAULT 0,`create_view` INT  NOT NULL DEFAULT 0,`edit_view` INT  NOT NULL DEFAULT 0,`detail_view` INT  NOT NULL DEFAULT 0,`display_status` INT  NOT NULL DEFAULT 1,`iscustom` INT  NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_blocks` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_blocks_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_businesstype` (`businesstypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`businesstype` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_campaign` (`campaign_no` VARCHAR(100)  NOT NULL ,`campaignname` VARCHAR(255)  NULL DEFAULT NULL,`campaigntype` VARCHAR(200)  NULL DEFAULT NULL,`campaignstatus` VARCHAR(200)  NULL DEFAULT NULL,`expectedrevenue` FLOAT(25,3)  NULL DEFAULT NULL,`budgetcost` FLOAT(25,3)  NULL DEFAULT NULL,`actualcost` FLOAT(25,3)  NULL DEFAULT NULL,`expectedresponse` VARCHAR(200)  NULL DEFAULT NULL,`numsent` FLOAT(11,0)  NULL DEFAULT NULL,`product_id` INT  NULL DEFAULT NULL,`sponsor` VARCHAR(255)  NULL DEFAULT NULL,`targetaudience` VARCHAR(255)  NULL DEFAULT NULL,`targetsize` INT  NULL DEFAULT NULL,`expectedresponsecount` INT  NULL DEFAULT NULL,`expectedsalescount` INT  NULL DEFAULT NULL,`expectedroi` FLOAT(25,3)  NULL DEFAULT NULL,`actualresponsecount` INT  NULL DEFAULT NULL,`actualsalescount` INT  NULL DEFAULT NULL,`actualroi` FLOAT(25,3)  NULL DEFAULT NULL,`campaignid` INT PRIMARY KEY NOT NULL DEFAULT 0,`closingdate` DATE  NULL DEFAULT NULL);

CREATE TABLE `vtiger_campaignaccountrel` (`campaignid` INT  NULL DEFAULT NULL,`accountid` INT  NULL DEFAULT NULL,`campaignrelstatusid` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_campaigncontrel` (`campaignid` INT  NOT NULL DEFAULT 0,`contactid` INT  NOT NULL DEFAULT 0,`campaignrelstatusid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (campaignid,contactid,campaignrelstatusid),CONSTRAINT `fk_2_vtiger_campaigncontrel` FOREIGN KEY (`contactid`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_campaignleadrel` (`campaignid` INT  NOT NULL DEFAULT 0,`leadid` INT  NOT NULL DEFAULT 0,`campaignrelstatusid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (campaignid,leadid,campaignrelstatusid),CONSTRAINT `fk_2_vtiger_campaignleadrel` FOREIGN KEY (`leadid`) REFERENCES vtiger_leaddetails (`leadid`));

CREATE TABLE `vtiger_campaignrelstatus` (`campaignrelstatusid` INT  NULL DEFAULT NULL,`campaignrelstatus` VARCHAR(256)  NULL DEFAULT NULL,`sortorderid` INT  NULL DEFAULT NULL,`presence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_campaignrelstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_campaignscf` (`campaignid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_campaignscf` FOREIGN KEY (`campaignid`) REFERENCES vtiger_campaign (`campaignid`));

CREATE TABLE `vtiger_campaignstatus` (`campaignstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`campaignstatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_campaignstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_campaigntype` (`campaigntypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`campaigntype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_campaigntype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_carrier` (`carrierid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`carrier` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_carrier_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_cashreceipt` (`cashreceiptid` INT  NOT NULL DEFAULT 0,`invoiceid` INT  NOT NULL DEFAULT 0,`customerid` INT  NOT NULL DEFAULT 0,`grandtotal` FLOAT(10,2)  NULL DEFAULT 0,`creditamount` FLOAT(10,2)  NULL DEFAULT 0,`paidamount` FLOAT(10,2)  NULL DEFAULT 0,`pendingamount` FLOAT(10,2)  NULL DEFAULT 0,`crediteddate` DATE  NULL DEFAULT NULL,`lastpaiddate` DATE  NULL DEFAULT NULL);

CREATE TABLE `vtiger_cashreceiptcf` (`cashreceiptid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_cashreceiptgrouprel` (`cashreceiptid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_cashreturndetails` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`cashreceiptid` INT  NOT NULL DEFAULT 0,`amountpaid` FLOAT(10,2)  NOT NULL DEFAULT 0,`datereceived` DATETIME  NULL DEFAULT NULL,`paymentmethod` CHAR(6)  NOT NULL ,`bankname` VARCHAR(50)  NULL DEFAULT NULL,`checkno` INT  NULL DEFAULT NULL,`checkdate` DATE  NULL DEFAULT NULL);

CREATE TABLE `vtiger_category` (`categoryid` INT  NOT NULL DEFAULT 0,`categoryname` VARCHAR(100)  NOT NULL ,`taxtype` VARCHAR(10)  NOT NULL ,`vat` FLOAT(10,2)  NULL DEFAULT NULL,`size` VARCHAR(100)  NULL DEFAULT NULL,`color` VARCHAR(100)  NULL DEFAULT NULL,PRIMARY KEY (categoryid,categoryname));

CREATE TABLE `vtiger_categorycf` (`categoryid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_categorygrouprel` (`categoryid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_chat_msg` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`chat_from` INT  NOT NULL DEFAULT 0,`chat_to` INT  NOT NULL DEFAULT 0,`born` DATETIME  NULL DEFAULT NULL,`msg` VARCHAR(255)  NOT NULL ,CONSTRAINT `fk_1_vtiger_chat_msg` FOREIGN KEY (`chat_from`) REFERENCES vtiger_chat_users (`id`));

CREATE TABLE `vtiger_chat_pchat` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`msg` INT  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_chat_pchat` FOREIGN KEY (`msg`) REFERENCES vtiger_chat_msg (`id`));

CREATE TABLE `vtiger_chat_pvchat` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`msg` INT  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_chat_pvchat` FOREIGN KEY (`msg`) REFERENCES vtiger_chat_msg (`id`));

CREATE TABLE `vtiger_chat_users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`nick` VARCHAR(50)  NOT NULL ,`session` VARCHAR(50)  NOT NULL ,`ip` VARCHAR(20)  NOT NULL DEFAULT '000.000.000.000',`ping` DATETIME  NULL DEFAULT NULL);

CREATE TABLE `vtiger_clearance` (`clearanceid` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,`barcode_id` INT  NOT NULL DEFAULT 0,`product_name` VARCHAR(100)  NULL DEFAULT NULL,`mrp` FLOAT(0,0)  NULL DEFAULT NULL,`discount` FLOAT(0,0)  NULL DEFAULT NULL,`newmrp` FLOAT(0,0)  NULL DEFAULT NULL,`vat` FLOAT(10,1)  NULL DEFAULT NULL,`clearanceprice` FLOAT(0,0)  NULL DEFAULT NULL,`from_date` DATE  NULL DEFAULT NULL,`to_date` DATE  NULL DEFAULT NULL);

CREATE TABLE `vtiger_clearancecf` (`clearanceid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_clearancegrouprel` (`clearanceid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_cntactivityrel` (`contactid` INT  NOT NULL DEFAULT 0,`activityid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (contactid,activityid),CONSTRAINT `fk_2_vtiger_cntactivityrel` FOREIGN KEY (`contactid`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_competitor` (`competitorid` INT PRIMARY KEY NOT NULL DEFAULT 0,`competitorname` VARCHAR(100)  NOT NULL ,`website` VARCHAR(100)  NULL DEFAULT NULL,`strength` VARCHAR(250)  NULL DEFAULT NULL,`weakness` VARCHAR(250)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_competitor` FOREIGN KEY (`competitorid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_consolidate_purchaserequest` (`consolidate_pr_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`productid` INT  NULL DEFAULT NULL,`barcode` VARCHAR(100)  NULL DEFAULT NULL,`requestedqty` INT  NULL DEFAULT NULL,`receivedqty` INT  NULL DEFAULT NULL,`balancedqty` INT  NULL DEFAULT NULL,`is_po_generated` SMALLINT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_contactaddress` (`contactaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`mailingcity` VARCHAR(40)  NULL DEFAULT NULL,`mailingstreet` VARCHAR(250)  NULL DEFAULT NULL,`mailingcountry` VARCHAR(40)  NULL DEFAULT NULL,`othercountry` VARCHAR(30)  NULL DEFAULT NULL,`mailingstate` VARCHAR(30)  NULL DEFAULT NULL,`mailingpobox` VARCHAR(30)  NULL DEFAULT NULL,`othercity` VARCHAR(40)  NULL DEFAULT NULL,`otherstate` VARCHAR(50)  NULL DEFAULT NULL,`mailingzip` VARCHAR(30)  NULL DEFAULT NULL,`otherzip` VARCHAR(30)  NULL DEFAULT NULL,`otherstreet` VARCHAR(250)  NULL DEFAULT NULL,`otherpobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_contactaddress` FOREIGN KEY (`contactaddressid`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_contactdetails` (`contactid` INT PRIMARY KEY NOT NULL DEFAULT 0,`contact_no` VARCHAR(100)  NOT NULL ,`accountid` INT  NULL DEFAULT NULL,`salutation` VARCHAR(200)  NULL DEFAULT NULL,`firstname` VARCHAR(40)  NULL DEFAULT NULL,`lastname` VARCHAR(80)  NOT NULL ,`email` VARCHAR(100)  NULL DEFAULT NULL,`phone` VARCHAR(50)  NULL DEFAULT NULL,`mobile` VARCHAR(50)  NULL DEFAULT NULL,`title` VARCHAR(50)  NULL DEFAULT NULL,`department` VARCHAR(30)  NULL DEFAULT NULL,`fax` VARCHAR(50)  NULL DEFAULT NULL,`reportsto` VARCHAR(30)  NULL DEFAULT NULL,`training` VARCHAR(50)  NULL DEFAULT NULL,`usertype` VARCHAR(50)  NULL DEFAULT NULL,`contacttype` VARCHAR(50)  NULL DEFAULT NULL,`otheremail` VARCHAR(100)  NULL DEFAULT NULL,`yahooid` VARCHAR(100)  NULL DEFAULT NULL,`donotcall` VARCHAR(3)  NULL DEFAULT NULL,`emailoptout` VARCHAR(3)  NULL DEFAULT '0',`imagename` VARCHAR(150)  NULL DEFAULT NULL,`reference` VARCHAR(3)  NULL DEFAULT NULL,`notify_owner` VARCHAR(3)  NULL DEFAULT '0',CONSTRAINT `fk_1_vtiger_contactdetails` FOREIGN KEY (`contactid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_contactscf` (`contactid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_contactscf` FOREIGN KEY (`contactid`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_contactsubdetails` (`contactsubscriptionid` INT PRIMARY KEY NOT NULL DEFAULT 0,`homephone` VARCHAR(50)  NULL DEFAULT NULL,`otherphone` VARCHAR(50)  NULL DEFAULT NULL,`assistant` VARCHAR(30)  NULL DEFAULT NULL,`assistantphone` VARCHAR(50)  NULL DEFAULT NULL,`birthday` DATE  NULL DEFAULT NULL,`laststayintouchrequest` INT  NULL DEFAULT 0,`laststayintouchsavedate` INT  NULL DEFAULT 0,`leadsource` VARCHAR(200)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_contactsubdetails` FOREIGN KEY (`contactsubscriptionid`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_contacttype` (`contacttypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`contacttype` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_contpotentialrel` (`contactid` INT  NOT NULL DEFAULT 0,`potentialid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (contactid,potentialid),CONSTRAINT `fk_2_vtiger_contpotentialrel` FOREIGN KEY (`potentialid`) REFERENCES vtiger_potential (`potentialid`));

CREATE TABLE `vtiger_contract_priority` (`contract_priorityid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`contract_priority` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_contract_priority_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_contract_status` (`contract_statusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`contract_status` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_contract_status_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_contract_type` (`contract_typeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`contract_type` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_contract_type_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_convertleadmapping` (`cfmid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`leadfid` INT  NOT NULL DEFAULT 0,`accountfid` INT  NULL DEFAULT NULL,`contactfid` INT  NULL DEFAULT NULL,`potentialfid` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_crmentity` (`crmid` INT PRIMARY KEY NOT NULL DEFAULT 0,`smcreatorid` INT  NOT NULL DEFAULT 0,`smownerid` INT  NOT NULL DEFAULT 0,`modifiedby` INT  NOT NULL DEFAULT 0,`setype` VARCHAR(30)  NOT NULL ,`description` TEXT  NULL ,`createdtime` DATETIME  NOT NULL ,`modifiedtime` DATETIME  NOT NULL ,`viewedtime` DATETIME  NULL DEFAULT NULL,`status` VARCHAR(50)  NULL DEFAULT NULL,`version` INT  NOT NULL DEFAULT 0,`presence` INT  NULL DEFAULT 1,`deleted` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_crmentity_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_crmentitynotesrel` (`crmid` INT  NOT NULL DEFAULT 0,`notesid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (crmid,notesid),CONSTRAINT `fk_2_vtiger_crmentitynotesrel` FOREIGN KEY (`notesid`) REFERENCES vtiger_notes (`notesid`));

CREATE TABLE `vtiger_crmentityrel` (`crmid` INT  NOT NULL DEFAULT 0,`module` VARCHAR(100)  NOT NULL ,`relcrmid` INT  NOT NULL DEFAULT 0,`relmodule` VARCHAR(100)  NOT NULL );

CREATE TABLE `vtiger_currencies` (`currencyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`currency_name` VARCHAR(200)  NULL DEFAULT NULL,`currency_code` VARCHAR(50)  NULL DEFAULT NULL,`currency_symbol` VARCHAR(11)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_currencies_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_currency` (`currencyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`currency` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_currency_info` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`currency_name` VARCHAR(100)  NULL DEFAULT NULL,`currency_code` VARCHAR(100)  NULL DEFAULT NULL,`currency_symbol` VARCHAR(30)  NULL DEFAULT NULL,`conversion_rate` FLOAT(10,3)  NULL DEFAULT NULL,`currency_status` VARCHAR(25)  NULL DEFAULT NULL,`defaultid` VARCHAR(10)  NOT NULL DEFAULT '0',`deleted` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_currency_info_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_customaction` (`cvid` INT  NOT NULL DEFAULT 0,`subject` VARCHAR(250)  NOT NULL ,`module` VARCHAR(50)  NOT NULL ,`content` TEXT  NULL ,CONSTRAINT `fk_1_vtiger_customaction` FOREIGN KEY (`cvid`) REFERENCES vtiger_customview (`cvid`));

CREATE TABLE `vtiger_customerdetails` (`customerid` INT PRIMARY KEY NOT NULL DEFAULT 0,`portal` VARCHAR(3)  NULL DEFAULT NULL,`support_start_date` DATE  NULL DEFAULT NULL,`support_end_date` DATE  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_customerdetails` FOREIGN KEY (`customerid`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_customerportal_fields` (`tabid` INT  NOT NULL DEFAULT 0,`fieldid` INT  NULL DEFAULT NULL,`visible` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_customerportal_prefs` (`tabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`prefkey` VARCHAR(100)  NULL DEFAULT NULL,`prefvalue` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_customerportal_tabs` (`tabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`visible` INT  NULL DEFAULT 1,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_customview` (`cvid` INT PRIMARY KEY NOT NULL DEFAULT 0,`viewname` VARCHAR(100)  NOT NULL ,`setdefault` INT  NULL DEFAULT 0,`setmetrics` INT  NULL DEFAULT 0,`entitytype` VARCHAR(25)  NOT NULL ,`status` INT  NULL DEFAULT 1,`userid` INT  NULL DEFAULT 1,CONSTRAINT `fk_1_vtiger_customview` FOREIGN KEY (`entitytype`) REFERENCES vtiger_tab (`name`));

CREATE TABLE `vtiger_customview_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_cvadvfilter` (`cvid` INT  NOT NULL DEFAULT 0,`columnindex` INT  NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NULL DEFAULT NULL,`comparator` VARCHAR(10)  NULL DEFAULT NULL,`value` VARCHAR(200)  NULL DEFAULT NULL,PRIMARY KEY (cvid,columnindex),CONSTRAINT `fk_1_vtiger_cvadvfilter` FOREIGN KEY (`cvid`) REFERENCES vtiger_customview (`cvid`));

CREATE TABLE `vtiger_cvcolumnlist` (`cvid` INT  NOT NULL DEFAULT 0,`columnindex` INT  NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NULL DEFAULT NULL,PRIMARY KEY (cvid,columnindex),CONSTRAINT `fk_1_vtiger_cvcolumnlist` FOREIGN KEY (`cvid`) REFERENCES vtiger_customview (`cvid`));

CREATE TABLE `vtiger_cvstdfilter` (`cvid` INT PRIMARY KEY NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NULL DEFAULT NULL,`stdfilter` VARCHAR(250)  NULL DEFAULT NULL,`startdate` DATE  NULL DEFAULT NULL,`enddate` DATE  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_cvstdfilter` FOREIGN KEY (`cvid`) REFERENCES vtiger_customview (`cvid`));

CREATE TABLE `vtiger_datashare_grp2grp` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_groupid` INT  NULL DEFAULT NULL,`to_groupid` INT  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_grp2grp` FOREIGN KEY (`to_groupid`) REFERENCES vtiger_groups (`groupid`));

CREATE TABLE `vtiger_datashare_grp2role` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_groupid` INT  NULL DEFAULT NULL,`to_roleid` VARCHAR(255)  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_grp2role` FOREIGN KEY (`to_roleid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_grp2rs` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_groupid` INT  NULL DEFAULT NULL,`to_roleandsubid` VARCHAR(255)  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_grp2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_module_rel` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`relationtype` VARCHAR(200)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_datashare_module_rel` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_datashare_module_rel_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_datashare_relatedmodule_permission` (`shareid` INT  NOT NULL DEFAULT 0,`datashare_relatedmodule_id` INT  NOT NULL DEFAULT 0,`permission` INT  NULL DEFAULT NULL,PRIMARY KEY (shareid,datashare_relatedmodule_id));

CREATE TABLE `vtiger_datashare_relatedmodules` (`datashare_relatedmodule_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`tabid` INT  NULL DEFAULT NULL,`relatedto_tabid` INT  NULL DEFAULT NULL,CONSTRAINT `fk_2_vtiger_datashare_relatedmodules` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_datashare_relatedmodules_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_datashare_role2group` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_roleid` VARCHAR(255)  NULL DEFAULT NULL,`to_groupid` INT  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_role2group` FOREIGN KEY (`share_roleid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_role2role` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_roleid` VARCHAR(255)  NULL DEFAULT NULL,`to_roleid` VARCHAR(255)  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_role2role` FOREIGN KEY (`to_roleid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_role2rs` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_roleid` VARCHAR(255)  NULL DEFAULT NULL,`to_roleandsubid` VARCHAR(255)  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_role2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_rs2grp` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_roleandsubid` VARCHAR(255)  NULL DEFAULT NULL,`to_groupid` INT  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_rs2grp` FOREIGN KEY (`share_roleandsubid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_rs2role` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_roleandsubid` VARCHAR(255)  NULL DEFAULT NULL,`to_roleid` VARCHAR(255)  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_rs2role` FOREIGN KEY (`to_roleid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_datashare_rs2rs` (`shareid` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_roleandsubid` VARCHAR(255)  NULL DEFAULT NULL,`to_roleandsubid` VARCHAR(255)  NULL DEFAULT NULL,`permission` INT  NULL DEFAULT NULL,CONSTRAINT `fk_3_vtiger_datashare_rs2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_date_format` (`date_formatid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`date_format` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_date_format_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_dealintimation` (`dealintimationid` INT PRIMARY KEY NOT NULL DEFAULT 0,`dealname` VARCHAR(100)  NOT NULL ,`intimationamount` INT  NOT NULL DEFAULT 0,`dealprobability` FLOAT(3,2)  NOT NULL DEFAULT 0,`dealintimationactive` INT  NULL DEFAULT NULL,`fromname` VARCHAR(120)  NOT NULL ,`fromemailid` VARCHAR(100)  NOT NULL ,`notifyemails` VARCHAR(50)  NOT NULL ,`notifybccemails` VARCHAR(50)  NOT NULL ,`notifyccmails` VARCHAR(50)  NOT NULL ,`notifypotentialowner` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_debtortransaction` (`transactionid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`date` DATETIME  NULL DEFAULT NULL,`storeid` INT  NULL DEFAULT NULL,`userid` INT  NULL DEFAULT NULL,`username` VARCHAR(100)  NULL DEFAULT NULL,`openingbalance` FLOAT(11,2)  NULL DEFAULT 0,`invid` INT  NULL DEFAULT NULL,`inv_no` VARCHAR(100)  NULL DEFAULT NULL,`grandtotal` FLOAT(11,2)  NULL DEFAULT 0,`amt_received_by_cash` FLOAT(11,2)  NULL DEFAULT 0,`amt_received_by_card` FLOAT(11,2)  NULL DEFAULT 0,`amt_received_by_check` FLOAT(11,2)  NULL DEFAULT 0,`salesret_id` INT  NULL DEFAULT NULL,`amt_return` FLOAT(11,2)  NULL DEFAULT 0,`mode_of_payment` VARCHAR(100)  NULL DEFAULT NULL,`bank_name` VARCHAR(25)  NULL DEFAULT NULL,`checkno` VARCHAR(100)  NULL DEFAULT NULL,`check_date` DATE  NULL DEFAULT NULL,`balance` FLOAT(11,2)  NULL DEFAULT 0,`adjustment` FLOAT(11,2)  NULL DEFAULT 0,`ref_inv_no` VARCHAR(100)  NULL DEFAULT NULL,`closingbalance` FLOAT(11,2)  NULL DEFAULT 0,`modulename` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_def_org_field` (`tabid` INT  NULL DEFAULT NULL,`fieldid` INT PRIMARY KEY NOT NULL DEFAULT 0,`visible` INT  NULL DEFAULT NULL,`readonly` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_def_org_share` (`ruleid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`tabid` INT  NOT NULL DEFAULT 0,`permission` INT  NULL DEFAULT NULL,`editstatus` INT  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_def_org_share` FOREIGN KEY (`permission`) REFERENCES vtiger_org_share_action_mapping (`share_action_id`));

CREATE TABLE `vtiger_def_org_share_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_defaultcv` (`tabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`defaultviewname` VARCHAR(50)  NOT NULL ,`query` TEXT  NULL ,CONSTRAINT `fk_1_vtiger_defaultcv` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_delivery_products` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`dcid` INT  NOT NULL DEFAULT 0,`barcodeid` VARCHAR(100)  NOT NULL ,`productname` VARCHAR(200)  NOT NULL ,`dc_qty` INT  NOT NULL DEFAULT 0,`dc_qty_locked` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_deliverychallan` (`dcid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`from_wh_st` VARCHAR(100)  NULL DEFAULT NULL,`to_wh_st` VARCHAR(100)  NULL DEFAULT NULL,`createddate` DATE  NULL DEFAULT NULL,`recieveddate` DATE  NULL DEFAULT NULL,`status` VARCHAR(11)  NOT NULL ,`dc_code` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_deliverychallan_status` (`sid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`status_code` VARCHAR(11)  NOT NULL ,`status` VARCHAR(100)  NOT NULL );

CREATE TABLE `vtiger_deliverychallan_transaction` (`tid` INTEGER  NOT NULL ,`dcid` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,`barcode` VARCHAR(100)  NOT NULL ,`from_warehouse_store` VARCHAR(11)  NOT NULL ,`to_warehouse_store` VARCHAR(11)  NOT NULL ,`dc_quantity` INT  NOT NULL DEFAULT 0,`dc_qty_locked` INT  NOT NULL DEFAULT 0,`createddate` DATE  NOT NULL ,`recieveddate` DATE  NULL DEFAULT NULL,`status` VARCHAR(11)  NOT NULL );

CREATE TABLE `vtiger_deliverychallancf` (`dcid` INT PRIMARY KEY NOT NULL DEFAULT 0,`cf_799` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_deliverychallangrouprel` (`dcid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_downloadpurpose` (`downloadpurposeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`purpose` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_duration_minutes` (`minutesid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`duration_minutes` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_duration_minutes_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_durationhrs` (`hrsid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`hrs` VARCHAR(50)  NULL DEFAULT NULL,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_durationmins` (`minsid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`mins` VARCHAR(50)  NULL DEFAULT NULL,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_email_access` (`crmid` INT  NULL DEFAULT NULL,`mailid` INT  NULL DEFAULT NULL,`accessdate` DATE  NULL DEFAULT NULL,`accesstime` DATETIME  NULL DEFAULT NULL);

CREATE TABLE `vtiger_email_track` (`crmid` INT  NULL DEFAULT NULL,`mailid` INT  NULL DEFAULT NULL,`access_count` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_emaildetails` (`emailid` INT PRIMARY KEY NOT NULL DEFAULT 0,`from_email` VARCHAR(50)  NOT NULL ,`to_email` TEXT  NULL ,`cc_email` TEXT  NULL ,`bcc_email` TEXT  NULL ,`assigned_user_email` VARCHAR(50)  NOT NULL ,`idlists` TEXT  NULL ,`email_flag` VARCHAR(50)  NOT NULL );

CREATE TABLE `vtiger_emailsettings` (`emailsettingsid` INT  NOT NULL DEFAULT 0,`emailname` VARCHAR(100)  NOT NULL ,`sendto` VARCHAR(100)  NOT NULL ,`sendcc` VARCHAR(100)  NOT NULL );

CREATE TABLE `vtiger_emailsettingscf` (`emailsettingsid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_emailsettingsgrouprel` (`emailsettingsid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_emailtemplates` (`foldername` VARCHAR(100)  NULL DEFAULT NULL,`templatename` VARCHAR(100)  NULL DEFAULT NULL,`subject` VARCHAR(100)  NULL DEFAULT NULL,`description` TEXT  NULL ,`body` TEXT  NULL ,`deleted` INT  NOT NULL DEFAULT 0,`templateid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`groupid` INT  NULL DEFAULT 0,`templatecodeid` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_emailtemplates_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_entityname` (`tabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`modulename` VARCHAR(50)  NOT NULL ,`tablename` VARCHAR(100)  NOT NULL ,`fieldname` VARCHAR(150)  NOT NULL ,`entityidfield` VARCHAR(150)  NOT NULL ,`entityidcolumn` VARCHAR(150)  NOT NULL ,CONSTRAINT `fk_1_vtiger_entityname` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_evaluationstatus` (`evalstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`status` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_eventhandler_module` (`eventhandler_module_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`module_name` VARCHAR(100)  NULL DEFAULT NULL,`handler_class` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_eventhandler_module_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_eventhandlers` (`eventhandler_id` INTEGER  NOT NULL ,`event_name` VARCHAR(100)  NOT NULL ,`handler_path` VARCHAR(400)  NOT NULL ,`handler_class` VARCHAR(100)  NOT NULL ,`cond` TEXT  NULL ,`is_active` INT  NOT NULL DEFAULT 0,PRIMARY KEY (eventhandler_id,event_name,handler_class));

CREATE TABLE `vtiger_eventhandlers_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_eventstatus` (`eventstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`eventstatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_eventstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_expectedresponse` (`expectedresponseid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`expectedresponse` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_expectedresponse_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_faq` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`faq_no` VARCHAR(100)  NOT NULL ,`product_id` VARCHAR(100)  NULL DEFAULT NULL,`question` TEXT  NULL ,`answer` TEXT  NULL ,`category` VARCHAR(200)  NOT NULL ,`status` VARCHAR(200)  NOT NULL ,CONSTRAINT `fk_1_vtiger_faq` FOREIGN KEY (`id`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_faqcategories` (`faqcategories_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`faqcategories` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_faqcategories_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_faqcomments` (`commentid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`faqid` INT  NULL DEFAULT NULL,`comments` TEXT  NULL ,`createdtime` DATETIME  NOT NULL ,CONSTRAINT `fk_1_vtiger_faqcomments` FOREIGN KEY (`faqid`) REFERENCES vtiger_faq (`id`));

CREATE TABLE `vtiger_faqstatus` (`faqstatus_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`faqstatus` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_faqstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_field` (`tabid` INT  NOT NULL DEFAULT 0,`fieldid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`columnname` VARCHAR(30)  NOT NULL ,`tablename` VARCHAR(50)  NOT NULL ,`generatedtype` INT  NOT NULL DEFAULT 0,`uitype` VARCHAR(30)  NOT NULL ,`fieldname` VARCHAR(50)  NOT NULL ,`fieldlabel` VARCHAR(50)  NOT NULL ,`readonly` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1,`selected` INT  NOT NULL DEFAULT 0,`maximumlength` INT  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL,`block` INT  NULL DEFAULT NULL,`displaytype` INT  NULL DEFAULT NULL,`typeofdata` VARCHAR(100)  NULL DEFAULT NULL,`quickcreate` INT  NOT NULL DEFAULT 1,`quickcreatesequence` INT  NULL DEFAULT NULL,`info_type` VARCHAR(20)  NULL DEFAULT NULL,`masseditable` INT  NOT NULL DEFAULT 1,`helpinfo` TEXT  NULL ,CONSTRAINT `fk_1_vtiger_field` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_field_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_fieldformulas` (`expressionid` INT PRIMARY KEY NOT NULL DEFAULT 0,`modulename` VARCHAR(100)  NULL DEFAULT NULL,`expression_engine` TEXT  NULL );

CREATE TABLE `vtiger_fieldmodulerel` (`fieldid` INT  NOT NULL DEFAULT 0,`module` VARCHAR(100)  NOT NULL ,`relmodule` VARCHAR(100)  NOT NULL ,`status` VARCHAR(10)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_files` (`id` VARCHAR(36) PRIMARY KEY NOT NULL ,`name` VARCHAR(36)  NULL DEFAULT NULL,`content` BLOB  NULL ,`deleted` INT  NOT NULL DEFAULT 0,`date_entered` TIMESTAMP  NOT NULL ,`assigned_user_id` VARCHAR(36)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_freetagged_objects` (`tag_id` INT  NOT NULL DEFAULT 0,`tagger_id` INT  NOT NULL DEFAULT 0,`object_id` INT  NOT NULL DEFAULT 0,`tagged_on` TIMESTAMP  NOT NULL ,`module` VARCHAR(50)  NOT NULL ,PRIMARY KEY (tag_id,tagger_id,object_id));

CREATE TABLE `vtiger_freetags` (`id` INT PRIMARY KEY NOT NULL DEFAULT 0,`tag` VARCHAR(50)  NOT NULL ,`raw_tag` VARCHAR(50)  NOT NULL );

CREATE TABLE `vtiger_freetags_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_glacct` (`glacctid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`glacct` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_glacct_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_group2grouprel` (`groupid` INT  NOT NULL DEFAULT 0,`containsgroupid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (groupid,containsgroupid),CONSTRAINT `fk_2_vtiger_group2grouprel` FOREIGN KEY (`groupid`) REFERENCES vtiger_groups (`groupid`));

CREATE TABLE `vtiger_group2role` (`groupid` INT  NOT NULL DEFAULT 0,`roleid` VARCHAR(255)  NOT NULL ,PRIMARY KEY (groupid,roleid),CONSTRAINT `fk_2_vtiger_group2role` FOREIGN KEY (`roleid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_group2rs` (`groupid` INT  NOT NULL DEFAULT 0,`roleandsubid` VARCHAR(255)  NOT NULL ,PRIMARY KEY (groupid,roleandsubid),CONSTRAINT `fk_2_vtiger_group2rs` FOREIGN KEY (`roleandsubid`) REFERENCES vtiger_role (`roleid`));

CREATE TABLE `vtiger_groups` (`groupid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL,`description` TEXT  NULL );

CREATE TABLE `vtiger_headers` (`fileid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`headernames` VARCHAR(30)  NOT NULL );

CREATE TABLE `vtiger_home_layout` (`userid` INT PRIMARY KEY NOT NULL DEFAULT 0,`layout` INT  NOT NULL DEFAULT 4);

CREATE TABLE `vtiger_homedashbd` (`stuffid` INT PRIMARY KEY NOT NULL DEFAULT 0,`dashbdname` VARCHAR(100)  NULL DEFAULT NULL,`dashbdtype` VARCHAR(100)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_homedashbd` FOREIGN KEY (`stuffid`) REFERENCES vtiger_homestuff (`stuffid`));

CREATE TABLE `vtiger_homedefault` (`stuffid` INT PRIMARY KEY NOT NULL DEFAULT 0,`hometype` VARCHAR(30)  NOT NULL ,`maxentries` INT  NULL DEFAULT NULL,`setype` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_homedefault` FOREIGN KEY (`stuffid`) REFERENCES vtiger_homestuff (`stuffid`));

CREATE TABLE `vtiger_homemodule` (`stuffid` INT PRIMARY KEY NOT NULL DEFAULT 0,`modulename` VARCHAR(100)  NULL DEFAULT NULL,`maxentries` INT  NOT NULL DEFAULT 0,`customviewid` INT  NOT NULL DEFAULT 0,`setype` VARCHAR(30)  NOT NULL ,CONSTRAINT `fk_1_vtiger_homemodule` FOREIGN KEY (`stuffid`) REFERENCES vtiger_homestuff (`stuffid`));

CREATE TABLE `vtiger_homemoduleflds` (`stuffid` INT  NULL DEFAULT NULL,`fieldname` VARCHAR(100)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_homemoduleflds` FOREIGN KEY (`stuffid`) REFERENCES vtiger_homemodule (`stuffid`));

CREATE TABLE `vtiger_homerss` (`stuffid` INT PRIMARY KEY NOT NULL DEFAULT 0,`url` VARCHAR(100)  NULL DEFAULT NULL,`maxentries` INT  NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_homerss` FOREIGN KEY (`stuffid`) REFERENCES vtiger_homestuff (`stuffid`));

CREATE TABLE `vtiger_homestuff` (`stuffid` INT PRIMARY KEY NOT NULL DEFAULT 0,`stuffsequence` INT  NOT NULL DEFAULT 0,`stufftype` VARCHAR(100)  NULL DEFAULT NULL,`userid` INT  NOT NULL DEFAULT 0,`visible` INT  NOT NULL DEFAULT 0,`stufftitle` VARCHAR(100)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_homestuff` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_homestuff_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_import_maps` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`name` VARCHAR(36)  NOT NULL ,`module` VARCHAR(36)  NOT NULL ,`content` BLOB  NULL ,`has_header` INT  NOT NULL DEFAULT 1,`deleted` INT  NOT NULL DEFAULT 0,`date_entered` TIMESTAMP  NOT NULL ,`date_modified` TIMESTAMP  NOT NULL ,`assigned_user_id` VARCHAR(36)  NULL DEFAULT NULL,`is_published` VARCHAR(3)  NOT NULL DEFAULT 'no');

CREATE TABLE `vtiger_industry` (`industryid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`industry` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_industry_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_inventory_tandc` (`id` INT PRIMARY KEY NOT NULL DEFAULT 0,`type` VARCHAR(30)  NOT NULL ,`tandc` TEXT  NULL );

CREATE TABLE `vtiger_inventory_tandc_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_inventorynotification` (`notificationid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`notificationname` VARCHAR(200)  NULL DEFAULT NULL,`notificationsubject` VARCHAR(200)  NULL DEFAULT NULL,`notificationbody` TEXT  NULL ,`label` VARCHAR(50)  NULL DEFAULT NULL,`status` VARCHAR(30)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_inventorynotification_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_inventoryproductrel` (`id` INT  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`sequence_no` INT  NULL DEFAULT NULL,`qtyinstock` INT  NULL DEFAULT NULL,`quantity` INT  NULL DEFAULT 0,`listprice` FLOAT(25,2)  NULL DEFAULT NULL,`discount_percent` FLOAT(7,3)  NULL DEFAULT NULL,`discount_amount` FLOAT(10,2)  NULL DEFAULT NULL,`comment` VARCHAR(250)  NULL DEFAULT NULL,`description` TEXT  NULL ,`incrementondel` INT  NOT NULL DEFAULT 0,`lineitem_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`tax1` FLOAT(7,3)  NULL DEFAULT NULL,`tax2` FLOAT(7,3)  NULL DEFAULT NULL,`tax3` FLOAT(7,3)  NULL DEFAULT NULL,`vat` FLOAT(7,2)  NULL DEFAULT 0,`taxamount` FLOAT(12,2)  NULL DEFAULT 0,`withcform` SMALLINT  NULL DEFAULT NULL,`cstwithcform_per` FLOAT(12,2)  NULL DEFAULT 0,`cstwithcform_amt` FLOAT(12,2)  NULL DEFAULT 0,`cstwithoutcform_per` FLOAT(12,2)  NULL DEFAULT 0,`cstwithoutcform_amt` FLOAT(12,2)  NULL DEFAULT 0,`service` FLOAT(7,3)  NULL DEFAULT NULL,`netprice` FLOAT(15,2)  NULL DEFAULT NULL,`tax4` FLOAT(7,3)  NULL DEFAULT NULL,`tax5` FLOAT(7,3)  NULL DEFAULT NULL,`tax6` FLOAT(7,3)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_inventoryshippingrel` (`id` INT  NULL DEFAULT NULL,`shtax1` FLOAT(7,3)  NULL DEFAULT NULL,`shtax2` FLOAT(7,3)  NULL DEFAULT NULL,`shtax3` FLOAT(7,3)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_inventorysubproductrel` (`id` INT  NOT NULL DEFAULT 0,`sequence_no` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_inventorytaxinfo` (`taxid` INT PRIMARY KEY NOT NULL DEFAULT 0,`taxname` VARCHAR(50)  NULL DEFAULT NULL,`taxlabel` VARCHAR(50)  NULL DEFAULT NULL,`percentage` FLOAT(7,3)  NULL DEFAULT NULL,`deleted` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_inventorytaxinfo_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_inventorytransaction` (`transaction_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`date` DATETIME  NULL DEFAULT NULL,`barcode` VARCHAR(11)  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`product_name` VARCHAR(25)  NULL DEFAULT NULL,`opening_stock_qty` INT  NULL DEFAULT NULL,`opening_stock_WS_qty` INT  NOT NULL DEFAULT 0,`opening_cost` FLOAT(12,2)  NULL DEFAULT NULL,`markup_per` FLOAT(12,2)  NULL DEFAULT 0,`markup_amt` FLOAT(12,2)  NULL DEFAULT 0,`poid` INT  NULL DEFAULT NULL,`purchase_qty` INT  NULL DEFAULT NULL,`purchase_cost` FLOAT(12,2)  NULL DEFAULT NULL,`cstwithcform_per` FLOAT(12,2)  NULL DEFAULT 0,`cstwithcform_amt` FLOAT(12,2)  NULL DEFAULT 0,`cstwithoutcform_per` FLOAT(12,2)  NULL DEFAULT 0,`cstwithoutcform_amt` FLOAT(12,2)  NULL DEFAULT 0,`inv_id` INT  NULL DEFAULT NULL,`invoice_no` VARCHAR(25)  NULL DEFAULT NULL,`sales_qty` INT  NULL DEFAULT NULL,`store_id` INT  NULL DEFAULT NULL,`sales_cost` FLOAT(12,2)  NULL DEFAULT NULL,`purchase_return_qty` INT  NULL DEFAULT NULL,`purchase_return_cost` FLOAT(12,2)  NULL DEFAULT NULL,`salesret_id` INT  NULL DEFAULT NULL,`sales_return_qty` INT  NULL DEFAULT NULL,`sales_return_cost` FLOAT(12,2)  NULL DEFAULT NULL,`adjustment_qty` INT  NULL DEFAULT NULL,`adjustment_cost` FLOAT(12,2)  NULL DEFAULT NULL,`challan_id` INT  NULL DEFAULT NULL,`challan_no` VARCHAR(25)  NULL DEFAULT NULL,`challan_qty_sent` INT  NOT NULL DEFAULT 0,`challan_qty_receive` INT  NOT NULL DEFAULT 0,`closing_stock` INT  NULL DEFAULT NULL,`final_stock` INT  NULL DEFAULT 0,`discount` FLOAT(10,2)  NULL DEFAULT NULL,`unitprice` FLOAT(12,2)  NULL DEFAULT 0,`closing_stock_WS_qty` INT  NOT NULL DEFAULT 0,`vat` FLOAT(10,2)  NULL DEFAULT NULL,`vendor_id` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_invitees` (`activityid` INT  NOT NULL DEFAULT 0,`inviteeid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (activityid,inviteeid));

CREATE TABLE `vtiger_invoice` (`invoiceid` INT PRIMARY KEY NOT NULL DEFAULT 0,`subject` VARCHAR(100)  NULL DEFAULT NULL,`salesorderid` INT  NULL DEFAULT NULL,`customerno` VARCHAR(100)  NULL DEFAULT NULL,`contactid` INT  NULL DEFAULT NULL,`notes` VARCHAR(100)  NULL DEFAULT NULL,`invoicedate` DATE  NULL DEFAULT NULL,`duedate` DATE  NULL DEFAULT NULL,`invoiceterms` VARCHAR(100)  NULL DEFAULT NULL,`type` VARCHAR(100)  NULL DEFAULT NULL,`adjustment` FLOAT(25,3)  NULL DEFAULT NULL,`salescommission` FLOAT(25,3)  NULL DEFAULT NULL,`exciseduty` FLOAT(25,3)  NULL DEFAULT NULL,`subtotal` FLOAT(25,3)  NULL DEFAULT NULL,`total` FLOAT(25,3)  NULL DEFAULT NULL,`taxtype` VARCHAR(25)  NULL DEFAULT NULL,`discount_percent` FLOAT(25,3)  NULL DEFAULT NULL,`discount_amount` FLOAT(25,3)  NULL DEFAULT NULL,`s_h_amount` FLOAT(25,3)  NULL DEFAULT NULL,`shipping` VARCHAR(100)  NULL DEFAULT NULL,`accountid` INT  NULL DEFAULT NULL,`terms_conditions` TEXT  NULL ,`purchaseorder` VARCHAR(200)  NULL DEFAULT NULL,`invoicestatus` VARCHAR(200)  NULL DEFAULT NULL,`invoice_no` VARCHAR(100)  NULL DEFAULT NULL,`currency_id` INT  NOT NULL DEFAULT 1,`conversion_rate` FLOAT(10,3)  NOT NULL DEFAULT 1.000,`customername` VARCHAR(100)  NULL DEFAULT NULL,`mobile` VARCHAR(50)  NULL DEFAULT NULL,`salesorderno` VARCHAR(100)  NULL DEFAULT NULL,`email` VARCHAR(100)  NULL DEFAULT NULL,`cash` FLOAT(10,2)  NULL DEFAULT 0,`credit` FLOAT(10,2)  NULL DEFAULT 0,`card` FLOAT(10,2)  NULL DEFAULT 0,`bankname` VARCHAR(100)  NULL DEFAULT NULL,`chq_date` DATE  NULL DEFAULT NULL,`cheque_no` VARCHAR(100)  NULL DEFAULT NULL,`cheque_amt` FLOAT(10,2)  NULL DEFAULT 0,`storeid` INT  NULL DEFAULT NULL,CONSTRAINT `fk_2_vtiger_invoice` FOREIGN KEY (`salesorderid`) REFERENCES vtiger_salesorder (`salesorderid`));

CREATE TABLE `vtiger_invoice_recurring_info` (`salesorderid` INT  NULL DEFAULT NULL,`recurring_frequency` VARCHAR(200)  NULL DEFAULT NULL,`start_period` DATE  NULL DEFAULT NULL,`end_period` DATE  NULL DEFAULT NULL,`last_recurring_date` DATE  NULL DEFAULT NULL,`payment_duration` VARCHAR(200)  NULL DEFAULT NULL,`invoice_status` VARCHAR(200)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_invoicebillads` (`invoicebilladdressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`bill_city` VARCHAR(30)  NULL DEFAULT NULL,`bill_code` VARCHAR(30)  NULL DEFAULT NULL,`bill_country` VARCHAR(30)  NULL DEFAULT NULL,`bill_state` VARCHAR(30)  NULL DEFAULT NULL,`bill_street` VARCHAR(250)  NULL DEFAULT NULL,`bill_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_invoicebillads` FOREIGN KEY (`invoicebilladdressid`) REFERENCES vtiger_invoice (`invoiceid`));

CREATE TABLE `vtiger_invoicecf` (`invoiceid` INT PRIMARY KEY NOT NULL DEFAULT 0,`cf_637` VARCHAR(100)  NULL DEFAULT NULL,`cf_638` VARCHAR(30)  NULL DEFAULT NULL,`cf_639` VARCHAR(100)  NULL DEFAULT NULL,`cf_640` VARCHAR(50)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_invoicecf` FOREIGN KEY (`invoiceid`) REFERENCES vtiger_invoice (`invoiceid`));

CREATE TABLE `vtiger_invoiceshipads` (`invoiceshipaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ship_city` VARCHAR(30)  NULL DEFAULT NULL,`ship_code` VARCHAR(30)  NULL DEFAULT NULL,`ship_country` VARCHAR(30)  NULL DEFAULT NULL,`ship_state` VARCHAR(30)  NULL DEFAULT NULL,`ship_street` VARCHAR(250)  NULL DEFAULT NULL,`ship_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_invoiceshipads` FOREIGN KEY (`invoiceshipaddressid`) REFERENCES vtiger_invoice (`invoiceid`));

CREATE TABLE `vtiger_invoicestatus` (`invoicestatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`invoicestatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_invoicestatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_invoicestatushistory` (`historyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`invoiceid` INT  NOT NULL DEFAULT 0,`accountname` VARCHAR(100)  NULL DEFAULT NULL,`total` FLOAT(10,0)  NULL DEFAULT NULL,`invoicestatus` VARCHAR(200)  NULL DEFAULT NULL,`lastmodified` DATETIME  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_invoicestatushistory` FOREIGN KEY (`invoiceid`) REFERENCES vtiger_invoice (`invoiceid`));

CREATE TABLE `vtiger_language` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`name` VARCHAR(50)  NULL DEFAULT NULL,`prefix` VARCHAR(10)  NULL DEFAULT NULL,`label` VARCHAR(30)  NULL DEFAULT NULL,`lastupdated` DATETIME  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL,`isdefault` INT  NULL DEFAULT NULL,`active` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_language_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_lar` (`larid` INT PRIMARY KEY NOT NULL DEFAULT 0,`name` VARCHAR(50)  NOT NULL ,`createdby` INT  NOT NULL DEFAULT 0,`createdon` DATE  NOT NULL ,CONSTRAINT `fk_1_vtiger_lar` FOREIGN KEY (`createdby`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_lead_view` (`lead_viewid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`lead_view` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_lead_view_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_leadacctrel` (`leadid` INT PRIMARY KEY NOT NULL DEFAULT 0,`accountid` INT  NOT NULL DEFAULT 0,CONSTRAINT `fk_2_vtiger_leadacctrel` FOREIGN KEY (`leadid`) REFERENCES vtiger_leaddetails (`leadid`));

CREATE TABLE `vtiger_leadaddress` (`leadaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`city` VARCHAR(30)  NULL DEFAULT NULL,`code` VARCHAR(30)  NULL DEFAULT NULL,`state` VARCHAR(30)  NULL DEFAULT NULL,`pobox` VARCHAR(30)  NULL DEFAULT NULL,`country` VARCHAR(30)  NULL DEFAULT NULL,`phone` VARCHAR(50)  NULL DEFAULT NULL,`mobile` VARCHAR(50)  NULL DEFAULT NULL,`fax` VARCHAR(50)  NULL DEFAULT NULL,`lane` VARCHAR(250)  NULL DEFAULT NULL,`leadaddresstype` VARCHAR(30)  NULL DEFAULT 'Billing',CONSTRAINT `fk_1_vtiger_leadaddress` FOREIGN KEY (`leadaddressid`) REFERENCES vtiger_leaddetails (`leadid`));

CREATE TABLE `vtiger_leadcontrel` (`leadid` INT PRIMARY KEY NOT NULL DEFAULT 0,`contactid` INT  NOT NULL DEFAULT 0,CONSTRAINT `fk_2_vtiger_leadcontrel` FOREIGN KEY (`leadid`) REFERENCES vtiger_leaddetails (`leadid`));

CREATE TABLE `vtiger_leaddetails` (`leadid` INT PRIMARY KEY NOT NULL DEFAULT 0,`lead_no` VARCHAR(100)  NOT NULL ,`email` VARCHAR(100)  NULL DEFAULT NULL,`interest` VARCHAR(50)  NULL DEFAULT NULL,`firstname` VARCHAR(40)  NULL DEFAULT NULL,`salutation` VARCHAR(200)  NULL DEFAULT NULL,`lastname` VARCHAR(80)  NOT NULL ,`company` VARCHAR(100)  NOT NULL ,`annualrevenue` INT  NULL DEFAULT 0,`industry` VARCHAR(200)  NULL DEFAULT NULL,`campaign` VARCHAR(30)  NULL DEFAULT NULL,`rating` VARCHAR(200)  NULL DEFAULT NULL,`leadstatus` VARCHAR(50)  NULL DEFAULT NULL,`leadsource` VARCHAR(200)  NULL DEFAULT NULL,`converted` INT  NULL DEFAULT 0,`designation` VARCHAR(50)  NULL DEFAULT 'SalesMan',`licencekeystatus` VARCHAR(50)  NULL DEFAULT NULL,`space` VARCHAR(250)  NULL DEFAULT NULL,`comments` TEXT  NULL ,`priority` VARCHAR(50)  NULL DEFAULT NULL,`demorequest` VARCHAR(50)  NULL DEFAULT NULL,`partnercontact` VARCHAR(50)  NULL DEFAULT NULL,`productversion` VARCHAR(20)  NULL DEFAULT NULL,`product` VARCHAR(50)  NULL DEFAULT NULL,`maildate` DATE  NULL DEFAULT NULL,`nextstepdate` DATE  NULL DEFAULT NULL,`fundingsituation` VARCHAR(50)  NULL DEFAULT NULL,`purpose` VARCHAR(50)  NULL DEFAULT NULL,`evaluationstatus` VARCHAR(50)  NULL DEFAULT NULL,`transferdate` DATE  NULL DEFAULT NULL,`revenuetype` VARCHAR(50)  NULL DEFAULT NULL,`noofemployees` INT  NULL DEFAULT NULL,`yahooid` VARCHAR(100)  NULL DEFAULT NULL,`assignleadchk` INT  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_leaddetails` FOREIGN KEY (`leadid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_leadpotrel` (`leadid` INT  NOT NULL DEFAULT 0,`potentialid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_2_vtiger_leadpotrel` FOREIGN KEY (`potentialid`) REFERENCES vtiger_potential (`potentialid`));

CREATE TABLE `vtiger_leadscf` (`leadid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_leadscf` FOREIGN KEY (`leadid`) REFERENCES vtiger_leaddetails (`leadid`));

CREATE TABLE `vtiger_leadsource` (`leadsourceid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`leadsource` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_leadsource_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_leadstage` (`leadstageid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`stage` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_leadstatus` (`leadstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`leadstatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_leadstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_leadsubdetails` (`leadsubscriptionid` INT PRIMARY KEY NOT NULL DEFAULT 0,`website` VARCHAR(255)  NULL DEFAULT NULL,`callornot` INT  NULL DEFAULT 0,`readornot` INT  NULL DEFAULT 0,`empct` INT  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_leadsubdetails` FOREIGN KEY (`leadsubscriptionid`) REFERENCES vtiger_leaddetails (`leadid`));

CREATE TABLE `vtiger_licencekeystatus` (`licencekeystatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`licencekeystatus` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_links` (`linkid` INT PRIMARY KEY NOT NULL DEFAULT 0,`tabid` INT  NULL DEFAULT NULL,`linktype` VARCHAR(20)  NULL DEFAULT NULL,`linklabel` VARCHAR(30)  NULL DEFAULT NULL,`linkurl` VARCHAR(255)  NULL DEFAULT NULL,`linkicon` VARCHAR(100)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_links_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_loginhistory` (`login_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`user_name` VARCHAR(25)  NOT NULL ,`user_ip` VARCHAR(25)  NOT NULL ,`logout_time` TIMESTAMP  NOT NULL ,`login_time` TIMESTAMP  NOT NULL ,`status` VARCHAR(25)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mail_accounts` (`account_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`user_id` INT  NOT NULL DEFAULT 0,`display_name` VARCHAR(50)  NULL DEFAULT NULL,`mail_id` VARCHAR(50)  NULL DEFAULT NULL,`account_name` VARCHAR(50)  NULL DEFAULT NULL,`mail_protocol` VARCHAR(20)  NULL DEFAULT NULL,`mail_username` VARCHAR(50)  NOT NULL ,`mail_password` VARCHAR(250)  NOT NULL ,`mail_servername` VARCHAR(50)  NULL DEFAULT NULL,`box_refresh` INT  NULL DEFAULT NULL,`mails_per_page` INT  NULL DEFAULT NULL,`ssltype` VARCHAR(50)  NULL DEFAULT NULL,`sslmeth` VARCHAR(50)  NULL DEFAULT NULL,`int_mailer` INT  NULL DEFAULT 0,`status` VARCHAR(10)  NULL DEFAULT NULL,`set_default` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mail_accounts_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_mailscanner` (`scannerid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`scannername` VARCHAR(30)  NULL DEFAULT NULL,`server` VARCHAR(100)  NULL DEFAULT NULL,`protocol` VARCHAR(10)  NULL DEFAULT NULL,`username` VARCHAR(255)  NULL DEFAULT NULL,`password` VARCHAR(255)  NULL DEFAULT NULL,`ssltype` VARCHAR(10)  NULL DEFAULT NULL,`sslmethod` VARCHAR(30)  NULL DEFAULT NULL,`connecturl` VARCHAR(255)  NULL DEFAULT NULL,`searchfor` VARCHAR(10)  NULL DEFAULT NULL,`markas` VARCHAR(10)  NULL DEFAULT NULL,`isvalid` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mailscanner_actions` (`actionid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`scannerid` INT  NULL DEFAULT NULL,`actiontype` VARCHAR(10)  NULL DEFAULT NULL,`module` VARCHAR(30)  NULL DEFAULT NULL,`lookup` VARCHAR(30)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mailscanner_folders` (`folderid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`scannerid` INT  NULL DEFAULT NULL,`foldername` VARCHAR(255)  NULL DEFAULT NULL,`lastscan` VARCHAR(30)  NULL DEFAULT NULL,`rescan` INT  NULL DEFAULT NULL,`enabled` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mailscanner_ids` (`scannerid` INT  NULL DEFAULT NULL,`messageid` TEXT  NULL ,`crmid` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mailscanner_ruleactions` (`ruleid` INT  NULL DEFAULT NULL,`actionid` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_mailscanner_rules` (`ruleid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`scannerid` INT  NULL DEFAULT NULL,`fromaddress` VARCHAR(255)  NULL DEFAULT NULL,`toaddress` VARCHAR(255)  NULL DEFAULT NULL,`subjectop` VARCHAR(20)  NULL DEFAULT NULL,`subject` VARCHAR(255)  NULL DEFAULT NULL,`bodyop` VARCHAR(20)  NULL DEFAULT NULL,`body` VARCHAR(255)  NULL DEFAULT NULL,`matchusing` VARCHAR(5)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_manufacturer` (`manufacturerid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`manufacturer` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_manufacturer_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_mobile_alerts` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`handler_path` VARCHAR(500)  NULL DEFAULT NULL,`handler_class` VARCHAR(50)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL,`deleted` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_modcomments` (`modcommentsid` INT  NULL DEFAULT NULL,`commentcontent` TEXT  NULL ,`related_to` VARCHAR(100)  NOT NULL ,`parent_comments` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_modcommentscf` (`modcommentsid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_modentity_num` (`num_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`semodule` VARCHAR(50)  NOT NULL ,`prefix` VARCHAR(50)  NOT NULL ,`start_id` VARCHAR(50)  NOT NULL ,`cur_id` VARCHAR(50)  NOT NULL ,`active` VARCHAR(2)  NOT NULL );

CREATE TABLE `vtiger_modentity_num_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_moduleowners` (`tabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`user_id` VARCHAR(11)  NOT NULL ,CONSTRAINT `fk_1_vtiger_moduleowners` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_notebook_contents` (`userid` INT  NOT NULL DEFAULT 0,`notebookid` INT  NOT NULL DEFAULT 0,`contents` TEXT  NULL );

CREATE TABLE `vtiger_notes` (`notesid` INT PRIMARY KEY NOT NULL DEFAULT 0,`note_no` VARCHAR(100)  NOT NULL ,`title` VARCHAR(50)  NOT NULL ,`filename` VARCHAR(200)  NULL DEFAULT NULL,`notecontent` TEXT  NULL ,`folderid` INT  NOT NULL DEFAULT 1,`filetype` VARCHAR(50)  NULL DEFAULT NULL,`filelocationtype` VARCHAR(5)  NULL DEFAULT NULL,`filedownloadcount` INT  NULL DEFAULT NULL,`filestatus` INT  NULL DEFAULT NULL,`filesize` INT  NOT NULL DEFAULT 0,`fileversion` VARCHAR(50)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_notes` FOREIGN KEY (`notesid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_notescf` (`notesid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_notificationscheduler` (`schedulednotificationid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`schedulednotificationname` VARCHAR(200)  NULL DEFAULT NULL,`active` INT  NULL DEFAULT NULL,`notificationsubject` VARCHAR(200)  NULL DEFAULT NULL,`notificationbody` TEXT  NULL ,`label` VARCHAR(50)  NULL DEFAULT NULL,`type` VARCHAR(10)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_notificationscheduler_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_opportunity_type` (`opptypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`opportunity_type` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_opportunity_type_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_opportunitystage` (`potstageid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`stage` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1,`probability` FLOAT(3,2)  NULL DEFAULT 0);

CREATE TABLE `vtiger_org_share_action2tab` (`share_action_id` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (share_action_id,tabid),CONSTRAINT `fk_2_vtiger_org_share_action2tab` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_org_share_action_mapping` (`share_action_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`share_action_name` VARCHAR(200)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_organizationdetails` (`organizationname` VARCHAR(60) PRIMARY KEY NOT NULL ,`address` VARCHAR(150)  NULL DEFAULT NULL,`city` VARCHAR(100)  NULL DEFAULT NULL,`state` VARCHAR(100)  NULL DEFAULT NULL,`country` VARCHAR(100)  NULL DEFAULT NULL,`code` VARCHAR(30)  NULL DEFAULT NULL,`phone` VARCHAR(30)  NULL DEFAULT NULL,`fax` VARCHAR(30)  NULL DEFAULT NULL,`website` VARCHAR(100)  NULL DEFAULT NULL,`logoname` VARCHAR(50)  NULL DEFAULT NULL,`logo` TEXT  NULL ,`tin_number` VARCHAR(100)  NOT NULL ,`cst` VARCHAR(100)  NOT NULL );

CREATE TABLE `vtiger_ownernotify` (`crmid` INT  NULL DEFAULT NULL,`smownerid` INT  NULL DEFAULT NULL,`flag` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_parenttab` (`parenttabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`parenttab_label` VARCHAR(100)  NOT NULL ,`sequence` INT  NOT NULL DEFAULT 0,`visible` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_parenttabrel` (`parenttabid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`sequence` INT  NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_parenttabrel` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`),CONSTRAINT `fk_2_vtiger_parenttabrel` FOREIGN KEY (`parenttabid`) REFERENCES vtiger_parenttab (`parenttabid`));

CREATE TABLE `vtiger_payment_duration` (`payment_duration_id` INT  NULL DEFAULT NULL,`payment_duration` VARCHAR(200)  NULL DEFAULT NULL,`sortorderid` INT  NULL DEFAULT NULL,`presence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_payment_duration_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_pbxmanager` (`pbxmanagerid` INT  NULL DEFAULT NULL,`callfrom` VARCHAR(255)  NULL DEFAULT NULL,`callto` VARCHAR(255)  NULL DEFAULT NULL,`timeofcall` VARCHAR(255)  NULL DEFAULT NULL,`status` VARCHAR(255)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_picklist` (`picklistid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`name` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_picklist_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_picklistvalues_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_po_pr_item_mapping` (`po_pr_item_mapping_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`poid` INT  NULL DEFAULT NULL,`prid` VARCHAR(100)  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`qty` INT  NULL DEFAULT NULL,`warehouseid` INT  NULL DEFAULT NULL,`status` VARCHAR(25)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_pobillads` (`pobilladdressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`bill_city` VARCHAR(30)  NULL DEFAULT NULL,`bill_code` VARCHAR(30)  NULL DEFAULT NULL,`bill_country` VARCHAR(30)  NULL DEFAULT NULL,`bill_state` VARCHAR(30)  NULL DEFAULT NULL,`bill_street` VARCHAR(250)  NULL DEFAULT NULL,`bill_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_pobillads` FOREIGN KEY (`pobilladdressid`) REFERENCES vtiger_purchaseorder (`purchaseorderid`));

CREATE TABLE `vtiger_portal` (`portalid` INT PRIMARY KEY NOT NULL DEFAULT 0,`portalname` VARCHAR(200)  NOT NULL ,`portalurl` VARCHAR(255)  NOT NULL ,`sequence` INT  NOT NULL DEFAULT 0,`setdefault` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_portal_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_portalinfo` (`id` INT PRIMARY KEY NOT NULL DEFAULT 0,`user_name` VARCHAR(50)  NULL DEFAULT NULL,`user_password` VARCHAR(30)  NULL DEFAULT NULL,`type` VARCHAR(5)  NULL DEFAULT NULL,`last_login_time` DATETIME  NULL DEFAULT NULL,`login_time` DATETIME  NULL DEFAULT NULL,`logout_time` DATETIME  NULL DEFAULT NULL,`isactive` INT  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_portalinfo` FOREIGN KEY (`id`) REFERENCES vtiger_contactdetails (`contactid`));

CREATE TABLE `vtiger_poshipads` (`poshipaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ship_city` VARCHAR(30)  NULL DEFAULT NULL,`ship_code` VARCHAR(30)  NULL DEFAULT NULL,`ship_country` VARCHAR(30)  NULL DEFAULT NULL,`ship_state` VARCHAR(30)  NULL DEFAULT NULL,`ship_street` VARCHAR(250)  NULL DEFAULT NULL,`ship_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_poshipads` FOREIGN KEY (`poshipaddressid`) REFERENCES vtiger_purchaseorder (`purchaseorderid`));

CREATE TABLE `vtiger_postatus` (`postatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`postatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_postatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_postatushistory` (`historyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`purchaseorderid` INT  NOT NULL DEFAULT 0,`vendorname` VARCHAR(100)  NULL DEFAULT NULL,`total` FLOAT(10,0)  NULL DEFAULT NULL,`postatus` VARCHAR(200)  NULL DEFAULT NULL,`lastmodified` DATETIME  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_postatushistory` FOREIGN KEY (`purchaseorderid`) REFERENCES vtiger_purchaseorder (`purchaseorderid`));

CREATE TABLE `vtiger_potcompetitorrel` (`potentialid` INT  NOT NULL DEFAULT 0,`competitorid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (potentialid,competitorid),CONSTRAINT `fk_2_vtiger_potcompetitorrel` FOREIGN KEY (`potentialid`) REFERENCES vtiger_potential (`potentialid`));

CREATE TABLE `vtiger_potential` (`potentialid` INT PRIMARY KEY NOT NULL DEFAULT 0,`potential_no` VARCHAR(100)  NOT NULL ,`related_to` INT  NULL DEFAULT NULL,`potentialname` VARCHAR(120)  NOT NULL ,`amount` FLOAT(14,2)  NULL DEFAULT 0,`currency` VARCHAR(20)  NULL DEFAULT NULL,`closingdate` DATE  NULL DEFAULT NULL,`typeofrevenue` VARCHAR(50)  NULL DEFAULT NULL,`nextstep` VARCHAR(100)  NULL DEFAULT NULL,`private` INT  NULL DEFAULT 0,`probability` FLOAT(7,3)  NULL DEFAULT 0,`campaignid` INT  NULL DEFAULT NULL,`sales_stage` VARCHAR(200)  NULL DEFAULT NULL,`potentialtype` VARCHAR(200)  NULL DEFAULT NULL,`leadsource` VARCHAR(200)  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`productversion` VARCHAR(50)  NULL DEFAULT NULL,`quotationref` VARCHAR(50)  NULL DEFAULT NULL,`partnercontact` VARCHAR(50)  NULL DEFAULT NULL,`remarks` VARCHAR(50)  NULL DEFAULT NULL,`runtimefee` INT  NULL DEFAULT 0,`followupdate` DATE  NULL DEFAULT NULL,`evaluationstatus` VARCHAR(50)  NULL DEFAULT NULL,`description` TEXT  NULL ,`forecastcategory` INT  NULL DEFAULT 0,`outcomeanalysis` INT  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_potential` FOREIGN KEY (`potentialid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_potentialscf` (`potentialid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_potentialscf` FOREIGN KEY (`potentialid`) REFERENCES vtiger_potential (`potentialid`));

CREATE TABLE `vtiger_potstagehistory` (`historyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`potentialid` INT  NOT NULL DEFAULT 0,`amount` FLOAT(10,0)  NULL DEFAULT NULL,`stage` VARCHAR(100)  NULL DEFAULT NULL,`probability` FLOAT(7,3)  NULL DEFAULT NULL,`expectedrevenue` FLOAT(10,0)  NULL DEFAULT NULL,`closedate` DATE  NULL DEFAULT NULL,`lastmodified` DATETIME  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_potstagehistory` FOREIGN KEY (`potentialid`) REFERENCES vtiger_potential (`potentialid`));

CREATE TABLE `vtiger_prdelivery` (`prdeliveryid` INT  NULL DEFAULT NULL,`prid` INT  NULL DEFAULT NULL,`warehouseid` INT  NULL DEFAULT NULL,`duedate` DATE  NULL DEFAULT NULL,`status` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_prdeliverycf` (`prdeliveryid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_prdeliverygrouprel` (`prdeliveryid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_pricebook` (`pricebookid` INT PRIMARY KEY NOT NULL DEFAULT 0,`pricebook_no` VARCHAR(100)  NOT NULL ,`bookname` VARCHAR(100)  NULL DEFAULT NULL,`active` INT  NULL DEFAULT NULL,`currency_id` INT  NOT NULL DEFAULT 1,CONSTRAINT `fk_1_vtiger_pricebook` FOREIGN KEY (`pricebookid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_pricebookcf` (`pricebookid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_pricebookcf` FOREIGN KEY (`pricebookid`) REFERENCES vtiger_pricebook (`pricebookid`));

CREATE TABLE `vtiger_pricebookproductrel` (`pricebookid` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,`listprice` FLOAT(25,3)  NULL DEFAULT NULL,`usedcurrency` INT  NOT NULL DEFAULT 1,PRIMARY KEY (pricebookid,productid),CONSTRAINT `fk_1_vtiger_pricebookproductrel` FOREIGN KEY (`pricebookid`) REFERENCES vtiger_pricebook (`pricebookid`));

CREATE TABLE `vtiger_priority` (`priorityid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`priority` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_productcategory` (`productcategoryid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`productcategory` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_productcategory_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_productcf` (`productid` INT PRIMARY KEY NOT NULL DEFAULT 0,`cf_833` FLOAT(5,2)  NULL DEFAULT NULL,`cf_834` FLOAT(5,2)  NULL DEFAULT NULL,`cf_835` FLOAT(5,2)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_productcf` FOREIGN KEY (`productid`) REFERENCES vtiger_products (`productid`));

CREATE TABLE `vtiger_productcollaterals` (`productid` INT PRIMARY KEY NOT NULL DEFAULT 0,`date_entered` TIMESTAMP  NOT NULL ,`data` BLOB  NULL ,`description` TEXT  NULL ,`filename` VARCHAR(50)  NULL DEFAULT NULL,`filesize` VARCHAR(50)  NOT NULL ,`filetype` VARCHAR(20)  NOT NULL ,CONSTRAINT `fk_1_vtiger_productcollaterals` FOREIGN KEY (`productid`) REFERENCES vtiger_products (`productid`));

CREATE TABLE `vtiger_productcurrencyrel` (`productid` INT  NOT NULL DEFAULT 0,`currencyid` INT  NOT NULL DEFAULT 0,`converted_price` FLOAT(25,2)  NULL DEFAULT NULL,`actual_price` FLOAT(25,2)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_products` (`productid` INT PRIMARY KEY NOT NULL DEFAULT 0,`product_no` VARCHAR(100)  NOT NULL ,`productname` VARCHAR(50)  NOT NULL ,`barcode` VARCHAR(255)  NULL DEFAULT NULL,`warehouse_id` VARCHAR(25)  NULL DEFAULT NULL,`productcode` VARCHAR(40)  NULL DEFAULT NULL,`productcategory` VARCHAR(200)  NULL DEFAULT NULL,`manufacturer` VARCHAR(200)  NULL DEFAULT NULL,`qty_per_unit` FLOAT(11,2)  NULL DEFAULT 0,`cost` FLOAT(12,2)  NULL DEFAULT 0,`unit_price` FLOAT(12,2)  NULL DEFAULT 0,`discount` FLOAT(25,2)  NULL DEFAULT 0,`netprice` FLOAT(25,2)  NULL DEFAULT 0,`vat` FLOAT(12,2)  NULL DEFAULT NULL,`service` FLOAT(12,2)  NULL DEFAULT NULL,`frequency` VARCHAR(100)  NULL DEFAULT NULL,`weight` FLOAT(11,3)  NULL DEFAULT NULL,`pack_size` INT  NULL DEFAULT NULL,`sales_start_date` DATE  NULL DEFAULT NULL,`sales_end_date` DATE  NULL DEFAULT NULL,`start_date` DATE  NULL DEFAULT NULL,`expiry_date` DATE  NULL DEFAULT NULL,`cost_factor` INT  NULL DEFAULT NULL,`commissionrate` FLOAT(7,3)  NULL DEFAULT NULL,`commissionmethod` VARCHAR(50)  NULL DEFAULT NULL,`discontinued` INT  NOT NULL DEFAULT 0,`usageunit` VARCHAR(200)  NULL DEFAULT NULL,`handler` INT  NULL DEFAULT NULL,`reorderlevel` INT  NULL DEFAULT NULL,`website` VARCHAR(100)  NULL DEFAULT NULL,`taxclass` VARCHAR(200)  NULL DEFAULT NULL,`mfr_part_no` VARCHAR(200)  NULL DEFAULT NULL,`vendor_part_no` VARCHAR(200)  NULL DEFAULT NULL,`serialno` VARCHAR(200)  NULL DEFAULT NULL,`qtyinstock` FLOAT(11,2)  NULL DEFAULT NULL,`productsheet` VARCHAR(200)  NULL DEFAULT NULL,`qtyindemand` INT  NULL DEFAULT NULL,`glacct` VARCHAR(200)  NULL DEFAULT NULL,`vendor_id` INT  NULL DEFAULT NULL,`imagename` TEXT  NULL ,`currency_id` INT  NOT NULL DEFAULT 1,`product_markup` FLOAT(12,2)  NULL DEFAULT 0,`product_withcform` FLOAT(12,2)  NULL DEFAULT 0,`product_withoutcform` FLOAT(12,2)  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_products` FOREIGN KEY (`productid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_producttaxrel` (`productid` INT  NOT NULL DEFAULT 0,`taxid` INT  NOT NULL DEFAULT 0,`taxpercentage` FLOAT(7,3)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_profile` (`profileid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`profilename` VARCHAR(50)  NOT NULL ,`description` TEXT  NULL );

CREATE TABLE `vtiger_profile2field` (`profileid` INT  NOT NULL DEFAULT 0,`tabid` INT  NULL DEFAULT NULL,`fieldid` INT  NOT NULL DEFAULT 0,`visible` INT  NULL DEFAULT NULL,`readonly` INT  NULL DEFAULT NULL,PRIMARY KEY (profileid,fieldid));

CREATE TABLE `vtiger_profile2globalpermissions` (`profileid` INT  NOT NULL DEFAULT 0,`globalactionid` INT  NOT NULL DEFAULT 0,`globalactionpermission` INT  NULL DEFAULT NULL,PRIMARY KEY (profileid,globalactionid),CONSTRAINT `fk_1_vtiger_profile2globalpermissions` FOREIGN KEY (`profileid`) REFERENCES vtiger_profile (`profileid`));

CREATE TABLE `vtiger_profile2standardpermissions` (`profileid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`operation` INT  NOT NULL DEFAULT 0,`permissions` INT  NULL DEFAULT NULL,PRIMARY KEY (profileid,tabid,operation));

CREATE TABLE `vtiger_profile2tab` (`profileid` INT  NULL DEFAULT NULL,`tabid` INT  NULL DEFAULT NULL,`permissions` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_profile2utility` (`profileid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`activityid` INT  NOT NULL DEFAULT 0,`permission` INT  NULL DEFAULT NULL,PRIMARY KEY (profileid,tabid,activityid));

CREATE TABLE `vtiger_profile_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_progress` (`progressid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`progress` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_progress_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_project` (`projectid` INT  NULL DEFAULT NULL,`projectname` VARCHAR(255)  NULL DEFAULT NULL,`project_no` VARCHAR(100)  NULL DEFAULT NULL,`startdate` DATE  NULL DEFAULT NULL,`targetenddate` DATE  NULL DEFAULT NULL,`actualenddate` DATE  NULL DEFAULT NULL,`targetbudget` VARCHAR(255)  NULL DEFAULT NULL,`projecturl` VARCHAR(255)  NULL DEFAULT NULL,`projectstatus` VARCHAR(100)  NULL DEFAULT NULL,`projectpriority` VARCHAR(100)  NULL DEFAULT NULL,`projecttype` VARCHAR(100)  NULL DEFAULT NULL,`progress` VARCHAR(100)  NULL DEFAULT NULL,`linktoaccountscontacts` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_projectcf` (`projectid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectmilestone` (`projectmilestoneid` INT PRIMARY KEY NOT NULL DEFAULT 0,`projectmilestonename` VARCHAR(255)  NULL DEFAULT NULL,`projectmilestone_no` VARCHAR(100)  NULL DEFAULT NULL,`projectmilestonedate` VARCHAR(255)  NULL DEFAULT NULL,`projectid` VARCHAR(100)  NULL DEFAULT NULL,`projectmilestonetype` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_projectmilestonecf` (`projectmilestoneid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectmilestonetype` (`projectmilestonetypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projectmilestonetype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectmilestonetype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectpriority` (`projectpriorityid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projectpriority` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectpriority_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectstatus` (`projectstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projectstatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projectstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttask` (`projecttaskid` INT PRIMARY KEY NOT NULL DEFAULT 0,`projecttaskname` VARCHAR(255)  NULL DEFAULT NULL,`projecttask_no` VARCHAR(100)  NULL DEFAULT NULL,`projecttasktype` VARCHAR(100)  NULL DEFAULT NULL,`projecttaskpriority` VARCHAR(100)  NULL DEFAULT NULL,`projecttaskprogress` VARCHAR(100)  NULL DEFAULT NULL,`projecttaskhours` VARCHAR(255)  NULL DEFAULT NULL,`startdate` DATE  NULL DEFAULT NULL,`enddate` DATE  NULL DEFAULT NULL,`projectid` VARCHAR(100)  NULL DEFAULT NULL,`projecttasknumber` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_projecttaskcf` (`projecttaskid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttaskpriority` (`projecttaskpriorityid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projecttaskpriority` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttaskpriority_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttaskprogress` (`projecttaskprogressid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projecttaskprogress` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttaskprogress_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttasktype` (`projecttasktypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projecttasktype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttasktype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttype` (`projecttypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`projecttype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_projecttype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_promotion` (`promotionid` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,`product_name` VARCHAR(100)  NULL DEFAULT NULL,`qty` FLOAT(0,0)  NULL DEFAULT NULL,`mrp` FLOAT(0,0)  NULL DEFAULT NULL,`vat` FLOAT(0,0)  NULL DEFAULT NULL,`service` FLOAT(10,0)  NULL DEFAULT NULL,`netprice` FLOAT(0,0)  NULL DEFAULT NULL,`from_date` DATE  NULL DEFAULT NULL,`to_date` DATE  NULL DEFAULT NULL);

CREATE TABLE `vtiger_promotioncf` (`promotionid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_promotiongrouprel` (`promotionid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_prreceive` (`prreceiveid` INT  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`warehouseid` INT  NULL DEFAULT NULL,`duedate` DATE  NULL DEFAULT NULL,`status` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_prreceivecf` (`prreceiveid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_prreceivegrouprel` (`prreceiveid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_purchaseorder` (`purchaseorderid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ref_po_no` INT  NULL DEFAULT 0,`subject` VARCHAR(100)  NULL DEFAULT NULL,`quoteid` INT  NULL DEFAULT NULL,`vendorid` INT  NULL DEFAULT NULL,`requisition_no` VARCHAR(100)  NULL DEFAULT NULL,`purchaseorder_no` VARCHAR(100)  NULL DEFAULT NULL,`tracking_no` VARCHAR(100)  NULL DEFAULT NULL,`contactid` INT  NULL DEFAULT NULL,`duedate` DATE  NULL DEFAULT NULL,`carrier` VARCHAR(200)  NULL DEFAULT NULL,`type` VARCHAR(100)  NULL DEFAULT NULL,`adjustment` FLOAT(25,3)  NULL DEFAULT NULL,`salescommission` FLOAT(25,3)  NULL DEFAULT NULL,`exciseduty` FLOAT(25,3)  NULL DEFAULT NULL,`total` FLOAT(25,3)  NULL DEFAULT NULL,`subtotal` FLOAT(25,3)  NULL DEFAULT NULL,`taxtype` VARCHAR(25)  NULL DEFAULT NULL,`discount_percent` FLOAT(25,3)  NULL DEFAULT NULL,`discount_amount` FLOAT(25,3)  NULL DEFAULT NULL,`s_h_amount` FLOAT(25,3)  NULL DEFAULT NULL,`service_percent` FLOAT(25,3)  NULL DEFAULT NULL,`service_amount` FLOAT(25,3)  NULL DEFAULT NULL,`terms_conditions` TEXT  NULL ,`postatus` VARCHAR(200)  NULL DEFAULT NULL,`warehouse` VARCHAR(100)  NULL DEFAULT NULL,`currency_id` INT  NOT NULL DEFAULT 1,`conversion_rate` FLOAT(10,3)  NOT NULL DEFAULT 1.000,CONSTRAINT `fk_4_vtiger_purchaseorder` FOREIGN KEY (`vendorid`) REFERENCES vtiger_vendor (`vendorid`));

CREATE TABLE `vtiger_purchaseordercf` (`purchaseorderid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_purchaseordercf` FOREIGN KEY (`purchaseorderid`) REFERENCES vtiger_purchaseorder (`purchaseorderid`));

CREATE TABLE `vtiger_purchaseorderreceived` (`poreceivedid` INT  NULL DEFAULT 0,`productid` INT  NULL DEFAULT NULL,`productname` VARCHAR(50)  NULL DEFAULT NULL,`actualqty` FLOAT(11,2)  NULL DEFAULT NULL,`qtyreceived` FLOAT(11,2)  NULL DEFAULT NULL,`balanceqty` FLOAT(11,2)  NULL DEFAULT NULL,`cost` FLOAT(11,2)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_purchaseorderreceivedcf` (`poreceivedid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_purchaseorderreceivedgrouprel` (`poreceivedid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_purchaserequest` (`purchaserequestid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`customprid` VARCHAR(100)  NULL DEFAULT NULL,`warehouseid` INT  NULL DEFAULT NULL,`date` DATE  NULL DEFAULT NULL,`status` VARCHAR(20)  NULL DEFAULT NULL,`linkto` VARCHAR(100)  NULL DEFAULT NULL,`comment` VARCHAR(500)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_purchaserequest_item` (`purchaserequestitemid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`customprid` VARCHAR(100)  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`actualprqty` INT  NULL DEFAULT NULL,`prqty` INT  NULL DEFAULT NULL,`barcode` VARCHAR(100)  NULL DEFAULT NULL,`prqtyreceived` INT  NULL DEFAULT NULL,`prqtybalance` INT  NULL DEFAULT NULL,`status` VARCHAR(100)  NULL DEFAULT NULL,`deliverydate` DATE  NULL DEFAULT NULL,`is_po_generated` SMALLINT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_purchaserequestcf` (`purchaserequestid` INT PRIMARY KEY NOT NULL DEFAULT 0,`cf_807` DATE  NULL DEFAULT NULL,`cf_808` DATE  NULL DEFAULT NULL,`cf_809` VARCHAR(100)  NULL DEFAULT NULL,`cf_810` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_purchaserequestgrouprel` (`purchaserequestid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_quickview` (`fieldid` INT  NOT NULL DEFAULT 0,`related_fieldid` INT  NOT NULL DEFAULT 0,`sequence` INT  NOT NULL DEFAULT 0,`currentview` INT  NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_quickview` FOREIGN KEY (`fieldid`) REFERENCES vtiger_field (`fieldid`));

CREATE TABLE `vtiger_quotes` (`quoteid` INT PRIMARY KEY NOT NULL DEFAULT 0,`subject` VARCHAR(100)  NULL DEFAULT NULL,`potentialid` INT  NULL DEFAULT NULL,`quotestage` VARCHAR(200)  NULL DEFAULT NULL,`validtill` DATE  NULL DEFAULT NULL,`contactid` INT  NULL DEFAULT NULL,`quote_no` VARCHAR(100)  NULL DEFAULT NULL,`subtotal` FLOAT(25,3)  NULL DEFAULT NULL,`carrier` VARCHAR(200)  NULL DEFAULT NULL,`shipping` VARCHAR(100)  NULL DEFAULT NULL,`inventorymanager` INT  NULL DEFAULT NULL,`type` VARCHAR(100)  NULL DEFAULT NULL,`adjustment` FLOAT(25,3)  NULL DEFAULT NULL,`total` FLOAT(25,3)  NULL DEFAULT NULL,`taxtype` VARCHAR(25)  NULL DEFAULT NULL,`discount_percent` FLOAT(25,3)  NULL DEFAULT NULL,`discount_amount` FLOAT(25,3)  NULL DEFAULT NULL,`s_h_amount` FLOAT(25,3)  NULL DEFAULT NULL,`accountid` INT  NULL DEFAULT NULL,`terms_conditions` TEXT  NULL ,`currency_id` INT  NOT NULL DEFAULT 1,`conversion_rate` FLOAT(10,3)  NOT NULL DEFAULT 1.000,CONSTRAINT `fk_3_vtiger_quotes` FOREIGN KEY (`potentialid`) REFERENCES vtiger_potential (`potentialid`));

CREATE TABLE `vtiger_quotesbillads` (`quotebilladdressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`bill_city` VARCHAR(30)  NULL DEFAULT NULL,`bill_code` VARCHAR(30)  NULL DEFAULT NULL,`bill_country` VARCHAR(30)  NULL DEFAULT NULL,`bill_state` VARCHAR(30)  NULL DEFAULT NULL,`bill_street` VARCHAR(250)  NULL DEFAULT NULL,`bill_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_quotesbillads` FOREIGN KEY (`quotebilladdressid`) REFERENCES vtiger_quotes (`quoteid`));

CREATE TABLE `vtiger_quotescf` (`quoteid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_quotescf` FOREIGN KEY (`quoteid`) REFERENCES vtiger_quotes (`quoteid`));

CREATE TABLE `vtiger_quotesshipads` (`quoteshipaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ship_city` VARCHAR(30)  NULL DEFAULT NULL,`ship_code` VARCHAR(30)  NULL DEFAULT NULL,`ship_country` VARCHAR(30)  NULL DEFAULT NULL,`ship_state` VARCHAR(30)  NULL DEFAULT NULL,`ship_street` VARCHAR(250)  NULL DEFAULT NULL,`ship_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_quotesshipads` FOREIGN KEY (`quoteshipaddressid`) REFERENCES vtiger_quotes (`quoteid`));

CREATE TABLE `vtiger_quotestage` (`quotestageid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`quotestage` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_quotestage_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_quotestagehistory` (`historyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`quoteid` INT  NOT NULL DEFAULT 0,`accountname` VARCHAR(100)  NULL DEFAULT NULL,`total` FLOAT(10,0)  NULL DEFAULT NULL,`quotestage` VARCHAR(200)  NULL DEFAULT NULL,`lastmodified` DATETIME  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_quotestagehistory` FOREIGN KEY (`quoteid`) REFERENCES vtiger_quotes (`quoteid`));

CREATE TABLE `vtiger_rating` (`rating_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`rating` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_rating_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_recurring_frequency` (`recurring_frequency_id` INT  NULL DEFAULT NULL,`recurring_frequency` VARCHAR(200)  NULL DEFAULT NULL,`sortorderid` INT  NULL DEFAULT NULL,`presence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_recurring_frequency_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_recurringevents` (`recurringid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`activityid` INT  NOT NULL DEFAULT 0,`recurringdate` DATE  NULL DEFAULT NULL,`recurringtype` VARCHAR(30)  NULL DEFAULT NULL,`recurringfreq` INT  NULL DEFAULT NULL,`recurringinfo` VARCHAR(50)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_recurringevents` FOREIGN KEY (`activityid`) REFERENCES vtiger_activity (`activityid`));

CREATE TABLE `vtiger_recurringtype` (`recurringeventid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`recurringtype` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_recurringtype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_relatedlists` (`relation_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`tabid` INT  NULL DEFAULT NULL,`related_tabid` INT  NULL DEFAULT NULL,`name` VARCHAR(100)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL,`label` VARCHAR(100)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 0,`actions` VARCHAR(50)  NOT NULL );

CREATE TABLE `vtiger_relatedlists_rb` (`entityid` INT  NULL DEFAULT NULL,`action` VARCHAR(50)  NULL DEFAULT NULL,`rel_table` VARCHAR(200)  NULL DEFAULT NULL,`rel_column` VARCHAR(200)  NULL DEFAULT NULL,`ref_column` VARCHAR(200)  NULL DEFAULT NULL,`related_crm_ids` TEXT  NULL );

CREATE TABLE `vtiger_relatedlists_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_relcriteria` (`queryid` INT  NOT NULL DEFAULT 0,`columnindex` INT  NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NULL DEFAULT NULL,`comparator` VARCHAR(10)  NULL DEFAULT NULL,`value` VARCHAR(200)  NULL DEFAULT NULL,`groupid` INT  NULL DEFAULT 1,`column_condition` VARCHAR(256)  NULL DEFAULT 'and',PRIMARY KEY (queryid,columnindex),CONSTRAINT `fk_1_vtiger_relcriteria` FOREIGN KEY (`queryid`) REFERENCES vtiger_selectquery (`queryid`));

CREATE TABLE `vtiger_relcriteria_grouping` (`groupid` INT  NOT NULL DEFAULT 0,`queryid` INT  NOT NULL DEFAULT 0,`group_condition` VARCHAR(256)  NULL DEFAULT NULL,`condition_expression` TEXT  NULL ,PRIMARY KEY (groupid,queryid));

CREATE TABLE `vtiger_reminder_interval` (`reminder_intervalid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`reminder_interval` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_reminder_interval_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_report` (`reportid` INT PRIMARY KEY NOT NULL DEFAULT 0,`folderid` INT  NOT NULL DEFAULT 0,`reportname` VARCHAR(100)  NULL DEFAULT NULL,`description` VARCHAR(250)  NULL DEFAULT NULL,`reporttype` VARCHAR(50)  NULL DEFAULT NULL,`queryid` INT  NOT NULL DEFAULT 0,`state` VARCHAR(50)  NULL DEFAULT 'SAVED',`customizable` INT  NULL DEFAULT 1,`category` INT  NULL DEFAULT 1,`owner` INT  NULL DEFAULT 1,`sharingtype` VARCHAR(200)  NULL DEFAULT 'Private',CONSTRAINT `fk_2_vtiger_report` FOREIGN KEY (`queryid`) REFERENCES vtiger_selectquery (`queryid`));

CREATE TABLE `vtiger_reportdatefilter` (`datefilterid` INT PRIMARY KEY NOT NULL DEFAULT 0,`datecolumnname` VARCHAR(250)  NULL DEFAULT NULL,`datefilter` VARCHAR(250)  NULL DEFAULT NULL,`startdate` DATE  NULL DEFAULT NULL,`enddate` DATE  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_reportdatefilter` FOREIGN KEY (`datefilterid`) REFERENCES vtiger_report (`reportid`));

CREATE TABLE `vtiger_reportfilters` (`filterid` INT  NOT NULL DEFAULT 0,`name` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_reportfolder` (`folderid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`foldername` VARCHAR(100)  NOT NULL ,`description` VARCHAR(250)  NULL DEFAULT NULL,`state` VARCHAR(50)  NULL DEFAULT 'SAVED');

CREATE TABLE `vtiger_reportmodules` (`reportmodulesid` INT PRIMARY KEY NOT NULL DEFAULT 0,`primarymodule` VARCHAR(50)  NOT NULL ,`secondarymodules` VARCHAR(250)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_reportmodules` FOREIGN KEY (`reportmodulesid`) REFERENCES vtiger_report (`reportid`));

CREATE TABLE `vtiger_reports` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`report_code` VARCHAR(200)  NOT NULL ,`report_name` VARCHAR(200)  NOT NULL ,`mod_name` VARCHAR(200)  NOT NULL ,`is_deleted` SMALLINT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_reports_group` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`report_parent_code` VARCHAR(200)  NOT NULL ,`report_name` VARCHAR(200)  NOT NULL ,`query_code` TEXT  NOT NULL ,`columns_total` INT  NOT NULL DEFAULT 0,`is_deleted` SMALLINT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_reportsharing` (`reportid` INT  NOT NULL DEFAULT 0,`shareid` INT  NOT NULL DEFAULT 0,`setype` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_reportsortcol` (`sortcolid` INT  NOT NULL DEFAULT 0,`reportid` INT  NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NULL DEFAULT NULL,`sortorder` VARCHAR(250)  NULL DEFAULT 'Asc',PRIMARY KEY (sortcolid,reportid),CONSTRAINT `fk_1_vtiger_reportsortcol` FOREIGN KEY (`reportid`) REFERENCES vtiger_report (`reportid`));

CREATE TABLE `vtiger_reportsummary` (`reportsummaryid` INT  NOT NULL DEFAULT 0,`summarytype` INT  NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NOT NULL ,PRIMARY KEY (reportsummaryid,summarytype,columnname),CONSTRAINT `fk_1_vtiger_reportsummary` FOREIGN KEY (`reportsummaryid`) REFERENCES vtiger_report (`reportid`));

CREATE TABLE `vtiger_revenuetype` (`revenuetypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`revenuetype` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_role` (`roleid` VARCHAR(255) PRIMARY KEY NOT NULL ,`rolename` VARCHAR(200)  NULL DEFAULT NULL,`parentrole` VARCHAR(255)  NULL DEFAULT NULL,`depth` INT  NULL DEFAULT NULL,`warehouseid` VARCHAR(100)  NULL DEFAULT NULL,`rolecode` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_role2picklist` (`roleid` VARCHAR(255)  NOT NULL ,`picklistvalueid` INT  NOT NULL DEFAULT 0,`picklistid` INT  NOT NULL DEFAULT 0,`sortid` INT  NULL DEFAULT NULL,PRIMARY KEY (roleid,picklistvalueid,picklistid),CONSTRAINT `fk_1_vtiger_role2picklist` FOREIGN KEY (`roleid`) REFERENCES vtiger_role (`roleid`),CONSTRAINT `fk_2_vtiger_role2picklist` FOREIGN KEY (`picklistid`) REFERENCES vtiger_picklist (`picklistid`));

CREATE TABLE `vtiger_role2profile` (`roleid` VARCHAR(255)  NOT NULL ,`profileid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (roleid,profileid));

CREATE TABLE `vtiger_role_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_rss` (`rssid` INT PRIMARY KEY NOT NULL DEFAULT 0,`rssurl` VARCHAR(200)  NOT NULL ,`rsstitle` VARCHAR(200)  NULL DEFAULT NULL,`rsstype` INT  NULL DEFAULT 0,`starred` INT  NULL DEFAULT 0);

CREATE TABLE `vtiger_rss_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_sales_stage` (`sales_stage_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`sales_stage` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_sales_stage_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_salesmanactivityrel` (`smid` INT  NOT NULL DEFAULT 0,`activityid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (smid,activityid),CONSTRAINT `fk_2_vtiger_salesmanactivityrel` FOREIGN KEY (`smid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_salesmanattachmentsrel` (`smid` INT  NOT NULL DEFAULT 0,`attachmentsid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (smid,attachmentsid),CONSTRAINT `fk_2_vtiger_salesmanattachmentsrel` FOREIGN KEY (`attachmentsid`) REFERENCES vtiger_attachments (`attachmentsid`));

CREATE TABLE `vtiger_salesmanticketrel` (`smid` INT  NOT NULL DEFAULT 0,`id` INT  NOT NULL DEFAULT 0,PRIMARY KEY (smid,id),CONSTRAINT `fk_2_vtiger_salesmanticketrel` FOREIGN KEY (`smid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_salesorder` (`salesorderid` INT PRIMARY KEY NOT NULL DEFAULT 0,`subject` VARCHAR(100)  NULL DEFAULT NULL,`potentialid` INT  NULL DEFAULT NULL,`customerno` VARCHAR(100)  NULL DEFAULT NULL,`salesorder_no` VARCHAR(100)  NULL DEFAULT NULL,`quoteid` INT  NULL DEFAULT NULL,`vendorterms` VARCHAR(100)  NULL DEFAULT NULL,`contactid` INT  NULL DEFAULT NULL,`vendorid` INT  NULL DEFAULT NULL,`duedate` DATE  NULL DEFAULT NULL,`carrier` VARCHAR(200)  NULL DEFAULT NULL,`pending` VARCHAR(200)  NULL DEFAULT NULL,`type` VARCHAR(100)  NULL DEFAULT NULL,`adjustment` FLOAT(25,3)  NULL DEFAULT NULL,`salescommission` FLOAT(25,3)  NULL DEFAULT NULL,`exciseduty` FLOAT(25,3)  NULL DEFAULT NULL,`total` FLOAT(25,3)  NULL DEFAULT NULL,`subtotal` FLOAT(25,3)  NULL DEFAULT NULL,`taxtype` VARCHAR(25)  NULL DEFAULT NULL,`discount_percent` FLOAT(25,3)  NULL DEFAULT NULL,`discount_amount` FLOAT(25,3)  NULL DEFAULT NULL,`s_h_amount` FLOAT(25,3)  NULL DEFAULT NULL,`accountid` INT  NULL DEFAULT NULL,`terms_conditions` TEXT  NULL ,`purchaseorder` VARCHAR(200)  NULL DEFAULT NULL,`sostatus` VARCHAR(200)  NULL DEFAULT NULL,`currency_id` INT  NOT NULL DEFAULT 1,`conversion_rate` FLOAT(10,3)  NOT NULL DEFAULT 1.000,`enable_recurring` INT  NULL DEFAULT 0,CONSTRAINT `fk_3_vtiger_salesorder` FOREIGN KEY (`vendorid`) REFERENCES vtiger_vendor (`vendorid`));

CREATE TABLE `vtiger_salesordercf` (`salesorderid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_salesordercf` FOREIGN KEY (`salesorderid`) REFERENCES vtiger_salesorder (`salesorderid`));

CREATE TABLE `vtiger_salesret` (`salesid` INT  NOT NULL DEFAULT 0,`invoiceid` INT  NOT NULL DEFAULT 0,`customername` VARCHAR(100)  NULL DEFAULT NULL,`mobile` VARCHAR(50)  NULL DEFAULT NULL,`email` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_salesretcf` (`salesid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_salesretgrouprel` (`salesid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_salutationtype` (`salutationid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`salutationtype` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_salutationtype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_seactivityrel` (`crmid` INT  NOT NULL DEFAULT 0,`activityid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (crmid,activityid),CONSTRAINT `fk_2_vtiger_seactivityrel` FOREIGN KEY (`crmid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_seactivityrel_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_seattachmentsrel` (`crmid` INT  NOT NULL DEFAULT 0,`attachmentsid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (crmid,attachmentsid),CONSTRAINT `fk_2_vtiger_seattachmentsrel` FOREIGN KEY (`crmid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_selectcolumn` (`queryid` INT  NOT NULL DEFAULT 0,`columnindex` INT  NOT NULL DEFAULT 0,`columnname` VARCHAR(250)  NULL DEFAULT NULL,PRIMARY KEY (queryid,columnindex),CONSTRAINT `fk_1_vtiger_selectcolumn` FOREIGN KEY (`queryid`) REFERENCES vtiger_selectquery (`queryid`));

CREATE TABLE `vtiger_selectquery` (`queryid` INT PRIMARY KEY NOT NULL DEFAULT 0,`startindex` INT  NULL DEFAULT 0,`numofobjects` INT  NULL DEFAULT 0);

CREATE TABLE `vtiger_selectquery_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_senotesrel` (`crmid` INT  NOT NULL DEFAULT 0,`notesid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (crmid,notesid),CONSTRAINT `fk_2_vtiger_senotesrel` FOREIGN KEY (`notesid`) REFERENCES vtiger_notes (`notesid`));

CREATE TABLE `vtiger_seproductsrel` (`crmid` INT  NOT NULL DEFAULT 0,`productid` INT  NOT NULL DEFAULT 0,`setype` VARCHAR(30)  NOT NULL ,PRIMARY KEY (crmid,productid),CONSTRAINT `fk_2_vtiger_seproductsrel` FOREIGN KEY (`productid`) REFERENCES vtiger_products (`productid`));

CREATE TABLE `vtiger_service` (`serviceid` INT PRIMARY KEY NOT NULL DEFAULT 0,`service_no` VARCHAR(100)  NOT NULL ,`servicename` VARCHAR(50)  NOT NULL ,`servicecategory` VARCHAR(200)  NULL DEFAULT NULL,`qty_per_unit` FLOAT(11,2)  NULL DEFAULT 0,`unit_price` FLOAT(25,2)  NULL DEFAULT NULL,`sales_start_date` DATE  NULL DEFAULT NULL,`sales_end_date` DATE  NULL DEFAULT NULL,`start_date` DATE  NULL DEFAULT NULL,`expiry_date` DATE  NULL DEFAULT NULL,`discontinued` INT  NOT NULL DEFAULT 0,`service_usageunit` VARCHAR(200)  NULL DEFAULT NULL,`handler` INT  NULL DEFAULT NULL,`website` VARCHAR(100)  NULL DEFAULT NULL,`taxclass` VARCHAR(200)  NULL DEFAULT NULL,`currency_id` INT  NOT NULL DEFAULT 1,`commissionrate` FLOAT(7,3)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_service` FOREIGN KEY (`serviceid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_service_usageunit` (`service_usageunitid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`service_usageunit` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_service_usageunit_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_servicecategory` (`servicecategoryid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`servicecategory` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_servicecategory_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_servicecf` (`serviceid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_servicecontracts` (`servicecontractsid` INT  NULL DEFAULT NULL,`start_date` DATE  NULL DEFAULT NULL,`end_date` DATE  NULL DEFAULT NULL,`sc_related_to` INT  NULL DEFAULT NULL,`tracking_unit` VARCHAR(100)  NULL DEFAULT NULL,`total_units` FLOAT(5,2)  NULL DEFAULT NULL,`used_units` FLOAT(5,2)  NULL DEFAULT NULL,`subject` VARCHAR(100)  NULL DEFAULT NULL,`due_date` DATE  NULL DEFAULT NULL,`planned_duration` VARCHAR(256)  NULL DEFAULT NULL,`actual_duration` VARCHAR(256)  NULL DEFAULT NULL,`contract_status` VARCHAR(200)  NULL DEFAULT NULL,`priority` VARCHAR(200)  NULL DEFAULT NULL,`contract_type` VARCHAR(200)  NULL DEFAULT NULL,`progress` FLOAT(5,2)  NULL DEFAULT NULL,`contract_no` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_servicecontractscf` (`servicecontractsid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_seticketsrel` (`crmid` INT  NOT NULL DEFAULT 0,`ticketid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (crmid,ticketid),CONSTRAINT `fk_2_vtiger_seticketsrel` FOREIGN KEY (`ticketid`) REFERENCES vtiger_troubletickets (`ticketid`));

CREATE TABLE `vtiger_settings_blocks` (`blockid` INT PRIMARY KEY NOT NULL DEFAULT 0,`label` VARCHAR(250)  NULL DEFAULT NULL,`sequence` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_settings_blocks_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_settings_field` (`fieldid` INT PRIMARY KEY NOT NULL DEFAULT 0,`blockid` INT  NULL DEFAULT NULL,`name` VARCHAR(250)  NULL DEFAULT NULL,`iconpath` VARCHAR(300)  NULL DEFAULT NULL,`description` TEXT  NULL ,`linkto` TEXT  NULL ,`sequence` INT  NULL DEFAULT NULL,`active` INT  NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_settings_field` FOREIGN KEY (`blockid`) REFERENCES vtiger_settings_blocks (`blockid`));

CREATE TABLE `vtiger_settings_field_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_sharedcalendar` (`userid` INT  NOT NULL DEFAULT 0,`sharedid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,sharedid));

CREATE TABLE `vtiger_shippingtaxinfo` (`taxid` INT PRIMARY KEY NOT NULL DEFAULT 0,`taxname` VARCHAR(50)  NULL DEFAULT NULL,`taxlabel` VARCHAR(50)  NULL DEFAULT NULL,`percentage` FLOAT(7,3)  NULL DEFAULT NULL,`deleted` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_shippingtaxinfo_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_smsnotifier` (`smsnotifierid` INT  NULL DEFAULT NULL,`message` TEXT  NULL ,`status` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_smsnotifier_servers` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`password` VARCHAR(255)  NULL DEFAULT NULL,`isactive` INT  NULL DEFAULT NULL,`providertype` VARCHAR(50)  NULL DEFAULT NULL,`username` VARCHAR(255)  NULL DEFAULT NULL,`parameters` TEXT  NULL );

CREATE TABLE `vtiger_smsnotifier_status` (`smsnotifierid` INT  NULL DEFAULT NULL,`tonumber` VARCHAR(20)  NULL DEFAULT NULL,`status` VARCHAR(10)  NULL DEFAULT NULL,`smsmessageid` VARCHAR(50)  NULL DEFAULT NULL,`needlookup` INT  NULL DEFAULT 1,`statusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`statusmessage` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_smsnotifiercf` (`smsnotifierid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_soapservice` (`id` INT  NULL DEFAULT NULL,`type` VARCHAR(25)  NULL DEFAULT NULL,`sessionid` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_sobillads` (`sobilladdressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`bill_city` VARCHAR(30)  NULL DEFAULT NULL,`bill_code` VARCHAR(30)  NULL DEFAULT NULL,`bill_country` VARCHAR(30)  NULL DEFAULT NULL,`bill_state` VARCHAR(30)  NULL DEFAULT NULL,`bill_street` VARCHAR(250)  NULL DEFAULT NULL,`bill_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_sobillads` FOREIGN KEY (`sobilladdressid`) REFERENCES vtiger_salesorder (`salesorderid`));

CREATE TABLE `vtiger_soshipads` (`soshipaddressid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ship_city` VARCHAR(30)  NULL DEFAULT NULL,`ship_code` VARCHAR(30)  NULL DEFAULT NULL,`ship_country` VARCHAR(30)  NULL DEFAULT NULL,`ship_state` VARCHAR(30)  NULL DEFAULT NULL,`ship_street` VARCHAR(250)  NULL DEFAULT NULL,`ship_pobox` VARCHAR(30)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_soshipads` FOREIGN KEY (`soshipaddressid`) REFERENCES vtiger_salesorder (`salesorderid`));

CREATE TABLE `vtiger_sostatus` (`sostatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`sostatus` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_sostatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_sostatushistory` (`historyid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`salesorderid` INT  NOT NULL DEFAULT 0,`accountname` VARCHAR(100)  NULL DEFAULT NULL,`total` FLOAT(10,0)  NULL DEFAULT NULL,`sostatus` VARCHAR(200)  NULL DEFAULT NULL,`lastmodified` DATETIME  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_sostatushistory` FOREIGN KEY (`salesorderid`) REFERENCES vtiger_salesorder (`salesorderid`));

CREATE TABLE `vtiger_status` (`statusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`status` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_status_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_stockadjust` (`stockadjusttid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`warehouse_store_id` INT  NULL DEFAULT NULL,`productid` INT  NOT NULL DEFAULT 0,`product_name` VARCHAR(200)  NOT NULL ,`stocktotal` INT  NOT NULL DEFAULT 0,`adjustqty` INT  NOT NULL DEFAULT 0,`debitdate` DATE  NULL DEFAULT NULL,`adj_comments` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_stockadjustcf` (`stockadjustid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_stockadjustgrouprel` (`stockadjustid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_systems` (`id` INT PRIMARY KEY NOT NULL DEFAULT 0,`server` VARCHAR(100)  NULL DEFAULT NULL,`server_port` INT  NULL DEFAULT NULL,`server_username` VARCHAR(100)  NULL DEFAULT NULL,`server_password` VARCHAR(100)  NULL DEFAULT NULL,`server_type` VARCHAR(20)  NULL DEFAULT NULL,`smtp_auth` VARCHAR(5)  NULL DEFAULT NULL,`server_path` VARCHAR(256)  NULL DEFAULT NULL,`from_email_field` VARCHAR(50)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_systems_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_tab` (`tabid` INT PRIMARY KEY NOT NULL DEFAULT 0,`name` VARCHAR(25)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`tabsequence` INT  NULL DEFAULT NULL,`tablabel` VARCHAR(25)  NOT NULL ,`modifiedby` INT  NULL DEFAULT NULL,`modifiedtime` INT  NULL DEFAULT NULL,`customized` INT  NULL DEFAULT NULL,`ownedby` INT  NULL DEFAULT NULL,`isentitytype` INT  NOT NULL DEFAULT 1,`version` VARCHAR(10)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_tab_info` (`tabid` INT  NULL DEFAULT NULL,`prefname` VARCHAR(256)  NULL DEFAULT NULL,`prefvalue` VARCHAR(256)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_tab_info` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_taskpriority` (`taskpriorityid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`taskpriority` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_taskpriority_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_taskstatus` (`taskstatusid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`taskstatus` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_taskstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_taxclass` (`taxclassid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`taxclass` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_taxclass_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_templatecode` (`templatecodeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`templatecode` VARCHAR(100)  NULL DEFAULT NULL,`subject` VARCHAR(100)  NULL DEFAULT NULL,`body` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_ticketcategories` (`ticketcategories_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`ticketcategories` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 0,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketcategories_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketcf` (`ticketid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_ticketcf` FOREIGN KEY (`ticketid`) REFERENCES vtiger_troubletickets (`ticketid`));

CREATE TABLE `vtiger_ticketcomments` (`commentid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`ticketid` INT  NULL DEFAULT NULL,`comments` TEXT  NULL ,`ownerid` INT  NOT NULL DEFAULT 0,`ownertype` VARCHAR(10)  NULL DEFAULT NULL,`createdtime` DATETIME  NOT NULL ,CONSTRAINT `fk_1_vtiger_ticketcomments` FOREIGN KEY (`ticketid`) REFERENCES vtiger_troubletickets (`ticketid`));

CREATE TABLE `vtiger_ticketpriorities` (`ticketpriorities_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`ticketpriorities` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 0,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketpriorities_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketseverities` (`ticketseverities_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`ticketseverities` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 0,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketseverities_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketstatus` (`ticketstatus_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`ticketstatus` VARCHAR(200)  NULL DEFAULT NULL,`presence` INT  NOT NULL DEFAULT 0,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketstatus_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ticketstracktime` (`ticket_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`supporter_id` INT  NOT NULL DEFAULT 0,`minutes` INT  NULL DEFAULT 0,`date_logged` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_tmp_read_group_rel_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`relatedtabid` INT  NOT NULL DEFAULT 0,`sharedgroupid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,relatedtabid,sharedgroupid),CONSTRAINT `fk_4_vtiger_tmp_read_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_read_group_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`sharedgroupid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,sharedgroupid),CONSTRAINT `fk_3_vtiger_tmp_read_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_read_user_rel_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`relatedtabid` INT  NOT NULL DEFAULT 0,`shareduserid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,relatedtabid,shareduserid),CONSTRAINT `fk_4_vtiger_tmp_read_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_read_user_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`shareduserid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,shareduserid),CONSTRAINT `fk_3_vtiger_tmp_read_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_write_group_rel_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`relatedtabid` INT  NOT NULL DEFAULT 0,`sharedgroupid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,relatedtabid,sharedgroupid),CONSTRAINT `fk_4_vtiger_tmp_write_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_write_group_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`sharedgroupid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,sharedgroupid),CONSTRAINT `fk_3_vtiger_tmp_write_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_write_user_rel_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`relatedtabid` INT  NOT NULL DEFAULT 0,`shareduserid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,relatedtabid,shareduserid),CONSTRAINT `fk_4_vtiger_tmp_write_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tmp_write_user_sharing_per` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`shareduserid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid,shareduserid),CONSTRAINT `fk_3_vtiger_tmp_write_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_tracker` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`user_id` VARCHAR(36)  NULL DEFAULT NULL,`module_name` VARCHAR(25)  NULL DEFAULT NULL,`item_id` VARCHAR(36)  NULL DEFAULT NULL,`item_summary` VARCHAR(255)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_tracking_unit` (`tracking_unitid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`tracking_unit` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_tracking_unit_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_troubletickets` (`ticketid` INT PRIMARY KEY NOT NULL DEFAULT 0,`ticket_no` VARCHAR(100)  NOT NULL ,`groupname` VARCHAR(100)  NULL DEFAULT NULL,`parent_id` VARCHAR(100)  NULL DEFAULT NULL,`product_id` VARCHAR(100)  NULL DEFAULT NULL,`priority` VARCHAR(200)  NULL DEFAULT NULL,`severity` VARCHAR(200)  NULL DEFAULT NULL,`status` VARCHAR(200)  NULL DEFAULT NULL,`category` VARCHAR(200)  NULL DEFAULT NULL,`title` VARCHAR(255)  NOT NULL ,`solution` TEXT  NULL ,`update_log` TEXT  NULL ,`version_id` INT  NULL DEFAULT NULL,`hours` VARCHAR(200)  NULL DEFAULT NULL,`days` VARCHAR(200)  NULL DEFAULT NULL,CONSTRAINT `fk_1_vtiger_troubletickets` FOREIGN KEY (`ticketid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_usageunit` (`usageunitid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`usageunit` VARCHAR(200)  NOT NULL ,`presence` INT  NOT NULL DEFAULT 1,`picklist_valueid` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_usageunit_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_user2mergefields` (`userid` INT  NULL DEFAULT NULL,`tabid` INT  NULL DEFAULT NULL,`fieldid` INT  NULL DEFAULT NULL,`visible` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_user2role` (`userid` INT PRIMARY KEY NOT NULL DEFAULT 0,`roleid` VARCHAR(255)  NOT NULL ,CONSTRAINT `fk_2_vtiger_user2role` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_user_module_preferences` (`userid` INT  NOT NULL DEFAULT 0,`tabid` INT  NOT NULL DEFAULT 0,`default_cvid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,tabid),CONSTRAINT `fk_2_vtiger_user_module_preferences` FOREIGN KEY (`tabid`) REFERENCES vtiger_tab (`tabid`));

CREATE TABLE `vtiger_users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`user_name` VARCHAR(255)  NULL DEFAULT NULL,`user_password` VARCHAR(128)  NULL DEFAULT NULL,`user_hash` VARCHAR(32)  NULL DEFAULT NULL,`cal_color` VARCHAR(25)  NULL DEFAULT '#E6FAD8',`first_name` VARCHAR(30)  NULL DEFAULT NULL,`last_name` VARCHAR(30)  NULL DEFAULT NULL,`reports_to_id` VARCHAR(36)  NULL DEFAULT NULL,`is_admin` VARCHAR(3)  NULL DEFAULT '0',`currency_id` INT  NOT NULL DEFAULT 1,`description` TEXT  NULL ,`date_entered` TIMESTAMP  NOT NULL ,`date_modified` TIMESTAMP  NOT NULL ,`modified_user_id` VARCHAR(36)  NULL DEFAULT NULL,`title` VARCHAR(50)  NULL DEFAULT NULL,`department` VARCHAR(50)  NULL DEFAULT NULL,`phone_home` VARCHAR(50)  NULL DEFAULT NULL,`phone_mobile` VARCHAR(50)  NULL DEFAULT NULL,`phone_work` VARCHAR(50)  NULL DEFAULT NULL,`phone_other` VARCHAR(50)  NULL DEFAULT NULL,`phone_fax` VARCHAR(50)  NULL DEFAULT NULL,`email1` VARCHAR(100)  NULL DEFAULT NULL,`email2` VARCHAR(100)  NULL DEFAULT NULL,`yahoo_id` VARCHAR(100)  NULL DEFAULT NULL,`status` VARCHAR(25)  NULL DEFAULT NULL,`signature` VARCHAR(250)  NULL DEFAULT NULL,`address_street` VARCHAR(150)  NULL DEFAULT NULL,`address_city` VARCHAR(100)  NULL DEFAULT NULL,`address_state` VARCHAR(100)  NULL DEFAULT NULL,`address_country` VARCHAR(25)  NULL DEFAULT NULL,`address_postalcode` VARCHAR(9)  NULL DEFAULT NULL,`user_preferences` TEXT  NULL ,`tz` VARCHAR(30)  NULL DEFAULT NULL,`holidays` VARCHAR(60)  NULL DEFAULT NULL,`namedays` VARCHAR(60)  NULL DEFAULT NULL,`workdays` VARCHAR(30)  NULL DEFAULT NULL,`weekstart` INT  NULL DEFAULT NULL,`date_format` VARCHAR(200)  NULL DEFAULT NULL,`hour_format` VARCHAR(30)  NULL DEFAULT 'am/pm',`start_hour` VARCHAR(30)  NULL DEFAULT '10:00',`end_hour` VARCHAR(30)  NULL DEFAULT '23:00',`activity_view` VARCHAR(200)  NULL DEFAULT 'Today',`lead_view` VARCHAR(200)  NULL DEFAULT 'Today',`imagename` VARCHAR(250)  NULL DEFAULT NULL,`deleted` INT  NOT NULL DEFAULT 0,`confirm_password` VARCHAR(30)  NULL DEFAULT NULL,`internal_mailer` VARCHAR(3)  NOT NULL DEFAULT '1',`reminder_interval` VARCHAR(100)  NULL DEFAULT NULL,`reminder_next_time` VARCHAR(100)  NULL DEFAULT NULL,`crypt_type` VARCHAR(20)  NOT NULL DEFAULT 'MD5',`accesskey` VARCHAR(36)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_users2group` (`groupid` INT  NOT NULL DEFAULT 0,`userid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (groupid,userid),CONSTRAINT `fk_2_vtiger_users2group` FOREIGN KEY (`userid`) REFERENCES vtiger_users (`id`));

CREATE TABLE `vtiger_users_last_import` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`assigned_user_id` VARCHAR(36)  NULL DEFAULT NULL,`bean_type` VARCHAR(36)  NULL DEFAULT NULL,`bean_id` VARCHAR(36)  NULL DEFAULT NULL,`deleted` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_users_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_usertype` (`usertypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`usertype` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_vendor` (`vendorid` INT PRIMARY KEY NOT NULL DEFAULT 0,`vendor_no` VARCHAR(100)  NOT NULL ,`vendorname` VARCHAR(100)  NULL DEFAULT NULL,`phone` VARCHAR(100)  NULL DEFAULT NULL,`email` VARCHAR(100)  NULL DEFAULT NULL,`website` VARCHAR(100)  NULL DEFAULT NULL,`glacct` VARCHAR(200)  NULL DEFAULT NULL,`category` VARCHAR(50)  NULL DEFAULT NULL,`street` TEXT  NULL ,`city` VARCHAR(30)  NULL DEFAULT NULL,`state` VARCHAR(30)  NULL DEFAULT NULL,`pobox` VARCHAR(30)  NULL DEFAULT NULL,`postalcode` VARCHAR(100)  NULL DEFAULT NULL,`country` VARCHAR(100)  NULL DEFAULT NULL,`description` TEXT  NULL ,CONSTRAINT `fk_1_vtiger_vendor` FOREIGN KEY (`vendorid`) REFERENCES vtiger_crmentity (`crmid`));

CREATE TABLE `vtiger_vendorcf` (`vendorid` INT PRIMARY KEY NOT NULL DEFAULT 0,CONSTRAINT `fk_1_vtiger_vendorcf` FOREIGN KEY (`vendorid`) REFERENCES vtiger_vendor (`vendorid`));

CREATE TABLE `vtiger_vendorcontactrel` (`vendorid` INT  NOT NULL DEFAULT 0,`contactid` INT  NOT NULL DEFAULT 0,PRIMARY KEY (vendorid,contactid),CONSTRAINT `fk_2_vtiger_vendorcontactrel` FOREIGN KEY (`vendorid`) REFERENCES vtiger_vendor (`vendorid`));

CREATE TABLE `vtiger_version` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`old_version` VARCHAR(30)  NULL DEFAULT NULL,`current_version` VARCHAR(30)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_version_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_visibility` (`visibilityid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`visibility` VARCHAR(200)  NOT NULL ,`sortorderid` INT  NOT NULL DEFAULT 0,`presence` INT  NOT NULL DEFAULT 1);

CREATE TABLE `vtiger_visibility_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_warehouse` (`warehouseid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`warehouse_name` VARCHAR(100)  NULL DEFAULT NULL,`address1` VARCHAR(100)  NULL DEFAULT NULL,`address2` VARCHAR(100)  NULL DEFAULT NULL,`street` VARCHAR(100)  NULL DEFAULT NULL,`city` VARCHAR(100)  NULL DEFAULT NULL,`state` VARCHAR(100)  NULL DEFAULT NULL,`country` VARCHAR(100)  NULL DEFAULT NULL,`contact_person_name` VARCHAR(100)  NULL DEFAULT NULL,`mobile` VARCHAR(100)  NULL DEFAULT NULL,`landline` VARCHAR(100)  NULL DEFAULT NULL,`identifier` VARCHAR(10)  NULL DEFAULT NULL,`linkto` VARCHAR(100)  NULL DEFAULT NULL,`code` VARCHAR(10)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_warehouse_stock` (`warehousestockid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`warehouseid` INT  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`qty` INT  NULL DEFAULT NULL,`reorder` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_warehousecf` (`warehouseid` INT PRIMARY KEY NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_warehousegrouprel` (`warehouseid` INT PRIMARY KEY NOT NULL DEFAULT 0,`groupname` VARCHAR(100)  NULL DEFAULT NULL);

CREATE TABLE `vtiger_warehousestore_inventorytransaction` (`warehousestore_transaction_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`date` DATETIME  NULL DEFAULT NULL,`warehousestore_id` INT  NULL DEFAULT NULL,`barcode` VARCHAR(11)  NULL DEFAULT NULL,`productid` INT  NULL DEFAULT NULL,`product_name` VARCHAR(25)  NULL DEFAULT NULL,`opening_stock_qty` INT  NULL DEFAULT NULL,`opening_cost` FLOAT(12,2)  NULL DEFAULT NULL,`markup_per` FLOAT(12,2)  NULL DEFAULT 0,`markup_amt` FLOAT(12,2)  NULL DEFAULT 0,`poid` INT  NULL DEFAULT NULL,`purchase_qty` INT  NULL DEFAULT NULL,`purchase_cost` FLOAT(12,2)  NULL DEFAULT NULL,`cstwithcform_per` FLOAT(12,2)  NULL DEFAULT 0,`cstwithcform_amt` FLOAT(12,2)  NULL DEFAULT 0,`cstwithoutcform_per` FLOAT(12,2)  NULL DEFAULT 0,`cstwithoutcform_amt` FLOAT(12,2)  NULL DEFAULT 0,`invoice_id` INT  NULL DEFAULT NULL,`invoice_no` VARCHAR(25)  NULL DEFAULT NULL,`sales_qty` INT  NULL DEFAULT NULL,`sales_cost` FLOAT(12,2)  NULL DEFAULT NULL,`purchase_return_qty` INT  NULL DEFAULT NULL,`purchase_return_cost` FLOAT(12,2)  NULL DEFAULT NULL,`salesret_id` INT  NULL DEFAULT NULL,`sales_return_qty` INT  NULL DEFAULT NULL,`sales_return_cost` FLOAT(12,2)  NULL DEFAULT NULL,`adjustment_qty` INT  NULL DEFAULT NULL,`adjustment_cost` FLOAT(12,2)  NULL DEFAULT NULL,`challan_id` INT  NULL DEFAULT NULL,`challan_no` VARCHAR(25)  NULL DEFAULT NULL,`challan_qty_sent` INT  NOT NULL DEFAULT 0,`challan_qty_receive` INT  NOT NULL DEFAULT 0,`closing_stock` INT  NULL DEFAULT NULL,`final_stock` INT  NULL DEFAULT 0,`unitprice` FLOAT(12,2)  NULL DEFAULT 0,`vat` FLOAT(12,2)  NULL DEFAULT NULL,`vendor_id` INT  NULL DEFAULT NULL);

CREATE TABLE `vtiger_wordtemplates` (`templateid` INT PRIMARY KEY NOT NULL DEFAULT 0,`filename` VARCHAR(100)  NOT NULL ,`module` VARCHAR(30)  NOT NULL ,`date_entered` TIMESTAMP  NOT NULL ,`parent_type` VARCHAR(50)  NOT NULL ,`data` BLOB  NULL ,`description` TEXT  NULL ,`filesize` VARCHAR(50)  NOT NULL ,`filetype` VARCHAR(20)  NOT NULL ,`deleted` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ws_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`name` VARCHAR(25)  NOT NULL ,`handler_path` VARCHAR(255)  NOT NULL ,`handler_class` VARCHAR(64)  NOT NULL ,`ismodule` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ws_entity_fieldtype` (`fieldtypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`table_name` VARCHAR(50)  NOT NULL ,`field_name` VARCHAR(50)  NOT NULL ,`fieldtype` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_ws_entity_fieldtype_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ws_entity_name` (`entity_id` INT PRIMARY KEY NOT NULL DEFAULT 0,`name_fields` VARCHAR(50)  NOT NULL ,`index_field` VARCHAR(50)  NOT NULL ,`table_name` VARCHAR(50)  NOT NULL );

CREATE TABLE `vtiger_ws_entity_referencetype` (`fieldtypeid` INT  NOT NULL DEFAULT 0,`type` VARCHAR(25)  NOT NULL ,PRIMARY KEY (fieldtypeid,type),CONSTRAINT `vtiger_fk_1_actors_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES vtiger_ws_entity_fieldtype (`fieldtypeid`));

CREATE TABLE `vtiger_ws_entity_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ws_entity_tables` (`webservice_entity_id` INT  NOT NULL DEFAULT 0,`table_name` VARCHAR(50)  NOT NULL ,PRIMARY KEY (webservice_entity_id,table_name),CONSTRAINT `fk_1_vtiger_ws_actor_tables` FOREIGN KEY (`webservice_entity_id`) REFERENCES vtiger_ws_entity (`id`));

CREATE TABLE `vtiger_ws_fieldtype` (`fieldtypeid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`uitype` VARCHAR(30)  NOT NULL ,`fieldtype` VARCHAR(200)  NOT NULL );

CREATE TABLE `vtiger_ws_operation` (`operationid` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,`name` VARCHAR(128)  NOT NULL ,`handler_path` VARCHAR(255)  NOT NULL ,`handler_method` VARCHAR(64)  NOT NULL ,`type` VARCHAR(8)  NOT NULL ,`prelogin` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ws_operation_parameters` (`operationid` INTEGER  NOT NULL ,`name` VARCHAR(128)  NOT NULL ,`type` VARCHAR(64)  NOT NULL ,`sequence` INT  NOT NULL DEFAULT 0,PRIMARY KEY (operationid,name));

CREATE TABLE `vtiger_ws_operation_seq` (`id` INT  NOT NULL DEFAULT 0);

CREATE TABLE `vtiger_ws_referencetype` (`fieldtypeid` INT  NOT NULL DEFAULT 0,`type` VARCHAR(25)  NOT NULL ,PRIMARY KEY (fieldtypeid,type),CONSTRAINT `fk_1_vtiger_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES vtiger_ws_fieldtype (`fieldtypeid`));

CREATE TABLE `vtiger_ws_userauthtoken` (`userid` INT  NOT NULL DEFAULT 0,`token` VARCHAR(36)  NOT NULL ,`expiretime` INT  NOT NULL DEFAULT 0,PRIMARY KEY (userid,expiretime));

CREATE UNIQUE INDEX 'com_vtiger_workflows_idx' ON 'com_vtiger_workflows' (`workflow_id` DESC);

CREATE UNIQUE INDEX 'com_vtiger_workflowtask_queue_idx' ON 'com_vtiger_workflowtask_queue' (`task_id` DESC,`entity_id` DESC);

CREATE UNIQUE INDEX 'com_vtiger_workflowtasks_idx' ON 'com_vtiger_workflowtasks' (`task_id` DESC);

CREATE UNIQUE INDEX 'com_vtiger_workflowtasks_entitymethod_idx' ON 'com_vtiger_workflowtasks_entitymethod' (`workflowtasks_entitymethod_id` DESC);

CREATE INDEX 'account_account_type_idx' ON 'vtiger_account' (`account_type` DESC);

CREATE UNIQUE INDEX 'accountdepstatus_deploymentstatus_idx' ON 'vtiger_accountdepstatus' (`deploymentstatus` DESC);

CREATE UNIQUE INDEX 'accountownership_ownership_idx' ON 'vtiger_accountownership' (`ownership` DESC);

CREATE UNIQUE INDEX 'accountrating_rating_idx' ON 'vtiger_accountrating' (`rating` DESC);

CREATE UNIQUE INDEX 'accountregion_region_idx' ON 'vtiger_accountregion' (`region` DESC);

CREATE UNIQUE INDEX 'accounttype_accounttype_idx' ON 'vtiger_accounttype' (`accounttype` DESC);

CREATE INDEX 'activity_activityid_subject_idx' ON 'vtiger_activity' (`activityid` DESC,`subject` DESC);

CREATE INDEX 'activity_activitytype_date_start_idx' ON 'vtiger_activity' (`activitytype` DESC,`date_start` DESC);

CREATE INDEX 'activity_date_start_due_date_idx' ON 'vtiger_activity' (`date_start` DESC,`due_date` DESC);

CREATE INDEX 'activity_date_start_time_start_idx' ON 'vtiger_activity' (`date_start` DESC,`time_start` DESC);

CREATE INDEX 'activity_eventstatus_idx' ON 'vtiger_activity' (`eventstatus` DESC);

CREATE INDEX 'activity_status_idx' ON 'vtiger_activity' (`status` DESC);

CREATE INDEX 'activityproductrel_activityid_idx' ON 'vtiger_activityproductrel' (`activityid` DESC);

CREATE INDEX 'activityproductrel_productid_idx' ON 'vtiger_activityproductrel' (`productid` DESC);

CREATE UNIQUE INDEX 'activitytype_activitytype_idx' ON 'vtiger_activitytype' (`activitytype` DESC);

CREATE INDEX 'announcement_creatorid_idx' ON 'vtiger_announcement' (`creatorid` DESC);

CREATE INDEX 'attachments_attachmentsid_idx' ON 'vtiger_attachments' (`attachmentsid` DESC);

CREATE INDEX 'block_tabid_idx' ON 'vtiger_blocks' (`tabid` DESC);

CREATE UNIQUE INDEX 'businesstype_businesstype_idx' ON 'vtiger_businesstype' (`businesstype` DESC);

CREATE INDEX 'campaign_campaignstatus_idx' ON 'vtiger_campaign' (`campaignstatus` DESC);

CREATE INDEX 'campaign_campaignname_idx' ON 'vtiger_campaign' (`campaignname` DESC);

CREATE INDEX 'campaign_campaignid_idx' ON 'vtiger_campaign' (`campaignid` DESC);

CREATE INDEX 'campaigncontrel_contractid_idx' ON 'vtiger_campaigncontrel' (`contactid` DESC);

CREATE INDEX 'campaignleadrel_leadid_campaignid_idx' ON 'vtiger_campaignleadrel' (`leadid` DESC,`campaignid` DESC);

CREATE INDEX 'campaignstatus_campaignstatus_idx' ON 'vtiger_campaignstatus' (`campaignstatus` DESC);

CREATE UNIQUE INDEX 'campaigntype_campaigntype_idx' ON 'vtiger_campaigntype' (`campaigntype` DESC);

CREATE UNIQUE INDEX 'carrier_carrier_idx' ON 'vtiger_carrier' (`carrier` DESC);

CREATE INDEX 'chat_msg_chat_from_idx' ON 'vtiger_chat_msg' (`chat_from` DESC);

CREATE INDEX 'chat_msg_chat_to_idx' ON 'vtiger_chat_msg' (`chat_to` DESC);

CREATE INDEX 'chat_msg_born_idx' ON 'vtiger_chat_msg' (`born` DESC);

CREATE UNIQUE INDEX 'chat_pchat_msg_idx' ON 'vtiger_chat_pchat' (`msg` DESC);

CREATE UNIQUE INDEX 'chat_pvchat_msg_idx' ON 'vtiger_chat_pvchat' (`msg` DESC);

CREATE INDEX 'chat_users_nick_idx' ON 'vtiger_chat_users' (`nick` DESC);

CREATE INDEX 'chat_users_session_idx' ON 'vtiger_chat_users' (`session` DESC);

CREATE INDEX 'chat_users_ping_idx' ON 'vtiger_chat_users' (`ping` DESC);

CREATE INDEX 'cntactivityrel_contactid_idx' ON 'vtiger_cntactivityrel' (`contactid` DESC);

CREATE INDEX 'cntactivityrel_activityid_idx' ON 'vtiger_cntactivityrel' (`activityid` DESC);

CREATE INDEX 'contactdetails_accountid_idx' ON 'vtiger_contactdetails' (`accountid` DESC);

CREATE UNIQUE INDEX 'contacttype_contacttype_idx' ON 'vtiger_contacttype' (`contacttype` DESC);

CREATE INDEX 'contpotentialrel_potentialid_idx' ON 'vtiger_contpotentialrel' (`potentialid` DESC);

CREATE INDEX 'contpotentialrel_contactid_idx' ON 'vtiger_contpotentialrel' (`contactid` DESC);

CREATE INDEX 'crmentity_smcreatorid_idx' ON 'vtiger_crmentity' (`smcreatorid` DESC);

CREATE INDEX 'crmentity_modifiedby_idx' ON 'vtiger_crmentity' (`modifiedby` DESC);

CREATE INDEX 'crmentity_deleted_idx' ON 'vtiger_crmentity' (`deleted` DESC);

CREATE INDEX 'crm_ownerid_del_setype_idx' ON 'vtiger_crmentity' (`smownerid` DESC,`deleted` DESC,`setype` DESC);

CREATE INDEX 'crmentitynotesrel_notesid_idx' ON 'vtiger_crmentitynotesrel' (`notesid` DESC);

CREATE INDEX 'crmentitynotesrel_crmid_idx' ON 'vtiger_crmentitynotesrel' (`crmid` DESC);

CREATE UNIQUE INDEX 'currency_currency_idx' ON 'vtiger_currency' (`currency` DESC);

CREATE INDEX 'customaction_cvid_idx' ON 'vtiger_customaction' (`cvid` DESC);

CREATE INDEX 'customview_entitytype_idx' ON 'vtiger_customview' (`entitytype` DESC);

CREATE INDEX 'cvadvfilter_cvid_idx' ON 'vtiger_cvadvfilter' (`cvid` DESC);

CREATE INDEX 'cvcolumnlist_columnindex_idx' ON 'vtiger_cvcolumnlist' (`columnindex` DESC);

CREATE INDEX 'cvcolumnlist_cvid_idx' ON 'vtiger_cvcolumnlist' (`cvid` DESC);

CREATE INDEX 'cvstdfilter_cvid_idx' ON 'vtiger_cvstdfilter' (`cvid` DESC);

CREATE INDEX 'datashare_grp2grp_share_groupid_idx' ON 'vtiger_datashare_grp2grp' (`share_groupid` DESC);

CREATE INDEX 'datashare_grp2grp_to_groupid_idx' ON 'vtiger_datashare_grp2grp' (`to_groupid` DESC);

CREATE INDEX 'idx_datashare_grp2role_share_groupid' ON 'vtiger_datashare_grp2role' (`share_groupid` DESC);

CREATE INDEX 'idx_datashare_grp2role_to_roleid' ON 'vtiger_datashare_grp2role' (`to_roleid` DESC);

CREATE INDEX 'datashare_grp2rs_share_groupid_idx' ON 'vtiger_datashare_grp2rs' (`share_groupid` DESC);

CREATE INDEX 'datashare_grp2rs_to_roleandsubid_idx' ON 'vtiger_datashare_grp2rs' (`to_roleandsubid` DESC);

CREATE INDEX 'idx_datashare_module_rel_tabid' ON 'vtiger_datashare_module_rel' (`tabid` DESC);

CREATE INDEX 'datashare_relatedmodule_permission_shareid_permissions_idx' ON 'vtiger_datashare_relatedmodule_permission' (`shareid` DESC,`permission` DESC);

CREATE INDEX 'datashare_relatedmodules_tabid_idx' ON 'vtiger_datashare_relatedmodules' (`tabid` DESC);

CREATE INDEX 'datashare_relatedmodules_relatedto_tabid_idx' ON 'vtiger_datashare_relatedmodules' (`relatedto_tabid` DESC);

CREATE INDEX 'idx_datashare_role2group_share_roleid' ON 'vtiger_datashare_role2group' (`share_roleid` DESC);

CREATE INDEX 'idx_datashare_role2group_to_groupid' ON 'vtiger_datashare_role2group' (`to_groupid` DESC);

CREATE INDEX 'datashare_role2role_share_roleid_idx' ON 'vtiger_datashare_role2role' (`share_roleid` DESC);

CREATE INDEX 'datashare_role2role_to_roleid_idx' ON 'vtiger_datashare_role2role' (`to_roleid` DESC);

CREATE INDEX 'datashare_role2s_share_roleid_idx' ON 'vtiger_datashare_role2rs' (`share_roleid` DESC);

CREATE INDEX 'datashare_role2s_to_roleandsubid_idx' ON 'vtiger_datashare_role2rs' (`to_roleandsubid` DESC);

CREATE INDEX 'datashare_rs2grp_share_roleandsubid_idx' ON 'vtiger_datashare_rs2grp' (`share_roleandsubid` DESC);

CREATE INDEX 'datashare_rs2grp_to_groupid_idx' ON 'vtiger_datashare_rs2grp' (`to_groupid` DESC);

CREATE INDEX 'datashare_rs2role_share_roleandsubid_idx' ON 'vtiger_datashare_rs2role' (`share_roleandsubid` DESC);

CREATE INDEX 'datashare_rs2role_to_roleid_idx' ON 'vtiger_datashare_rs2role' (`to_roleid` DESC);

CREATE INDEX 'datashare_rs2rs_share_roleandsubid_idx' ON 'vtiger_datashare_rs2rs' (`share_roleandsubid` DESC);

CREATE INDEX 'idx_datashare_rs2rs_to_roleandsubid_idx' ON 'vtiger_datashare_rs2rs' (`to_roleandsubid` DESC);

CREATE UNIQUE INDEX 'dealintimation_dealname_idx' ON 'vtiger_dealintimation' (`dealname` DESC);

CREATE INDEX 'def_org_field_tabid_fieldid_idx' ON 'vtiger_def_org_field' (`tabid` DESC,`fieldid` DESC);

CREATE INDEX 'def_org_field_tabid_idx' ON 'vtiger_def_org_field' (`tabid` DESC);

CREATE INDEX 'def_org_field_visible_fieldid_idx' ON 'vtiger_def_org_field' (`visible` DESC,`fieldid` DESC);

CREATE INDEX 'fk_1_vtiger_def_org_share' ON 'vtiger_def_org_share' (`permission` DESC);

CREATE INDEX 'dcid' ON 'vtiger_deliverychallan' (`dcid` DESC);

CREATE UNIQUE INDEX 'tid' ON 'vtiger_deliverychallan_transaction' (`tid` DESC);

CREATE INDEX 'tid_2' ON 'vtiger_deliverychallan_transaction' (`tid` DESC);

CREATE UNIQUE INDEX 'downloadpurpose_purpose_idx' ON 'vtiger_downloadpurpose' (`purpose` DESC);

CREATE UNIQUE INDEX 'link_tabidtype_idx' ON 'vtiger_email_track' (`crmid` DESC,`mailid` DESC);

CREATE INDEX 'emailtemplates_foldernamd_templatename_subject_idx' ON 'vtiger_emailtemplates' (`foldername` DESC,`templatename` DESC,`subject` DESC);

CREATE INDEX 'entityname_tabid_idx' ON 'vtiger_entityname' (`tabid` DESC);

CREATE UNIQUE INDEX 'evaluationstatus_status_idx' ON 'vtiger_evaluationstatus' (`status` DESC);

CREATE UNIQUE INDEX 'eventhandler_idx' ON 'vtiger_eventhandlers' (`eventhandler_id` DESC);

CREATE UNIQUE INDEX 'CampaignExpRes_UK01' ON 'vtiger_expectedresponse' (`expectedresponse` DESC);

CREATE INDEX 'faq_id_idx' ON 'vtiger_faq' (`id` DESC);

CREATE INDEX 'faqcomments_faqid_idx' ON 'vtiger_faqcomments' (`faqid` DESC);

CREATE INDEX 'field_tabid_idx' ON 'vtiger_field' (`tabid` DESC);

CREATE INDEX 'field_fieldname_idx' ON 'vtiger_field' (`fieldname` DESC);

CREATE INDEX 'field_block_idx' ON 'vtiger_field' (`block` DESC);

CREATE INDEX 'field_displaytype_idx' ON 'vtiger_field' (`displaytype` DESC);

CREATE INDEX 'files_assigned_user_id_name_deleted_idx' ON 'vtiger_files' (`assigned_user_id` DESC,`name` DESC,`deleted` DESC);

CREATE INDEX 'freetagged_objects_tag_id_tagger_id_object_id_idx' ON 'vtiger_freetagged_objects' (`tag_id` DESC,`tagger_id` DESC,`object_id` DESC);

CREATE UNIQUE INDEX 'glacct_glacct_idx' ON 'vtiger_glacct' (`glacct` DESC);

CREATE INDEX 'fk_2_vtiger_group2role' ON 'vtiger_group2role' (`roleid` DESC);

CREATE INDEX 'fk_2_vtiger_group2rs' ON 'vtiger_group2rs' (`roleandsubid` DESC);

CREATE UNIQUE INDEX 'groups_groupname_idx' ON 'vtiger_groups' (`groupname` DESC);

CREATE INDEX 'stuff_stuffid_idx' ON 'vtiger_homestuff' (`stuffid` DESC);

CREATE INDEX 'fk_1_vtiger_homestuff' ON 'vtiger_homestuff' (`userid` DESC);

CREATE INDEX 'import_maps_assigned_user_id_module_name_deleted_idx' ON 'vtiger_import_maps' (`assigned_user_id` DESC,`module` DESC,`name` DESC,`deleted` DESC);

CREATE UNIQUE INDEX 'industry_industry_idx' ON 'vtiger_industry' (`industry` DESC);

CREATE INDEX 'inventoryproductrel_id_idx' ON 'vtiger_inventoryproductrel' (`id` DESC);

CREATE INDEX 'inventoryproductrel_productid_idx' ON 'vtiger_inventoryproductrel' (`productid` DESC);

CREATE INDEX 'inventoryishippingrel_id_idx' ON 'vtiger_inventoryshippingrel' (`id` DESC);

CREATE INDEX 'inventorytaxinfo_taxname_idx' ON 'vtiger_inventorytaxinfo' (`taxname` DESC);

CREATE INDEX 'invoice_purchaseorderid_idx' ON 'vtiger_invoice' (`invoiceid` DESC);

CREATE INDEX 'fk_2_vtiger_invoice' ON 'vtiger_invoice' (`salesorderid` DESC);

CREATE UNIQUE INDEX 'invoicestatus_invoiestatus_idx' ON 'vtiger_invoicestatus' (`invoicestatus` DESC);

CREATE INDEX 'invoicestatushistory_invoiceid_idx' ON 'vtiger_invoicestatushistory' (`invoiceid` DESC);

CREATE UNIQUE INDEX 'lar_name_idx' ON 'vtiger_lar' (`name` DESC);

CREATE INDEX 'lar_createdby_idx' ON 'vtiger_lar' (`createdby` DESC);

CREATE INDEX 'leadacctrel_accountid_idx' ON 'vtiger_leadacctrel' (`accountid` DESC);

CREATE INDEX 'leadcontrel_contactid_idx' ON 'vtiger_leadcontrel' (`contactid` DESC);

CREATE INDEX 'leaddetails_converted_leadstatus_idx' ON 'vtiger_leaddetails' (`converted` DESC,`leadstatus` DESC);

CREATE UNIQUE INDEX 'leadpotrel_leadid_idx' ON 'vtiger_leadpotrel' (`leadid` DESC);

CREATE UNIQUE INDEX 'leadstage_stage_idx' ON 'vtiger_leadstage' (`stage` DESC);

CREATE UNIQUE INDEX 'manufacturer_manufacturer_idx' ON 'vtiger_manufacturer' (`manufacturer` DESC);

CREATE UNIQUE INDEX 'num_idx' ON 'vtiger_modentity_num' (`num_id` DESC);

CREATE INDEX 'semodule_active_idx' ON 'vtiger_modentity_num' (`semodule` DESC,`active` DESC);

CREATE INDEX 'moduleowners_tabid_user_id_idx' ON 'vtiger_moduleowners' (`tabid` DESC,`user_id` DESC);

CREATE INDEX 'notes_title_idx' ON 'vtiger_notes' (`title` DESC);

CREATE INDEX 'notes_notesid_idx' ON 'vtiger_notes' (`notesid` DESC);

CREATE UNIQUE INDEX 'notificationscheduler_schedulednotificationname_idx' ON 'vtiger_notificationscheduler' (`schedulednotificationname` DESC);

CREATE UNIQUE INDEX 'opportunity_type_opportunity_type_idx' ON 'vtiger_opportunity_type' (`opportunity_type` DESC);

CREATE UNIQUE INDEX 'opportunitystage_stage_idx' ON 'vtiger_opportunitystage' (`stage` DESC);

CREATE INDEX 'fk_2_vtiger_org_share_action2tab' ON 'vtiger_org_share_action2tab' (`tabid` DESC);

CREATE INDEX 'ownernotify_crmid_flag_idx' ON 'vtiger_ownernotify' (`crmid` DESC,`flag` DESC);

CREATE INDEX 'parenttab_parenttabid_parenttabl_label_visible_idx' ON 'vtiger_parenttab' (`parenttabid` DESC,`parenttab_label` DESC,`visible` DESC);

CREATE INDEX 'parenttabrel_tabid_parenttabid_idx' ON 'vtiger_parenttabrel' (`tabid` DESC,`parenttabid` DESC);

CREATE INDEX 'fk_2_vtiger_parenttabrel' ON 'vtiger_parenttabrel' (`parenttabid` DESC);

CREATE UNIQUE INDEX 'picklist_name_idx' ON 'vtiger_picklist' (`name` DESC);

CREATE INDEX 'portal_portalname_idx' ON 'vtiger_portal' (`portalname` DESC);

CREATE UNIQUE INDEX 'postatus_postatus_idx' ON 'vtiger_postatus' (`postatus` DESC);

CREATE INDEX 'postatushistory_purchaseorderid_idx' ON 'vtiger_postatushistory' (`purchaseorderid` DESC);

CREATE INDEX 'potcompetitorrel_potentialid_idx' ON 'vtiger_potcompetitorrel' (`potentialid` DESC);

CREATE INDEX 'potcompetitorrel_competitorid_idx' ON 'vtiger_potcompetitorrel' (`competitorid` DESC);

CREATE INDEX 'potential_relatedto_idx' ON 'vtiger_potential' (`related_to` DESC);

CREATE INDEX 'potentail_sales_stage_idx' ON 'vtiger_potential' (`sales_stage` DESC);

CREATE INDEX 'potentail_sales_stage_amount_idx' ON 'vtiger_potential' (`amount` DESC,`sales_stage` DESC);

CREATE INDEX 'potstagehistory_potentialid_idx' ON 'vtiger_potstagehistory' (`potentialid` DESC);

CREATE INDEX 'pricebookproductrel_pricebookid_idx' ON 'vtiger_pricebookproductrel' (`pricebookid` DESC);

CREATE INDEX 'pricebookproductrel_productid_idx' ON 'vtiger_pricebookproductrel' (`productid` DESC);

CREATE UNIQUE INDEX 'priority_priority_idx' ON 'vtiger_priority' (`priority` DESC);

CREATE UNIQUE INDEX 'productcategory_productcategory_idx' ON 'vtiger_productcategory' (`productcategory` DESC);

CREATE INDEX 'productcollaterals_productid_filename_idx' ON 'vtiger_productcollaterals' (`productid` DESC,`filename` DESC);

CREATE UNIQUE INDEX 'barcode' ON 'vtiger_products' (`barcode` DESC);

CREATE INDEX 'producttaxrel_productid_idx' ON 'vtiger_producttaxrel' (`productid` DESC);

CREATE INDEX 'producttaxrel_taxid_idx' ON 'vtiger_producttaxrel' (`taxid` DESC);

CREATE INDEX 'profile2field_profileid_tabid_fieldname_idx' ON 'vtiger_profile2field' (`profileid` DESC,`tabid` DESC);

CREATE INDEX 'profile2field_tabid_profileid_idx' ON 'vtiger_profile2field' (`tabid` DESC,`profileid` DESC);

CREATE INDEX 'profile2field_visible_profileid_idx' ON 'vtiger_profile2field' (`visible` DESC,`profileid` DESC);

CREATE INDEX 'idx_profile2globalpermissions' ON 'vtiger_profile2globalpermissions' (`profileid` DESC,`globalactionid` DESC);

CREATE INDEX 'profile2standardpermissions_profileid_tabid_operation_idx' ON 'vtiger_profile2standardpermissions' (`profileid` DESC,`tabid` DESC,`operation` DESC);

CREATE INDEX 'profile2tab_profileid_tabid_idx' ON 'vtiger_profile2tab' (`profileid` DESC,`tabid` DESC);

CREATE INDEX 'profile2utility_profileid_tabid_activityid_idx' ON 'vtiger_profile2utility' (`profileid` DESC,`tabid` DESC,`activityid` DESC);

CREATE INDEX 'purchaseorder_vendorid_idx' ON 'vtiger_purchaseorder' (`vendorid` DESC);

CREATE INDEX 'purchaseorder_quoteid_idx' ON 'vtiger_purchaseorder' (`quoteid` DESC);

CREATE INDEX 'purchaseorder_contactid_idx' ON 'vtiger_purchaseorder' (`contactid` DESC);

CREATE INDEX 'fk_1_vtiger_quickview' ON 'vtiger_quickview' (`fieldid` DESC);

CREATE INDEX 'quote_quotestage_idx' ON 'vtiger_quotes' (`quotestage` DESC);

CREATE INDEX 'quotes_potentialid_idx' ON 'vtiger_quotes' (`potentialid` DESC);

CREATE INDEX 'quotes_contactid_idx' ON 'vtiger_quotes' (`contactid` DESC);

CREATE UNIQUE INDEX 'quotestage_quotestage_idx' ON 'vtiger_quotestage' (`quotestage` DESC);

CREATE INDEX 'quotestagehistory_quoteid_idx' ON 'vtiger_quotestagehistory' (`quoteid` DESC);

CREATE INDEX 'fk_1_vtiger_recurringevents' ON 'vtiger_recurringevents' (`activityid` DESC);

CREATE UNIQUE INDEX 'recurringtype_status_idx' ON 'vtiger_recurringtype' (`recurringtype` DESC);

CREATE INDEX 'relatedlists_relation_id_idx' ON 'vtiger_relatedlists' (`relation_id` DESC);

CREATE INDEX 'relcriteria_queryid_idx' ON 'vtiger_relcriteria' (`queryid` DESC);

CREATE INDEX 'report_queryid_idx' ON 'vtiger_report' (`queryid` DESC);

CREATE INDEX 'report_folderid_idx' ON 'vtiger_report' (`folderid` DESC);

CREATE INDEX 'reportdatefilter_datefilterid_idx' ON 'vtiger_reportdatefilter' (`datefilterid` DESC);

CREATE INDEX 'id' ON 'vtiger_reports' (`id` DESC);

CREATE INDEX 'fk_1_vtiger_reportsortcol' ON 'vtiger_reportsortcol' (`reportid` DESC);

CREATE INDEX 'reportsummary_reportsummaryid_idx' ON 'vtiger_reportsummary' (`reportsummaryid` DESC);

CREATE UNIQUE INDEX 'revenuetype_revenuetype_idx' ON 'vtiger_revenuetype' (`revenuetype` DESC);

CREATE INDEX 'role2picklist_roleid_picklistid_idx' ON 'vtiger_role2picklist' (`roleid` DESC,`picklistid` DESC,`picklistvalueid` DESC);

CREATE INDEX 'fk_2_vtiger_role2picklist' ON 'vtiger_role2picklist' (`picklistid` DESC);

CREATE INDEX 'role2profile_roleid_profileid_idx' ON 'vtiger_role2profile' (`roleid` DESC,`profileid` DESC);

CREATE INDEX 'salesmanactivityrel_activityid_idx' ON 'vtiger_salesmanactivityrel' (`activityid` DESC);

CREATE INDEX 'salesmanactivityrel_smid_idx' ON 'vtiger_salesmanactivityrel' (`smid` DESC);

CREATE INDEX 'salesmanattachmentsrel_smid_idx' ON 'vtiger_salesmanattachmentsrel' (`smid` DESC);

CREATE INDEX 'salesmanattachmentsrel_attachmentsid_idx' ON 'vtiger_salesmanattachmentsrel' (`attachmentsid` DESC);

CREATE INDEX 'salesmanticketrel_smid_idx' ON 'vtiger_salesmanticketrel' (`smid` DESC);

CREATE INDEX 'salesmanticketrel_id_idx' ON 'vtiger_salesmanticketrel' (`id` DESC);

CREATE INDEX 'salesorder_vendorid_idx' ON 'vtiger_salesorder' (`vendorid` DESC);

CREATE INDEX 'salesorder_contactid_idx' ON 'vtiger_salesorder' (`contactid` DESC);

CREATE INDEX 'seactivityrel_activityid_idx' ON 'vtiger_seactivityrel' (`activityid` DESC);

CREATE INDEX 'seactivityrel_crmid_idx' ON 'vtiger_seactivityrel' (`crmid` DESC);

CREATE INDEX 'seattachmentsrel_attachmentsid_idx' ON 'vtiger_seattachmentsrel' (`attachmentsid` DESC);

CREATE INDEX 'seattachmentsrel_crmid_idx' ON 'vtiger_seattachmentsrel' (`crmid` DESC);

CREATE INDEX 'seattachmentsrel_attachmentsid_crmid_idx' ON 'vtiger_seattachmentsrel' (`attachmentsid` DESC,`crmid` DESC);

CREATE INDEX 'selectcolumn_queryid_idx' ON 'vtiger_selectcolumn' (`queryid` DESC);

CREATE INDEX 'selectquery_queryid_idx' ON 'vtiger_selectquery' (`queryid` DESC);

CREATE INDEX 'senotesrel_notesid_idx' ON 'vtiger_senotesrel' (`notesid` DESC);

CREATE INDEX 'senotesrel_crmid_idx' ON 'vtiger_senotesrel' (`crmid` DESC);

CREATE INDEX 'seproductsrel_productid_idx' ON 'vtiger_seproductsrel' (`productid` DESC);

CREATE INDEX 'seproductrel_crmid_idx' ON 'vtiger_seproductsrel' (`crmid` DESC);

CREATE INDEX 'seticketsrel_crmid_idx' ON 'vtiger_seticketsrel' (`crmid` DESC);

CREATE INDEX 'seticketsrel_ticketid_idx' ON 'vtiger_seticketsrel' (`ticketid` DESC);

CREATE INDEX 'fk_1_vtiger_settings_field' ON 'vtiger_settings_field' (`blockid` DESC);

CREATE INDEX 'shippingtaxinfo_taxname_idx' ON 'vtiger_shippingtaxinfo' (`taxname` DESC);

CREATE UNIQUE INDEX 'sostatus_sostatus_idx' ON 'vtiger_sostatus' (`sostatus` DESC);

CREATE INDEX 'sostatushistory_salesorderid_idx' ON 'vtiger_sostatushistory' (`salesorderid` DESC);

CREATE UNIQUE INDEX 'tab_name_idx' ON 'vtiger_tab' (`name` DESC);

CREATE INDEX 'tab_modifiedby_idx' ON 'vtiger_tab' (`modifiedby` DESC);

CREATE INDEX 'tab_tabid_idx' ON 'vtiger_tab' (`tabid` DESC);

CREATE INDEX 'fk_1_vtiger_tab_info' ON 'vtiger_tab_info' (`tabid` DESC);

CREATE UNIQUE INDEX 'taxclass_carrier_idx' ON 'vtiger_taxclass' (`taxclass` DESC);

CREATE INDEX 'ticketcomments_ticketid_idx' ON 'vtiger_ticketcomments' (`ticketid` DESC);

CREATE INDEX 'ticketstracktime_ticket_id_idx' ON 'vtiger_ticketstracktime' (`ticket_id` DESC);

CREATE INDEX 'tmp_read_group_rel_sharing_per_userid_sharedgroupid_tabid' ON 'vtiger_tmp_read_group_rel_sharing_per' (`userid` DESC,`sharedgroupid` DESC,`tabid` DESC);

CREATE INDEX 'tmp_read_group_sharing_per_userid_sharedgroupid_idx' ON 'vtiger_tmp_read_group_sharing_per' (`userid` DESC,`sharedgroupid` DESC);

CREATE INDEX 'tmp_read_user_rel_sharing_per_userid_shared_reltabid_idx' ON 'vtiger_tmp_read_user_rel_sharing_per' (`userid` DESC,`shareduserid` DESC,`relatedtabid` DESC);

CREATE INDEX 'tmp_read_user_sharing_per_userid_shareduserid_idx' ON 'vtiger_tmp_read_user_sharing_per' (`userid` DESC,`shareduserid` DESC);

CREATE INDEX 'tmp_write_group_rel_sharing_per_userid_sharedgroupid_tabid_idx' ON 'vtiger_tmp_write_group_rel_sharing_per' (`userid` DESC,`sharedgroupid` DESC,`tabid` DESC);

CREATE INDEX 'tmp_write_group_sharing_per_UK1' ON 'vtiger_tmp_write_group_sharing_per' (`userid` DESC,`sharedgroupid` DESC);

CREATE INDEX 'tmp_write_user_rel_sharing_per_userid_sharduserid_tabid_idx' ON 'vtiger_tmp_write_user_rel_sharing_per' (`userid` DESC,`shareduserid` DESC,`tabid` DESC);

CREATE INDEX 'tmp_write_user_sharing_per_userid_shareduserid_idx' ON 'vtiger_tmp_write_user_sharing_per' (`userid` DESC,`shareduserid` DESC);

CREATE INDEX 'troubletickets_ticketid_idx' ON 'vtiger_troubletickets' (`ticketid` DESC);

CREATE INDEX 'troubletickets_status_idx' ON 'vtiger_troubletickets' (`status` DESC);

CREATE UNIQUE INDEX 'usageunit_usageunit_idx' ON 'vtiger_usageunit' (`usageunit` DESC);

CREATE INDEX 'userid_tabid_idx' ON 'vtiger_user2mergefields' (`userid` DESC,`tabid` DESC);

CREATE INDEX 'user2role_roleid_idx' ON 'vtiger_user2role' (`roleid` DESC);

CREATE INDEX 'fk_2_vtiger_user_module_preferences' ON 'vtiger_user_module_preferences' (`tabid` DESC);

CREATE INDEX 'user_user_name_idx' ON 'vtiger_users' (`user_name` DESC);

CREATE INDEX 'user_user_password_idx' ON 'vtiger_users' (`user_password` DESC);

CREATE INDEX 'users2group_groupname_uerid_idx' ON 'vtiger_users2group' (`groupid` DESC,`userid` DESC);

CREATE INDEX 'fk_2_vtiger_users2group' ON 'vtiger_users2group' (`userid` DESC);

CREATE INDEX 'idx_user_id' ON 'vtiger_users_last_import' (`assigned_user_id` DESC);

CREATE UNIQUE INDEX 'usertype_usertype_idx' ON 'vtiger_usertype' (`usertype` DESC);

CREATE INDEX 'vendorcontactrel_vendorid_idx' ON 'vtiger_vendorcontactrel' (`vendorid` DESC);

CREATE INDEX 'vendorcontactrel_contact_idx' ON 'vtiger_vendorcontactrel' (`contactid` DESC);

CREATE UNIQUE INDEX 'visibility_visibility_idx' ON 'vtiger_visibility' (`visibility` DESC);

CREATE UNIQUE INDEX 'vtiger_idx_1_tablename_fieldname' ON 'vtiger_ws_entity_fieldtype' (`table_name` DESC,`field_name` DESC);

CREATE UNIQUE INDEX 'uitype_idx' ON 'vtiger_ws_fieldtype' (`uitype` DESC);

CREATE UNIQUE INDEX 'userid_idx' ON 'vtiger_ws_userauthtoken' (`userid` DESC);
