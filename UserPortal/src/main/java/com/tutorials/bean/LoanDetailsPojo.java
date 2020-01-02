package com.tutorials.bean;

import java.util.Date;

public class LoanDetailsPojo {
	
	
	
	private String loan_bank_name;
	private String loan_type;
	private Integer tenure;
	private Double emi;
	private String user_flag;
	private Date loan_date;
	private Date emi_paid_date;
	
	private String property_name;
	private String area_city;
	private String prop_Address;
	private String builder;
	private Integer pincode;
	private Integer contact_num;
	
	
	public String getLoan_bank_name() {
		return loan_bank_name;
	}
	public void setLoan_bank_name(String loan_bank_name) {
		this.loan_bank_name = loan_bank_name;
	}
	public String getLoan_type() {
		return loan_type;
	}
	public void setLoan_type(String loan_type) {
		this.loan_type = loan_type;
	}
	public Integer getTenure() {
		return tenure;
	}
	public void setTenure(Integer tenure) {
		this.tenure = tenure;
	}
	public Double getEmi() {
		return emi;
	}
	public void setEmi(Double emi) {
		this.emi = emi;
	}
	public String getUser_flag() {
		return user_flag;
	}
	public void setUser_flag(String user_flag) {
		this.user_flag = user_flag;
	}
	public Date getLoan_date() {
		return loan_date;
	}
	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
	}
	public Date getEmi_paid_date() {
		return emi_paid_date;
	}
	public void setEmi_paid_date(Date emi_paid_date) {
		this.emi_paid_date = emi_paid_date;
	}
	public String getProperty_name() {
		return property_name;
	}
	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}
	public String getArea_city() {
		return area_city;
	}
	public void setArea_city(String area_city) {
		this.area_city = area_city;
	}
	public String getProp_Address() {
		return prop_Address;
	}
	public void setProp_Address(String prop_Address) {
		this.prop_Address = prop_Address;
	}
	public String getBuilder() {
		return builder;
	}
	public void setBuilder(String builder) {
		this.builder = builder;
	}
	public Integer getPincode() {
		return pincode;
	}
	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}
	public Integer getContact_num() {
		return contact_num;
	}
	public void setContact_num(Integer contact_num) {
		this.contact_num = contact_num;
	}
	
	

}
