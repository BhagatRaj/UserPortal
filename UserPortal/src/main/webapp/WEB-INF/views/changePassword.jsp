<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/medCommon.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/Password.css"/>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>Change Password</title>
</head>
<body>

<div id="page-wrapper">
		<!-- Header -->
		
		<!-- Header -->
		<div class="heading-Profile">
<h1 class="page-title-pass">Change Password</h1>
</div>
		
		
		<div id="content" class="two-column">
			<div id="left-column" class="spcolumn top-bar graish corner-all black_bg" style="border-radius: 4px;height: 495px;">
				<h2 class="gray">Change Your Password</h2>
				<img src="${pageContext.request.contextPath}/resource/left-banner-images/left_image_myprofile.jpg"
					width="216" height="360" border="0" /> <br />
					
				<p id="left-content">Enter a new, unique password, Known only to you.</p>
			</div>
			<div id="right-column" class="spcolumn corner-all">
				<div id="contact-wrap">
					
					<div class="password_wrap">

					<div id='errorWrap' style="color: red">
					<div style=" text-align:  center;font-style:  italic; font: 500;">${errorMsg}</div>
					</div>
						<form:form id="changePassword" modelAttribute="changePassword" method="post" action="${pageContext.request.contextPath}/userRegController/passWordChange"
							onsubmit="return checkValid();">
							<ul class="chnage_pwd">

								<li><label>Current Password</label>  
								<input type="password"  name="oldPassword" id="oldPassword"  title="old Password required." maxlength="20" required>
								  <span
									class="red-font">*</span>
								</li>
								<li><label>New Password
								</label>
									<input type="password"  name="newPassword" id="newPassword"  title="New Password required." maxlength="20" required>
									<span class="red-font">*</span></li>


								<li><label><label>Re enter Password </label> </label>  
												<input id="confirmPassword" name="confirmPassword" type="password" maxlength="20" requireds/>
									<span class="red-font">*</span>
								</li>
								<input type="hidden" name="fromId" value="3" />
								<li class="right_align_btn"><input type="submit"
									tabindex="" class="btn btn-success
									" value="UPDATE PASSWORD" /></li>
							</ul>
						</form:form>
						<div id="note_section">
							Note: Enter new and unique password which will meet the following
							criteria.
							<ul type="circle">
								<li>between 8 and 20 characters.</li>
								<li>with at least one capital letter.</li>
								<li>With atleast one number.</li>
								<li>With atleast one special character like @, # ,! etc.</li>
								<li>should not match any of the 8 matched.</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		
		<!-- Footer -->
	</div>

</body>

</html>