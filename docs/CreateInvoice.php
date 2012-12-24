<?php

require_once('include/mpdf/mpdf.php');

class CreateInvoice {
	var $db;
	
	private function getAddress($id){
		global $adb;
		
		$query = "SELECT warehouse_name, address1, address2, street, city, state, country, mobile, landline FROM vtiger_warehouse WHERE identifier='ST' and warehouseid = ?";
		$result = $adb->pquery($query, array($id));
		$record = $adb->fetchByAssoc($result);
		
		return $record;
	}
	
	private function getInvoicetandc(){
		global $adb;
		$type = "Inventory";
		
		$query = "SELECT tandc FROM vtiger_inventory_tandc";
		//$result = $adb->pquery($query, array($type));
		$record = $adb->run_query_allrecords($query);
	
		return $record;
	}
	
	private function getPrint($consolidate_data){
		
		 $handle = printer_open('TSP650');
			
		 // Starting Print JOB Document
		 printer_start_doc($handle, "Invoice");
		  printer_start_page($handle);
		 
		 //Setting Printer Mode to RAW
		 printer_set_option($handle, PRINTER_MODE, "TEXT");
		 printer_set_option($handle, PRINTER_PAPER_FORMAT, PRINTER_FORMAT_CUSTOM);
		 printer_set_option($handle, PRINTER_PAPER_WIDTH, "78");
		 printer_set_option($handle, PRINTER_TEXT_ALIGN, PRINTER_TA_CENTER);
		 //printer_set_option($handle, PRINTER_TEXT_ALIGN, PRINTER_TA_CENTER);
		 
		 // Starting Print Page
		
		 $pen = printer_create_pen(PRINTER_PEN_SOLID, 10, "000000");
		 printer_select_pen($handle, $pen);
		 
		 $superbold = printer_create_font("Arial", 40, 15, PRINTER_FW_BOLD, false, false, false, 0);
		 $bold = printer_create_font("Arial", 30, 10, PRINTER_FW_BOLD, false, false, false, 0);
		 $normal = printer_create_font("Arial", 30, 10, PRINTER_FW_NORMAL, false, false, false, 0);
		 
		 printer_select_font($handle, $superbold);
		 
		 printer_draw_text($handle, $consolidate_data['companyname'], 160, 30);
		 
		 printer_select_font($handle, $normal);
		 printer_draw_text($handle, $consolidate_data['address1'], 130, 60);
		 printer_draw_text($handle, $consolidate_data['address2'], 200, 90);
		 printer_draw_text($handle, $consolidate_data['phone'], 200, 120);
		 
		 printer_draw_text($handle, "Tax Invoice No. ". $consolidate_data['invoiceno'], 5, 150);
		 
		 printer_select_font($handle, $bold);
		 printer_draw_text($handle, "User: ". $consolidate_data['salesman'], 5, 180);
		 printer_draw_text($handle, date("d-m-y"), 400, 180);
		 
		 printer_select_font($handle, $normal);
		 printer_draw_text($handle, "-------------------------------------------------------------------------------------", 5, 210);
		 
		 //Header starts from here
		 
		 printer_draw_text($handle, "Item Name", 5, 235);
		 printer_draw_text($handle, "Price", 260, 235);
		 printer_draw_text($handle, "Qty.", 360, 235);
		 printer_draw_text($handle, "Total", 480, 235);
		 
		 printer_draw_text($handle, "-------------------------------------------------------------------------------------", 5, 260);
		 
		 /* Roylty points earned by the customer */
		 
		 if($_SESSION['royalitypointsearned'] > 0) {
			 printer_select_font($handle, $bold);
			 $yaxis = 290;
			 printer_draw_text($handle, "Congratulations!! you have earned royalty points", 5, $yaxis);
			 $yaxis = 290 + 30;
			 printer_draw_text($handle, $_SESSION['royalitypointsearned'], 450, $yaxis);
		 }
		 
		 $yaxis = $yaxis + 30;
		 foreach($consolidate_data["productsdata"] as $k=>$value){
		 	
		 	printer_select_font($handle, $normal);	 	
			$sno = $k+1;
			$bcode = $value['barcodeid'];
			$pname = $value['productName'];
			$quantity = $value['qty'];
			$unitprice = $value['mrp'];
			$discount = $value['discount'];
			$vat = $value['vat'];
			$price = $value['mrp'] + ($value['mrp'] * ($value['vat']/100));
			$price = number_format($price, 2, '.', '');
			$total = number_format($value['netprice'], 2, '.', '');
						
			printer_draw_text($handle, trim($pname), 5, $yaxis);
			printer_draw_text($handle, trim($price), 260, $yaxis);
		 	printer_draw_text($handle, $quantity, 370, $yaxis);
		 	printer_draw_text($handle, $total, 450, $yaxis);
		 	
		 	if($value['itemdiscount']>0){
		 		printer_select_font($handle, $bold);
		 		$yaxis = $yaxis+30;
		 		$dis = number_format($value['itemdiscount'], 2, '.', '');
		 		printer_draw_text($handle, "Fantastic Discount", 20, $yaxis);
		 		printer_draw_text($handle, "-".$dis, 380, $yaxis);
		 	}
			
			$yaxis = $yaxis + 30;
			
		}
				
		$yaxis = $yaxis+10;
		printer_draw_text($handle, "-------------------------------------------------------------------------------------------------", 5, $yaxis);
	
		printer_select_font($handle, $bold);
		
		if($consolidate_data['royaltydiscount'] > 0){
			$yaxis = $yaxis+30;
			printer_draw_text($handle, "Royalty Discount", 5, $yaxis);
			$royaltydiscount = number_format($consolidate_data['royaltydiscount'], 2, '.', '');
			printer_draw_text($handle, $royaltydiscount, 450, $yaxis);
		}
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "Grand Total", 5, $yaxis);
		$gtotal = number_format($consolidate_data['grandtotal'], 2, '.', '');
		printer_draw_text($handle, $gtotal, 450, $yaxis);
		
		if($consolidate_data['totaldiscount'] > 0){		
			$yaxis = $yaxis+30;
			printer_draw_text($handle, "Saved Total", 5, $yaxis);
			$totaldiscount = number_format($consolidate_data['totaldiscount'], 2, '.', '');
			printer_draw_text($handle, $totaldiscount, 450, $yaxis);
		}
		
		$yaxis = $yaxis+30;
		printer_select_font($handle, $bold);
		printer_draw_text($handle, "-------------------------------------------------------------------------------------------------", 5, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "Terms & Conditions", 30, $yaxis);
		
