<?php
/*********************************************************************************
 * The contents of this file are subject to the SugarCRM Public License Version 1.1.2
 * ("License"); You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://www.sugarcrm.com/SPL
 * Software distributed under the License is distributed on an  "AS IS"  basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 * The Original Code is:  SugarCRM Open Source
 * The Initial Developer of the Original Code is SugarCRM, Inc.
 * Portions created by SugarCRM are Copyright (C) SugarCRM, Inc.;
 * All Rights Reserved.
 * Contributor(s): ______________________________________.
 ********************************************************************************/
/*********************************************************************************
 * $Header$
 * Description:  Defines the Account SugarBean Account entity with the necessary
 * methods and variables.
 * Portions created by SugarCRM are Copyright (C) SugarCRM, Inc.
 * All Rights Reserved.
 * Contributor(s): ______________________________________..
 ********************************************************************************/

include_once ('config.php');
require_once ('include/logging.php');
require_once ('data/SugarBean.php');
require_once ('include/utils/utils.php');
require_once ('user_privileges/default_module_view.php');

// Account is used to store vtiger_account information.
class Invoice extends CRMEntity {
	var $log;
	var $db;
	
	var $table_name = "vtiger_invoice";
	var $table_index = 'invoiceid';
	var $tab_name = Array ('vtiger_crmentity', 'vtiger_invoice', 'vtiger_invoicebillads', 'vtiger_invoiceshipads', 'vtiger_invoicecf' );
	var $tab_name_index = Array ('vtiger_crmentity' => 'crmid', 'vtiger_invoice' => 'invoiceid', 'vtiger_invoicebillads' => 'invoicebilladdressid', 'vtiger_invoiceshipads' => 'invoiceshipaddressid', 'vtiger_invoicecf' => 'invoiceid' );
	/**
	 * Mandatory table for supporting custom fields.
	 */
	var $customFieldTable = Array ('vtiger_invoicecf', 'invoiceid' );
	
	var $column_fields = Array ();
	
	var $update_product_array = Array ();
	
	var $sortby_fields = Array ('subject', 'invoice_no', 'invoicestatus', 'smownerid', 'accountname', 'lastname' );
	
	// This is used to retrieve related vtiger_fields from form posts.
	var $additional_column_fields = Array ('assigned_user_name', 'smownerid', 'opportunity_id', 'case_id', 'contact_id', 'task_id', 'note_id', 'meeting_id', 'call_id', 'email_id', 'parent_name', 'member_id' );
	
	// This is the list of vtiger_fields that are in the lists.
	var $list_fields = Array (//'Invoice No'=>Array('crmentity'=>'crmid'),
'Invoice No' => Array ('invoice' => 'invoice_no' ), 
'Subject' => Array ('invoice' => 'subject' ), 
'Sales Order' => Array ('invoice' => 'salesorderid' ), 
'Status' => Array ('invoice' => 'invoicestatus' ), 
'Total' => Array ('invoice' => 'total' ), 
'Assigned To' => Array ('crmentity' => 'smownerid' ) );
	
	var $list_fields_name = Array ('Invoice No' => 'invoice_no', 'Subject' => 'subject', 'Sales Order' => 'salesorder_id', 'Status' => 'invoicestatus', 'Total' => 'hdnGrandTotal', 'Assigned To' => 'assigned_user_id' );
	var $list_link_field = 'subject';
	
	var $search_fields = Array (//'Invoice No'=>Array('crmentity'=>'crmid'),
'Invoice No' => Array ('invoice' => 'invoice_no' ), 'Subject' => Array ('purchaseorder' => 'subject' ) );
	
	var $search_fields_name = Array ('Invoice No' => '', 'Subject' => 'subject' );
	
	// This is the list of vtiger_fields that are required.
	var $required_fields = array ("accountname" => 1 );
	
	//Added these variables which are used as default order by and sortorder in ListView
	var $default_order_by = 'crmid';
	var $default_sort_order = 'ASC';
	
	//var $groupTable = Array('vtiger_invoicegrouprelation','invoiceid');
	

	var $mandatory_fields = Array ('subject', 'createdtime', 'modifiedtime' );
	var $_salesorderid;
	var $_recurring_mode;
	
	/**	Constructor which will set the column_fields in this object
	 */
	function Invoice() {
		$this->log = LoggerManager::getLogger ( 'Invoice' );
		$this->log->debug ( "Entering Invoice() method ..." );
		$this->db = PearDatabase::getInstance ();
		$this->column_fields = getColumnFields ( 'Invoice' );
		$this->log->debug ( "Exiting Invoice method ..." );
	}
	
	/** Function to handle the module specific save operations
	 */
	
	function save_module($module) {
		//Checking if vtiger_salesorderid is present and updating the quote status
		if ($this->column_fields ["salesorder_id"] != '') {
			$so_id = $this->column_fields ["salesorder_id"];
			$query1 = "update vtiger_salesorder set sostatus='Approved' where salesorderid=?";
			$this->db->pquery ( $query1, array ($so_id ) );
		}
		
		//in ajax save we should not call this function, because this will delete all the existing product values
		if (isset ( $this->_recurring_mode ) && $this->_recurring_mode == 'recurringinvoice_from_so' && isset ( $this->_salesorderid ) && $this->_salesorderid != '') {
			// We are getting called from the RecurringInvoice cron service!
			$this->createRecurringInvoiceFromSO ();
		
		} else if (isset ( $_REQUEST )) {
			if ($_REQUEST ['action'] != 'InvoiceAjax' && $_REQUEST ['ajxaction'] != 'DETAILVIEW' && $_REQUEST ['action'] != 'MassEditSave') {
				//Based on the total Number of rows we will save the product relationship with this entity
				saveInventoryProductDetails ( $this, 'Invoice' );
			}
		}
		
		// Update the currency id and the conversion rate for the invoice
		$update_query = "update vtiger_invoice set currency_id=?, conversion_rate=? where invoiceid=?";
		
		$update_params = array ($this->column_fields ['currency_id'], $this->column_fields ['conversion_rate'], $this->id );
		$this->db->pquery ( $update_query, $update_params );
	}
	
	/**	Function used to get the sort order for Invoice listview
	 *	@return string	$sorder	- first check the $_REQUEST['sorder'] if request value is empty then check in the $_SESSION['INVOICE_SORT_ORDER'] if this session value is empty then default sort order will be returned. 
	 */
	function getSortOrder() {
		global $log;
		$log->debug ( "Entering getSortOrder() method ..." );
		if (isset ( $_REQUEST ['sorder'] ))
			$sorder = $this->db->sql_escape_string ( $_REQUEST ['sorder'] );
		else
			$sorder = (($_SESSION ['INVOICE_SORT_ORDER'] != '') ? ($_SESSION ['INVOICE_SORT_ORDER']) : ($this->default_sort_order));
		$log->debug ( "Exiting getSortOrder() method ..." );
		return $sorder;
	}
	
	/**	Function used to get the order by value for Invoice listview
	 *	@return string	$order_by  - first check the $_REQUEST['order_by'] if request value is empty then check in the $_SESSION['INVOICE_ORDER_BY'] if this session value is empty then default order by will be returned. 
	 */
	function getOrderBy() {
		global $log;
		$log->debug ( "Entering getOrderBy() method ..." );
		
		$use_default_order_by = '';
		if (PerformancePrefs::getBoolean ( 'LISTVIEW_DEFAULT_SORTING', true )) {
			$use_default_order_by = $this->default_order_by;
		}
		
		if (isset ( $_REQUEST ['order_by'] ))
			$order_by = $this->db->sql_escape_string ( $_REQUEST ['order_by'] );
		else
			$order_by = (($_SESSION ['INVOICE_ORDER_BY'] != '') ? ($_SESSION ['INVOICE_ORDER_BY']) : ($use_default_order_by));
		$log->debug ( "Exiting getOrderBy method ..." );
		return $order_by;
	}
	
	/**	function used to get the name of the current object
	 *	@return string $this->name - name of the current object
	 */
	function get_summary_text() {
		global $log;
		$log->debug ( "Entering get_summary_text() method ..." );
		$log->debug ( "Exiting get_summary_text method ..." );
		return $this->name;
	}
	
