package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerInventoryTandc generated by hbm2java
 */
public class VtigerInventoryTandc implements java.io.Serializable {

	private int id;
	private String type;
	private String tandc;

	public VtigerInventoryTandc() {
	}

	public VtigerInventoryTandc(int id, String type) {
		this.id = id;
		this.type = type;
	}

	public VtigerInventoryTandc(int id, String type, String tandc) {
		this.id = id;
		this.type = type;
		this.tandc = tandc;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTandc() {
		return this.tandc;
	}

	public void setTandc(String tandc) {
		this.tandc = tandc;
	}

}