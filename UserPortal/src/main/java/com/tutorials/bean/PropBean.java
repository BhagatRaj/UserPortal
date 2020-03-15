package com.tutorials.bean;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;

/**
 * @author Bhaga
 *
 */
@Embeddable
public class PropBean {
	
	@Column(name="property_name")
	private String property_name;
	
	@Column(name="area_city")
	private String area_city;
	
	@Column(name="prop_add")
	private String prop_Address;
	
	@Column(name="builder")
	private String builder;
	
	@Column(name="pincode")
	private Integer pincode;
	
	@Column(name="contact_num")
	private Integer contact_num;

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

	public PropBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
