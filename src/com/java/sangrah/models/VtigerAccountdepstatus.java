package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerAccountdepstatus generated by hbm2java
 */
public class VtigerAccountdepstatus implements java.io.Serializable {

	private int deploymentstatusid;
	private String deploymentstatus;
	private int sortorderid;
	private int presence;

	public VtigerAccountdepstatus() {
	}

	public VtigerAccountdepstatus(int deploymentstatusid,
			String deploymentstatus, int sortorderid, int presence) {
		this.deploymentstatusid = deploymentstatusid;
		this.deploymentstatus = deploymentstatus;
		this.sortorderid = sortorderid;
		this.presence = presence;
	}

	public int getDeploymentstatusid() {
		return this.deploymentstatusid;
	}

	public void setDeploymentstatusid(int deploymentstatusid) {
		this.deploymentstatusid = deploymentstatusid;
	}

	public String getDeploymentstatus() {
		return this.deploymentstatus;
	}

	public void setDeploymentstatus(String deploymentstatus) {
		this.deploymentstatus = deploymentstatus;
	}

	public int getSortorderid() {
		return this.sortorderid;
	}

	public void setSortorderid(int sortorderid) {
		this.sortorderid = sortorderid;
	}

	public int getPresence() {
		return this.presence;
	}

	public void setPresence(int presence) {
		this.presence = presence;
	}

}
