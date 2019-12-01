package com.tutorials.sqlConstants;

public class MedSqlConstants {
	public final static String queryForDropDownList="select lapName,lapModel from laptopemitable";

	public final static String queryForCreditDetailsList="select CardName,CardNum,CreditExp,CredExpMonth,ExpenseYear,Comment,CardType,CardUser from creditcard";
	
	public final static String getEmployementDetails="select EmpID, EmpName, CompanyName, DOJ, WorkingLocation, Tower, AppTower, TechSpecs from employmentdetails where CompId=?";
}
