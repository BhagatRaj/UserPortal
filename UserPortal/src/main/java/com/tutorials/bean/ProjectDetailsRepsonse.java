package com.tutorials.bean;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProjectDetailsRepsonse {

	
	private String projectCode;
	private String projectName;
	private List<String> ApplicationDetails=new ArrayList<String>();
	private String golubID;
	
	
	private String clientName;
	private LocalDate projJoinDate;
	
	
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public LocalDate getProjJoinDate() {
		return projJoinDate;
	}
	public void setProjJoinDate(LocalDate projJoinDate) {
		this.projJoinDate = projJoinDate;
	}
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
