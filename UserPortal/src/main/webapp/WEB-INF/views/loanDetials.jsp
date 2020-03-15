<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/user-form.css"/>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loan-Form</title>
</head>
<body>

		<div class="mainDiv" style="position: relative; border-radius: 4px; height: 825px;">
		    <form action="${pageContext.request.contextPath}/loanDetailsControl/saveLoanDetails" class="lpin-form" method="POST" id="loanDetailsModel">
					<div class="user-details">
							<h1> Loan-Details</h1>
						
							<div style="margin-right: 55px;text-align: right; margin-bottom: 10px;"><span style="color: red;">*</span> Required</div>
							<div class="form-element">
								<label for="loan_bank_name" class="required">Bank-Name </label>
								<input type="text" name="loan_bank_name" id="loan_bank_name" value="" required="required" onkeypress="return validalphabet(event);">
							</div>
							<div class="form-element">
								<label for="tenure" class="required">Tenure</label>
								  <select id="tenure" name="tenure">
								  <c:forEach items="${tenureList}" var="tenureCategory">
								  <option value="${tenureCategory}">${tenureCategory}</option>
								  </c:forEach>
								
                                    </select>
							</div>
							<div class="form-element">
								<label for="loan_date">Issued-Date</label>
								<input type="date" name="loan_date" id="loan_date" value="">
							</div>
							<div class="form-element">
								<label for="loan_type" class="required">Loan-Type</label>
								<select id="loan_type" name="loan_type">
				 				<option value="H">Home</option>
								 <option value="P">Personal</option>
								</select>
							</div>
							<div class="form-element">
								<label for="emi" class="required">Emi-Amount</label>
								<input type="text" name="emi" id="emi" value="" required="required" maxlength="10" onkeypress="return validnumber(event);">
							</div>
							<div class="form-element">
								<label for="contact" class="required">Emit-Payment-Date</label>
								<input type="date" name="emi_paid_date" id="emi_paid_date" value="" required="required" maxlength="10">
							</div>
								
					
					</div>
						
					<div class="car-details"> 		
						<h1>Property Details</h1>
						<div style="margin-right: 55px;text-align: right;margin-bottom: 18px;"></div>
						<div class="form-element">
								<label for="property_name" class="required">Property-Name</label>
								<input type="text" name="property_name" id="property_name" value="" required="required" onkeypress="return validalphabet(event);">
							</div>
							<div class="form-element">
								<label for="area_city" class="required">Area/City</label>
								<input type="text" name="area_city" id="area_city" value="" required="required">
							</div>
							<div class="form-element">
								<label for="prop_Address" class="required">Address</label>
								<input type="text" name="prop_Address" id="prop_Address" value="" required="required" onkeypress="return validalphabet(event);">
							</div>
							<div class="form-element">
								<label for="builder" class="required">Builder</label>
								<input type="text" name="builder" id="builder" value="" required="required">
							</div>
							<div class="form-element">
								<label for="pinCode" class="required">Pin-code</label>
								<input type="text" name="pincode" id="pincode" value="" required="required" maxlength="10" onkeypress="return validnumber(event);">
							</div>
							
								<div class="form-element">
								<label for="contact_num" class="required">Contact-number</label>
								<input type="text" name="contact_num" id="contact_num" value="" required="required" maxlength="10">
							</div>
					</div>

					<div class="form-element new-line">
								<input type="checkbox" required="required" oninvalid="this.setCustomValidity('Please accept terms and conditions to proceed.')" oninput="this.setCustomValidity('')"> 
								<span>I agree that I have read and understood the <a href="#"> Terms and Conditions</a>
								<button type="submit" class="lpin-theme-button" name="submit-form" id="submit-form" style="float: right;margin-right: 54px;margin-top: 3px;">
									SUBMIT
								</button>		
								</span>	 
						</div>
						</form>
</div>


</body>
</html>