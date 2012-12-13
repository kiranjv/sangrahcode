package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerInvoice generated by hbm2java
 */
public class VtigerInvoice implements java.io.Serializable {

	private int invoiceid;
	private String subject;
	private Integer salesorderid;
	private String customerno;
	private Integer contactid;
	private String notes;
	private String invoicedate;
	private String duedate;
	private String invoiceterms;
	private String type;
	private String adjustment;
	private String salescommission;
	private String exciseduty;
	private String subtotal;
	private String total;
	private String taxtype;
	private String discountPercent;
	private String discountAmount;
	private String SHAmount;
	private String shipping;
	private Integer accountid;
	private String termsConditions;
	private String purchaseorder;
	private String invoicestatus;
	private String invoiceNo;
	private int currencyId;
	private String conversionRate = "1.000";
	private String customername;
	private String mobile;
	private String salesorderno;
	private String email;
	private String cash;
	private String credit;
	private String card;
	private String bankname;
	private String chqDate;
	private String chequeNo;
	private String chequeAmt;
	private Integer storeid;

	public VtigerInvoice() {
	}

	public VtigerInvoice(int invoiceid, int currencyId, String conversionRate) {
		this.invoiceid = invoiceid;
		this.currencyId = currencyId;
		this.conversionRate = conversionRate;
	}

	public VtigerInvoice(int invoiceid, String subject, Integer salesorderid,
			String customerno, Integer contactid, String notes,
			String invoicedate, String duedate, String invoiceterms,
			String type, String adjustment, String salescommission,
			String exciseduty, String subtotal, String total, String taxtype,
			String discountPercent, String discountAmount, String SHAmount,
			String shipping, Integer accountid, String termsConditions,
			String purchaseorder, String invoicestatus, String invoiceNo,
			int currencyId, String conversionRate, String customername,
			String mobile, String salesorderno, String email, String cash,
			String credit, String card, String bankname, String chqDate,
			String chequeNo, String chequeAmt, Integer storeid) {
		this.invoiceid = invoiceid;
		this.subject = subject;
		this.salesorderid = salesorderid;
		this.customerno = customerno;
		this.contactid = contactid;
		this.notes = notes;
		this.invoicedate = invoicedate;
		this.duedate = duedate;
		this.invoiceterms = invoiceterms;
		this.type = type;
		this.adjustment = adjustment;
		this.salescommission = salescommission;
		this.exciseduty = exciseduty;
		this.subtotal = subtotal;
		this.total = total;
		this.taxtype = taxtype;
		this.discountPercent = discountPercent;
		this.discountAmount = discountAmount;
		this.SHAmount = SHAmount;
		this.shipping = shipping;
		this.accountid = accountid;
		this.termsConditions = termsConditions;
		this.purchaseorder = purchaseorder;
		this.invoicestatus = invoicestatus;
		this.invoiceNo = invoiceNo;
		this.currencyId = currencyId;
		this.conversionRate = conversionRate;
		this.customername = customername;
		this.mobile = mobile;
		this.salesorderno = salesorderno;
		this.email = email;
		this.cash = cash;
		this.credit = credit;
		this.card = card;
		this.bankname = bankname;
		this.chqDate = chqDate;
		this.chequeNo = chequeNo;
		this.chequeAmt = chequeAmt;
		this.storeid = storeid;
	}

	public VtigerInvoice(int new_crmid, String invoicedate, String type, String adjustment,
				String subtotal, String total, String discount_amount, String invoicestatus,
				String invoice_no, String customername, String mobile, String salesorderno,
				String email, String cash, String credit, String card, String bankname,
				String chq_date, String cheque_no, String cheque_amt, String storeid) {
		this.invoiceid =  new_crmid;
		this.invoicedate = invoicedate;
		this.type = type;
		this.adjustment = adjustment;
		this.subtotal = subtotal;
		this.total = total;
		this.discountAmount = discount_amount;
		this.invoicestatus = invoicestatus;
		this.invoiceNo = invoice_no;
		this.customername = customername;
		this.mobile = mobile;
		this.salesorderno = salesorderno;
		this.email = email;
		this.cash = cash;
		this.credit = credit;
		this.card = card;
		this.bankname = bankname;
		this.chqDate = chq_date;
		this.chequeNo = cheque_no;
		this.chequeAmt = cheque_amt;
		this.storeid = Integer.parseInt(storeid);
		
	}

