<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

  <head>
    <title>Credit Details</title>
    
  

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/medCommon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/credit-details-form.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style type="text/css">

.credit-form .form-element{
	width: 196px;
    display: inline-block;
    margin-bottom: 5px;
}

.creditCardAdd{
/* background-image: url(${pageContext.request.contextPath}/backgroundWall/background6.jpg);
height: 270px; */
	height: 255px;
    background-color: #E2E2E4;
}


.credit-user-input{
border-radius: 5px;
border-color: lightgrey;
}

.footer-panel{
	text-align: center;
    clear: both;
    padding: 200px 0px 10px;
}
h1.page-title{
	color: #FF9933;
    font-size: 24px;
    font-weight: bold;
    padding-bottom: 8px;
    
}
.top-bar.black {background: #fff url(${pageContext.request.contextPath}/backgroundWall/topbar-bg-black.jpg) repeat-x top;}

.top-bar h1.innerHd,.top-bar h2.innerHd {line-height: normal;padding-top: 8px;height: 34px;}
.top-bar h1,.top-bar h2 {font-size: 14px;font-weight: bold;line-height: 42px;padding-left: 15px;text-transform: uppercase;color: #E9E9E9;}
.top-bar.black.quote-box p{background-color: #FFF; color: #666; font-weight: bold; padding: 5px 30px; position: absolute; right: 10px; top: 0px;}
.buttonAdd{background: #716d6c;color: #fff; padding: 7px 16px; border-radius: 3px; border: solid 1px #887e7a; outline: 0;}
.buttonExit{background: #716d6c;color: #fff; padding: 7px 16px; border-radius: 3px; border: solid 1px #887e7a; outline: 0;}
.modelbox span.home-info {
    position: absolute;
    bottom: 30px;
    display: inline-block;
    width: 86px;
    left: 30px;
}

.morebtn {
    background: #000 none repeat scroll 0 0;
    color: #fff;
    text-align: center;
    text-transform: uppercase;
    padding: 1px 10px;
    display: inline-block;
}

</style>


<script type="text/javascript">


$(document).ready(function () {
    var saveFlag = $("#saveFlag").val();
    if (saveFlag != "") {
    	showPopupForSubmit('credit-add-submit');
    }
});


function showPopupForSubmit(id){
	$("#" + id).dialog({
		autoOpen : false,
		height : '172',
		width : '351',
		modal : true,
		title : 'Message'
		
	});
	$("#"+id).dialog('open');
}

function exitFromCredDetails(){
	window.location = "/UserPortal/CreditController/exitFromCredit";
	
}

function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
</script>

    
  </head>
  <body>
 
   <div style="width: 100%;
    float: left;
    box-sizing: border-box;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    margin-bottom: 0px" class="top-bar black quote-box">
    
    				<div class="credit-add-submit" id="credit-add-submit" style="display: none; height: 98px;" >
    					<b>Thank you for submitting the form.</b>
    				<br>
    				<br>
    				<br>
    				<input type="button" style="float: rigth; padding:4px 10px 0px;" class="lpin-theme-button" value="OK" onclick="javascript:window.location='${ctx}/';"/>
    				</div>
    
    
        <form:form action="${pageContext.request.contextPath}/CreditController/submitCreditDetails" method="POST"  cssClass="lpin-form" modelAttribute="creditCardBean">
        	<input type="hidden" name="saveFlag" id="saveFlag" value="${saveFlag}">
        	<h1 class="page-title">Credit Add</h1>
        	<p class="corner-button-style" style="border-radius: 15px;">
						Welcome
						<span>${userName}</span>
					</p>
        	
        
        	<div class="creditCardAdd">
        	
        	<div class="form-element">
        		<label for="cardName" class="required">Card-Name</label>
        				<select id="cardName">
        				<option value="select">Select</option>
        				<c:forEach items="${listforDropDown}" var="cardDrowpDown">
						<option value="${cardDrowpDown.cardName}">${cardDrowpDown.cardName}</option>
						</c:forEach>
						</select>
        	
        	</div>
        	<div class="form-element">
        	<label for="CardNumber" class="required">Card-Number</label>
        				<select id="cardNum" >
        				<option value="select">Select</option>
        				<c:forEach items="${listforDropDown}" var="cardDrowpDown">
						<option value="${cardDrowpDown.cardNum}">${cardDrowpDown.cardNum}</option>
						</c:forEach>
						</select>
        	
        	</div>
        	<div class="form-element">
        	<label for="creditExpense" class="required">Credit-Expense</label>
        	<input type="text" name="creditExpAm" id="creditExpAm" onkeypress="return isNumberKey(event)"  required="required"/>
        	</div>
        	  	
        	<div class="form-element">
        	<label for="credit-year" class="required">Date</label>
        	<input type="date" name="creditExpMonth" id="creditExpMonth" required="required"/>
        	</div>
        	
        	<div class="form-element">
        	<label for="Year" class="required">Year</label>
        	<select id="creditExpYear" style="width: 90px;">
						<option value="Year">Year</option>
    					<c:forEach begin="0" end="15" var="yearListSel">
						<option value="${yearList - yearListSel}">${yearList - yearListSel}</option>
						</c:forEach>
						</select>
        	</div>
        	
        	<div class="form-element">
        	<label for="paid-status" class="required">Paid-Status</label>
        	<select id="cardStatus" name="cardStatus" required= "required">
        					<option value="paid">Paid</option>
        					<option value="nPaid">Not Paid</option>
        				</select>
        	</div>
        	
        	<div class="form-element">
        	<label for="card-type" class="required">Card-Type</label>
        	<select id="cardType">
        				<option value="Year">Select</option>
        				<c:forEach items="${listforDropDown}" var="cardDrowpDown">
						<option value="${cardDrowpDown.cardType}">${cardDrowpDown.cardType}</option>
						</c:forEach>
						</select>
        	</div>
        	
        	<div class="form-element">
        	<label for="card-type" class="required">Description</label>
        	<input type="text" name="comment" style="height: 45px; width: 160px;" id="comment"  required="required"/>
      				<!-- <texttextarea
      				
      				area rows="8" cols="100" name="comment" id="comment" style="border-color: black;border-radius: 2px;">
					</textarea>   	 -->	
        		</div>
        		<div class="form-element">
        		<button type="submit" class="lpin-theme-button" name="submit-form" id="submit-form" style="float: right;margin-right: 90px;margin-top: 0px;">
									SUBMIT
								</button>	
        	</div>
        	<%-- <table class="table table-striped" style="text-align:center; width: 100%;" >
        		<thead>
        		<tr style="background-color: mediumseagreen;">
        			<th width="20%">CardName</th>
        			<th width="20%">CardNumber</th>
        			<th width="20%">CreditExpanse</th>
        			<th width="20%">Date</th>
        			<th width="30%">Year</th>
        			<th width="10%">Status</th>
        			<th width="10%">CardType</th>
        			
        		</tr>
        		</thead>
        		<tbody>
        			
        			<tr>
        			
        				<td>
        				<select id="cardName" class="credit-user-input" style="width: 150px;">
        				<option value="select">Select</option>
        				<c:forEach items="${listforDropDown}" var="cardDrowpDown">
						<option value="${cardDrowpDown.cardName}">${cardDrowpDown.cardName}</option>
						</c:forEach>
						</select>
						
        				</td>
        				<td>
        				<!-- <input type="text" name="cardNum" id="cardNum" class="credit-user-input" onkeypress="return isNumberKey(event)" required> -->
        				
        				<select id="cardNum" class="credit-user-input" style="width: 150px;">
        				<option value="select">Select</option>
        				<c:forEach items="${listforDropDown}" var="cardDrowpDown">
						<option value="${cardDrowpDown.cardNum}">${cardDrowpDown.cardNum}</option>
						</c:forEach>
						</select>
        				
        				</td>
        				<td><input type="text" name="creditExpAm" id="creditExpAm" class="credit-user-input" onkeypress="return isNumberKey(event)" required></td>
        				<td><input type="text" name="creditExpMonth" id="creditExpMonth" class="credit-user-input" required></td>
        				<td>
        				<select id="creditExpYear" class="credit-user-input" style="width: 90px;">
						<option value="Year">Year</option>
    					<c:forEach begin="0" end="15" var="yearListSel">
						<option value="${yearList - yearListSel}">${yearList - yearListSel}</option>
						</c:forEach>
						</select>
        				</td>
        				<td>
        				<select id="cardStatus" name="cardStatus" class="credit-user-input" required>
        					<option value="paid">Paid</option>
        					<option value="nPaid">Not Paid</option>
        				</select>
        				</td>
        				<td><!-- <select id="cardType" name="cardType" class="credit-user-input" required>
        					 <option value="debit">Debit</option>
  							 <option value="credit">Credit</option>
        				</select> -->
        				<select id="cardType" class="credit-user-input">
        				<option value="Year">Select</option>
        				<c:forEach items="${listforDropDown}" var="cardDrowpDown">
						<option value="${cardDrowpDown.cardType}">${cardDrowpDown.cardType}</option>
						</c:forEach>
						</select>
        				
        				</td>
        			</tr>
        			
        		</tbody>
        	<!-- 	<tr>
        		<td>	
        		Fill the description:
        		<textarea rows="8" cols="50" name="comment" id="comment" style="width: 360%;border-color: black;border-radius: 2px;">
					</textarea> 
					</td>
					</tr> -->
        		</table> --%>
        		
        		
        		<!-- <div>
        			
        			<img alt="backLoading" src="resource/enroll-now-button.jpg">
        		</div> -->
        		
        		
        	<!-- <div align="left">
        	<table>
        	<tr>
        	<td><input type="submit" value="Add" class="buttonAdd"/></td>
        	</tr>
        	
        	</table>
        	</div>
        	<div align="right">
        	<table>
        	<tr>
        	<td><input type="button"  value="Exit" class="buttonExit"  onclick="exitFromCredDetails()" /></td>
        	</tr>
        
        	</table>
        	</div> -->
        	
        	</div>
        </form:form>
        </div>
      <!--   <div>
        <a class="btn btn-success" href="#">Add</a>
        </div> -->
  </body>

<div>
		<jsp:include page="footer.jsp"/>
		</div>

<!--End wrapper fullwidth-->
</html>