		printer_select_font($handle, $normal);
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "NO CASH REFUND IN ANY CASE", 5, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "YOU CAN EXCHANGE THE GOODS (AFTERNOON 12:00 PM)", 5, $yaxis);
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "WITHIN THREE DAYS FROM THE DATE", 15, $yaxis);
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "OF THE PURCHASE.", 15, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "INVOICE MUST FOR EXCHANGE", 5, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "THERE IS NO GUARANTEE FOR SILK, JARI,", 5, $yaxis);
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "READYMADE AND OTHER FANCY ITEMS.", 15, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "-------------------------------------------------------------------------------------------------", 5, $yaxis);
		
		printer_select_font($handle, $bold);
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "THANKS YOU FOR SHOPPING @ PREM TEXTILE", 30, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "VAT RegNo.: ".$consolidate_data['tin'], 30, $yaxis);
		
		$yaxis = $yaxis+30;
		printer_draw_text($handle, "-------------------------------", 200, $yaxis);
				
		printer_delete_pen($pen);
		 // Ending Print Page
		 printer_end_page($handle);
		 
		 // Ending Print JOB Document
		 printer_end_doc($handle);
		 
		// Closing Printer
		 printer_close($handle);
		
	}
	
	function salesinvoice($_REQUEST, $app_strings){
		/* Generate consolidated array fo data */
		$consolidate_data = array();
		$consolidate_data['productsdata'] = array();
		$consolidate_data['tax_segregation'] = array();
		$discount = 0;
		
		foreach($_REQUEST as $key=>$value){
			
			if($key == 'productName') {
				foreach($_REQUEST['productName'] as $k=>$value){
					$pname = str_pad($value,25," ");
					$consolidate_data['productsdata'][$k]['productName'] = $pname;
				}
			}
				
			if($key == 'mrp'){
				foreach($_REQUEST['mrp'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['mrp'] = $value;
				}
			}
			
			if($key == 'qty'){
				foreach($_REQUEST['qty'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['qty'] = $value;
				}
			}
			
			if($key == 'discount'){
				foreach($_REQUEST['discount'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['discount'] = $value;
				}
			}
			
			if($key == 'vat'){
				foreach($_REQUEST['vat'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['vat'] = $value;
					
				}
			}
			
			if($key == 'netprice'){
				foreach($_REQUEST['netprice'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['netprice'] = $value;
				}
			}
				
			if($key == 'hndpid'){
				foreach($_REQUEST['hndpid'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['hndpid'] = $value;
				}
			}
			
			if($key == 'barcodeid'){
				foreach($_REQUEST['barcodeid'] as $k=>$value){
					$consolidate_data['productsdata'][$k]['barcodeid'] = $value;
				}
			}
				
			if($key == 'nettotal')
				$consolidate_data['nettotal'] = $_REQUEST['nettotal'];
			
			if($key == 'totaldiscount') {
				$consolidate_data['totaldiscount'] = $_REQUEST['totaldiscount'];
				$consolidate_data['royaltydiscount'] = $_REQUEST['totaldiscount'];
			}
				
			/*else
				$consolidate_data['totaldiscount'] = $discount;*/
			
			if($key == 'adjustment')
				$consolidate_data['adjustment'] = $_REQUEST['adjustment'];
			
			if($key == 'grandtotal')
				$consolidate_data['grandtotal'] = $_REQUEST['grandtotal'];
			
			if($key == 'invoice_no')
				$consolidate_data['invoice_no'] = $_REQUEST['invoice_no'];
			
			if($key == 'invoicedate')
				$consolidate_data['invoicedate'] = $_REQUEST['invoicedate'];
		}	
		
		/* Creating invoice in txt file */
		
	/* Creating invoice in txt file */
		        
	     if($consolidate_data['productsdata']){
	            
	            $filepathhtml = 'test/product/'. $_REQUEST['invoice_no'] . '.html';
	            $_REQUEST['filepathtxt'] = $filepathhtml;
	            
	            if (!($fpinv = fopen($filepathhtml, 'w'))) {
	                  return;
	            }
	            
	            foreach($consolidate_data['productsdata'] as $key=>$arr){
	            	$taxable_value = $arr['mrp'] * $arr['qty'];
	            	$taxable_value = $taxable_value - ($taxable_value * ($arr['discount']/100));
	            	$tax_amount = ($taxable_value * ($arr['vat']/100));
	            	
	            	$netmrp_peritem =  $arr['mrp'] + ($arr['mrp'] * ($arr['vat']/100));
	            	$itemdiscount = round($netmrp_peritem * ($arr['discount']/100));
					$consolidate_data['productsdata'][$key]['itemdiscount'] = $itemdiscount;
					$consolidate_data['totaldiscount'] = $consolidate_data['totaldiscount'] + $itemdiscount;
					//$discount += $itemdiscount;
	            		            	
	            	$consolidate_data['tax_segregation'][$arr['vat']]['taxable_value'] += $taxable_value; 
	            	$consolidate_data['tax_segregation'][$arr['vat']]['tax_amount'] += $tax_amount;
	            	
	            	$consolidate_data['tax_segregation']['total']['total_taxable_value'] += $taxable_value;
	            	$consolidate_data['tax_segregation']['total']['total_tax'] += $tax_amount;
	            	
	            }
	            	$consolidate_data['tax_segregation']['total']['gross_total'] = $consolidate_data['tax_segregation']['total']['total_taxable_value'] + $consolidate_data['tax_segregation']['total']['total_tax'];
	           
	            // Calling method for desiging the invoice layout
	           // $html = $this->invoiceLayoutGenerator($consolidate_data, $_REQUEST);
	            $html = $this->textInvoiceLayoutGenerator($consolidate_data, $_REQUEST);
	            
	            $this->getPrint($html);
	            /* Open and write a HTML file */
	            /*fwrite($fpinv,$html);
				
	            $mpdf=new mPDF('c','A4','','' , 0 , 0 , 0 , 0 , 0 , 0); 
				$mpdf->SetDisplayMode('fullpage');
				$mpdf->list_indent_first_level = 0;	// 1 or 0 - whether to indent the first level of a list
				$mpdf->WriteHTML(file_get_contents($filepathhtml));
				$pdffile = 'test/product/'. $_REQUEST['invoice_no'] . ".pdf";
				$mpdf->Output($pdffile,'F');*/
				
				//unlink('../../' . $filepathhtml);
	            
	            fclose($fpinv);
	         
		}
			return $pdffile;
	}
	
	/* Invoice Layout Generator */
	
	public function textInvoiceLayoutGenerator($consolidate_data, $_REQUEST){
		
		global $app_strings;
		global $adb;
		
		$customername = $_REQUEST['customername'];
	    
	    $country = $_REQUEST['bill_country'];
	    $gtotal = $_REQUEST['grandtotal'];
	    $grandtotalinword = $this->convert_number($gtotal);
	    $grandtotalinword .= " Only.";
	    
	    //$phone = str_pad($_REQUEST['mobile'], 40, " ");
	    
		$inv = $_REQUEST ['invoice_no'];
		$invoicedate = $_REQUEST['invoicedate'];
		
		$nettotal = $_REQUEST['nettotal'];
		$totaldiscount = $_REQUEST['totaldiscount'];
				   
	    $customername = ($_REQUEST['customername'])?$_REQUEST['customername']:"";
	    $mobile = ($_REQUEST['mobile'])?$_REQUEST['mobile']:"";
	     
		$gtotal = $_REQUEST['grandtotal'];
		
		//$store_add = $this->getAddress($_SESSION['warehouseid']);
				
		/*$company = $app_strings[companyname];
		$address1 = $app_strings['address1'];
		$address2 = $app_strings['address2'];
		//$address3 = $store_add['city'] .','. $store_add['state'] .','. $store_add['country'];
		$phone = $app_strings['companyphone'];
		$tin = $app_strings[tin];
		$cst = $app_strings[CST];*/
		
		$consolidate_data['invoiceno'] = $inv;
		$consolidate_data['grandtotalinword'] = $grandtotalinword;
		$consolidate_data['companyname'] = $app_strings[companyname];
		$consolidate_data['tin'] = $app_strings[tin];
		$consolidate_data['address1'] = $app_strings['address1'];;
		$consolidate_data['address2'] = $app_strings['address2'];
		$consolidate_data['phone'] = $app_strings['companyphone'];;
		
		/* Fetch sales man name */
		$query = "SELECT concat(first_name, ' ', last_name) as salesmanname FROM vtiger_users WHERE id='". $_REQUEST ['salesmanuser'] ."'";
		$resultSet = $adb->pquery ( $query, '' );
		$record = $adb->fetchByAssoc ( $resultSet );
		
		$consolidate_data['salesman'] = $record['salesmanname'];
				
		return $consolidate_data;
		
	}
	
	public function invoiceLayoutGenerator($consolidate_data, $_REQUEST){
	
	global $app_strings;
	
	$customername = $_REQUEST['customername'];
    
    $country = $_REQUEST['bill_country'];
    $gtotal = $_REQUEST['grandtotal'];
    $grandtotalinword = $this->convert_number($gtotal);
    $grandtotalinword .= " Only.";
    
    //$phone = str_pad($_REQUEST['mobile'], 40, " ");
    
	$inv = $_REQUEST ['invoice_no'];
	$invoicedate = $_REQUEST['invoicedate'];
	
	$nettotal = $_REQUEST['nettotal'];
	$totaldiscount = $_REQUEST['totaldiscount'];
	$adjustmentType = $_REQUEST['adjustmentType'];
	$adjustment = $_REQUEST['adjustment'];
	
	$cash_amt = ($_REQUEST['cash_amt'])?$_REQUEST['cash_amt']:0.00;;
	
    $credit_amt = ($_REQUEST['credit_amt'])?$_REQUEST['credit_amt']:0.00;
    $card_amt = ($_REQUEST['card_amt'])?$_REQUEST['card_amt']:0.00;
    $bank_amt = ($_REQUEST['bank_amt'])?$_REQUEST['bank_amt']:0.00;
    $chqdate = ($_REQUEST['chqdate'])?$_REQUEST['chqdate']:"";
    $bankname = ($_REQUEST['bankname'])?$_REQUEST['bankname']:"";
    $chq_no = ($_REQUEST['chq_no'])?$_REQUEST['chq_no']:"";
    
    $customername = ($_REQUEST['customername'])?$_REQUEST['customername']:"";
    $mobile = ($_REQUEST['mobile'])?$_REQUEST['mobile']:"";
     
    if($_REQUEST['bill_street']) {
	    $baddress1 = str_pad(substr($_REQUEST['bill_street'], 0 , 25),40," ");
	    $baddress2 = str_pad(substr($_REQUEST['bill_street'], 26 , 50),40," ");
	    $baddress3 = str_pad(substr($_REQUEST['bill_street'], 51),40," ");
    }
    
    if($_REQUEST['bill_city']) {
    	$baddress4 = $_REQUEST['bill_city'] . "," . $_REQUEST['bill_state'] . "-" . $_REQUEST['bill_code'];
    }
    $bcountry = ($_REQUEST['bill_country'])?$_REQUEST['bill_country']:"";
	
	$gtotal = $_REQUEST['grandtotal'];
	
	$store_add = $this->getAddress($_SESSION['warehouseid']);
			
	$company = $app_strings[companyname];
	$address1 = $store_add['address1'];
	$address2 = $store_add['address2'];
	$address3 = $store_add['city'] .','. $store_add['state'] .','. $store_add['country'];
	$phone = $store_add['mobile'] . ' ' . $store_add['phone'];
	$tin = $app_strings[tin];
	$cst = $app_strings[CST];

	 $html = '<html>
		<head>
		<title>Print Invoice</title>
		<style>
		*
		{margin:0;padding:0;font-family:Arial;font-size:10pt;color:#000;}
		body{width:100%;font-family:Arial;font-size:10pt;margin:0;padding:0;}
		p{margin:0;padding:0;}
		#wrapper{width:180mm;margin:0 15mm;}
		.page{height:297mm;width:210mm;page-break-after:always;}
		table{border-left: 1px solid #000;border-top: 1px solid #000;border-spacing:0;border-collapse: collapse;}
		table td{border-right: 1px solid #000;border-bottom: 1px solid #000;padding: 3px;}
		table.heading{height:50mm;}
		h1.heading{font-size:14pt;color:#000;font-weight:normal;}
		h2.heading{font-size:9pt;color:#000;font-weight:normal;}
		hr{color:#000;background:#000;}
		#invoice_body{height: auto;}
		#invoice_body , #invoice_total{width:100%;}
		#invoice_body table , #invoice_total table{width:100%;border-left: 1px solid #000;border-top: 1px solid #000;border-spacing:0;border-collapse: collapse;;
		}
		#tax_total, #payment_modes{width:100%;background-color:#f0f7f8;}
		
		#payment_modes tr, #tax_total tr{background-color:#e5eaeb;}
		#invoice_body table td , #invoice_total table td
		{
		text-align:center;
		font-size:9pt;
		border-right: 1px solid #000;
		border-bottom: 1px solid #000;
		padding:3px;
		}
		
		#invoice_body table td.mono  , #invoice_total table td.mono
		{
		font-family:monospace;
		text-align:right;
		padding-right:3mm;
		font-size:10pt;
		}
		
		#footer
		{
		width:180mm;
		margin:0 15mm;
		padding-bottom:3mm;
		}
		#footer table
		{
		width:100%;
		border-left: 1px solid #000;
		border-top: 1px solid #000;
		
		background:#eee;
		
		border-spacing:0;
		border-collapse: collapse;
		}
		#footer table td
		{
		width:25%;
		text-align:center;
		font-size:9pt;
		border-right: 1px solid #000;
		border-bottom: 1px solid #000;
		}
		</style>
		</head>
<body>
<div id="wrapper">
    <br />
    <table class="heading" style="width:100%;">
    	<tr>
    		<td style="width:70%;padding:0px;border:0px;">
				<table style="width:100%;border:0px;">
					<tr>
						<!-- <td style="width:30%;">
								<img style="vertical-align: top" src="test/logo/vtiger-crm-logo.JPG" width="120" />
						</td> -->
						<td style="width:70%;">
							<h1 class="heading">'. $company .'</h1>';
							$html .= '<h2 class="heading">';
							$html .= $address1.'<br />';
							$html .= $address2 .'<br />';
							$html .= $address3 .'<br />';
							$html .= 'Phone : ' . $phone . '<br />';
							//$html .= 'Email: '. $app_strings['email'] .'<br />';
							$html .= '</h2>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top" align="right" style="padding:0px;">
				<table style="width:100%">
					<tr><td colspan=2 style="background:#4d4d4d;color:#ffffff;font-weight:bold;">CASH / CREDIT / TAX INVOICE</td></tr>
					<tr><td style="padding:1mm;">TIN : '. $tin .' </td></tr>
					<tr><td style="padding:1mm;">CST : '. $cst .' </td></tr>
				</table>
			</td>
		</tr>
    	<tr>
    		<td style="width:70%;">
    			<b>To,</b> <br />';
				$html .= $customername . '<br />';
				$html .= $_REQUEST['bill_street'] . '<br />';
				$html .= $baddress4 . '<br />';
				$html .= $bcountry  . '<br />';
				$html .= "Mobile::>". $mobile  . '<br />';
				$html .= '</td>';
				$html .= '<td valign="top" align="right" style="padding:0px;">';
				$html .= '<table style="width:100%">';
				$html .= '<tr>';
				$html .= '<td>Invoice No </td>';
				$html .= '<td>' . $inv . '</td></tr>';
				$html .= '<tr>';
				$html .= '<td>Invoice Date </td>';
				$html .= '<td>' . $invoicedate . '</td></tr>';
				$html .= '</table>
			</td>
    	</tr>
    </table>
	
	<div id="content">
		<div id="invoice_body">
			<table style="width:100%;">
			<tr style="background:#eee;">
				<td style="width:5%;"><b>S.No.</b></td>
				<td style="width:10%;"><b>Barcode</b></td>
				<td style="width:30%;"><b>Item name</b></td>
				<td style="width:8%;"><b>Quantity</b></td>
				<td style="width:10%;"><b>Rate</b></td>
				<td style="width:10%;"><b>Discount(%)</b></td>
				<td style="width:8%;"><b>VAT (%)</b></td>
				<td style="width:19%;"><b>Net price</b></td>
			</tr>';
	 		foreach($consolidate_data['productsdata'] as $k=>$value){
	 				            
	            $sno = $k+1;
				$bcode = $value['barcodeid'];
				$pname = $value['productName'];
				$quantity = $value['qty'];
				$unitprice = $value['mrp'];
				$discount = $value['discount'];
				$vat = $value['vat'];
				$vatamount = ($value['mrp'] * ($value['vat']/100));
				$vatamount = number_format($vatamount, 2, '.', '');
				$mrp = $unitprice + $vatamount;
				$mrp = number_format($mrp, 2, '.', '');
				$total = $value['netprice'];
	 			
				$html .= '<tr>';
				$html .= '<td style="width:5%;">'.$sno.'</td>';
				$html .= '<td style="width:10%;" align="right">'.$bcode.'</td>';
				$html .= '<td style="padding-left:10px;" style="width:30%;" align="right">'.$pname.'</td>';
				$html .= '<td class="mono" style="width:8%;" align="right">'.$quantity.'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'.$mrp.'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'. $discount .'</td>';
				$html .= '<td style="width:8%;" class="mono" align="right">'. $vat .'</td>';
				$html .= '<td style="width:19%;" class="mono" align="right">'. $total .'</td>';
				$html .= '</tr>';
	 		}
	 		
	 		$adjustmentsymbol = ($adjustmentType=='add')?'+':'-';
			$html .= '<tr>
				
			</tr>
		</table>
		</div>
	
		<div id="invoice_total">
			<table style="width:100%;">
				<tr>
					<td style="text-align:left; padding-left:10px;" colspan="6">'. $grandtotalinword .'</td>
					<td style="width:10%;">Rs.</td>
					<td style="width:15%;" class="mono">'. $gtotal .'</td>
				</tr>
			</table>
		</div>
		
		<div id="payment_modes">
			
			<table style="width:100%">';
				$html .= '<tr>
					<td style="text-align:right; padding-right:10px;">Amount paid by cash</td>
					<td style="width:10%;">Rs.</td>
					<td style="width:15%;" class="mono" align="right">'. number_format($cash_amt, 2, '.', '') .'</td>
				</tr>';
				
				if($card_amt>0) {
					$html .= '<tr>
						<td style="text-align:right; padding-right:10px;">Amount paid by card</td>
						<td style="width:10%;">Rs.</td>
						<td style="width:15%;" class="mono" align="right">'. number_format($card_amt, 2, '.', '') .'</td>
					</tr>';
				}
				
				if($credit_amt>0) {
					$html .= '<tr>
						<td style="text-align:right; padding-right:10px;">Credit amount</td>
						<td style="width:10%;">Rs.</td>
						<td style="width:15%;" class="mono" align="right">'. number_format($credit_amt, 2, '.', '') .'</td>
					</tr>';
				}
				
				if($bank_amt>0) {
					$html .= '<tr>
						<td style="width:100%;" colspan="3">
							<table style="width:100%;" >
								<tr>
									<td colspan="4">Amount paid by check</td>
								</tr>
								<tr>
									<td style="width:25%;" align="center">Check date</td>
									<td style="width:25%;" align="center">Check Number</td>
									<td style="width:25%;" class="mono" align="center">Bank Name</td>
									<td style="width:25%;" class="mono" align="center">Check Amount</td>
								</tr> 
								<tr>
									<td style="width:25%;" align="right">'. $chqdate .'</td>
									<td style="width:25%;" align="right">'. $chq_no .'</td>
									<td style="width:25%;" class="mono" align="right">'. $bankname .'</td>
									<td style="width:25%;" class="mono" align="right">'. number_format($bank_amt, 2, '.', '') .'</td>
								</tr> 
							</table>
						</td>
						
					</tr>';
				}
			$html .= '</table>
		</div>';
		
		$tandc = $this->getInvoicetandc();
		
		
		
		$html .= '<hr />
		<table style="width:100%; height:35mm;">
			<tr>
				<td style="width:70%;" valign="top">
					<b>Terms and Conditions</b><br />';
					
					foreach($tandc as $key=>$value) {
						$html .= $value['tandc'] . '<br/>';
					}
					
		$html .= '</td>
				<td style="width:30%;" >
				<div id="box">
					For <b>'. $company .'</b><br />
					<br/><br/><br/><br/>
					Authorised Signatory
				</div>
				</td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>';
	 return $html;
}
	
	function salesreturninvoice($_REQUEST, $app_strings){
		
		$consolidate_data = array();
		$consolidate_data['productsdata'] = array();
		$consolidate_data['nettotal'] = 0;
		$grandtotal = 0;
		$rerurndataindex = array();
		$i=0;
		foreach($_REQUEST['saleret_price'] as $key=>$value){
			if($value != ''){
				$rerurndataindex[$i] = $key;
			}
			$i++;
		}
			
		foreach($_REQUEST as $key=>$value){
			
			if($key == 'productName') {
				foreach($_REQUEST['productName'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$pname = str_pad($value,25," ");
						$consolidate_data['productsdata'][$k]['productName'] = $pname;
					}
				}
			}
				
			if($key == 'price'){
				foreach($_REQUEST['price'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['price'] = $value;
					}
				}
			}
			
			if($key == 'saleret'){
				foreach($_REQUEST['saleret'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['saleret'] = $value;
					}
				}
			}
			
			if($key == 'discount'){
				foreach($_REQUEST['discount'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['discount'] = $value;
					}
				}
			}
			
			if($key == 'vat'){
				foreach($_REQUEST['vat'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['vat'] = $value;
					}
				}
			}
			
			if($key == 'saleret_price'){
				foreach($_REQUEST['saleret_price'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['netprice'] = $value;
						$grandtotal = $grandtotal + $value;
						//$consolidate_data['nettotal'] += $value;
					}
				}
			}
					
			if($key == 'hndid'){
				foreach($_REQUEST['hndid'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['hndid'] = $value;
					}
				}
			}
			
			if($key == 'barcodeid'){
				foreach($_REQUEST['barcodeid'] as $k=>$value){
					if(in_array($k, $rerurndataindex)){
						$consolidate_data['productsdata'][$k]['barcodeid'] = $value;
					}
				}
			}
		
				$consolidate_data['grandtotal'] = $grandtotal;
			
			if($key == 'invoiceid')
				$consolidate_data['invoice_no'] = $_REQUEST['invoiceid'];
				
			if($key == 'invoice')
				$consolidate_data['invoice'] = $_REQUEST['invoice'];
		
				$consolidate_data['invoicedate'] =  date("d/m/Y");   //$_REQUEST['invoicedate'];
				
				$consolidate_data['salesretid'] = $_REQUEST['sales_ret_id'];
		}

		/* Creating invoice in txt file */
		if($consolidate_data['productsdata']){
			
				$filepathhtml = 'test/salesreturn/' . $_REQUEST['sales_ret_id'] . '.html';
	            $_REQUEST['filepathtxt'] = $filepathhtml;
	            
	            if (!($fpinv = fopen($filepathhtml, 'w'))) {
	                  return;
	            }
	            
	            foreach($consolidate_data['productsdata'] as $key=>$arr){
	            	$taxable_value = $arr['price'] * $arr['saleret'];
	            	$taxable_value = $taxable_value - ($taxable_value * ($arr['discount']/100));
	            	$tax_amount = ($taxable_value * ($arr['vat']/100));
	            		            	
	            	$consolidate_data['tax_segregation'][$arr['vat']]['taxable_value'] += $taxable_value; 
	            	$consolidate_data['tax_segregation'][$arr['vat']]['tax_amount'] += $tax_amount;
	            	
	            	$consolidate_data['tax_segregation']['total']['total_taxable_value'] += $taxable_value;
	            	$consolidate_data['tax_segregation']['total']['total_tax'] += $tax_amount;
	            	
	            }
	            	$consolidate_data['tax_segregation']['total']['gross_total'] = $consolidate_data['tax_segregation']['total']['total_taxable_value'] + $consolidate_data['tax_segregation']['total']['total_tax'];
	           
	            // Calling method for desiging the invoice layout
	            $html = $this->salesreturninvoiceGenerator($consolidate_data, $_REQUEST);
	            /* Open and write a HTML file */
	            fwrite($fpinv,$html);
				
	            $mpdf=new mPDF('c','A4','','' , 0 , 0 , 0 , 0 , 0 , 0); 
				$mpdf->SetDisplayMode('fullpage');
				$mpdf->list_indent_first_level = 0;	// 1 or 0 - whether to indent the first level of a list
				$mpdf->WriteHTML(file_get_contents($filepathhtml));
				$pdffile = 'test/salesreturn/' . $_REQUEST['sales_ret_id'] . ".pdf";
				$mpdf->Output($pdffile,'F');
			
				//unlink(dirname(__FILE__) ."/../../". $filepathhtml);
	            
	            fclose($fpinv);
			
		}
		
		return $pdffile;
		
	}
	
	private function salesreturninvoiceGenerator($consolidate_data, $_REQUEST){
	
	global $app_strings;
	
	$customername = $_REQUEST['customername'];
    
    $gtotal = $consolidate_data['grandtotal'];
    $grandtotalinword = $this->convert_number($gtotal);
    $grandtotalinword .= " Only.";
    
    //$phone = str_pad($_REQUEST['mobile'], 40, " ");
    $salesretid = $consolidate_data['salesretid'];
	$inv = $consolidate_data ['invoice_no'];
	$invoicedate = $consolidate_data['invoicedate'];
	
	//$nettotal = $_REQUEST['nettotal'];
	    
    $customername = ($_REQUEST['customername'])?$_REQUEST['customername']:"";
    $mobile = ($_REQUEST['mobile'])?$_REQUEST['mobile']:"";
     
	$store_add = $this->getAddress($_SESSION['warehouseid']);
			
	$company = $app_strings[companyname];
	$address1 = $store_add['address1'];
	$address2 = $store_add['address2'];
	$address3 = $store_add['city'] .','. $store_add['state'] .','. $store_add['country'];
	$phone = $store_add['mobile'] . ' ' . $store_add['phone'];
	$tin = "TIN  :".$app_strings[tin];
	$cst = "CST  :".$app_strings[CST];

	 $html = '<html>
		<head>
		<title>Sales Return Invoice</title>
		<style>
		*
		{margin:0;padding:0;font-family:Arial;font-size:10pt;color:#000;}
		body{width:100%;font-family:Arial;font-size:10pt;margin:0;padding:0;}
		p{margin:0;padding:0;}
		#wrapper{width:180mm;margin:0 15mm;}
		.page{height:297mm;width:210mm;page-break-after:always;}
		table{border-left: 1px solid #000;border-top: 1px solid #000;border-spacing:0;border-collapse: collapse;}
		table td{border-right: 1px solid #000;border-bottom: 1px solid #000;padding: 3px;}
		table.heading{height:50mm;}
		h1.heading{font-size:14pt;color:#000;font-weight:normal;}
		h2.heading{font-size:9pt;color:#000;font-weight:normal;}
		hr{color:#000;background:#000;}
		#invoice_body{height: auto;}
		#invoice_body , #invoice_total{width:100%;}
		#invoice_body table , #invoice_total table{width:100%;border-left: 1px solid #000;border-top: 1px solid #000;border-spacing:0;border-collapse: collapse;;
		}
		#tax_total, #payment_modes{width:100%;background-color:#f0f7f8;}
		
		#payment_modes tr, #tax_total tr{background-color:#e5eaeb;}
		#invoice_body table td , #invoice_total table td
		{
		text-align:center;
		font-size:9pt;
		border-right: 1px solid #000;
		border-bottom: 1px solid #000;
		padding:3px;
		}
		
		#invoice_body table td.mono  , #invoice_total table td.mono
		{
		font-family:monospace;
		text-align:right;
		padding-right:3mm;
		font-size:10pt;
		}
		
		#footer
		{
		width:180mm;
		margin:0 15mm;
		padding-bottom:3mm;
		}
		#footer table
		{
		width:100%;
		border-left: 1px solid #000;
		border-top: 1px solid #000;
		
		background:#eee;
		
		border-spacing:0;
		border-collapse: collapse;
		}
		#footer table td
		{
		width:25%;
		text-align:center;
		font-size:9pt;
		border-right: 1px solid #000;
		border-bottom: 1px solid #000;
		}
		</style>
		</head>
<body>
<div id="wrapper">
    <br />
    <table class="heading" style="width:100%;">
    	<tr>
    		<td style="width:120mm;padding:0px;border:0px;">
				<table style="width:100%;border:0px;">
					<tr>
						<!-- <td style="width:30%;">
								<img style="vertical-align: top" src="test/logo/vtiger-crm-logo.JPG" width="120" />
						</td> -->
						<td style="width:70%;">
							<h1 class="heading">'. $company .'</h1>';
							$html .= '<h2 class="heading">';
							$html .= $address1.'<br />';
							$html .= $address2 .'<br />';
							$html .= $address3 .'<br />';
							$html .= 'Phone : ' . $phone . '<br />';
							$html .= '</h2>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top" align="right" style="padding:0px;">
				<table style="width:100%">
					<tr><td colspan=2 style="background:#4d4d4d;color:#ffffff;font-weight:bold;">CASH / CREDIT / TAX INVOICE</td></tr>
					<tr><td style="padding:1mm;">TIN : '. $tin .' </td></tr>
					<tr><td style="padding:1mm;">CST : '. $cst .' </td></tr>
					
				</table>
			</td>
		</tr>
    	<tr>
    		<td style="width:90mm;">
    			<b>To,</b> <br />';
	 
    		$html .= $customername . '<br />';
			$html .= $_REQUEST['bill_street'] . '<br />';
			$html .= $baddress4 . '<br />';
    		$html .= $bcountry  . '<br />';
    		$html .= "Mobile::>". $mobile  . '<br />';
    		$html .= '</td>';
			$html .= '<td valign="top" align="right" style="padding:0px;">';
			$html .= '<table style="width:100%">';
			$html .= '<tr>';
			$html .= '<td>Return Invoice No. </td>';
			$html .= '<td>' . $salesretid . '</td></tr>';
			$html .= '<tr><td>Ref Invoice No. </td>';
			$html .= '<td>' . $inv . '</td></tr>';
			$html .= '<tr>';
			$html .= '<td>Invoice Date </td>';
			$html .= '<td>' . $invoicedate . '</td></tr>';
			$html .= '</table>
			</td>
    	</tr>
    </table>
	
	<div id="content">
		<div id="invoice_body">
			<table>
			<tr style="background:#eee;">
				<td style="width:5%;"><b>S.No.</b></td>
				<td style="width:10%;"><b>Barcode</b></td>
				<td style="width:30%;"><b>Item name</b></td>
				<td style="width:10%;"><b>Quantity</b></td>
				<td style="width:10%;"><b>Rate</b></td>
				<td style="width:15%;"><b>Discount(%)</b></td>
				<td style="width:10%;"><b>VAT (%)</b></td>
				<td style="width:10%;"><b>Net price</b></td>
			</tr>';
	 		foreach($consolidate_data['productsdata'] as $k=>$value){

	 			$sno = $k+1;
				$bcode = $value['barcodeid'];
				$pname = $value['productName'];
				$quantity = $value['saleret'];
				$unitprice = $value['price'];
				$discount = $value['discount'];
				$vat = $value['vat'];
				$vatamount = ($value['price'] * ($value['vat']/100));
				$mrp = $unitprice + $vatamount;
				$mrp = number_format($mrp, 2, '.', '');
				$vatamount = number_format($vatamount, 2, '.', '');
				$total = $value['netprice'];
	 			
				$html .= '<tr>';
				$html .= '<td style="width:5%;">'. $sno .'</td>';
				$html .= '<td style="width:10%;" align="right">'. $bcode .'</td>';
				$html .= '<td style="padding-left:10px;" style="width:30%;" align="right">'. $pname .'</td>';
				$html .= '<td class="mono" style="width:10%;" align="right">'. $quantity .'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'. $mrp .'</td>';
				$html .= '<td style="width:15%;" class="mono" align="right">'. $discount .'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'. $vat .'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'. $total .'</td>';
				$html .= '</tr>';
	 		}
	 		
	 		
			
			$html .= '<tr>
				
			</tr>
		</table>
		</div>
	
		<div id="invoice_total">
			<table style="width:100%;">
				<tr>
					<td style="text-align:left; padding-left:10px;" colspan="6">'. $grandtotalinword .'</td>
					<td style="width:10%;">Rs.</td>
					<td style="width:15%;" class="mono">'. $gtotal .'</td>
				</tr>
			</table>
		</div>
		
		<div id="tax_total">
			<table style="width:100%;">
				<tr style="background-color:#d1d3d3;">
					<td style="width:25%;" align="center">VAT(%)</td>
					<td style="width:25%;" align="center">Taxable value</td>
					<td style="width:25%;" class="mono" align="center">TAX amount</td>
					<td style="width:25%;" class="mono" align="center">Net Total</td>
				</tr> ';
				
				foreach($consolidate_data['tax_segregation'] as $key=>$arr){
					if($key != 'total') {
						$seg_net_total = $arr['taxable_value'] + $arr['tax_amount'];
						$html .= '<tr>';
						$html .= '<td style="width:25%;" align="right">'. $key .'</td>';
						$html .= '<td style="width:25%;" align="right">'. number_format($arr['taxable_value'], 2, '.', '') .'</td>';
						$html .= '<td style="width:25%;" class="mono" align="right">'. number_format($arr['tax_amount'], 2, '.', '') .'</td>';
						$html .= '<td style="width:25%;" class="mono" align="right">'. number_format($seg_net_total, 2, '.', '') .'</td>';
						$html .= '</tr>';
					}
				}
				
				$html .= '<tr style="background-color:#e8ebeb;">
					<td style="width:25%;">Tax Total</td>
					<td style="width:25%;" align="right">'. number_format($consolidate_data['tax_segregation']['total']['total_taxable_value'], 2, '.', '') .'</td>
					<td style="width:25%;" class="mono" align="right">'. number_format($consolidate_data['tax_segregation']['total']['total_tax'], 2, '.', '') .'</td>
					<td style="width:25%;" class="mono" align="right">'. number_format($consolidate_data['tax_segregation']['total']['gross_total'], 2, '.', '') .'</td>
				</tr>
			</table>
		</div>
		
		<hr />
		<table style="width:100%; height:35mm;">
			<tr>
				<td style="width:60%;" valign="top">&nbps;</td>
				<td>
				<div id="box">
					For <b>Vinayak Furnishing</b><br />
					<br /><br /><br /><br />
					Authorised Signatory
				</div>
				</td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>';
	 return $html;
}
	
	
	
	function cashreturninvoice($_REQUEST, $app_strings){
		
		$consolidate_data = array();
		
		$filepathhtml = 'test/cashreturn/CashReturn_' . $_REQUEST['cashreceiptid'] . '.html';
		
		if (!($fpinv = fopen($filepathhtml, 'w'))) {
			return;
		}
		
		$html = $this->cashreturninvoiceGenerator($app_strings, $_REQUEST);
        /* Open and write a HTML file */
        fwrite($fpinv,$html);
		
        $mpdf=new mPDF('c','A4','','' , 0 , 0 , 0 , 0 , 0 , 0); 
		$mpdf->SetDisplayMode('fullpage');
		$mpdf->list_indent_first_level = 0;	// 1 or 0 - whether to indent the first level of a list
		$mpdf->WriteHTML(file_get_contents($filepathhtml));
		$pdffile = 'test/salesreturn/' . $_REQUEST['cashreceiptid'] . ".pdf";
		$mpdf->Output($pdffile,'F');
	
		//unlink(dirname(__FILE__) ."/../../". $filepathhtml);
            
            fclose($fpinv);
		
		return $pdffile;
		
	}
	
	private function cashreturninvoiceGenerator($app_strings, $_REQUEST){
	
		//global $app_strings;
		
		$invoice_no = $_REQUEST['invoiceno'];
		$cashreceiptid = $_REQUEST['cashreceiptid'];
		$date = date("d/m/Y");
		$customername = $_REQUEST['cname']; 
		$mobile = $_REQUEST['cmobile']; 
		$caddress = $_REQUEST['caddress'];
		
		$particulars = "Payment received";
		$paymentmode = $_REQUEST['pmethod']; 
		$bankname = ($_REQUEST['bankname'])?$_REQUEST['bankname']:'-'; 
		$checkno = ($_REQUEST['checkno'])?$_REQUEST['checkno']:'-'; 
		$checkdate = ($_REQUEST['checkdate'])?$_REQUEST['checkdate']:'-';
		$totalpaid = $_REQUEST['rec_amount'];
		$grandtotalinword = $this->convert_number($totalpaid);
    	$grandtotalinword .= " Only.";
		
		$company = $app_strings[companyname];
		
		$store_add = $this->getAddress($_SESSION['warehouseid']);
			
		$company = $app_strings[companyname];
		$address1 = $store_add['address1'];
		$address2 = $store_add['address2'];
		$address3 = $store_add['city'] .','. $store_add['state'] .','. $store_add['country'];
		$phone = $store_add['mobile'] . ' ' . $store_add['phone'];
		$tin = $app_strings[tin];
		$cst = $app_strings[CST];

	 	$html = '<html>
		<head>
		<title>Sales Return Invoice</title>
		<style>
		*
		{margin:0;padding:0;font-family:Arial;font-size:10pt;color:#000;}
		body{width:100%;font-family:Arial;font-size:10pt;margin:0;padding:0;}
		p{margin:0;padding:0;}
		#wrapper{width:180mm;margin:0 15mm;}
		.page{height:297mm;width:210mm;page-break-after:always;}
		table{border-left: 1px solid #000;border-top: 1px solid #000;border-spacing:0;border-collapse: collapse;}
		table td{border-right: 1px solid #000;border-bottom: 1px solid #000;padding: 3px;}
		table.heading{height:50mm;}
		h1.heading{font-size:14pt;color:#000;font-weight:normal;}
		h2.heading{font-size:9pt;color:#000;font-weight:normal;}
		hr{color:#000;background:#000;}
		#invoice_body{height: auto;}
		#invoice_body , #invoice_total{width:100%;}
		#invoice_body table , #invoice_total table{width:100%;border-left: 1px solid #000;border-top: 1px solid #000;border-spacing:0;border-collapse: collapse;;
		}
		#tax_total, #payment_modes{width:100%;background-color:#f0f7f8;}
		
		#payment_modes tr, #tax_total tr{background-color:#e5eaeb;}
		#invoice_body table td , #invoice_total table td
		{
		text-align:center;
		font-size:9pt;
		border-right: 1px solid #000;
		border-bottom: 1px solid #000;
		padding:3px;
		}
		
		#invoice_body table td.mono  , #invoice_total table td.mono
		{
		font-family:monospace;
		text-align:right;
		padding-right:3mm;
		font-size:10pt;
		}
		
		#footer
		{
		width:180mm;
		margin:0 15mm;
		padding-bottom:3mm;
		}
		#footer table
		{
		width:100%;
		border-left: 1px solid #000;
		border-top: 1px solid #000;
		
		background:#eee;
		
		border-spacing:0;
		border-collapse: collapse;
		}
		#footer table td
		{
		width:25%;
		text-align:center;
		font-size:9pt;
		border-right: 1px solid #000;
		border-bottom: 1px solid #000;
		}
		</style>
		</head>
	<body>
	<div id="wrapper">
	    <br />
	    <table class="heading" style="width:100%;">
	    	<tr>
	    		<td style="width:120mm;padding:0px;border:0px;">
					<table style="width:100%;border:0px;">
						<tr>
							<!-- <td style="width:30%;">
									<img style="vertical-align: top" src="test/logo/vtiger-crm-logo.JPG" width="120" />
							</td> -->
							<td style="width:70%;">
								<h1 class="heading">'. $company .'</h1>';
								$html .= '<h2 class="heading">';
								$html .= $address1.'<br />';
								$html .= $address2 .'<br />';
								$html .= $address3 .'<br />';
								$html .= 'Phone : ' . $phone . '<br />';
								$html .= '</h2>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top" align="right" style="padding:0px;">
					<table style="width:100%">
						<tr><td colspan=2 style="background:#4d4d4d;color:#ffffff;font-weight:bold;">CASH / CREDIT / TAX INVOICE</td></tr>
						<tr><td style="padding:1mm;">TIN : '. $tin .' </td></tr>
						<tr><td style="padding:1mm;">CST : '. $cst .' </td></tr>
						
					</table>
				</td>
			</tr>
	    	<tr>
	    		<td style="width:90mm;">
	    			<b>To,</b> <br />';
		 
	    		$html .= $customername . '<br />';
				$html .= $caddress . '<br />';
	    		$html .= "Mobile::>". $mobile  . '<br />';
	    		$html .= '</td>';
				$html .= '<td valign="top" align="right" style="padding:0px;">';
				$html .= '<table style="width:100%">';
				$html .= '<tr>';
				$html .= '<td>Cash Return Invoice No. </td>';
				$html .= '<td>' . $cashreceiptid . '</td></tr>';
				$html .= '<tr><td>Ref Invoice No. </td>';
				$html .= '<td>' . $invoice_no . '</td></tr>';
				$html .= '<tr>';
				$html .= '<td>Invoice Date </td>';
				$html .= '<td>' . $date . '</td></tr>';
				$html .= '</table>
				</td>
	    	</tr>
	    </table>
		
		<div id="content">
			<div id="invoice_body">
				<table>
				<tr style="background:#eee;">
					
					<td style="width:10%;"><b>Particulars</b></td>
					<td style="width:30%;"><b>Payment mode</b></td>
					<td style="width:10%;"><b>Bank name</b></td>
					<td style="width:10%;"><b>Cheque no</b></td>
					<td style="width:15%;"><b>Check date</b></td>
					<td style="width:10%;"><b>Amount received</b></td>
				</tr>';
		 		
				$html .= '<tr>';
				//$html .= '<td style="width:5%;">'.$sno.'</td>';
				$html .= '<td style="width:10%;" align="right">'.$particulars.'</td>';
				$html .= '<td style="padding-left:10px;" style="width:30%;" align="right">'.$paymentmode.'</td>';
				$html .= '<td class="mono" style="width:10%;" align="right">'.$bankname.'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'.$checkno.'</td>';
				$html .= '<td style="width:15%;" class="mono" align="right">'. $checkdate .'</td>';
				$html .= '<td style="width:10%;" class="mono" align="right">'. $totalpaid .'</td>';
				$html .= '</tr>';
		 		
				$html .= '<tr>
					
				</tr>
			</table>
			</div>
		
			<div id="invoice_total">
				<table style="width:100%;">
					<tr>
						<td style="text-align:left; padding-left:10px;" colspan="6">'. $grandtotalinword .'</td>
						<td style="width:10%;">Rs.</td>
						<td style="width:15%;" class="mono">'. $totalpaid .'</td>
					</tr>
				</table>
			</div>
			
			<hr />
			<table style="width:100%; height:35mm;">
				<tr>
					<td style="width:60%;" valign="top">&nbps;</td>
					<td>
					<div id="box">
						For <b>Vinayak Furnishing</b><br />
						<br /><br /><br /><br />
						Authorised Signatory
					</div>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</body>
</html>';
	 return $html;
}
	
	public function convert_number($number){
		 
	    if (($number < 0) || ($number > 999999999)){ 
			throw new Exception("Number is out of range");
	    } 
	
	    $Gn = floor($number / 1000000);  /* Millions (giga) */ 
	    $number -= $Gn * 1000000; 
	    $kn = floor($number / 1000);     /* Thousands (kilo) */ 
	    $number -= $kn * 1000; 
	    $Hn = floor($number / 100);      /* Hundreds (hecto) */ 
	    $number -= $Hn * 100; 
	    $Dn = floor($number / 10);       /* Tens (deca) */ 
	    $n = $number % 10;               /* Ones */ 
	
	    $res = ""; 
	
	    if ($Gn){ 
	        $res .= $this->convert_number($Gn) . " Million"; 
	    } 
	
	    if ($kn){ 
	        $res .= (empty($res) ? "" : " ") . $this->convert_number($kn) . " Thousand"; 
	    } 
	
	    if ($Hn){ 
	        $res .= (empty($res) ? "" : " ") . 
	            $this->convert_number($Hn) . " Hundred"; 
	    } 
	
	    $ones = array("", "One", "Two", "Three", "Four", "Five", "Six", 
	        "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", 
	        "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eightteen", 
	        "Nineteen"); 
	    $tens = array("", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", 
	        "Seventy", "Eigthy", "Ninety"); 
	
	    if ($Dn || $n){ 
	        if (!empty($res)){ 
	            $res .= " and "; 
	        } 
	
	        if ($Dn < 2) { 
	            $res .= $ones[$Dn * 10 + $n]; 
	        } 
	        else { 
				$res .= $tens[$Dn]; 
	            if ($n){ 
	                $res .= "-" . $ones[$n]; 
	            } 
	        } 
	    } 
	
	    if (empty($res)){ 
	        $res = "zero"; 
	    } 
	
	    return $res; 
	}
}

?>