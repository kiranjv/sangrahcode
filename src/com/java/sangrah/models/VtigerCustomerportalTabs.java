package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerCustomerportalTabs generated by hbm2java
 */
public class VtigerCustomerportalTabs implements java.io.Serializable {

	private int tabid;
	private Integer visible;
	private Integer sequence;

	public VtigerCustomerportalTabs() {
	}

	public VtigerCustomerportalTabs(int tabid) {
		this.tabid = tabid;
	}

	public VtigerCustomerportalTabs(int tabid, Integer visible, Integer sequence) {
		this.tabid = tabid;
		this.visible = visible;
		this.sequence = sequence;
	}

	public int getTabid() {
		return this.tabid;
	}

	public void setTabid(int tabid) {
		this.tabid = tabid;
	}

	public Integer getVisible() {
		return this.visible;
	}

	public void setVisible(Integer visible) {
		this.visible = visible;
	}

	public Integer getSequence() {
		return this.sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

}
