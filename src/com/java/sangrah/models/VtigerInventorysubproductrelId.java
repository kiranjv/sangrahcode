package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerInventorysubproductrelId generated by hbm2java
 */
public class VtigerInventorysubproductrelId implements java.io.Serializable {

	private int id;
	private int sequenceNo;
	private int productid;

	public VtigerInventorysubproductrelId() {
	}

	public VtigerInventorysubproductrelId(int id, int sequenceNo, int productid) {
		this.id = id;
		this.sequenceNo = sequenceNo;
		this.productid = productid;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSequenceNo() {
		return this.sequenceNo;
	}

	public void setSequenceNo(int sequenceNo) {
		this.sequenceNo = sequenceNo;
	}

	public int getProductid() {
		return this.productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VtigerInventorysubproductrelId))
			return false;
		VtigerInventorysubproductrelId castOther = (VtigerInventorysubproductrelId) other;

		return (this.getId() == castOther.getId())
				&& (this.getSequenceNo() == castOther.getSequenceNo())
				&& (this.getProductid() == castOther.getProductid());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getId();
		result = 37 * result + this.getSequenceNo();
		result = 37 * result + this.getProductid();
		return result;
	}

}