	/**	function used to get the list of activities which are related to the invoice
	 *	@param int $id - invoice id
	 *	@return array - return an array which will be returned from the function GetRelatedList
	 */
	function get_activities($id, $cur_tab_id, $rel_tab_id, $actions = false) {
		global $log, $singlepane_view, $currentModule, $current_user;
		$log->debug ( "Entering get_activities(" . $id . ") method ..." );
		$this_module = $currentModule;
		
		$related_module = vtlib_getModuleNameById ( $rel_tab_id );
		require_once ("modules/$related_module/Activity.php");
		$other = new Activity ( );
		vtlib_setup_modulevars ( $related_module, $other );
		$singular_modname = vtlib_toSingular ( $related_module );
		
		$parenttab = getParentTab ();
		
		if ($singlepane_view == 'true')
			$returnset = '&return_module=' . $this_module . '&return_action=DetailView&return_id=' . $id;
		else
			$returnset = '&return_module=' . $this_module . '&return_action=CallRelatedList&return_id=' . $id;
		
		$button = '';
		
		$button .= '<input type="hidden" name="activity_mode">';
		
		if ($actions) {
			if (is_string ( $actions ))
				$actions = explode ( ',', strtoupper ( $actions ) );
			if (in_array ( 'ADD', $actions ) && isPermitted ( $related_module, 1, '' ) == 'yes') {
				$button .= "<input title='" . getTranslatedString ( 'LBL_NEW' ) . " " . getTranslatedString ( 'LBL_TODO', $related_module ) . "' class='crmbutton small create'" . " onclick='this.form.action.value=\"EditView\";this.form.module.value=\"$related_module\";this.form.return_module.value=\"$this_module\";this.form.activity_mode.value=\"Task\";' type='submit' name='button'" . " value='" . getTranslatedString ( 'LBL_ADD_NEW' ) . " " . getTranslatedString ( 'LBL_TODO', $related_module ) . "'>&nbsp;";
			}
		}
		
		$query = "SELECT case when (vtiger_users.user_name not like '') then vtiger_users.user_name else vtiger_groups.groupname end as user_name,
				vtiger_contactdetails.lastname, vtiger_contactdetails.firstname, vtiger_contactdetails.contactid,
				vtiger_activity.*,vtiger_seactivityrel.*,vtiger_crmentity.crmid, vtiger_crmentity.smownerid,
				vtiger_crmentity.modifiedtime
				from vtiger_activity
				inner join vtiger_seactivityrel on vtiger_seactivityrel.activityid=vtiger_activity.activityid
				inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_activity.activityid
				left join vtiger_cntactivityrel on vtiger_cntactivityrel.activityid= vtiger_activity.activityid
				left join vtiger_contactdetails on vtiger_contactdetails.contactid = vtiger_cntactivityrel.contactid
				left join vtiger_users on vtiger_users.id=vtiger_crmentity.smownerid
				left join vtiger_groups on vtiger_groups.groupid=vtiger_crmentity.smownerid
				where vtiger_seactivityrel.crmid=" . $id . " and activitytype='Task' and vtiger_crmentity.deleted=0
						and (vtiger_activity.status is not NULL and vtiger_activity.status != 'Completed')
						and (vtiger_activity.status is not NULL and vtiger_activity.status != 'Deferred')";
		
		$return_value = GetRelatedList ( $this_module, $related_module, $other, $query, $button, $returnset );
		
		if ($return_value == null)
			$return_value = Array ();
		$return_value ['CUSTOM_BUTTON'] = $button;
		
		$log->debug ( "Exiting get_activities method ..." );
		return $return_value;
	}
	
	/**	function used to get the the activity history related to the quote
	 *	@param int $id - invoice id
	 *	@return array - return an array which will be returned from the function GetHistory
	 */
	function get_history($id) {
		global $log;
		$log->debug ( "Entering get_history(" . $id . ") method ..." );
		$query = "SELECT vtiger_contactdetails.lastname, vtiger_contactdetails.firstname, 
				vtiger_contactdetails.contactid,vtiger_activity.*,vtiger_seactivityrel.*,
				vtiger_crmentity.crmid, vtiger_crmentity.smownerid, vtiger_crmentity.modifiedtime,
				vtiger_crmentity.createdtime, vtiger_crmentity.description,
				case when (vtiger_users.user_name not like '') then vtiger_users.user_name else vtiger_groups.groupname end as user_name
				from vtiger_activity
				inner join vtiger_seactivityrel on vtiger_seactivityrel.activityid=vtiger_activity.activityid
				inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_activity.activityid
				left join vtiger_cntactivityrel on vtiger_cntactivityrel.activityid= vtiger_activity.activityid
				left join vtiger_contactdetails on vtiger_contactdetails.contactid = vtiger_cntactivityrel.contactid
                left join vtiger_groups on vtiger_groups.groupid=vtiger_crmentity.smownerid
				left join vtiger_users on vtiger_users.id=vtiger_crmentity.smownerid	
				where vtiger_activity.activitytype='Task'
					and (vtiger_activity.status = 'Completed' or vtiger_activity.status = 'Deferred')
					and vtiger_seactivityrel.crmid=" . $id . "
					and vtiger_crmentity.deleted = 0";
		//Don't add order by, because, for security, one more condition will be added with this query in include/RelatedListView.php
		

		$log->debug ( "Exiting get_history method ..." );
		return getHistory ( 'Invoice', $query, $id );
	}
	
	/**	Function used to get the Status history of the Invoice
	 *	@param $id - invoice id
	 *	@return $return_data - array with header and the entries in format Array('header'=>$header,'entries'=>$entries_list) where as $header and $entries_list are arrays which contains header values and all column values of all entries
	 */
	function get_invoicestatushistory($id) {
		global $log;
		$log->debug ( "Entering get_invoicestatushistory(" . $id . ") method ..." );
		
		global $adb;
		global $mod_strings;
		global $app_strings;
		
		$query = 'select vtiger_invoicestatushistory.*, vtiger_invoice.invoice_no from vtiger_invoicestatushistory inner join vtiger_invoice on vtiger_invoice.invoiceid = vtiger_invoicestatushistory.invoiceid inner join vtiger_crmentity on vtiger_crmentity.crmid = vtiger_invoice.invoiceid where vtiger_crmentity.deleted = 0 and vtiger_invoice.invoiceid = ?';
		$result = $adb->pquery ( $query, array ($id ) );
		$noofrows = $adb->num_rows ( $result );
		
		$header [] = $app_strings ['Invoice No'];
		$header [] = $app_strings ['LBL_ACCOUNT_NAME'];
		$header [] = $app_strings ['LBL_AMOUNT'];
		$header [] = $app_strings ['LBL_INVOICE_STATUS'];
		$header [] = $app_strings ['LBL_LAST_MODIFIED'];
		
		//Getting the field permission for the current user. 1 - Not Accessible, 0 - Accessible
		//Account Name , Amount are mandatory fields. So no need to do security check to these fields.
		global $current_user;
		
		//If field is accessible then getFieldVisibilityPermission function will return 0 else return 1
		$invoicestatus_access = (getFieldVisibilityPermission ( 'Invoice', $current_user->id, 'invoicestatus' ) != '0') ? 1 : 0;
		$picklistarray = getAccessPickListValues ( 'Invoice' );
		
		$invoicestatus_array = ($invoicestatus_access != 1) ? $picklistarray ['invoicestatus'] : array ();
		//- ==> picklist field is not permitted in profile
		//Not Accessible - picklist is permitted in profile but picklist value is not permitted
		$error_msg = ($invoicestatus_access != 1) ? 'Not Accessible' : '-';
		
		while ( $row = $adb->fetch_array ( $result ) ) {
			$entries = Array ();
			
			// Module Sequence Numbering
			//$entries[] = $row['invoiceid'];
			$entries [] = $row ['invoice_no'];
			// END
			$entries [] = $row ['accountname'];
			$entries [] = $row ['total'];
			$entries [] = (in_array ( $row ['invoicestatus'], $invoicestatus_array )) ? $row ['invoicestatus'] : $error_msg;
			$entries [] = getDisplayDate ( $row ['lastmodified'] );
			
			$entries_list [] = $entries;
		}
		
		$return_data = Array ('header' => $header, 'entries' => $entries_list );
		
		$log->debug ( "Exiting get_invoicestatushistory method ..." );
		
		return $return_data;
	}
	
	// Function to get column name - Overriding function of base class
	function get_column_value($columname, $fldvalue, $fieldname, $uitype, $datatype) {
		if ($columname == 'salesorderid') {
			if ($fldvalue == '')
				return null;
		}
		return parent::get_column_value ( $columname, $fldvalue, $fieldname, $uitype, $datatype );
	}
	
	/*
	 * Function to get the secondary query part of a report 
	 * @param - $module primary module name
	 * @param - $secmodule secondary module name
	 * returns the query string formed on fetching the related data for report for secondary module
	 */
	function generateReportsSecQuery($module, $secmodule) {
		$query = $this->getRelationQuery ( $module, $secmodule, "vtiger_invoice", "invoiceid" );
		$query .= " left join vtiger_crmentity as vtiger_crmentityInvoice on vtiger_crmentityInvoice.crmid=vtiger_invoice.invoiceid and vtiger_crmentityInvoice.deleted=0
			left join vtiger_invoicecf on vtiger_invoice.invoiceid = vtiger_invoicecf.invoiceid 
			left join vtiger_salesorder as vtiger_salesorderInvoice on vtiger_salesorderInvoice.salesorderid=vtiger_invoice.salesorderid
			left join vtiger_invoicebillads on vtiger_invoice.invoiceid=vtiger_invoicebillads.invoicebilladdressid
			left join vtiger_invoiceshipads on vtiger_invoice.invoiceid=vtiger_invoiceshipads.invoiceshipaddressid
			left join vtiger_inventoryproductrel as vtiger_inventoryproductrelInvoice on vtiger_invoice.invoiceid = vtiger_inventoryproductrelInvoice.id  
			left join vtiger_products as vtiger_productsInvoice on vtiger_productsInvoice.productid = vtiger_inventoryproductrelInvoice.productid  
			left join vtiger_service as vtiger_serviceInvoice on vtiger_serviceInvoice.serviceid = vtiger_inventoryproductrelInvoice.productid  
			left join vtiger_groups as vtiger_groupsInvoice on vtiger_groupsInvoice.groupid = vtiger_crmentityInvoice.smownerid
			left join vtiger_users as vtiger_usersInvoice on vtiger_usersInvoice.id = vtiger_crmentityInvoice.smownerid
			left join vtiger_contactdetails as vtiger_contactdetailsInvoice on vtiger_invoice.contactid = vtiger_contactdetailsInvoice.contactid
			left join vtiger_account as vtiger_accountInvoice on vtiger_accountInvoice.accountid = vtiger_invoice.accountid ";
		
		return $query;
	}
	
