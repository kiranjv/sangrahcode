package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerCustomerportalPrefs generated by hbm2java
 */
public class VtigerCustomerportalPrefs implements java.io.Serializable {

	private int tabid;
	private String prefkey;
	private Integer prefvalue;

	public VtigerCustomerportalPrefs() {
	}

	public VtigerCustomerportalPrefs(int tabid) {
		this.tabid = tabid;
	}

	public VtigerCustomerportalPrefs(int tabid, String prefkey,
			Integer prefvalue) {
		this.tabid = tabid;
		this.prefkey = prefkey;
		this.prefvalue = prefvalue;
	}

	public int getTabid() {
		return this.tabid;
	}

	public void setTabid(int tabid) {
		this.tabid = tabid;
	}

	public String getPrefkey() {
		return this.prefkey;
	}

	public void setPrefkey(String prefkey) {
		this.prefkey = prefkey;
	}

	public Integer getPrefvalue() {
		return this.prefvalue;
	}

	public void setPrefvalue(Integer prefvalue) {
		this.prefvalue = prefvalue;
	}

}
