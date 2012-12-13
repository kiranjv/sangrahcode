package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerInventorytransaction generated by hbm2java
 */
public class VtigerInventorytransaction implements java.io.Serializable {

	private int transactionId;
	private String date;
	private String barcode;
	private Integer productid;
	private String productName;
	private Integer openingStockQty;
	private int openingStockWsQty;
	private String openingCost;
	private String markupPer;
	private String markupAmt;
	private Integer poid;
	private Integer purchaseQty;
	private String purchaseCost;
	private String cstwithcformPer;
	private String cstwithcformAmt;
	private String cstwithoutcformPer;
	private String cstwithoutcformAmt;
	private Integer invId;
	private String invoiceNo;
	private Integer salesQty;
	private Integer storeId;
	private String salesCost;
	private Integer purchaseReturnQty;
	private String purchaseReturnCost;
	private Integer salesretId;
	private Integer salesReturnQty;
	private String salesReturnCost;
	private Integer adjustmentQty;
	private String adjustmentCost;
	private Integer challanId;
	private String challanNo;
	private int challanQtySent;
	private int challanQtyReceive;
	private Integer closingStock;
	private Integer finalStock;
	private String discount;
	private String unitprice;
	private int closingStockWsQty;
	private String vat;
	private Integer vendorId;

	public VtigerInventorytransaction() {
	}

	public VtigerInventorytransaction(int transactionId, int openingStockWsQty,
			int challanQtySent, int challanQtyReceive, int closingStockWsQty) {
		this.transactionId = transactionId;
		this.openingStockWsQty = openingStockWsQty;
		this.challanQtySent = challanQtySent;
		this.challanQtyReceive = challanQtyReceive;
		this.closingStockWsQty = closingStockWsQty;
	}

	public VtigerInventorytransaction(int transactionId, String date,
			String barcode, Integer productid, String productName,
			Integer openingStockQty, int openingStockWsQty, String openingCost,
			String markupPer, String markupAmt, Integer poid,
			Integer purchaseQty, String purchaseCost, String cstwithcformPer,
			String cstwithcformAmt, String cstwithoutcformPer,
			String cstwithoutcformAmt, Integer invId, String invoiceNo,
			Integer salesQty, Integer storeId, String salesCost,
			Integer purchaseReturnQty, String purchaseReturnCost,
			Integer salesretId, Integer salesReturnQty, String salesReturnCost,
			Integer adjustmentQty, String adjustmentCost, Integer challanId,
			String challanNo, int challanQtySent, int challanQtyReceive,
			Integer closingStock, Integer finalStock, String discount,
			String unitprice, int closingStockWsQty, String vat,
			Integer vendorId) {
		this.transactionId = transactionId;
		this.date = date;
		this.barcode = barcode;
		this.productid = productid;
		this.productName = productName;
		this.openingStockQty = openingStockQty;
		this.openingStockWsQty = openingStockWsQty;
		this.openingCost = openingCost;
		this.markupPer = markupPer;
		this.markupAmt = markupAmt;
		this.poid = poid;
		this.purchaseQty = purchaseQty;
		this.purchaseCost = purchaseCost;
		this.cstwithcformPer = cstwithcformPer;
		this.cstwithcformAmt = cstwithcformAmt;
		this.cstwithoutcformPer = cstwithoutcformPer;
		this.cstwithoutcformAmt = cstwithoutcformAmt;
		this.invId = invId;
		this.invoiceNo = invoiceNo;
		this.salesQty = salesQty;
		this.storeId = storeId;
		this.salesCost = salesCost;
		this.purchaseReturnQty = purchaseReturnQty;
		this.purchaseReturnCost = purchaseReturnCost;
		this.salesretId = salesretId;
		this.salesReturnQty = salesReturnQty;
		this.salesReturnCost = salesReturnCost;
		this.adjustmentQty = adjustmentQty;
		this.adjustmentCost = adjustmentCost;
		this.challanId = challanId;
		this.challanNo = challanNo;
		this.challanQtySent = challanQtySent;
		this.challanQtyReceive = challanQtyReceive;
		this.closingStock = closingStock;
		this.finalStock = finalStock;
		this.discount = discount;
		this.unitprice = unitprice;
		this.closingStockWsQty = closingStockWsQty;
		this.vat = vat;
		this.vendorId = vendorId;
	}

	public VtigerInventorytransaction(String date, int productid,
			String productName, int opening_stockqty, int openingCost, int new_crmid,
			String invoice_no, int reqQty, String warehouseid, String mrp,
			int closing_stock, int finalStock, String unitprice, String bcode) {
//		this.transactionId = transactionId;
		this.date =date;
		this.productid = productid;
		this.productName = productName;
		this.openingStockQty = opening_stockqty;
		this.openingCost = String.valueOf(openingCost);
		this.transactionId = new_crmid;
		this.invoiceNo = invoice_no;
		this.purchaseQty = reqQty;
		this.storeId = Integer.parseInt(warehouseid);
		this.salesCost = mrp;
		this.closingStock = closing_stock;
		this.finalStock = finalStock;
		this.unitprice = unitprice;
		this.barcode = bcode;
		
		
	}