	/*
	 * Function to get the relation tables for related modules 
	 * @param - $secmodule secondary module name
	 * returns the array with table names and fieldnames storing relations between module and this module
	 */
	function setRelationTables($secmodule) {
		$rel_tables = array ("Calendar" => array ("vtiger_seactivityrel" => array ("crmid", "activityid" ), "vtiger_invoice" => "invoiceid" ), "Documents" => array ("vtiger_senotesrel" => array ("crmid", "notesid" ), "vtiger_invoice" => "invoiceid" ), "Accounts" => array ("vtiger_invoice" => array ("invoiceid", "accountid" ) ) );
		return $rel_tables [$secmodule];
	}
	
	// Function to unlink an entity with given Id from another entity
	function unlinkRelationship($id, $return_module, $return_id) {
		global $log;
		if (empty ( $return_module ) || empty ( $return_id ))
			return;
		
		if ($return_module == 'Accounts' || $return_module == 'Contacts') {
			$this->trash ( 'Invoice', $id );
		} elseif ($return_module == 'SalesOrder') {
			$relation_query = 'UPDATE vtiger_invoice set salesorderid=0 where invoiceid=?';
			$this->db->pquery ( $relation_query, array ($id ) );
		} else {
			$sql = 'DELETE FROM vtiger_crmentityrel WHERE (crmid=? AND relmodule=? AND relcrmid=?) OR (relcrmid=? AND module=? AND crmid=?)';
			$params = array ($id, $return_module, $return_id, $id, $return_module, $return_id );
			$this->db->pquery ( $sql, $params );
		}
	}
	
	/*
	 * Function to get the relations of salesorder to invoice for recurring invoice procedure 
	 * @param - $salesorder_id Salesorder ID
	 */
	function createRecurringInvoiceFromSO() {
		global $adb;
		$salesorder_id = $this->_salesorderid;
		$query1 = "SELECT * FROM vtiger_inventoryproductrel WHERE id=?";
		$res = $adb->pquery ( $query1, array ($salesorder_id ) );
		$no_of_products = $adb->num_rows ( $res );
		$fieldsList = $adb->getFieldsArray ( $res );
		$update_stock = array ();
		for($j = 0; $j < $no_of_products; $j ++) {
			$row = $adb->query_result_rowdata ( $res, $j );
			$col_value = array ();
			for($k = 0; $k < count ( $fieldsList ); $k ++) {
				if ($fieldsList [$k] != 'lineitem_id') {
					$col_value [$fieldsList [$k]] = $row [$fieldsList [$k]];
				}
			}
			if (count ( $col_value ) > 0) {
				$col_value ['id'] = $this->id;
				$columns = array_keys ( $col_value );
				$values = array_values ( $col_value );
				$query2 = "INSERT INTO vtiger_inventoryproductrel(" . implode ( ",", $columns ) . ") VALUES (" . generateQuestionMarks ( $values ) . ")";
				$adb->pquery ( $query2, array ($values ) );
				$prod_id = $col_value ['productid'];
				$qty = $col_value ['quantity'];
				$update_stock [$col_value ['sequence_no']] = $qty;
				updateStk ( $prod_id, $qty, '', array (), 'Invoice' );
			}
		}
		
		$query1 = "SELECT * FROM vtiger_inventorysubproductrel WHERE id=?";
		$res = $adb->pquery ( $query1, array ($salesorder_id ) );
		$no_of_products = $adb->num_rows ( $res );
		$fieldsList = $adb->getFieldsArray ( $res );
		for($j = 0; $j < $no_of_products; $j ++) {
			$row = $adb->query_result_rowdata ( $res, $j );
			$col_value = array ();
			for($k = 0; $k < count ( $fieldsList ); $k ++) {
				$col_value [$fieldsList [$k]] = $row [$fieldsList [$k]];
			}
			if (count ( $col_value ) > 0) {
				$col_value ['id'] = $this->id;
				$columns = array_keys ( $col_value );
				$values = array_values ( $col_value );
				$query2 = "INSERT INTO vtiger_inventorysubproductrel(" . implode ( ",", $columns ) . ") VALUES (" . generateQuestionMarks ( $values ) . ")";
				$adb->pquery ( $query2, array ($values ) );
				$prod_id = $col_value ['productid'];
				$qty = $update_stock [$col_value ['sequence_no']];
				updateStk ( $prod_id, $qty, '', array (), 'Invoice' );
			}
		}
		
		// Add the Shipping taxes for the Invoice
		$query3 = "SELECT * FROM vtiger_inventoryshippingrel WHERE id=?";
		$res = $adb->pquery ( $query3, array ($salesorder_id ) );
		$no_of_shippingtax = $adb->num_rows ( $res );
		$fieldsList = $adb->getFieldsArray ( $res );
		for($j = 0; $j < $no_of_shippingtax; $j ++) {
			$row = $adb->query_result_rowdata ( $res, $j );
			$col_value = array ();
			for($k = 0; $k < count ( $fieldsList ); $k ++) {
				$col_value [$fieldsList [$k]] = $row [$fieldsList [$k]];
			}
			if (count ( $col_value ) > 0) {
				$col_value ['id'] = $this->id;
				$columns = array_keys ( $col_value );
				$values = array_values ( $col_value );
				$query4 = "INSERT INTO vtiger_inventoryshippingrel(" . implode ( ",", $columns ) . ") VALUES (" . generateQuestionMarks ( $values ) . ")";
				$adb->pquery ( $query4, array ($values ) );
			}
		}
		
		//Update the netprice (subtotal), taxtype, discount, S&H charge, adjustment and total for the Invoice
		

		$updatequery = " UPDATE vtiger_invoice SET ";
		$updateparams = array ();
		// Remaining column values to be updated -> column name to field name mapping
		$invoice_column_field = Array ('adjustment' => 'txtAdjustment', 'subtotal' => 'hdnSubTotal', 'total' => 'hdnGrandTotal', 'taxtype' => 'hdnTaxType', 'discount_percent' => 'hdnDiscountPercent', 'discount_amount' => 'hdnDiscountAmount', 's_h_amount' => 'hdnS_H_Amount' );
		$updatecols = array ();
		foreach ( $invoice_column_field as $col => $field ) {
			$updatecols [] = "$col=?";
			$updateparams [] = $this->column_fields [$field];
		}
		if (count ( $updatecols ) > 0) {
			$updatequery .= implode ( ",", $updatecols );
			
			$updatequery .= " WHERE invoiceid=?";
			array_push ( $updateparams, $this->id );
			
			$adb->pquery ( $updatequery, $updateparams );
		}
	}
	