	public int getInvoiceid() {
		return this.invoiceid;
	}

	public void setInvoiceid(int invoiceid) {
		this.invoiceid = invoiceid;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Integer getSalesorderid() {
		return this.salesorderid;
	}

	public void setSalesorderid(Integer salesorderid) {
		this.salesorderid = salesorderid;
	}

	public String getCustomerno() {
		return this.customerno;
	}

	public void setCustomerno(String customerno) {
		this.customerno = customerno;
	}

	public Integer getContactid() {
		return this.contactid;
	}

	public void setContactid(Integer contactid) {
		this.contactid = contactid;
	}

	public String getNotes() {
		return this.notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getInvoicedate() {
		return this.invoicedate;
	}

	public void setInvoicedate(String invoicedate) {
		this.invoicedate = invoicedate;
	}

	public String getDuedate() {
		return this.duedate;
	}

	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}

	public String getInvoiceterms() {
		return this.invoiceterms;
	}

	public void setInvoiceterms(String invoiceterms) {
		this.invoiceterms = invoiceterms;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAdjustment() {
		return this.adjustment;
	}

	public void setAdjustment(String adjustment) {
		this.adjustment = adjustment;
	}

	public String getSalescommission() {
		return this.salescommission;
	}

	public void setSalescommission(String salescommission) {
		this.salescommission = salescommission;
	}

	public String getExciseduty() {
		return this.exciseduty;
	}

	public void setExciseduty(String exciseduty) {
		this.exciseduty = exciseduty;
	}

	public String getSubtotal() {
		return this.subtotal;
	}

	public void setSubtotal(String subtotal) {
		this.subtotal = subtotal;
	}

	public String getTotal() {
		return this.total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getTaxtype() {
		return this.taxtype;
	}

	public void setTaxtype(String taxtype) {
		this.taxtype = taxtype;
	}

	public String getDiscountPercent() {
		return this.discountPercent;
	}

	public void setDiscountPercent(String discountPercent) {
		this.discountPercent = discountPercent;
	}

	public String getDiscountAmount() {
		return this.discountAmount;
	}

	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}

	public String getSHAmount() {
		return this.SHAmount;
	}

	public void setSHAmount(String SHAmount) {
		this.SHAmount = SHAmount;
	}

	public String getShipping() {
		return this.shipping;
	}

	public void setShipping(String shipping) {
		this.shipping = shipping;
	}

	public Integer getAccountid() {
		return this.accountid;
	}

	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}

	public String getTermsConditions() {
		return this.termsConditions;
	}

	public void setTermsConditions(String termsConditions) {
		this.termsConditions = termsConditions;
	}

	public String getPurchaseorder() {
		return this.purchaseorder;
	}

	public void setPurchaseorder(String purchaseorder) {
		this.purchaseorder = purchaseorder;
	}

	public String getInvoicestatus() {
		return this.invoicestatus;
	}

	public void setInvoicestatus(String invoicestatus) {
		this.invoicestatus = invoicestatus;
	}

	public String getInvoiceNo() {
		return this.invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public int getCurrencyId() {
		return this.currencyId;
	}

	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}

	public String getConversionRate() {
		return this.conversionRate;
	}

	public void setConversionRate(String conversionRate) {
		this.conversionRate = conversionRate;
	}

	public String getCustomername() {
		return this.customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSalesorderno() {
		return this.salesorderno;
	}

	public void setSalesorderno(String salesorderno) {
		this.salesorderno = salesorderno;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCash() {
		return this.cash;
	}

	public void setCash(String cash) {
		this.cash = cash;
	}

	public String getCredit() {
		return this.credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getCard() {
		return this.card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getBankname() {
		return this.bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getChqDate() {
		return this.chqDate;
	}

	public void setChqDate(String chqDate) {
		this.chqDate = chqDate;
	}

	public String getChequeNo() {
		return this.chequeNo;
	}

	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}

	public String getChequeAmt() {
		return this.chequeAmt;
	}

	public void setChequeAmt(String chequeAmt) {
		this.chequeAmt = chequeAmt;
	}

	public Integer getStoreid() {
		return this.storeid;
	}

	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}

}
