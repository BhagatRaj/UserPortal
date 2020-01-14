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

#upload-progress{
    height: 20px;
    border: 1px solid #ddd;
    width: 100%;
}
#upload-progress .progress-bar{
	background: #bde1ff;
    width: 0;
    height: 20px;
}

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
                    
                    
                    <form action="${pageContext.request.contextPath}/loanDetailsControl/saveLoanDetails" method="POST" id="loanDetailsModel">
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
                            <input type="submit" name="submit" value="Submit Form" />
                        </div>
                    </form>
                    <div id="upload-progress"><div class="progress-bar"></div></div> <!-- Progress bar added -->
                    
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="footer.jsp"%>

</body>
</html>