	function saveInvoice() {
		global $adb;
		
		try {

			mysql_query("SET AUTOCOMMIT=0");
			mysql_query("START TRANSACTION");
			
		$id = getCrmid ( 'Invoice' );
//		//GIRISH Added unique CODE from roles table in Invoice Number which is set in Users.php in users module
		$Invoice_no = invoiceNumber () . "_" . $_SESSION ['code'];
		
		$_REQUEST['invoice_no'] = $Invoice_no;
		
		if (! $_REQUEST ['totaldiscount']) {
			$discount = 0;
		} else {
			$discount = $_REQUEST ['totaldiscount'];
		}
		
		$_REQUEST ['card_amt'] = ! empty ( $_REQUEST ['card_amt'] ) ? $_REQUEST ['card_amt'] : '0.00';
		$_REQUEST ['bank_amt'] = ! empty ( $_REQUEST ['bank_amt'] ) ? $_REQUEST ['bank_amt'] : '0.00';
		$_REQUEST ['credit_amt'] = ! empty ( $_REQUEST ['credit_amt'] ) ? $_REQUEST ['credit_amt'] : '0.00';
		$_REQUEST ['totaldiscount'] = ! empty ( $_REQUEST ['totaldiscount'] ) ? $_REQUEST ['totaldiscount'] : '0.00';
		$_REQUEST ['adjustment'] = ! empty ( $_REQUEST ['adjustment'] ) ? $_REQUEST ['adjustment'] : '0.00';

	/*	echo "<pre>";
print_r($_REQUEST);
exit;*/
		
		/* Do the adjustment for Special category products */
			$totalmrp = 0;
			$totalnetprice = 0;
			$specialdiscount_total = 0;
		foreach($_REQUEST['category'] as $key=>$value){
			
			if($value == "SPECIAL") {
				
				$totalmrp +=  $_REQUEST['mrp'][$key];
				$totalnetprice += $_REQUEST['netprice'][$key];
				
				if($_REQUEST['discount'][$key]>0){
					$specialdiscount = $_REQUEST['mrp'][$key] * ($_REQUEST['discount'][$key]/100);
					$specialnetprice = ($_REQUEST['mrp'][$key] - $specialdiscount);
					$_REQUEST['netprice'][$key] = number_format($specialnetprice, 2, '.', ',');
					$specialdiscount_total += $specialdiscount;
				} else {
					$_REQUEST['netprice'][$key] = $_REQUEST['mrp'][$key];	
				}
				
				$_REQUEST['vat'][$key] = 0;
			}  
		}
		//$totalnetprice = $totalnetprice - $specialdiscount_total;
		$specialvat = $totalnetprice - $totalmrp;
		$_REQUEST['totalamount'] = $_REQUEST['totalamount'] - ($specialvat + $specialdiscount_total);
    	$_REQUEST['grandtotal'] = $_REQUEST['grandtotal'] - ($specialvat + $specialdiscount_total);
    	$_REQUEST['nettotal'] = $_REQUEST['nettotal'] - ($specialvat + $specialdiscount_total);
		
/*echo "<pre>";
echo "==Special Discount===".$specialdiscount_total;
print_r($_REQUEST);
exit;
		*/
		$sql = "insert IGNORE into vtiger_invoice set invoiceid= '" . ( int ) $id . "', 
				invoicedate =NOW(),
               `type`='" . $_REQUEST ['adjustmentType'] . "' ,
                adjustment='" . $_REQUEST ['adjustment'] . "' ,
                subtotal ='" . $_REQUEST ['nettotal'] . "',
                total ='" . $_REQUEST ['grandtotal'] . "',
                discount_amount='" . $discount . "',
                invoicestatus='Paid',
                invoice_no='" . $Invoice_no . "',
				customername='" . $_REQUEST ['customername'] . "',
				mobile='" . $_REQUEST ['mobile'] . "',
				salesorderno='" . $_REQUEST ['salesorderno'] . "',
				email='" . $_REQUEST ['email'] . "',
     			cash='" . ( float ) $_REQUEST ['cash_amt'] . "',
				credit='" . ( float ) $_REQUEST ['credit_amt'] . "',
				card='" . ( float ) $_REQUEST ['card_amt'] . "',
				bankname='" . $_REQUEST ['bankname'] . "',
				chq_date='" . $_REQUEST ['chqdate'] . "',
				cheque_no='" . $_REQUEST ['chq_no'] . "',
				cheque_amt='" . ( float ) $_REQUEST ['bank_amt'] . "',
                storeid='" . $_SESSION ['warehouseid'] . "'";
		
		mysql_query($sql) or die ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
		
		$invoicecf = "insert into vtiger_invoicecf (invoiceid) values('" . $id . "')";
		mysql_query($invoicecf) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
		
		/* Customer create while creating Invoice-- Girish 3 Jan 2012 
		Tables used vtiger_contactdetails,vtiger_contactscf,vtiger_crmentity,vtiger_crmentity_seq,vtiger_modentity_num,vtiger_contactaddress*/
		
		/* Updating royality points and royality money */
		
		if(!empty($_REQUEST['royalityno'])){
				
			$query = "SELECT contactid, royalitynumber, royalitycount FROM vtiger_contactroyality WHERE royalitynumber = '".$_REQUEST['royalityno']."'";	
			$resultSet = $adb->pquery ( $query, '' );
			$record = $adb->fetchByAssoc ( $resultSet );
			
			/*print_r($record);
			exit;*/
			
			/* Fetch the royality points formula */
					
			$query = "SELECT MIN(royality_count) AS royality_count, royalityamount FROM vtiger_royality WHERE (current_date >= from_date AND current_date <= to_date) AND deleted=0";
			$resultSet = $adb->pquery ( $query, '' );
			$royalityrecord = $adb->fetchByAssoc ( $resultSet );
			
			/* Calculate the royality points earned in this Invoice */ 
			$royalitpointsearned = floor($_REQUEST['grandtotal'] * ($royalityrecord['royalityamount']/$royalityrecord['royality_count']));
				
			if($record['royalitynumber']){
				
				if($_REQUEST['redeem_points']>0){				
					$remainingpoints = $record['royalitycount'] - $_REQUEST['redeem_points'];				
				}
				
				$totalroyalitypoints = $royalitpointsearned + $remainingpoints;
				
				$_SESSION['royalitypointsearned'] = $totalroyalitypoints;
				
				/* Update the total royality points */
				$query = "UPDATE vtiger_contactroyality SET royalitycount= '". $totalroyalitypoints ."' WHERE contactid='". $record['contactid'] ."' AND royalitynumber='" . $record['royalitynumber'] . "'";
				mysql_query($query) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error());
				
			} else {
				
				/**************** CREATE A NEW CONTACT/CUSTOMER ***********************/
				$cust_id = $id + 1;
				$customer_crmentity_seq = "UPDATE vtiger_crmentity_seq SET id='" . $cust_id . "' WHERE id='" . $id . "'";
				mysql_query ( $customer_crmentity_seq ) or die ( "ERROR IN QUERY customer_crmentity_seq @ LINE  " . __LINE__ . " " . mysql_error () );
				
				$customer_crmentity = "INSERT INTO vtiger_crmentity (crmid,smcreatorid,smownerid,modifiedby,setype,description,createdtime,modifiedtime,viewedtime,status,version,presence,deleted) VALUES 
			 	('" . $cust_id . "',1,1,0,'Contacts',NULL,NOW(),NOW(),NOW(),NULL,0,1,0)";
				mysql_query ( $customer_crmentity ) or die ( "ERROR IN QUERY customer_crmentity 1 @ LINE  " . __LINE__ . " " . mysql_error () );
				
				/* Query to fetch last contact number*/
				$cust_modentity_num = "SELECT cur_id FROM vtiger_modentity_num WHERE prefix='CON' LIMIT 1";
				$result_mod = mysql_query ( $cust_modentity_num ) or die ( "ERROR IN QUERY cust_modentity_num @ LINE  " . __LINE__ . " " . mysql_error () );
				$res_cur_id = mysql_fetch_array ( $result_mod );
				$cur_id = $res_cur_id ['cur_id'];
				$con_no = "CON" . $cur_id;
				
				/* Query ends*/
				$update_modentity_num = "UPDATE vtiger_modentity_num SET cur_id='" . ($cur_id + 1) . "' WHERE prefix='CON'";
				mysql_query ( $update_modentity_num ) or die ( "ERROR IN QUERY update_modentity_num @ LINE  " . __LINE__ . " " . mysql_error () );
				
				$cust_contactdetails = "INSERT INTO vtiger_contactdetails (contactid,contact_no,accountid,salutation,firstname,lastname,email,phone,mobile,title,department,fax,reportsto,training,usertype,contacttype,otheremail,yahooid,donotcall,emailoptout,imagename,reference,notify_owner) VALUES
			  	('" . $cust_id . "','" . $con_no . "',0,'--None--','" . $_REQUEST ['customername'] . "','','','','" . $_REQUEST ['mobile'] . "','','','',0,NULL,NULL,NULL,NULL,'',0,0,'',0,0)";
				mysql_query ( $cust_contactdetails ) or die ( "ERROR IN QUERY cust_contactdetails @ LINE  " . __LINE__ . " " . mysql_error () );
				
				$cust_contactscf = "INSERT INTO vtiger_contactscf (contactid) VALUES ('" . $cust_id . "')";
				mysql_query ( $cust_contactscf ) or die ( "ERROR IN QUERY cust_contactscf erer @ LINE  " . __LINE__ . " " . mysql_error () );
				
				$_SESSION['royalitypointsearned'] = $royalitpointsearned;
				
				/* Insert the total earned royality points */
				$query = "INSERT INTO vtiger_contactroyality (contactid, royalitynumber, royalitycount) VALUES ('" . $cust_id . "', '" . $_REQUEST['royalityno'] . "', '" . $royalitpointsearned . "')";
				mysql_query($query) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error());
				
			}			
		}
		//exit;
		/*echo "<pre>";
		print_r($royalityrecord);
		exit;*/
		
//		if(!empty($_REQUEST['credit_amt']) && $_REQUEST['credit_amt'] != "0.00"){
//		
//			/************** CHECK IF CONTACT ALREADY EXISTS ******************/
//			$customer_duplicate = "SELECT email,mobile, contactid FROM vtiger_contactdetails WHERE mobile='" . $_REQUEST ['mobile'] . "'";
//			$resultdup = mysql_query ( $customer_duplicate );
//			$countdup = mysql_num_rows ( $resultdup );
//			
//			/************** E  N   D  S***************/
//			if ($countdup == 0) {
//				
//				/**************** CREATE A NEW CONTACT/CUSTOMER ***********************/
//				
//				$cust_id = $id + 1;
//				$customer_crmentity_seq = "UPDATE vtiger_crmentity_seq SET id='" . $cust_id . "' WHERE id='" . $id . "'";
//				mysql_query ( $customer_crmentity_seq ) or die ( "ERROR IN QUERY customer_crmentity_seq @ LINE  " . __LINE__ . " " . mysql_error () );
//				
//				$customer_crmentity = "INSERT INTO vtiger_crmentity (crmid,smcreatorid,smownerid,modifiedby,setype,description,createdtime,modifiedtime,viewedtime,status,version,presence,deleted) VALUES 
//			 	('" . $cust_id . "',1,1,0,'Contacts',NULL,NOW(),NOW(),NOW(),NULL,0,1,0)";
//				mysql_query ( $customer_crmentity ) or die ( "ERROR IN QUERY customer_crmentity 1 @ LINE  " . __LINE__ . " " . mysql_error () );
//				
//				/* Query to fetch last contact number*/
//				$cust_modentity_num = "SELECT cur_id FROM vtiger_modentity_num WHERE prefix='CON' LIMIT 1";
//				$result_mod = mysql_query ( $cust_modentity_num ) or die ( "ERROR IN QUERY cust_modentity_num @ LINE  " . __LINE__ . " " . mysql_error () );
//				$res_cur_id = mysql_fetch_array ( $result_mod );
//				$cur_id = $res_cur_id ['cur_id'];
//				$con_no = "CON" . $cur_id;
//				
//				/* Query ends*/
//				$update_modentity_num = "UPDATE vtiger_modentity_num SET cur_id='" . ($cur_id + 1) . "' WHERE prefix='CON'";
//				mysql_query ( $update_modentity_num ) or die ( "ERROR IN QUERY update_modentity_num @ LINE  " . __LINE__ . " " . mysql_error () );
//				
//				$cust_contactdetails = "INSERT INTO vtiger_contactdetails (contactid,contact_no,accountid,salutation,firstname,lastname,email,phone,mobile,title,department,fax,reportsto,training,usertype,contacttype,otheremail,yahooid,donotcall,emailoptout,imagename,reference,notify_owner) VALUES
//			  	('" . $cust_id . "','" . $con_no . "',0,'--None--','" . $_REQUEST ['customername'] . "','','" . $_REQUEST ['email'] . "','','" . $_REQUEST ['mobile'] . "','','','',0,NULL,NULL,NULL,NULL,'',0,0,'',0,0)";
//				mysql_query ( $cust_contactdetails ) or die ( "ERROR IN QUERY cust_contactdetails @ LINE  " . __LINE__ . " " . mysql_error () );
//				/* If copy billing address is checked */
//				
//				if ($_REQUEST ['cpy'] == true ) {
//				 $cust_contactaddress = "INSERT INTO vtiger_contactaddress(contactaddressid,mailingcity,mailingstreet,mailingcountry,mailingstate,mailingpobox,
//				 mailingzip) VALUES 
//					('" . $cust_id . "',
//					'" . $_REQUEST ['bill_city'] . "',
//					'" . $_REQUEST ['bill_street'] . "',
//					'" . $_REQUEST ['bill_country'] . "',
//					'" . $_REQUEST ['bill_state'] . "',
//					'" . $_REQUEST ['bill_code'] . "',
//					'" . $_REQUEST ['bill_code'] . "',
//					)";
//					
//					mysql_query ( $cust_contactaddress );
//					
//					
//					$query_vtiger_customerdetails = "INSERT INTO vtiger_customerdetails (customerid,portal,support_start_date,support_end_date ) 
//			   		VALUES ('" . $cust_id . "',0,NOW(),NOW(),)";
//					mysql_query ( $query_vtiger_customerdetails );
//					
//					$query_vtiger_contactsubdetails = "INSERT INTO vtiger_contactsubdetails (contactsubscriptionid,homephone,otherphone,assistant,assistantphone,birthday,laststayintouchrequest,laststayintouchsavedate,leadsource) 
//			   		VALUES ('" . $cust_id . "','','','','',NULL,0,0,'--None--')";
//					mysql_query ( $query_vtiger_contactsubdetails );
//				
//				} else {
//					$query_vtiger_customerdetails = "INSERT INTO vtiger_customerdetails (customerid,portal,support_start_date,support_end_date ) 
//			   		VALUES ('" . $cust_id . "',0,NOW(),NOW(),)";
//					mysql_query ( $query_vtiger_customerdetails );
//					
//					$query_vtiger_contactsubdetails = "INSERT INTO vtiger_contactsubdetails (contactsubscriptionid,homephone,otherphone,assistant,assistantphone,birthday,laststayintouchrequest,laststayintouchsavedate,leadsource) 
//			   		VALUES ('" . $cust_id . "','','','','',NULL,0,0,'--None--')";
//					mysql_query ( $query_vtiger_contactsubdetails );
//					
//					$cust_contactaddress = "INSERT INTO vtiger_contactaddress(contactaddressid,mailingcity,mailingstreet,mailingcountry,othercountry,mailingstate,mailingpobox,othercity,otherstate,mailingzip,otherzip,otherstreet,otherpobox) VALUES ('" . $cust_id . "','" . $_REQUEST ['bill_city'] . "','" . $_REQUEST ['bill_street'] . "','" . $_REQUEST ['bill_country'] . "','" . $_REQUEST ['ship_country'] . "','" . $_REQUEST ['bill_state'] . "',
//					'" . $_REQUEST ['bill_code'] . "','" . $_REQUEST ['ship_code'] . "','" . $_REQUEST ['ship_street'] . "','','','','')";
//					mysql_query ( $cust_contactaddress );
//				}
//				/* Query copy billing address query ends*/
//				
//				$cust_contactscf = "INSERT INTO vtiger_contactscf (contactid) VALUES ('" . $cust_id . "')";
//				mysql_query ( $cust_contactscf ) or die ( "ERROR IN QUERY cust_contactscf erer @ LINE  " . __LINE__ . " " . mysql_error () );
//			
//			/**************CREATE CUSTOMER ENDS*******************/
//			
//			} else {
//				$row = mysql_fetch_array($resultdup);
//				
//				$cust_id = $row['contactid'];
//				//exit; 
//			}	
//		
//			/* Code ends - Girish*/
//			
//			$invoicebill = "insert into vtiger_invoicebillads (invoicebilladdressid,bill_city,bill_code,bill_country,bill_state,bill_street)
//		                  values 
//		                  ('" . $id . "','" . $_REQUEST ['bill_city'] . "','" . $_REQUEST ['bill_code'] . "','" . $_REQUEST ['bill_country'] . "'
//		                  ,'" . $_REQUEST ['bill_state'] . "','" . $_REQUEST ['bill_street'] . "')";
//			mysql_query ( $invoicebill ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
//			
//			$invoiceship = "insert into vtiger_invoiceshipads (invoiceshipaddressid,ship_city,ship_code,ship_country,ship_state,ship_street)
//		                  values 
//		                  ('" . $id . "','" . $_REQUEST ['ship_city'] . "','" . $_REQUEST ['ship_code'] . "','" . $_REQUEST ['ship_country'] . "'
//		                  ,'" . $_REQUEST ['ship_state'] . "','" . $_REQUEST ['ship_street'] . "')";
//			mysql_query ( $invoiceship ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
//			
//			//Code Commented By Shobhit
//			/*$getLine = "SELECT MAX(lineitem_id) AS `max` FROM vtiger_inventoryproductrel ";
//			$lineResult = mysql_query ( $getLine ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
//			$rowLine = mysql_fetch_assoc ( $lineResult );
//			
//			$lineItem = $rowLine ['max'] + 1;*/
//			
//			/* code to enter data in cash receipt if customer has credit amount*/
//			/*
//		       * Curently customer management is  not managed for customer we are entering 1 as default customer id*/
//			if ($_REQUEST ['credit_amt'] > 0) {
//				
//				$cash_id = getCrmid ( 'Cashreceipt' );
//				$cashReceipt = array ($cash_id, $id, $cust_id, ( float ) $_REQUEST ['grandtotal'], ( float ) $_REQUEST ['credit_amt'], 0, ( float ) $_REQUEST ['credit_amt'] );
//				
//				$adb->pquery ( "insert into vtiger_cashreceipt  set cashreceiptid= ? ,invoiceid = ?,customerid = ?,grandtotal = ?
//			    ,creditamount = ?,paidamount = ?,pendingamount =?,crediteddate = NOW()", $cashReceipt ) or die ( mysql_error () );
//			}
//			/* End of code to enter data in cash receipt if customer has credit amount*/
//		}	

