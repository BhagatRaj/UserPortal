package com.tutorials.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="loan_details_bean")

public class loanDetailsBean {
	
	private Integer loanId;
	private String loan_bank_name;
	private String loan_type;
	private Integer tenure;
	private Integer emi;
	private String owner_name;
	private Date loan_date;
	private Date emi_paid_date;
	private Date datetimeCreated;
	private Date datetimeUpdated;
	
	
	@Id
	@GeneratedValue
	@Column(name="loan_id", unique =true, nullable = false, length=10)
	public Integer getLoanId() {
		return loanId;
	}
	public void setLoanId(Integer loanId) {
		this.loanId = loanId;
	}
	
	@Column(name = "loan_bank_name", length=20)
	public String getLoan_bank_name() {
		return loan_bank_name;
	}
	public void setLoan_bank_name(String loan_bank_name) {
		this.loan_bank_name = loan_bank_name;
	}
	
	@Column(name = "loan_type", length=20)
	public String getLoan_type() {
		return loan_type;
	}
	public void setLoan_type(String loan_type) {
		this.loan_type = loan_type;
	}
	
	@Column(name = "loan_tenure")
	public Integer getTenure() {
		return tenure;
	}
	public void setTenure(Integer tenure) {
		this.tenure = tenure;
	}
	
	@Column(name = "loan_emi")
	public Integer getEmi() {
		return emi;
	}
	public void setEmi(Integer emi) {
		this.emi = emi;
	}
	
	@Column(name = "owner_name", length=20)
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="loan_date", length=23)
	public Date getLoan_date() {
		return loan_date;
	}
	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="emi_paid_date", length=23)
	public Date getEmi_paid_date() {
		return emi_paid_date;
	}
	public void setEmi_paid_date(Date emi_paid_date) {
		this.emi_paid_date = emi_paid_date;
	}
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="datetime_created", length=23)
	public Date getDatetimeCreated() {
		return datetimeCreated;
	}
	public void setDatetimeCreated(Date datetimeCreated) {
		this.datetimeCreated = datetimeCreated;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="datetime_updated", length=23)
	public Date getDatetimeUpdated() {
		return datetimeUpdated;
	}
	public void setDatetimeUpdated(Date datetimeUpdated) {
		this.datetimeUpdated = datetimeUpdated;
	}

	

}



