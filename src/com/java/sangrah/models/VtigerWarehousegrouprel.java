package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerWarehousegrouprel generated by hbm2java
 */
public class VtigerWarehousegrouprel implements java.io.Serializable {

	private int warehouseid;
	private String groupname;

	public VtigerWarehousegrouprel() {
	}

	public VtigerWarehousegrouprel(int warehouseid) {
		this.warehouseid = warehouseid;
	}

	public VtigerWarehousegrouprel(int warehouseid, String groupname) {
		this.warehouseid = warehouseid;
		this.groupname = groupname;
	}

	public int getWarehouseid() {
		return this.warehouseid;
	}

	public void setWarehouseid(int warehouseid) {
		this.warehouseid = warehouseid;
	}

	public String getGroupname() {
		return this.groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

}
