<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/medCommon.css"/>


<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>Medical Details</title>


<style type="text/css">  

.lpin-form select{
border: 1px solid;
    border-color: #dadada;
    width: 155px;
    border-radius: 5px;
    height: 27x;
    margin: 0px 0px 0px;
}

.lpin-form label {
	color: #666;
    width: 112px;
    display: inline-block;
    padding: 13px 0px 0px;
}


.box{
    position:fixed;
    top:-200px;
    left:30%;
    right:30%;
    background-color:#fff;
    color:#7F7F7F;
    padding:20px;
    border:2px solid #ccc;
    -moz-border-radius: 20px;
    -webkit-border-radius:20px;
    -khtml-border-radius:20px;
    -moz-box-shadow: 0 1px 5px #333;
    -webkit-box-shadow: 0 1px 5px #333;
    z-index:101;
}
a.boxclose{
     background: none repeat scroll 0 0 #fff;
    bottom: 11px;
    color: #7f7f7f;
    cursor: pointer;
    display: inline-block;
    float: right;
    font-size: 15px;
    font-weight: bold;
    line-height: normal;
    position: absolute;
    right: 4px;    
}

.boxclose:before {
    content: "x";

}

.toolTipWrapSearch{
position:relative;
background-color:#fff;
border:1px solid #666;
}
.toolTipWrapSearch:after{
top: 95%;
left: 20%;
border: solid transparent;
content: " ";
height: 0;
width: 0;
position: absolute;
pointer-events: none;
border-color: rgba(0, 0, 0, 0);
border-top-color: #fff;
border-width: 14px;;
margin-left: -8px;
}

.ui-widget-header,.ui-state-default, ui-button {
            background:#20211e;
            border: 1px solid #b9cd6d;
            color: #FFFFFF;
            font-weight: bold;
         }

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: white;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.login-text {
	font-size: 17px;
    line-height: 25px;
}
.userInput {
	border: 1px solid #cdcdcd;
    border-radius: 4px;
    box-shadow: 0 0 1px #eee;
    height: 30px;
    padding: 3px;
    width: 98%;
    transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s;
}

#loginBtn{
	color: #fff;
    padding: 10px 40px;
    border: 0;
    border-radius: 20px;
    font-weight: bold !important;
    outline: 0;
    cursor: pointer;
    text-decoration: none;
    margin: 10px 0px 0px 80px;
    background: #ee4c14;
    font-size: 14px !important;
    font-family: sans-serif;
    text-align: center;
}

.sp-box{clear: both; width: 139%; margin-bottom: 0px; margin-top: 2px; float: left;}
.sp-box-left{width: 35%; float: left;margin-bottom: 30px;border-right: 1px solid rgba(84,86,86,.4)}
.sp-box-right{width: 47%;float: right;}
					
.or{ background: #ee4c14; color: #fff;    display: block;float: left;}
.bl{ background: #00b1af; color: #fff;margin: 11px 0;    display: block;float: left;}		
.reg-btn{color: #515152; padding: 10px 40px; border: 0; margin-top: 30px; border-radius: 20px;font-weight: bold; outline: 0; cursor: pointer; text-decoration: none;font-size: 14px;}
.sp-headtxt-or{color: #ee4c14;font-size: 18px;font-weight: 700; line-height: 20px}
.sp-headtxt-bl{color: #00b1af;font-size: 18px;font-weight: 700; line-height: 20px}	
.sp-subtxt p{color: #515152;font-size: 12px;line-height: 25px;}		
.center-div{
background-image: url(${pageContext.request.contextPath}/backgroundWall/background6.jpg);
	margin: 0 auto;
	min-height: 135px;
    height: auto;
    border-radius: 76px;
    width: 706px;
}

.lpin-form input {
	border: 1px solid;
    border-color: #dadada;
    border-radius: 5px;
    height: 24px;
}

.submiButton{
	background-color: grey;
    border-radius: 10px;
    padding: 0px 33px 5px;
}
</style>
	<script>
         $(function() {
            $( "#loginDialog" ).dialog({
               autoOpen: false, 
               modal: true,

            });
            $( "#login-button" ).click(function() {
               $( "#loginDialog" ).dialog( "open" );
            });
         });
      </script>
</head>
<body>
<div id="loginDialog" title="LOGIN" style="overflow: hidden;
    width: auto;
    min-height: 0px;
    max-height: none;
    height: 338px;">
	
		<form:form method="POST" cssClass="lpin-form"  modelAttribute="logBean"
		action="${pageContext.request.contextPath}/addStudent">
	<div  align="right" class="pr-box-bg">
	<div class="right-mid-login" style="text-align: left;">
	<h2 style="text-align: center; background-color: #ee4c14; color: white; border-radius: 15px; font-family: sans-serif;
    font-size: 14px !important; padding: 5px 0px 2px;">Medical Portal Login</h2> 
				    	<div>
				    	<form:errors path="userName" cssClass="help-inline"></form:errors><br>
				    	<form:errors path="passWord" cssClass="help-inline"></form:errors>
				     	</div>
				
				<label class="login-text" for="userName"  >
				 <form:label  path="userName">User name</form:label></label>
				     <div class="login-box">
				     
				     	<form:input maxlength="20" path="userName"
							cssClass="userInput" />
				      <!--  <input type="text" name="usr_name" maxlength="10" tabindex="1" value="" id="usr_name" class="inpt-bx">        -->     
				     </div>				     
				     <label class="login-text" for="password"><form:label 
							path="passWord">Password</form:label></label>
				     <div class="login-box">    
				     <form:password maxlength="20" path="passWord"
							cssClass="userInput" />
				         </div>
					
					
					<div class="login-box" style="padding: 28px 2px 4px;">    
				     <form:select  path="domain"
							cssClass="userInput">
							<form:option value="Select" label="Select" />
				            <form:option value="HCLTECH" label="HCLTECH" />
				            <form:option value="STRAWBERRY" label="STRAWBERRY" />
				            <form:option value="KMG" label="KMG" />
				            </form:select>
				            
				            <input type="submit" value="Login" class="submiButton"/>
				         </div>
				         <br>
				         
				         
				   
	 	<div id='errorWrap' style="color: red">
					<div style=" text-align:  center;font-style:  italic; font: 500;">${errorMsg}</div>
					</div>	
         </div> 
				</div> 				
				
				
						
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	</form:form>
	
	</div>

<div class="center-div" style="padding: 110px 225px 41px; margin: 62px 62px 30px;">
	<div class="sp-box">
					
	
                   <div class="sp-box-left">
                      <div class="lef">
                         <span class="sp-headtxt-or">Get yourself Register</span>
                         <span class="sp-subtxt">
                            <p style="">Register yourself to get started. </p>
                         </span>
						 <a href="/UserPortal/showSetup" class="reg-btn or"> <span style="font-size: 20px; width: 120px; text-align: center;">Register</span>
					</a>
                        
                      </div>
					</div>
                   <div class="sp-box-right">
                      <div class="rit">
                         <span class="sp-headtxt-bl">Login to ?</span>
                         <span class="sp-subtxt">
                            <p style="">Login to check your medical details.</p>
                         </span>
                         <button id="login-button" class="reg-btn bl" style="font-size: 20px; width: 120px; text-align: center;">
                         Login
                         </button>
                         
                         <!-- <a href="/registration.htm" class="reg-btn bl"> <span style="font-size: 20px; width: 120px; text-align: center;">Login</span>
                        </a> -->
                      </div>
				</div>
                </div>

</div>

</body>
</html>