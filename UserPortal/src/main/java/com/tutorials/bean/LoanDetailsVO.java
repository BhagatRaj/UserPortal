package com.tutorials.bean;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="loan_details_table")
public class LoanDetailsVO {
	
	private Integer loanId;
	private String loan_bank_name;
	private String loan_type;
	private Integer tenure;
	private Double emi;
	private String user_flag;
	private Date loan_date;
	private Date emi_paid_date;
	private Date datetimeCreated;
	private Date datetimeUpdated;
	
	@OneToOne(mappedBy="loanDetails",cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private UserLoanBean loanBean;
	
	
	@Id
	@GeneratedValue
	@Column(name = "loan_id", unique = true, nullable = false, length = 10)
	public Integer getLoanId() {
		return loanId;
	}
	public void setLoanId(Integer loanId) {
		this.loanId = loanId;
	}
	
	
	@Column(name="lbank_name",length=100)
	public String getLoan_bank_name() {
		return loan_bank_name;
	}
	public void setLoan_bank_name(String loan_bank_name) {
		this.loan_bank_name = loan_bank_name;
	}
	
	@Column(name="lbank_type",length=1)
	public String getLoan_type() {
		return loan_type;
	}
	public void setLoan_type(String loan_type) {
		this.loan_type = loan_type;
	}
	
	@Column(name="tenure")
	public Integer getTenure() {
		return tenure;
	}
	public void setTenure(Integer tenure) {
		this.tenure = tenure;
	}
	
	@Column(name="lbank_name",length=100)
	public Double getEmi() {
		return emi;
	}
	public void setEmi(Double emi) {
		this.emi = emi;
	}
	
	@Column(name="loan_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getLoan_date() {
		return loan_date;
	}
	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
	}
	
	@Column(name="emi_paid_date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getEmi_paid_date() {
		return emi_paid_date;
	}
	public void setEmi_paid_date(Date emi_paid_date) {
		this.emi_paid_date = emi_paid_date;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "datetime_created", length = 23)
	public Date getDatetimeCreated() {
		return datetimeCreated;
	}
	public void setDatetimeCreated(Date datetimeCreated) {
		this.datetimeCreated = datetimeCreated;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "datetime_updated", length = 23)
	public Date getDatetimeUpdated() {
		return datetimeUpdated;
	}
	public void setDatetimeUpdated(Date datetimeUpdated) {
		this.datetimeUpdated = datetimeUpdated;
	}
	
	
	public UserLoanBean getLoanBean() {
		return loanBean;
	}
	public void setLoanBean(UserLoanBean loanBean) {
		this.loanBean = loanBean;
	}
	public LoanDetailsVO(Integer loanId, String loan_bank_name, String loan_type, Integer tenure, Double emi,
			String user_flag, Date loan_date, Date emi_paid_date, Date datetimeCreated, Date datetimeUpdated,
			UserLoanBean loanBean) {
		super();
		this.loanId = loanId;
		this.loan_bank_name = loan_bank_name;
		this.loan_type = loan_type;
		this.tenure = tenure;
		this.emi = emi;
		this.user_flag = user_flag;
		this.loan_date = loan_date;
		this.emi_paid_date = emi_paid_date;
		this.datetimeCreated = datetimeCreated;
		this.datetimeUpdated = datetimeUpdated;
		this.loanBean = loanBean;
	}
	
	
	public LoanDetailsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "LoanDetailsVO [loanId=" + loanId + ", loan_bank_name=" + loan_bank_name + ", loan_type=" + loan_type
				+ ", tenure=" + tenure + ", emi=" + emi + ", user_flag=" + user_flag + ", loan_date=" + loan_date
				+ ", emi_paid_date=" + emi_paid_date + ", datetimeCreated=" + datetimeCreated + ", datetimeUpdated="
				+ datetimeUpdated + ", loanBean=" + loanBean + "]";
	}
	
	
	
}
