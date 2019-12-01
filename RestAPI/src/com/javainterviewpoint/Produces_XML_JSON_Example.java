package com.javainterviewpoint;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("produceboth")
public class Produces_XML_JSON_Example {

		@Path("both")
	    @GET
	    @Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	    public ProjectDetails getBothResponse()
	    {
		 
		 List<String> projDetails = new ArrayList<String>();
		  	projDetails.add("Item Distribution & Shippers UI");
		  	projDetails.add("Store Delivery System.");
		  	projDetails.add("SOM");
		  	projDetails.add("Trailer Wash");
		  	projDetails.add("Floral Selection");
		  	projDetails.add("AppSpace");
		  	
		  	
		  
		  
		 	System.out.println("RestApi got hit-------");
	        ProjectDetails proj = new ProjectDetails();
	        proj.setProjectName("Price Chopper");
	        proj.setProjectCode("C/185733");
	        proj.setGolubID("Bhagatrajsingh@golub.com");
	        proj.setProjectDuration("5 Years");
	        proj.setProjectLocation("New York(USA)");
	        proj.setProjectState("Steady State");
	        
	        proj.setApplicationDetails(projDetails);
	        
	        return proj;
	    }
		
		@Path("getEmploymentDetails")
	    @GET
	    @Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
		public EmploymentVO getEmploymentDetails(@QueryParam("empId") String empId) {
			
			
			
			return null;
			
			
		}
		
	
}