	public int getTransactionId() {
		return this.transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getOpeningStockQty() {
		return this.openingStockQty;
	}

	public void setOpeningStockQty(Integer openingStockQty) {
		this.openingStockQty = openingStockQty;
	}

	public int getOpeningStockWsQty() {
		return this.openingStockWsQty;
	}

	public void setOpeningStockWsQty(int openingStockWsQty) {
		this.openingStockWsQty = openingStockWsQty;
	}

	public String getOpeningCost() {
		return this.openingCost;
	}

	public void setOpeningCost(String openingCost) {
		this.openingCost = openingCost;
	}

	public String getMarkupPer() {
		return this.markupPer;
	}

	public void setMarkupPer(String markupPer) {
		this.markupPer = markupPer;
	}

	public String getMarkupAmt() {
		return this.markupAmt;
	}

	public void setMarkupAmt(String markupAmt) {
		this.markupAmt = markupAmt;
	}

	public Integer getPoid() {
		return this.poid;
	}

	public void setPoid(Integer poid) {
		this.poid = poid;
	}

	public Integer getPurchaseQty() {
		return this.purchaseQty;
	}

	public void setPurchaseQty(Integer purchaseQty) {
		this.purchaseQty = purchaseQty;
	}

	public String getPurchaseCost() {
		return this.purchaseCost;
	}

	public void setPurchaseCost(String purchaseCost) {
		this.purchaseCost = purchaseCost;
	}

	public String getCstwithcformPer() {
		return this.cstwithcformPer;
	}

	public void setCstwithcformPer(String cstwithcformPer) {
		this.cstwithcformPer = cstwithcformPer;
	}

	public String getCstwithcformAmt() {
		return this.cstwithcformAmt;
	}

	public void setCstwithcformAmt(String cstwithcformAmt) {
		this.cstwithcformAmt = cstwithcformAmt;
	}

	public String getCstwithoutcformPer() {
		return this.cstwithoutcformPer;
	}

	public void setCstwithoutcformPer(String cstwithoutcformPer) {
		this.cstwithoutcformPer = cstwithoutcformPer;
	}

	public String getCstwithoutcformAmt() {
		return this.cstwithoutcformAmt;
	}

	public void setCstwithoutcformAmt(String cstwithoutcformAmt) {
		this.cstwithoutcformAmt = cstwithoutcformAmt;
	}

	public Integer getInvId() {
		return this.invId;
	}

	public void setInvId(Integer invId) {
		this.invId = invId;
	}

	public String getInvoiceNo() {
		return this.invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public Integer getSalesQty() {
		return this.salesQty;
	}

	public void setSalesQty(Integer salesQty) {
		this.salesQty = salesQty;
	}

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public String getSalesCost() {
		return this.salesCost;
	}

	public void setSalesCost(String salesCost) {
		this.salesCost = salesCost;
	}

	public Integer getPurchaseReturnQty() {
		return this.purchaseReturnQty;
	}

	public void setPurchaseReturnQty(Integer purchaseReturnQty) {
		this.purchaseReturnQty = purchaseReturnQty;
	}

	public String getPurchaseReturnCost() {
		return this.purchaseReturnCost;
	}

	public void setPurchaseReturnCost(String purchaseReturnCost) {
		this.purchaseReturnCost = purchaseReturnCost;
	}

	public Integer getSalesretId() {
		return this.salesretId;
	}

	public void setSalesretId(Integer salesretId) {
		this.salesretId = salesretId;
	}

	public Integer getSalesReturnQty() {
		return this.salesReturnQty;
	}

	public void setSalesReturnQty(Integer salesReturnQty) {
		this.salesReturnQty = salesReturnQty;
	}

	public String getSalesReturnCost() {
		return this.salesReturnCost;
	}

	public void setSalesReturnCost(String salesReturnCost) {
		this.salesReturnCost = salesReturnCost;
	}

	public Integer getAdjustmentQty() {
		return this.adjustmentQty;
	}

	public void setAdjustmentQty(Integer adjustmentQty) {
		this.adjustmentQty = adjustmentQty;
	}

	public String getAdjustmentCost() {
		return this.adjustmentCost;
	}

	public void setAdjustmentCost(String adjustmentCost) {
		this.adjustmentCost = adjustmentCost;
	}

	public Integer getChallanId() {
		return this.challanId;
	}

	public void setChallanId(Integer challanId) {
		this.challanId = challanId;
	}

	public String getChallanNo() {
		return this.challanNo;
	}

	public void setChallanNo(String challanNo) {
		this.challanNo = challanNo;
	}

	public int getChallanQtySent() {
		return this.challanQtySent;
	}

	public void setChallanQtySent(int challanQtySent) {
		this.challanQtySent = challanQtySent;
	}

	public int getChallanQtyReceive() {
		return this.challanQtyReceive;
	}

	public void setChallanQtyReceive(int challanQtyReceive) {
		this.challanQtyReceive = challanQtyReceive;
	}

	public Integer getClosingStock() {
		return this.closingStock;
	}

	public void setClosingStock(Integer closingStock) {
		this.closingStock = closingStock;
	}

	public Integer getFinalStock() {
		return this.finalStock;
	}

	public void setFinalStock(Integer finalStock) {
		this.finalStock = finalStock;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}

	public int getClosingStockWsQty() {
		return this.closingStockWsQty;
	}

	public void setClosingStockWsQty(int closingStockWsQty) {
		this.closingStockWsQty = closingStockWsQty;
	}

	public String getVat() {
		return this.vat;
	}

	public void setVat(String vat) {
		this.vat = vat;
	}

	public Integer getVendorId() {
		return this.vendorId;
	}

	public void setVendorId(Integer vendorId) {
		this.vendorId = vendorId;
	}

}