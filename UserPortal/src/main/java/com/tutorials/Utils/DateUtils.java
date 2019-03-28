package com.tutorials.Utils;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.ParseException;

public class DateUtils {

	
	public static String getStringDate(Date dt) {

		if (dt != null) {
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"dd-MM-yyyy");

			return sdf.format(dt);
		}
		return "";
	}
	
	
	public static Date parseDate(String dateString, String pattern)
			throws Exception {
		SimpleDateFormat format = new SimpleDateFormat(pattern);

		// logger.info("Format=" + format);
		try {
			// logger.info(" Date Format:"+format.parse(dateString));
			return dateString.equals(Constants.emptyString) ? null : format
					.parse(dateString);

		} catch (ParseException e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public static Date getSimpleDate(String date) throws Exception {
		//StringBuffer sb = new StringBuffer();
		String pattern = "dd/MM/yyyy";
		Date dt = parseDate(date, pattern);
		
		return dt;
	}
	
	public static Date showSimpleDate(String dateString) {
		

	      DateFormat formatter; 
	      Date date = null; 
	    
		try {
			
			  formatter = new SimpleDateFormat("yyyy-MM-DD");
		      date = (Date)formatter.parse(dateString);
		      System.out.println("Date Value is:"+date);
		
			
		}catch (ParseException e) {
				e.printStackTrace();
		}
		return date;
			
	}
	
	
	
}