		$getLine = "SELECT MAX(lineitem_id) AS `max` FROM vtiger_inventoryproductrel ";
		$lineResult = mysql_query ( $getLine ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
		$rowLine = mysql_fetch_assoc ( $lineResult );
			
		$lineItem = $rowLine ['max'] + 1;
		
		for($i = 0; $i < count ( $_REQUEST ['hndpid'] ); $i ++) {
			
			$productid = $_REQUEST ['hndpid'] [$i];
			$productName = $_REQUEST ['productName'] [$i];
			$qty = $_REQUEST ['qty'] [$i];
			$mrp = $_REQUEST ['mrp'] [$i];
			$vat = $_REQUEST ['vat'] [$i];
			
			/*if($_REQUEST ['category'] [$i] == "SPECIAL"){
				$vat = 0.00;
			} else {
				$vat = $_REQUEST ['vat'] [$i];
			}*/
			
			$bcode = $_REQUEST ['bcode'] [$i];			
			$taxAmount = (($mrp * $qty) * ($vat/100)); 		
			
			$proInsert = "INSERT IGNORE into vtiger_inventoryproductrel (id,productid,sequence_no,quantity,listprice,discount_amount,incrementondel,lineitem_id,vat,taxamount,netprice) value
			('" . $id . "','" . $productid . "',1,'" . $qty . "','" . $mrp . "','" . $_REQUEST ['discount'] [$i] . "',0,'" . $lineItem . "','" . $vat . "','" . $taxAmount . "'
			,'" . $_REQUEST ['netprice'] [$i] . "')";
			
			mysql_query ( $proInsert ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());			
			$lineItem ++;
			
			$getTransaction = "SELECT MAX(transaction_id) AS 'max' FROM vtiger_inventorytransaction WHERE productid='" . $productid . "' ";
			$transResult = mysql_query ( $getTransaction ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			$rowTrans = mysql_fetch_assoc ( $transResult );
			
			//Original Code
			/*$getTransactionWS = "SELECT MAX(transaction_id) AS `max`, opening_stock_WS_qty FROM vtiger_inventorytransaction WHERE productid='" . $productid . "' AND store_id = '" . $_SESSION ['warehouseid'] . "' ";
			$transResultWS = mysql_query ( $getTransactionWS ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			$rowTransWS = mysql_fetch_assoc ( $transResultWS );*/
			
			$getTransactionWS = "SELECT warehousestore_transaction_id AS `max`, opening_stock_qty, closing_stock FROM vtiger_warehousestore_inventorytransaction 
			WHERE productid='" . $productid . "' AND warehousestore_id = '" . $_SESSION ['warehouseid'] . "' ORDER BY warehousestore_transaction_id DESC LIMIT 1";
			$transResultWS = mysql_query ( $getTransactionWS ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			$rowTransWS = mysql_fetch_assoc ( $transResultWS );
			
			$getTransDetails = "SELECT * FROM vtiger_inventorytransaction WHERE transaction_id='" . $rowTrans ['max'] . "'";
			$transDetailResult = mysql_query ( $getTransDetails ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			$row = mysql_fetch_assoc ( $transDetailResult );
			
			$getCost = "SELECT cost FROM vtiger_products WHERE productid='" . $productid . "'";
			$costResult = mysql_query ( $getCost ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());			
			$rowCost = mysql_fetch_assoc ( $costResult );
			
			$opening_stock = $row ['closing_stock'];
			$newclosing_stock = $opening_stock - $qty;
			$opening_cost = $rowCost ['cost'];
			
			/*******Fetch Qty in stock from warehouse/store********/
			$query_WS = "SELECT * FROM vtiger_warehouse_stock WHERE warehouseid = '" . $_SESSION ['warehouseid'] . "' AND productid = '" . $productid . "'";
			$detail_WS = mysql_query ( $query_WS ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			$row_WS = mysql_fetch_assoc ( $detail_WS );
			/***************/
			
			$selectTransactionOfTheProduct = "SELECT transaction_id, opening_cost, final_stock FROM vtiger_inventorytransaction WHERE vtiger_inventorytransaction.productid = '". $productid ."' AND vtiger_inventorytransaction.final_stock > 0 ORDER BY transaction_id";
			$selectTransactionOfTheProductResultSet = mysql_query ( $selectTransactionOfTheProduct ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			
			$selectTransactionOfTheWHProduct = "SELECT warehousestore_transaction_id, opening_cost, final_stock FROM vtiger_warehousestore_inventorytransaction
			WHERE vtiger_warehousestore_inventorytransaction.productid = '". $productid ."' AND vtiger_warehousestore_inventorytransaction.warehousestore_id = '" . $_SESSION ['warehouseid'] . "' 
			AND vtiger_warehousestore_inventorytransaction.final_stock > 0 ORDER BY warehousestore_transaction_id";
			
//			$selectTransactionOfTheProductWH = "SELECT transaction_id, opening_cost, final_stock FROM vtiger_inventorytransaction WHERE vtiger_inventorytransaction.productid = '". $productid ."' AND vtiger_inventorytransaction.final_stock > 0 ORDER BY transaction_id";
			$selectTransactionOfTheWHProductResultSet = mysql_query ( $selectTransactionOfTheWHProduct ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
			
			if ($rowTransWS ['opening_stock_qty'] > 0) {
				$opening_stock_WS = $rowTransWS ['closing_stock'];
				$newclosing_stock_WS = $opening_stock_WS - $qty;
				
				//For Inventory Transaction.
				$reqQty = $qty;
				while($selectTransactionOfTheProductArray = mysql_fetch_assoc ( $selectTransactionOfTheProductResultSet )){
					error_log("START  :: {$reqQty}", 3, dirname(__FILE__)."/../../my-errors.log");
					if((int)$reqQty == 0 ) break;
					if($reqQty <= $selectTransactionOfTheProductArray['final_stock']):
						$transaction1 = "INSERT IGNORE INTO vtiger_inventorytransaction(DATE,productid,product_name,opening_stock_qty,opening_cost,inv_id,invoice_no,sales_qty,store_id,sales_cost,closing_stock,final_stock,unitprice, barcode)
										VALUES(NOW(),'" . $productid . "','" . $productName . "','" . $opening_stock . "','" . $selectTransactionOfTheProductArray['opening_cost'] . "','" . $id . "','" . $Invoice_no . "','" . $reqQty . "','" . $_SESSION ['warehouseid'] . "','" . $mrp . "','" . $newclosing_stock . "','0','" . $mrp . "', '" .$bcode. "')";
						mysql_query ( $transaction1 ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
						
						$updateFinalStock = "UPDATE vtiger_inventorytransaction SET final_stock = final_stock - " . $reqQty . " WHERE transaction_id = '" . $selectTransactionOfTheProductArray['transaction_id'] . "' ";
						mysql_query ( $updateFinalStock );
						error_log("QTY :: {$reqQty}", 3, dirname(__FILE__)."/../../my-errors.log");
						$reqQty = 0;
					else:						
						$transaction1 = "INSERT IGNORE INTO vtiger_inventorytransaction(DATE,productid,product_name,opening_stock_qty,opening_cost,inv_id,invoice_no,sales_qty,store_id,sales_cost,closing_stock,final_stock,unitprice)
										VALUES(NOW(),'" . $productid . "','" . $productName . "','" . $opening_stock . "','" . $selectTransactionOfTheProductArray['opening_cost'] . "','" . $id . "','" . $Invoice_no . "','" . $reqQty . "','" . $_SESSION ['warehouseid'] . "','" . $mrp . "','" . $newclosing_stock . "','0','" . $mrp . "')";
						mysql_query ( $transaction1 ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
						
						
						$updateFinalStock = "UPDATE vtiger_inventorytransaction SET final_stock = 0 WHERE transaction_id = '" . $selectTransactionOfTheProductArray['transaction_id'] . "' ";
						mysql_query ( $updateFinalStock );
						$reqQty = $reqQty - $selectTransactionOfTheProductArray['final_stock'];
						error_log("QTY :: {$reqQty}", 3, dirname(__FILE__)."/../../my-errors.log");
					endif;
				}
				
//				For Warehouse Transaction.
				$wreqQty = $qty;
				while($selectTransactionOfTheWHProductArray = mysql_fetch_assoc ( $selectTransactionOfTheWHProductResultSet )){
					error_log("START  :: {$wreqQty}", 3, dirname(__FILE__)."/../../my-errors.log");
					if((int)$wreqQty == 0 ) break;
					if($wreqQty <= $selectTransactionOfTheWHProductArray['final_stock']):
						$transaction2 = "INSERT IGNORE INTO vtiger_warehousestore_inventorytransaction(date, warehousestore_id, productid, product_name, opening_stock_qty, opening_cost, invoice_id, invoice_no, sales_qty, sales_cost, closing_stock, unitprice)
						VALUES(NOW(),'" . $_SESSION ['warehouseid'] . "','" . $productid . "','" . $productName . "','" . $opening_stock_WS . "','" . $selectTransactionOfTheWHProductArray['opening_cost'] . "','" . $id . "','" . $Invoice_no . "','" . $qty . "','" . $mrp . "','" . $newclosing_stock_WS . "','" . $mrp . "')";
						mysql_query ( $transaction2 ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
						
						$updateWHFinalStock = "UPDATE vtiger_warehousestore_inventorytransaction SET final_stock = final_stock - " . $wreqQty . " WHERE warehousestore_transaction_id = '" . $selectTransactionOfTheWHProductArray['warehousestore_transaction_id'] . "' ";
						mysql_query ( $updateWHFinalStock );
						error_log("QTY :: {$wreqQty}", 3, dirname(__FILE__)."/../../my-errors.log");
						$wreqQty = 0;
					else:						
						$transaction2 = "INSERT IGNORE INTO vtiger_warehousestore_inventorytransaction(date, warehousestore_id, productid, product_name, opening_stock_qty, opening_cost, invoice_id, invoice_no, sales_qty, sales_cost, closing_stock, unitprice)
						VALUES(NOW(),'" . $_SESSION ['warehouseid'] . "','" . $productid . "','" . $productName . "','" . $opening_stock_WS . "','" . $selectTransactionOfTheWHProductArray['opening_cost'] . "','" . $id . "','" . $Invoice_no . "','" . $qty . "','" . $mrp . "','" . $newclosing_stock_WS . "','" . $mrp . "')";
						mysql_query ( $transaction2 ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
												
						$updateFinalStock = "UPDATE vtiger_warehousestore_inventorytransaction SET final_stock = 0 WHERE warehousestore_transaction_id = '" . $selectTransactionOfTheWHProductArray['warehousestore_transaction_id'] . "' ";
						mysql_query ( $updateFinalStock );
						$wreqQty = $wreqQty - $selectTransactionOfTheWHProductArray['final_stock'];
						error_log("QTY :: {$wreqQty}", 3, dirname(__FILE__)."/../../my-errors.log");
					endif;
				}
				
//				$transaction1 = "INSERT IGNORE INTO vtiger_inventorytransaction(DATE,productid,opening_stock_qty,opening_stock_WS_qty,opening_cost,sales_qty,store_id,sales_cost,closing_stock,closing_stock_WS_qty)
//				VALUES(NOW(),'" . $productid . "','" . $opening_stock . "','" . $opening_stock_WS . "','" . $opening_cost . "','" . $qty . "','" . $_SESSION ['warehouseid'] . "','" . $mrp . "','" . $newclosing_stock . "','" . $newclosing_stock_WS . "')
//				";
//				mysql_query ( $transaction1 ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
								
//				$transaction2 = "INSERT IGNORE INTO vtiger_warehousestore_inventorytransaction(date, warehousestore_id, productid, product_name, opening_stock_qty, opening_cost, invoice_id, invoice_no, sales_qty, sales_cost, closing_stock, unitprice)
//				VALUES(NOW(),'" . $_SESSION ['warehouseid'] . "','" . $productid . "','" . $productName . "','" . $opening_stock_WS . "','" . $opening_cost . "','" . $id . "','" . $Invoice_no . "','" . $qty . "','" . $mrp . "','" . $newclosing_stock_WS . "','" . $mrp . "')
//				";
//				mysql_query ( $transaction2 ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());				
			}			
			/*****Query TO decrease sales quantity from main product table and from store table Girish dated 27 jan 2012 
			 $qty is sales quantity
			 *****/
			$update_vtiger_products = "UPDATE vtiger_products SET qtyinstock = qtyinstock - " . $qty . " WHERE productid = '" . $productid . "' ";
			mysql_query ( $update_vtiger_products );			
			//for store
			$update_vtiger_warehouse_stock = "UPDATE vtiger_warehouse_stock SET qty = qty - " . $qty . " WHERE productid = '" . $productid . "' AND warehouseid = '" . $_SESSION ['warehouseid'] . "' ";
			mysql_query ( $update_vtiger_warehouse_stock );
		/***********/
		
		}
		
		// Insert the sales man record.
		
		if($_REQUEST['salesmanuser'] != ""){
			
			$query = "INSERT INTO vtiger_salesman (userid, invoiceid, amount, date) VALUES ('" . $_REQUEST['salesmanuser'] . "', '" . $id . "', '" . $_REQUEST['grandtotal'] . "', NOW())";
			mysql_query($query) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error());
			
		}

		//Query To Insert the Billing Transaction.
//		if((!empty($_REQUEST['cash_amt']) && $_REQUEST['cash_amt'] != "0.00") && (!empty($_REQUEST['card_amt'])&& $_REQUEST['card_amt'] != "0.00") && (!empty($_REQUEST['bank_amt'])&& $_REQUEST['bank_amt'] != "0.00")):
//			$paymentMode = "cash/card/check";
//		elseif((!empty($_REQUEST['cash_amt']) && $_REQUEST['cash_amt'] != "0.00") && (!empty($_REQUEST['card_amt'])&& $_REQUEST['card_amt'] != "0.00")):
//			$paymentMode = "cash/card";	
//		elseif((!empty($_REQUEST['cash_amt']) && $_REQUEST['cash_amt'] != "0.00") && (!empty($_REQUEST['bank_amt'])&& $_REQUEST['bank_amt'] != "0.00")):
//			$paymentMode = "cash/check";	
//		elseif((!empty($_REQUEST['card_amt'])&& $_REQUEST['card_amt'] != "0.00") && (!empty($_REQUEST['bank_amt'])&& $_REQUEST['bank_amt'] != "0.00")):
//			$paymentMode = "card/check";			
//		elseif(!empty($_REQUEST['cash_amt']) && $_REQUEST['cash_amt'] != "0.00"):
//			$paymentMode = "cash";
//		elseif(!empty($_REQUEST['card_amt']) && $_REQUEST['card_amt'] != "0.00"):
//			$paymentMode = "card";			
//		elseif(!empty($_REQUEST['bank_amt']) && $_REQUEST['bank_amt'] != "0.00"):
//			$paymentMode = "check";	
//		endif;
//		

		$paymentMode = "cash";	
		$InvoiceDate = $_REQUEST['invoicedate'];
		$mysqlFormatInvoiceDate = date("Y-m-d H:i:s", strtotime($InvoiceDate));
		
		$query = "SELECT transactionid,  closingbalance FROM vtiger_debtortransaction WHERE userid = ".$cust_id." ORDER BY transactionid DESC LIMIT 1";
		$resultSet = mysql_query ( $query ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());
		$closingBalance = mysql_fetch_assoc ( $resultSet );

		if(!empty($closingBalance['closingbalance']) || $closingBalance['closingbalance']!='0.00'):
			$newOpeningBalance = $closingBalance['closingbalance'];
			$newClosingBalance = $closingBalance['closingbalance'] + $_REQUEST['credit_amt'];
		else:
			$newOpeningBalance = "0.00";
			$newClosingBalance = "0.00" + $_REQUEST['credit_amt'];	
		endif;		

		$InvoiceDate = $_REQUEST['invoicedate'];
		$mysqlFormatInvoiceDate = date('Y-m-d h:i:s', time());
		$_REQUEST ['cash_amt'] =  $_REQUEST ['grandtotal'];
		
		$billing_transaction = "INSERT IGNORE INTO vtiger_debtortransaction 
		(date, storeid, userid, username, openingbalance, invid, inv_no, grandtotal, amt_received_by_cash, amt_received_by_card, amt_received_by_check, mode_of_payment, bank_name, checkno, check_date, balance, closingbalance, modulename) VALUE
		('".$mysqlFormatInvoiceDate."', '".$_SESSION ['warehouseid']."', '".$cust_id."', '".$_REQUEST ['customername']."', '".$newOpeningBalance."', '".$id."', '".$Invoice_no."', '".( float ) $_REQUEST ['grandtotal']."', '".( float ) $_REQUEST ['cash_amt']."', '".( float ) $_REQUEST ['card_amt']."', '".( float ) $_REQUEST ['bank_amt']."', '".$paymentMode."', '".$_REQUEST ['bankname']."', '".$_REQUEST['chq_no']."', '".$_REQUEST ['chqdate']."', '".$_REQUEST['credit_amt']."', '".$newClosingBalance."', 'Sales')";
		mysql_query ( $billing_transaction ) or ("ERROR IN QUERY @ LINE  " . __LINE__ . " " . mysql_error ());

			mysql_query("COMMIT");
			
			return $id;

		} catch(Exception $e){
			
			mysql_query("ROLLBACK");
			
			return $id = 0;
		}
		
	}
	
	public function fetchRecordOnProductBase($barcode) {
		try {
			global $adb;
			
			$formData = array ('barcode' => $barcode );
			//$query = "SELECT * FROM vtiger_products as vp inner join vtiger_crmentity as crm  on
			// vp.productid=crm.crmid WHERE vp.barcode = ? and crm.deleted=0";
			$query = "SELECT vtiger_products.*, vtiger_warehouse_stock.qty  FROM vtiger_products, vtiger_warehouse_stock ,vtiger_crmentity WHERE vtiger_products.productid = vtiger_crmentity.crmid AND vtiger_crmentity.deleted=0 AND vtiger_products.productid = vtiger_warehouse_stock.productid AND  vtiger_warehouse_stock.qty > 0 AND vtiger_warehouse_stock.warehouseid = '" . $_SESSION ['warehouseid'] . "' AND vtiger_products.barcode= ? ";
			
			$resultSet = $adb->pquery ( $query, $formData );
			$data = $adb->fetchByAssoc ( $resultSet );
			
			/* checking product in clerance sale */
			if ($data) {
				
				$clearancequery = "select vp.productid as 'productid', vp.barcode as 'barcode',vp.productname as 'productname',
		                        vc.mrp as 'unit_price', vc.discount as 'discount', vc.vat as 'vat', vc.newmrp as netprice
						       from vtiger_clearance as vc inner join vtiger_products as vp
						       on vc.productid=vp.productid inner join  vtiger_crmentity as crm on crm.crmid=vc.clearanceid 				 	   
						 	   where vc.productid='" . $data ['productid'] . "'
						 	   and crm.deleted=0 and to_date >= NOW()";
				$cleranceResultSet = $adb->pquery ( $clearancequery, '' );
				$cleranceData = $adb->fetchByAssoc ( $cleranceResultSet );
			
			}
			/* end of code */
		
		} catch ( Exception $e ) {
			$e->getMessage ();
			$e->getTrace ();
		}
		
		if ($data) {
			if ($cleranceData) {
				return $cleranceData;
			
			} else {
				return $data;
			}
		} else {
			return false;
		}
	
	}
	
	public function getCachedProducts() {
		try {
			global $adb;
			$zend_cache = getCacheObject ();
			$cache_id = 'products_cache';
			$products = $zend_cache->load ( $cache_id );
			$json_data = "";
			
			if (true) {
				
				$query = "SELECT vp.productid as 'productid', vp.productname as 'productname', vp.barcode as 'barcode', vp.unit_price as 'unit_price', vp.netprice as netprice, vp.vat as 'vat', vp.discount as 'discount', vtiger_warehouse_stock.qty, vp.productcategory as category FROM vtiger_products vp, vtiger_warehouse_stock ,vtiger_crmentity WHERE vp.productid = vtiger_crmentity.crmid AND vtiger_crmentity.deleted=0 AND vp.productid = vtiger_warehouse_stock.productid AND  vtiger_warehouse_stock.qty > 0 AND vtiger_warehouse_stock.warehouseid = '" . $_SESSION ['warehouseid'] . "'";
				$resultSet = $adb->run_query_allrecords ( $query );
				$dataModel = array ();
				$cacheModel = array ();
				
				$i = 0;
				foreach ( $resultSet as $k => $arr ) {
					$barcode = $arr ['barcode'];
					foreach ( $arr as $key => $value ) {
						if (! is_numeric ( $key )) {
							$dataModel [$barcode] [$key] = $value;
							$cacheModel [$i] [$key] = $value;
						}
					}
					$i ++;
				}
				
				// checking product in clerance sale 
				if ($dataModel) {
					foreach ( $dataModel as $key => $value ) {
						$clearancequery = "select vp.productid as 'productid', vp.barcode as 'barcode',vp.productname as 'productname',
					                        vc.mrp as 'unit_price', vc.discount as 'discount', vc.vat as 'vat', vc.newmrp as netprice, vp.productcategory as category
									       from vtiger_clearance as vc 
									       inner join vtiger_products as vp on vc.productid=vp.productid 
									       inner join  vtiger_crmentity as crm on crm.crmid=vc.clearanceid 				 	   
									 	   where vc.productid='" . $dataModel [$key] ['productid'] . "'
									 	   and crm.deleted=0 and to_date >= NOW()";
						$cleranceResultSet = $adb->pquery ( $clearancequery, '' );
						$cleranceData = $adb->fetchByAssoc ( $cleranceResultSet );
						
						if ($key == $cleranceData ['barcode']) {
							$dataModel [$key] ['unit_price'] = $cleranceData ['unit_price'];
							$dataModel [$key] ['discount'] = $cleranceData ['discount'];
							$dataModel [$key] ['vat'] = $cleranceData ['vat'];
							$dataModel [$key] ['netprice'] = $cleranceData ['netprice'];
							
						}
					}
				}
				
				if ($cacheModel) {
					foreach ( $cacheModel as $key => $value ) {
						$clearancequery = "select vp.productid as 'productid', vp.barcode as 'barcode',vp.productname as 'productname',
					                        vc.mrp as 'unit_price', vc.discount as 'discount', vc.vat as 'vat', vc.newmrp as netprice, vp.productcategory as category
									       from vtiger_clearance as vc 
									       inner join vtiger_products as vp on vc.productid=vp.productid 
									       inner join  vtiger_crmentity as crm on crm.crmid=vc.clearanceid 				 	   
									 	   where vc.productid='" . $cacheModel [$key] ['productid'] . "'
									 	   and crm.deleted=0 and to_date >= NOW()";
						$cleranceResultSet = $adb->pquery ( $clearancequery, '' );
						$cleranceData = $adb->fetchByAssoc ( $cleranceResultSet );
						
						if ($cacheModel[$key] ['barcode'] == $cleranceData ['barcode']) {
							$cacheModel[$key] ['unit_price'] = $cleranceData ['unit_price'];
							$cacheModel[$key] ['discount'] = $cleranceData ['discount'];
							$cacheModel[$key] ['vat'] = $cleranceData ['vat'];
							$cacheModel[$key] ['netprice'] = $cleranceData ['netprice'];
						}
					}
				}
				
				$zend_cache->save ( $cacheModel, $cache_id );
				
				$json_data = Zend_Json::encode ( $dataModel );
				$cache_json_data = Zend_Json::encode ( $cacheModel );
				/* Write the data model in a JS file */
				$file=fopen("include/autocomplete/localdata.js","w");
				$str = "var datamodel = ". $cache_json_data;
				fwrite($file, $str);
			} else {
				$json_data = Zend_Json::encode ( $products );
			}
			/* end of code */
		} catch ( Exception $e ) {
			$e->getMessage ();
			$e->getTrace ();
		}
		
		if ($json_data) {
			
			echo $json_data;
		} else {
			echo false;
		}
	}
	
	/* Function will call on autocomplete event of product search */
	
	public function getOnAutoComplete($q) {
		try{
			if(!$q){
				return;
			}
			
			$zend_cache = getCacheObject ();
			$products = $zend_cache->load ('products_cache');
			$ahjx = array();
			
			
			/*
			echo "<pre>";
			print_r($products);
			exit;*/
			$i=0;
			foreach ($products as $key=>$arr) {
				if (strpos(strtolower($arr['productname']), $q) !== false) {
					
					$ahjx[$i] = $arr;
					
					//echo Zend_Json::encode($ahjx);
					$i++;
				}
				
			}
			/*echo "<pre>";
			print_r($ahjx);
*/			
			//exit;
			
			if($ahjx){
				echo Zend_Json::encode($ahjx);
			} else {
				$response[0] = "No Result Found";
				echo Zend_Json::encode($response);
			}
			
			
			
			
		} catch (Exception $e){
			
			
			
			$response['ERROR'] = $e->getMessage ();
				echo Zend_Json::encode($response);
				
				$e->getTrace();
		}
	}
	public function fetchInvoiceNo($invid){
		global $adb;
		$query = "SELECT invoice_no FROM vtiger_invoice WHERE invoiceid = ' ".$invid."'";
		$resultSet = $adb->pquery ( $query, '' );
		$record = $adb->fetchByAssoc ( $resultSet );
		return $record;
	}

	public function loadRoyalityPoints($_REQUEST){
		global $adb;
		
		$royalitynumber = trim($_REQUEST['royalitynumber']);
		
		$query = "SELECT royalitynumber FROM vtiger_contactroyality WHERE royalitynumber = '". $royalitynumber ."'";
		$resultSet = $adb->pquery ( $query, '' );
		$record = $adb->fetchByAssoc ( $resultSet );
		
		if($record['royalitynumber']){
			// TODO
			
			// Fetch the record of royality number 
			
			$query = "SELECT a.royalityid, a.royalitycount, b.firstname, b.mobile FROM vtiger_contactroyality a INNER JOIN vtiger_contactdetails b WHERE a.royalitynumber='". $_REQUEST['royalitynumber'] ."' AND a.contactid = b.contactid";
			$resultSet = $adb->pquery ( $query, '' );
			$record = $adb->fetchByAssoc ( $resultSet );
					
			// Call a function to get the complete royality

			  $moneyearned = $this->calculateRoyalityPoints($record['royalitycount']);
			
			  $record['moneyearned'] = $moneyearned;
			  
			  $json_record = json_encode($record);
		
			  echo $json_record;
			
		} else {
			echo $record = 1;   
		}
		
	}
	
	
	public function calculateRoyalityPoints($royalitycount){
			// Fetch the equation of royality program.
			global $adb;
		
			$query = "SELECT royality_count, royalityamount FROM vtiger_royality WHERE (current_date >= from_date AND current_date <= to_date) AND deleted=0";
			$resultSet = $adb->run_query_allrecords ( $query );
			
			foreach ( $resultSet as $k => $arr ) {	
				foreach ( $arr as $key => $value ) {
					if (! is_numeric ( $key )) {
						$royalityRecord[$k][$key] = $value;
					}
				}
			}
			
			rsort($royalityRecord);
			foreach($royalityRecord as $key=>$value){
				
				if($royalitycount > $value['royality_count']){
					
					$floorofrcount = floor($royalitycount/$value['royality_count']);
					$moneyearned1 = $floorofrcount * $value['royalityamount']; 															
					$remainingcount = $royalitycount - ($value['royality_count'] * $floorofrcount);
					
					if($remainingcount > $royalityRecord[$key+1]['royality_count']){
						$floorofsecondtoprcount = floor($remainingcount / $royalityRecord[$key+1]['royality_count']);
						$moneyearned2 = $floorofsecondtoprcount * $royalityRecord[$key+1]['royalityamount']; 
						$remaininglastcount = $remainingcount - ($royalityRecord[$key+1]['royality_count'] * $floorofsecondtoprcount);
						
						if($remaininglastcount > $royalityRecord[$key+2]['royality_count']){
							$moneyearned3 = ($remaininglastcount / $royalityRecord[$key+2]['royality_count']) * $royalityRecord[$key+2]['royalityamount'];
						}
					}
					
					$moneyearned = $moneyearned1 + $moneyearned2 + $moneyearned3;
					
				} 
			}
			
			return $moneyearned;
			
	}
	
	
}
?>