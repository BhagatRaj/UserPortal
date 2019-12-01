<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/medCommon.css"/>

<title>MainScreen</title>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="<c:url value="/resource/theme1/js/userDivCommon.js"/>"></script>


<style type="text/css">

#content-wrap {padding: 0px !important;}

.header-left-top {height: 80px;padding-top: 10px;position: relative;}

.left-row1{width:229px; float:left;}
.right-row1{width:256px; float:right;}

ul.left-row1>li>label{
    color: #6b2525;
    outline: 0;
    padding: 2px 6px;
    font-size: 11px;
}

ul.right-row1>li>label{
    color: #6b2525;
    outline: 0;
    padding: 2px 6px;
    font-size: 11px;
}


</style>

<script type="text/javascript">
 $(function(){
	$("#datepicker").datepicker();
});
 
 
 <%
 	String path=request.getContextPath();
 %>
function submitData(){
	
	
    var modelNum=$("#modelNum").val();
    var datepicker=$("#datepicker").val();
    if(modelNum=="" || datepicker==""){
    	
    	alert("Please enter the field");
    	return false;
    }
	document.getElementById("searchLoader").style.display = "block";
	$.ajax({
		  url:"/PortalApp/showDetailsforAutMob",
		  type:"GET",
		  data: "modelNum="+modelNum+"&datepicker="+datepicker,
		  dataType:"html",
		  success:function(data){
			  document.getElementById("searchLoader").style.display = "none"; 
			  console.log("before Replaced"+data);
			 var autData=data.replace(/[[\]]/g,'');
			 console.log("after Replaced"+autData);
			 autData=autData.replace(/["']/g, "");
			 autData=autData.split(",");
			 console.log("after Split"+autData);
			 
			  for(var i=0; i<autData.length; i++){
				  document.getElementById("displayAutMob").style.display = "block";
				  
				  document.getElementById("modelNumtd").innerHTML =autData[0]; 
				  document.getElementById("dateOfpurchasetd").innerHTML =autData[1];
				  document.getElementById("engineCCtd").innerHTML =autData[2];
				  document.getElementById("mileagetd").innerHTML =autData[3];
				  document.getElementById("topSpeedtd").innerHTML =autData[4];
			  
			  }
		  }
		});
    
}
 
 function calculateEmi(){
	 alert("function called");
	 var modelNum=$("#modelNum").val(); 
	  document.getElementById("displayAutoForm").action="/UserPortal/calculateEmi?modelNum="+modelNum;
	  document.getElementById("displayAutoForm").submit();
}	

</script>


</head>
<body>
<div> 	
  	<jsp:include page="nav-bar.jsp"/>
  </div>
  
<div id="contentDiv" class="two-column">	
<div id="left-column" class="spcolumn top-bar black corner-all" style="height: 846px; border-radius: 4px;">
		<h2 class="gray">Lists</h2>
		
		
		
		<ul id="navlist">
		
		<li>
		<a href="javascript:void(0)" onclick="getPages('contactUsLeads.htm?id=1006');" style="text-transform: capitalize;">Current Employement</a>
		</li>
		
		<li>
		<a href="javascript:void(0)" onclick="getPages('contactUsLeads.htm?id=1006');" style="text-transform: capitalize;">Contact Us Leads</a>
		</li>
		</ul>
		</div>
		
		<div id="right-column" class="spcolumn corner-all" style="height: 846px; border-radius: 4px;">
		
		<div id="content-wrap">
			<h1 class="page-title-main" style="height:40px;"><span style="display:block; width:205px; padding-bottom:10px; float:right;">	Employment Details
			</span></h1>	
			
			
			<div class="mainDiv" id="mainDiv" >
<h1>${newKey}</h1>
<c:choose>
	<c:when test="${techStatus eq 'HCL'}">
			<div align="center" class="empl-details">
			${techStatus}
			</div>
			
			<div>
			
			<span class="empDetails">Employment Details</span>

              <div style="overflow: auto; border-bottom: 2px solid #cecece; padding: 50px 0px;">

                     <ul class="left-row1">

                           <li><label>Employee Name:</label><span>${empName}
                                                       </span></li>
                           <li><label>Employee ID:</label><span>${empId}
                                                       </span></li>
                           <li><label>Company Name:</label><span>${compName}

                                                       </span></li>                                                      
                           <li><label>Working Location:</label><span>${wrkLocation}
                                                       </span></li>                                                                                   
                     </ul>

                     <ul class="right-row1">
                           
                           <li><label>Tower:</label><span>${tower}

                                                       </span></li>
                           <li><label>Application Tower:</label><span>${appTower}

                                                       </span></li>  
                                                       
                           <li><label>Tech Specs:</label><span>${techSpec}

                                                       </span></li>                                                   
                                                                                                        

                     </ul>
              </div>

              <span class="projDetails">Project Details</span>
              <div style="overflow: auto; border-bottom: 2px solid #cecece; padding: 13px 0px;">
              <ul class="left-row1">
                                      
                           <li><label>Project Code:</label><span>${projCode}

                                                       </span></li>
                           <li><label>Project Name:</label><span>${projName}

                                                       </span></li>
                           <li><label>Golub ID:</label><span>${golubId}

                                                       </span></li>
                           <li><label>Work Location:</label><span>${wrkLocation}

                                                       </span></li>    
                        
                                                       
                     </ul>

              </div>
</div>
			
			<%-- 
				<div style="overflow: auto;
				    padding-bottom: 20px;">	
				<ul class="left-row">
				 <li>
				 
				 
								   <label class="heading">Name:</label><span>${empName}</span>
								   </li>
								     <li>
								   <label class="heading">Employee ID:</label><span>${empId}</span>
								   </li>
								     <li>
								   <label class="heading">CompanyName :</label><span>${compName}</span>
								   </li>
								     <li>
								   <label class="heading">WorkingLocation :</label><span>${wrkLocation}</span>
								   </li>
				
				</ul>
				
				</div> --%>
				<div style="clear: both"></div>
			
			
	</c:when>
	<c:otherwise>
	
	<fieldset class="login" style="width: 47%"><legend>
</legend>
<table width="100%">
	<tr>
		<td class="">
		<table>
			<tbody>
				<tr>
					<td class=""><B>Model Name</B>:</td>
					<td><select id="modelNum" class="modelNum" name="modelNum">
						<option value="select">Select</option>
						<option value="Bajaj Avenger Street">Bajaj Avenger Street</option>
						<option value="Royal Enfield">Royal Enfield</option>
						<option value="Ktm">Ktm</option>
						<option value="Harley Davidson">Harley Davidson</option>
						<option value="Tvs Apache">Tvs Apache</option>
						<option value="Tvs Sport">Tvs Sport</option>
						<option value="Hero Honda">Hero Honda</option>
					</select></td>
					<td class="" align="right"><B>Year of Purchase</B>:</td>
					<td><input type="text" name="datepicker"  class="datepicker" id="datepicker" /></td>
				</tr>
				<tr>
					<td align="center"></td>
					<td><input type="submit"  value="Search" name="submitData" id="submitData" onclick="submitData()"></td>
					
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
</table>
</fieldset>
	
	
	<div id="searchLoader" style="display: none;"><img alt="backLoading" src="resource/images.png">
</div>
 <form:form id="displayAutoForm">
<div  id="displayAutMob" class="displayAutMob" style="display: none;" >
		 <h1>Details Of Bike</h1>
		<table border="1" width="100%" cellpadding="0" style="background:silver;">  
	<tr><th align="left" width="20%">ModelName</th>
	<th align="left" width="20%">DateOfPurchase</th>
	<th align="left" width="10%">Engine CC</th>
	<th align="left" width="10%">Mileage</th>
	<th align="left" width="20%">TopSpeed</th>
	</tr>  
 
	 <tr>  
  	 <td id="modelNumtd"></td>  
  	  <td id="dateOfpurchasetd"></td>  
  	   <td id="engineCCtd"></td>  
  	    <td id="mileagetd"></td>  
  	     <td id="topSpeedtd"></td>    	
  	 </tr>
   </table>
   <div>
   </div>  

</div>
</form:form>
<div  id="totalEmiDiv" class="totalEmiDiv" style="display: none;" >
		 <h1>Total Emi List</h1>
		<table border="1" width="100%" cellpadding="0" style="background:#8FBC8F;">  
	<tr><th align="left" width="20%">Month</th>
	<th align="left" width="20%">Amount</th>
	<th align="left" width="10%">Date of Paid</th>
	<th align="left" width="10%">Bike Name</th>
	
	</tr>  
 
	 <tr>  
  	 <td id="EmiMonthtd"></td>  
  	  <td id="emiAmounttd"></td>  
  	   <td id="dateOfPaidtd"></td>  
  	    <td id="nameOfBiketd"></td>   	
  	 </tr>
   </table>
   <div>
   <table>
   	<tr>
   	
   </table>
   </div>  

</div>
	</c:otherwise>
</c:choose>


</div>
			
		
		</div>
		
		</div>
</div>

</body>
</html>