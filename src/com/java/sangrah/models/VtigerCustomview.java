package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerCustomview generated by hbm2java
 */
public class VtigerCustomview implements java.io.Serializable {

	private int cvid;
	private String viewname;
	private Integer setdefault;
	private Integer setmetrics;
	private String entitytype;
	private Integer status;
	private Integer userid;

	public VtigerCustomview() {
	}

	public VtigerCustomview(int cvid, String viewname, String entitytype) {
		this.cvid = cvid;
		this.viewname = viewname;
		this.entitytype = entitytype;
	}

	public VtigerCustomview(int cvid, String viewname, Integer setdefault,
			Integer setmetrics, String entitytype, Integer status,
			Integer userid) {
		this.cvid = cvid;
		this.viewname = viewname;
		this.setdefault = setdefault;
		this.setmetrics = setmetrics;
		this.entitytype = entitytype;
		this.status = status;
		this.userid = userid;
	}

	public int getCvid() {
		return this.cvid;
	}

	public void setCvid(int cvid) {
		this.cvid = cvid;
	}

	public String getViewname() {
		return this.viewname;
	}

	public void setViewname(String viewname) {
		this.viewname = viewname;
	}

	public Integer getSetdefault() {
		return this.setdefault;
	}

	public void setSetdefault(Integer setdefault) {
		this.setdefault = setdefault;
	}

	public Integer getSetmetrics() {
		return this.setmetrics;
	}

	public void setSetmetrics(Integer setmetrics) {
		this.setmetrics = setmetrics;
	}

	public String getEntitytype() {
		return this.entitytype;
	}

	public void setEntitytype(String entitytype) {
		this.entitytype = entitytype;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

}
