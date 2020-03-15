package com.javainterviewpoint;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ProjectDetails {

	private String projectCode;
	private String projectName;
	private List<String> ApplicationDetails=new ArrayList<String>();
	private String golubID;
	private String ProjectDuration;
	private String ProjectLocation;
	private String projectState;
	
	
	public String getProjectDuration() {
		return ProjectDuration;
	}
	public void setProjectDuration(String projectDuration) {
		ProjectDuration = projectDuration;
	}
	public String getProjectLocation() {
		return ProjectLocation;
	}
	public void setProjectLocation(String projectLocation) {
		ProjectLocation = projectLocation;
	}
	public String getProjectState() {
		return projectState;
	}
	public void setProjectState(String projectState) {
		this.projectState = projectState;
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
