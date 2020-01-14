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
	

	
	private String property_name;
	private String area_city;
	private String prop_Address;
	private String builder;
	private Integer pincode;
	private Integer contact_num;
	
	
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
	
	
	@Column(name="user_flag",length=100)
	public String getUser_flag() {
		return user_flag;
	}
	public void setUser_flag(String user_flag) {
		this.user_flag = user_flag;
	}
	
	@Column(name="property_name",length=100)
	public String getProperty_name() {
		return property_name;
	}
	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}
	
	@Column(name="area_city",length=100)
	public String getArea_city() {
		return area_city;
	}
	public void setArea_city(String area_city) {
		this.area_city = area_city;
	}
	
	@Column(name="prop_address",length=100)
	public String getProp_Address() {
		return prop_Address;
	}
	public void setProp_Address(String prop_Address) {
		this.prop_Address = prop_Address;
	}
	
	@Column(name="builder",length=100)
	public String getBuilder() {
		return builder;
	}
	public void setBuilder(String builder) {
		this.builder = builder;
	}
	
	@Column(name="pin_code",length=100)
	public Integer getPincode() {
		return pincode;
	}
	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}
	
	@Column(name="contact_num",length=100)
	public Integer getContact_num() {
		return contact_num;
	}
	public void setContact_num(Integer contact_num) {
		this.contact_num = contact_num;
	}
	
}
