package com.tutorials.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="user_loan_details")

public class UserLoanBean {

	
	private Integer user_id;
	private String property_name;
	private String area_city;
	private String prop_Address;
	private String builder;
	private Integer pincode;
	private Integer contact_num;
	private Date datetimecreated;
	private Date datetimeupdated;
	
	@OneToOne
	private LoanDetailsVO loanDetails;
	
	
	
	
	public LoanDetailsVO getLoanDetails() {
		return loanDetails;
	}
	public void setLoanDetails(LoanDetailsVO loanDetails) {
		this.loanDetails = loanDetails;
	}
	
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "datetime_updated", length = 23)
	public Date getDatetimecreated() {
		return datetimecreated;
	}
	public void setDatetimecreated(Date datetimecreated) {
		this.datetimecreated = datetimecreated;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "datetimeupdated", length = 23)
	public Date getDatetimeupdated() {
		return datetimeupdated;
	}
	public void setDatetimeupdated(Date datetimeupdated) {
		this.datetimeupdated = datetimeupdated;
	}
	@Id
	@GeneratedValue
	@Column(name = "user_Id", unique = true, nullable = false, length = 10)
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	@Column(name="property_name", length=100)
	public String getProperty_name() {
		return property_name;
	}
	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}
	
	@Column(name="area_or_city", length=100)
	public String getArea_city() {
		return area_city;
	}
	public void setArea_city(String area_city) {
		this.area_city = area_city;
	}
	
	@Column(name="property_address", length=100)
	public String getProp_Address() {
		return prop_Address;
	}
	public void setProp_Address(String prop_Address) {
		this.prop_Address = prop_Address;
	}
	
	@Column(name="builder", length=100)
	public String getBuilder() {
		return builder;
	}
	public void setBuilder(String builder) {
		this.builder = builder;
	}
	
	
	@Column(name="pinCode")
	public Integer getPincode() {
		return pincode;
	}
	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}
	
	@Column(name="contact_num", length=10)
	public Integer getContact_num() {
		return contact_num;
	}
	public void setContact_num(Integer contact_num) {
		this.contact_num = contact_num;
	}
	public UserLoanBean(Integer user_id, String property_name, String area_city, String prop_Address, String builder,
			Integer pincode, Integer contact_num) {
		super();
		this.user_id = user_id;
		this.property_name = property_name;
		this.area_city = area_city;
		this.prop_Address = prop_Address;
		this.builder = builder;
		this.pincode = pincode;
		this.contact_num = contact_num;
	}
	@Override
	public String toString() {
		return "UserLoanBean [user_id=" + user_id + ", property_name=" + property_name + ", area_city=" + area_city
				+ ", prop_Address=" + prop_Address + ", builder=" + builder + ", pincode=" + pincode + ", contact_num="
				+ contact_num + "]";
	}
	public UserLoanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
