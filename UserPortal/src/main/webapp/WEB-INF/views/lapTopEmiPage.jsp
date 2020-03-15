<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<style type="text/css">

 a:hover {
  background-color: green;
}

.laptop-user-input{
border-radius: 5px;
border-color: lightgrey;
margin-left: 80px;
width:150px;
}

.footer-panel{
	text-align: center;
    clear: both;
    padding: 200px 0px 10px;
}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/medCommon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/cssStyle/loanDetails.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loan/EMI</title>
<script type="text/javascript">
$( function() {
    $( "#lapPurchaseDate" ).datepicker();
  } );
	
</script>
</head>
<body class="lapViewBackround">


<div class="header-left-emi">

<ul id="main-nav" class="corner-left" style="border-top-left-radius: 4px; border-bottom-left-radius: 4px;">
			<li title="Discover how car leasing can change the way you drive"><a href="${pageContext.request.contextPath}/loanDetailsControl/addLoanDetails"> Add Loan Details </a></li>
			<li title="Opt for mobility services to add more power to your lease"><a href="/EE/mobilityServices.htm">Loan Details</a></li>
			<!-- <li title=""><a href=""></a></li> -->
</ul>



	<div class="card card-4"  id="content-div">
                <div class="card-body">
                    <h2 class="title">Loan-Details-Form</h2>
		<div style="text-align: justify; ">
							User Portal Provides you to enter you Loan Details.
							This is to identify or view your loan records.
							 <br><br>
				
							Complete the form below and get access to a special discount voucher code that can be used on 
							<a target="__new" href="https://www.revv.co.in/">www.revv.co.in</a> or the Revv App.
							<a href="https://www.revv.co.in/policy" target="__new">Click here</a> to read Revv's Terms &amp; 
							Conditions.<br><br>
						</div>
	</div>

	<%-- <form:form action="${pageContext.request.contextPath}/submitlaptopEmi" method="POST" modelAttribute="laptopEmiBean" id="laptopEmiForm">        	
        	<div align="center">
        		<h1>Loan Details</h1>
        	</div>
        	<div>
        	<table class="table table-striped" style="width: 100%">
        		<thead>
        		<tr style="background-color: cadetblue;">
        			<th width="10%">Loan Name:</th>
        			<th width="10%">Loan EMI:</th>
        			<th width="10%">Loan EMI Paid Date:</th>
        			
        		</tr>
        		</thead>
        		<tbody>
        			<tr>
        				<td>
        				<select id="lapName" name="lapName" class="laptop-user-input">
        				
        				<option value="select">Select</option>
        				<c:forEach var="iterateMapDetails" items="${laptopEmiBean}">
        				<option value="${ iterateMapDetails.key}">${iterateMapDetails.value}</option>
        				</c:forEach>
        				</select>
        				</td>
        				<td><input type="text" name="lapModel" id="lapModel" class="laptop-user-input" required></td>
        				<td><input type="text" name="lapPurchaseDate" id="lapPurchaseDate" class="laptop-user-input" required></td>
        				
        				
        			</tr>
        		</tbody>
        	</table>
        	
        	<div>&nbsp;</div>
        	<div>&nbsp;</div>
        	<div>&nbsp;</div>
        	</div>
        	<div align="left">
        				<input type="submit" value="Submit"/>
        			</div>
        	<div align="right">
        		<a href="/PortalApp/Exit" id="">
			<img alt="close" class="close" id="exitAddEmi" src="resource/exit_btn_popup.gif"></a>
        	</div>		
        	
        </form:form> --%>
       </div>
</div>


</body>
</html>