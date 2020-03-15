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

.processing-area{padding-left: 4px;}
.processing-area.progressing {position: relative;}
		.processing-area.progressing::before {
			animation: 2s linear infinite spinner;
			border: solid 5px #BBB;
			border-bottom-color: #f57f29;
			border-radius: 50%;
			content: "";
			height: 40px;
			left: 50%;
			opacity: inherit;
			position: absolute;
			top: 50%;
			transform: translate3d(-50%, -50%, 0);
			transform-origin: center;
			width: 40px;
			will-change: transform;
			z-index: 100;
		}
		.processing-area.progressing::after {
			content: '';
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			background-color: #00000011;
			margin: -10px;
		}

.two-column #middle-column {float: right;width: 537px;background-color: #eaeaea;height: auto;}
.red-font{
color: red;
}

#upload-progress{
    height: 20px;
    border: 0px solid #ddd;
    width: 100%;
}
#upload-progress .progress-bar{
	background: #bde1ff;
    width: 0;
    height: 20px;
}

.loan-form{
	position: relative;
    padding-top: 10px;
    padding-bottom: 15px;
}

.loan-form .form-element {
			width: 206px;
			display: inline-block;
			margin-bottom: 30px;
		}

.loan-form .form-element.new-line {
			width: 630px;
		}
		.loan-form .form-element.same-line {
			width: auto;
		}
		.loan-form label {
			color: #666;
			width: 120px;
			display: inline-block;
		}
		.loan-form input {
			border: 1px solid;
			border-color: #dadada;
			padding-left: 5px;
			padding-right: 5px;
		}
		.loan-form select {
			border: 1px solid;
			border-color: #dadada;
			padding-left: 5px;
			padding-right: 5px;
			width: 155px;
    		height: 20px;
		}
		.loan-form input[type=checkbox]+* {
			vertical-align: text-bottom;
		}
		.loan-form input:focus {
			outline: none;
			border-color: #9ecaed;
			box-shadow: 0 0 10px #9ecaed;
		}
		.loan-form select:focus {
			outline: none;
			border-color: #9ecaed;
			box-shadow: 0 0 10px #9ecaed;
		}
		.loan-form label.required::after {
			content: ' *';
			color: red;
		}
		.loan-theme-button {
			background: linear-gradient(180deg, #ffb155, #fe891f, #fd8017, #fd8b2e);
			height: 25px;
			display: inline-block;
			padding: 2px 10px;
			border: 1px solid #c55e00;
			border-radius: 3px;
			color: white;
			line-height: 18px;
		}
		@keyframes spinner {
			0% {
				transform: translate3d(-50%, -50%, 0) rotate(0deg);
			}
			100% {
				transform: translate3d(-50%, -50%, 0) rotate(360deg);
			}
		}		
h1.page-title-loandetails {background:url("../images/common/dotted-line.jpg") repeat-x scroll center bottom transparent;color: #FF9933;font-size: 20px;font-weight: bold;padding-bottom: 70px;text-decoration: underline;text-align: center;}
		

</style>


<script type="text/javascript">

$(document).ready(function() {
	
	$('#content-div').hide();
	
	$( function() {
	    $("#loanDate,#emiPaidDate").datepicker({  maxDate: new Date() });
	  } );

});

$("#loanDetailsModel").submit(function(event){
    event.preventDefault(); //prevent default action 
    var post_url = $(this).attr("action"); //get form action url
    var request_method = $(this).attr("method"); //get form GET/POST method
    var form_data = new FormData(this); //Encode form elements for submission
    
    $.ajax({
        url : post_url,
        type: request_method,
        data : form_data,
		contentType: false,
		processData:false,
		xhr: function(){
		//upload Progress
		var xhr = $.ajaxSettings.xhr();
		if (xhr.upload) {
			xhr.upload.addEventListener('progress', function(event) {
				var percent = 0;
				var position = event.loaded || event.position;
				var total = event.total;
				if (event.lengthComputable) {
					percent = Math.ceil(position / total * 100);
				}
				//update progressbar
				$("#upload-progress .progress-bar").css("width", + percent +"%");
			}, true);
		}
		return xhr;
	}
    }).done(function(response){ //
        $("#server-results").html(response);
    });
});

function progressActive() {
	$('#loan-details-form').addClass('progressing');
}

function progressInactive() {
	$('#loan-details-form').removeClass('progressing');
}	


$('#user-details').submit(function() {
	progressActive();
	var reqData={};
	var $form1 = $("#user-details");
	reqData['property_name'] = $form1.find("input[name=property_name]").val();
	reqData['area_city']=$form1.find("input[name=area_city]").val();
	reqData['prop_Address']=$form1.find("input[name=prop_Address]").val();
	reqData['builder']=$form1.find("input[name=builder]").val();
	reqData['pinCode']=$form1.find("input[name=pinCode]").val();
	reqData['contact_num']=$form1.find("input[name=contact_num]").val();
	
	
	//var $form2 = $("#user-details");
	reqData['loan_bank_name']=$form1.find("input[name=loan_bank_name]").val();
	reqData['tenure']=$form1.find("select[name=tenure]").val();
	reqData['loan_date']=$form1.find("input[name=loan_date]").val();
	reqData['loan_type']=$form1.find("select[name=loan_type]").val();
	reqData['emi']=$form1.find("input[name=emi]").val();
	reqData['emi_paid_date']=$form1.find("input[name=emi_paid_date]").val();
		
		$.ajax({
			  url:"/UserPortal/loanDetailsControl/saveLoanDetails",
			  type:"POST",
			  data: reqData,
			  dataType:"html",
			  success:function(data){
				  if(data==null || data==undefined){
					  
						console.log("error");
						 $('#msg').html(data).fadeIn('slow');
					     $('#msg').html("Some error occured..?").fadeIn('slow') //also show a success message 
					     $('#msg').delay(5000).fadeOut('slow');
						
					}
				  else{
					  
					 console.log("Data successfully saved");
					 $('#msg').html(data).fadeIn('slow');
				     $('#msg').html("data insert successfully").fadeIn('slow') //also show a success message 
				     $('#msg').delay(5000).fadeOut('slow');
				  
				  }
					progressInactive();  
			  }
			});
	});
		


</script>

</head>
<body>

<div id="page-wrapper">

<%@ include file="lapTopEmiPage.jsp"%>


<h1 class="page-title-loandetails">
						<span>Loan|Details|Form</span>
					</h1>
 <div id="loan-details-form" style="background-color: #E9E9E9" class="processing-area">
 
 	<div id="msg"></div>
        <form id="user-details" class="loan-form">
        
        <div class="form-element">
        <label for="loan_bank_name" class="required">Bank-Name </label>
        <input type="text" name="loan_bank_name" autocomplete="off" required="required">
        </div>
         <div class="form-element">
        <label for="tenure" class="required">Tenure </label>
        <select id="tenure" name="tenure">
		  <c:forEach items="${tenureList}" var="tenureCategory">
		  <option value="${tenureCategory}">${tenureCategory}</option>
		  </c:forEach>
         </select>
        </div>
         <div class="form-element">
        <label for="loan_date" class="required">Sanction-Date </label>
        <input type="date" name="loan_date" autocomplete="off" required="required">
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
		<label for="emi_paid_date" class="required">Emi-Payment-Date</label>
		<input type="date" name="emi_paid_date" id="emi_paid_date" value="" required="required" maxlength="10">
		</div>				
        
        
        <%-- <form id="property-details" class="loan-form"> --%>
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
		<div><button type="submit" class="loan-theme-button">Submit</button></div>
		</form>
        <%-- </form>        --%>
        </div>
    </div>

<%@ include file="footer.jsp"%>

</body>
</html>