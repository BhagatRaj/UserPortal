<%@page import="org.hibernate.Incubating"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/cssStyle/loanDetails.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Loan Details</title>
<style type="text/css">

.two-column #middle-column {float: right;width: 537px;background-color: #eaeaea;height: auto;}
.red-font{
color: red;
}

</style>


<script type="text/javascript">

$(document).ready(function() {
	
	$('#content-div').hide();
	
	$( function() {
	    $("#loanDate,#emiPaidDate").datepicker({  maxDate: new Date() });
	  } );

});

</script>

</head>
<body>

<div id="page-wrapper">

<%@ include file="lapTopEmiPage.jsp"%>


 <div class="page" style="background-color: #E9E9E9">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Loan-Details-Form</h2>
                    
                    
                    <form:form modelAttribute="loanDetailsModel" action=" ${pageContext.request.contextPath}/loanDetailsControl/saveLoanDetails" method="POST" id="loanDetailsModel">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">loan Bank name<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="loan_bank_name" maxlength="40" required>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Tenure<span class="red-font">*</span></label>
                                    <select class="input--style-4" id="tenure" name="tenure">
                                    <c:forEach items="${tenureList}" var="category">
            						<option value="${category}">${category}</option>
        							</c:forEach>	
                                    </select>
                                    
                                    <!-- <input class="input--style-4" type="tel" name="tenure" pattern=".{10}" title="Enter Valid Mob No" required> -->
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Loan Issued Date<span class="red-font">*</span></label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4" type="text" id="loanDate" name="loan_date">
                                     
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Type:Loan<span class="red-font">*</span></label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Personal<span class="red-font">*</span>
                                            <input type="radio" checked="checked" name=loan_type>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Home<span class="red-font">*</span>
                                            <input type="radio" name="loan_type">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                             <div class="col-2">
                                <div class="input-group">
                                    <label class="label">EMI<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="emi">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Emi-Paid Date1<span class="red-font">*</span></label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" id="emiPaidDate" name="emi_paid_date">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                       <!--  <div class="input-group">
                            <label class="label">Subject</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="subject">
                                    <option disabled="disabled" selected="selected">Choose option</option>
                                    <option>Subject 1</option>
                                    <option>Subject 2</option>
                                    <option>Subject 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div> -->
                        <div>
                        <h2 class="title">Property-details</h2>
                        </div>
                         <div class="row row-space">
                             <div class="col-2">
                             <div class="input-group">
                                    <label class="label">Property-Name<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="property_name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Area/City<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="area_city">
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="row row-space">
                             <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Property-Address<span class="red-font">*</span></label>
                                        <input class="input--style-4" type="text" name="prop_Address">
                                        
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Builder<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="builder">
                                </div>
                            </div>
                        </div>
                        
                         <div class="row row-space">
                             <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Pin-Code<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="pincode">
                                    
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Contact-Number<span class="red-font">*</span></label>
                                    <input class="input--style-4" type="text" name="contact_num">
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="footer.jsp"%>
<%-- <div id="page-wrapper">

<%@ include file="lapTopEmiPage.jsp"%>

<div id="content" class="two-column">

<div id="middle-column" style="border-radius: 4px;
    height: 20px;">
<h2>


<spring:message code="lbl.page" text="Add New Employee" /></h2>

<div class="ln-details" style="width: 735px; height:350px;
    background-color: #fff;">
    
    
    <form:form id="contactUsLeadForm" name="contactUsLeadForm" action="javascript:void(0)" method="post" onsubmit="return submitContactUsLeadForm('contactLeadListing')">		
		<ul class="lft-form-wrap">
		
			<li style="padding-top:10px;*padding-top:60px;clear:both;">
			<label>First Name</label><input class="txtbox" type="text" name="firstName" id="firstName" onkeypress="return validalphabet(event);" maxlength="" tabindex="">
			<label>Last Name</label><input class="txtbox" type="text" name="lastName" id="lastName" maxlength="" onkeypress="return validalphabet(event);" tabindex="">
			
			</li>
			
			<li><label>Email ID</label><br><input class="txtbox" type="text" name="emailId" id="emailId" maxlength="" tabindex="">
			<label>City</label><br><input class="txtbox" type="text" name="city" id="city" maxlength="" tabindex="" onkeypress="return validalphabet(event);"></li>
			
			
			<li><label>Home Phone</label><br><input class="txtbox" type="text" name="homePhone" id="homePhone" title="Please enter numeric value for Home Phone" maxlength="" tabindex="">
			<label>Office Phone</label><br><input class="txtbox" type="text" name="officePhone" id="officePhone" title="Please enter numeric value for Office Phone" maxlength="" tabindex=""></li>
			
			
			<li><label>Mobile</label><br><input class="number txtbox" type="text" name="mobile" id="mobile" maxlength="" title="Please enter numeric value for Mobile" tabindex="">
			<label class="orange-font" style="clear:both;">Date Created</label></li>
			
			
			<li style="clear:both;"><span>From</span><br>              
				<input type="text" class="datbox hasDatepicker" name="fromCreatedDate" id="fromCreatedDate"><img class="ui-datepicker-trigger" src="/spadminElig/resources/images/common/calender.jpg" alt="..." title="...">
			</li>
			<li style="clear:both;"><span>To</span><br>
				<input type="text" class="datbox hasDatepicker" name="toCreatedDate" id="toCreatedDate"><img class="ui-datepicker-trigger" src="/spadminElig/resources/images/common/calender.jpg" alt="..." title="...">
			</li>

			<li><span class="btnWrap" style="float:right;padding-right:18px;padding-bottom:10px;" onclick="if (!(submitContactUsLeadForm(&quot;contactLeadListing&quot;))) {return false;}else{document.contactUsLeadForm.submit()}"><span class="btnbgRight"><span style="color:#fff; line-height: 24px;" class="btnTxt">SEARCH</span></span></span></li>
		</ul>
		
		</form:form>
</div>
</div>
	
</div>
</div>

 --%>

</body>
</html>