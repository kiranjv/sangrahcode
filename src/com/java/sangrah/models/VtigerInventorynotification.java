package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerInventorynotification generated by hbm2java
 */
public class VtigerInventorynotification implements java.io.Serializable {

	private int notificationid;
	private String notificationname;
	private String notificationsubject;
	private String notificationbody;
	private String label;
	private String status;

	public VtigerInventorynotification() {
	}

	public VtigerInventorynotification(int notificationid) {
		this.notificationid = notificationid;
	}

	public VtigerInventorynotification(int notificationid,
			String notificationname, String notificationsubject,
			String notificationbody, String label, String status) {
		this.notificationid = notificationid;
		this.notificationname = notificationname;
		this.notificationsubject = notificationsubject;
		this.notificationbody = notificationbody;
		this.label = label;
		this.status = status;
	}

	public int getNotificationid() {
		return this.notificationid;
	}

	public void setNotificationid(int notificationid) {
		this.notificationid = notificationid;
	}

	public String getNotificationname() {
		return this.notificationname;
	}

	public void setNotificationname(String notificationname) {
		this.notificationname = notificationname;
	}

	public String getNotificationsubject() {
		return this.notificationsubject;
	}

	public void setNotificationsubject(String notificationsubject) {
		this.notificationsubject = notificationsubject;
	}

	public String getNotificationbody() {
		return this.notificationbody;
	}

	public void setNotificationbody(String notificationbody) {
		this.notificationbody = notificationbody;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
