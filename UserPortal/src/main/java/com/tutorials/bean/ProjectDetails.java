package com.tutorials.bean;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;


public class ProjectDetails {

	
	private String projectCode;
	private String projectName;
	private List<String> ApplicationDetails=new ArrayList<String>();
	private String golubID;
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public List<String> getApplicationDetails() {
		return ApplicationDetails;
	}
	public void setApplicationDetails(List<String> applicationDetails) {
		ApplicationDetails = applicationDetails;
	}
	public String getGolubID() {
		return golubID;
	}
	public void setGolubID(String golubID) {
		this.golubID = golubID;
	}
	
	
	
	
}
