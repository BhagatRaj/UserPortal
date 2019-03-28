package com.tutorials.bean;

import java.util.Date;

/**
 * @author Bhaga
 *
 */
/**
 * @author Bhaga
 *
 */
public class EmploymentDetailsBean {

	private String EmpID;
	private String EmpName;
	private String CompanyName;
	private Date DOJ;
	private String WorkingLocation;
	private String EmpPprofile;
	private String TechnicalSpecs;
	private String ProjectState;
	private String ReportingManager;
	private String appTower;
	private String tower;
	private String techSpecs;
	
	
	public String getTechSpecs() {
		return techSpecs;
	}
	public void setTechSpecs(String techSpecs) {
		this.techSpecs = techSpecs;
	}
	public String getAppTower() {
		return appTower;
	}
	public void setAppTower(String appTower) {
		this.appTower = appTower;
	}
	public String getTower() {
		return tower;
	}
	public void setTower(String tower) {
		this.tower = tower;
	}
	public String getEmpPprofile() {
		return EmpPprofile;
	}
	public void setEmpPprofile(String empPprofile) {
		EmpPprofile = empPprofile;
	}
	public String getTechnicalSpecs() {
		return TechnicalSpecs;
	}
	public void setTechnicalSpecs(String technicalSpecs) {
		TechnicalSpecs = technicalSpecs;
	}
	public String getProjectState() {
		return ProjectState;
	}
	public void setProjectState(String projectState) {
		ProjectState = projectState;
	}
	public String getReportingManager() {
		return ReportingManager;
	}
	public void setReportingManager(String reportingManager) {
		ReportingManager = reportingManager;
	}
	public EmploymentDetailsBean() {
		
	}
	public String getEmpID() {
		return EmpID;
	}
	public void setEmpID(String empID) {
		EmpID = empID;
	}
	public String getEmpName() {
		return EmpName;
	}
	public void setEmpName(String empName) {
		EmpName = empName;
	}
	public String getCompanyName() {
		return CompanyName;
	}
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}
	public Date getDOJ() {
		return DOJ;
	}
	public void setDOJ(Date dOJ) {
		DOJ = dOJ;
	}
	public String getWorkingLocation() {
		return WorkingLocation;
	}
	public void setWorkingLocation(String workingLocation) {
		WorkingLocation = workingLocation;
	}
		
	
	
}
