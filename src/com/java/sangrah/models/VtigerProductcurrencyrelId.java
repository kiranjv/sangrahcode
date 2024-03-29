package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerProductcurrencyrelId generated by hbm2java
 */
public class VtigerProductcurrencyrelId implements java.io.Serializable {

	private int productid;
	private int currencyid;
	private String convertedPrice;
	private String actualPrice;

	public VtigerProductcurrencyrelId() {
	}

	public VtigerProductcurrencyrelId(int productid, int currencyid) {
		this.productid = productid;
		this.currencyid = currencyid;
	}

	public VtigerProductcurrencyrelId(int productid, int currencyid,
			String convertedPrice, String actualPrice) {
		this.productid = productid;
		this.currencyid = currencyid;
		this.convertedPrice = convertedPrice;
		this.actualPrice = actualPrice;
	}

	public int getProductid() {
		return this.productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public int getCurrencyid() {
		return this.currencyid;
	}

	public void setCurrencyid(int currencyid) {
		this.currencyid = currencyid;
	}

	public String getConvertedPrice() {
		return this.convertedPrice;
	}

	public void setConvertedPrice(String convertedPrice) {
		this.convertedPrice = convertedPrice;
	}

	public String getActualPrice() {
		return this.actualPrice;
	}

	public void setActualPrice(String actualPrice) {
		this.actualPrice = actualPrice;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VtigerProductcurrencyrelId))
			return false;
		VtigerProductcurrencyrelId castOther = (VtigerProductcurrencyrelId) other;

		return (this.getProductid() == castOther.getProductid())
				&& (this.getCurrencyid() == castOther.getCurrencyid())
				&& ((this.getConvertedPrice() == castOther.getConvertedPrice()) || (this
						.getConvertedPrice() != null
						&& castOther.getConvertedPrice() != null && this
						.getConvertedPrice().equals(
								castOther.getConvertedPrice())))
				&& ((this.getActualPrice() == castOther.getActualPrice()) || (this
						.getActualPrice() != null
						&& castOther.getActualPrice() != null && this
						.getActualPrice().equals(castOther.getActualPrice())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getProductid();
		result = 37 * result + this.getCurrencyid();
		result = 37
				* result
				+ (getConvertedPrice() == null ? 0 : this.getConvertedPrice()
						.hashCode());
		result = 37
				* result
				+ (getActualPrice() == null ? 0 : this.getActualPrice()
						.hashCode());
		return result;
	}

}
