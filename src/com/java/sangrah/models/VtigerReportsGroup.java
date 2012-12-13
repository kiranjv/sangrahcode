package com.java.sangrah.models;

// Generated Nov 17, 2012 10:58:25 AM by Hibernate Tools 3.4.0.CR1

/**
 * VtigerReportsGroup generated by hbm2java
 */
public class VtigerReportsGroup implements java.io.Serializable {

	private int id;
	private String reportParentCode;
	private String reportName;
	private String queryCode;
	private int columnsTotal;
	private String isDeleted;

	public VtigerReportsGroup() {
	}

	public VtigerReportsGroup(int id, String reportParentCode,
			String reportName, String queryCode, int columnsTotal,
			String isDeleted) {
		this.id = id;
		this.reportParentCode = reportParentCode;
		this.reportName = reportName;
		this.queryCode = queryCode;
		this.columnsTotal = columnsTotal;
		this.isDeleted = isDeleted;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReportParentCode() {
		return this.reportParentCode;
	}

	public void setReportParentCode(String reportParentCode) {
		this.reportParentCode = reportParentCode;
	}

	public String getReportName() {
		return this.reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getQueryCode() {
		return this.queryCode;
	}

	public void setQueryCode(String queryCode) {
		this.queryCode = queryCode;
	}

	public int getColumnsTotal() {
		return this.columnsTotal;
	}

	public void setColumnsTotal(int columnsTotal) {
		this.columnsTotal = columnsTotal;
	}

	public String getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

}