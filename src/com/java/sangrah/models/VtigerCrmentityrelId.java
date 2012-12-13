package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerCrmentityrelId generated by hbm2java
 */
public class VtigerCrmentityrelId implements java.io.Serializable {

	private int crmid;
	private String module;
	private int relcrmid;
	private String relmodule;

	public VtigerCrmentityrelId() {
	}

	public VtigerCrmentityrelId(int crmid, String module, int relcrmid,
			String relmodule) {
		this.crmid = crmid;
		this.module = module;
		this.relcrmid = relcrmid;
		this.relmodule = relmodule;
	}

	public int getCrmid() {
		return this.crmid;
	}

	public void setCrmid(int crmid) {
		this.crmid = crmid;
	}

	public String getModule() {
		return this.module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public int getRelcrmid() {
		return this.relcrmid;
	}

	public void setRelcrmid(int relcrmid) {
		this.relcrmid = relcrmid;
	}

	public String getRelmodule() {
		return this.relmodule;
	}

	public void setRelmodule(String relmodule) {
		this.relmodule = relmodule;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VtigerCrmentityrelId))
			return false;
		VtigerCrmentityrelId castOther = (VtigerCrmentityrelId) other;

		return (this.getCrmid() == castOther.getCrmid())
				&& ((this.getModule() == castOther.getModule()) || (this
						.getModule() != null && castOther.getModule() != null && this
						.getModule().equals(castOther.getModule())))
				&& (this.getRelcrmid() == castOther.getRelcrmid())
				&& ((this.getRelmodule() == castOther.getRelmodule()) || (this
						.getRelmodule() != null
						&& castOther.getRelmodule() != null && this
						.getRelmodule().equals(castOther.getRelmodule())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getCrmid();
		result = 37 * result
				+ (getModule() == null ? 0 : this.getModule().hashCode());
		result = 37 * result + this.getRelcrmid();
		result = 37 * result
				+ (getRelmodule() == null ? 0 : this.getRelmodule().hashCode());
		return result;
	}

}