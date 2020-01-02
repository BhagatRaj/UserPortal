<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<link rel="stylesheet" type="text/css" href="styles/medCommon.css"/>

  <style type="text/css">
  
  .detail-box.inner {visibility: hidden;position: absolute;top: 203px;z-index: 100}
.detail-box {width: 452px;float: left;padding: 9px;background-color: #646464;color: #FFF;}
#popup-mask {position: absolute;top: 0;left: 0;z-index: 99;background-color: #FFF;display: none;}
.container-fluid li a{font-family: Arial, Helvetica, sans-serif;};

  </style>
  
  <script type="text/javascript">
	var timerAdmin = setTimeout('test()',1740000);
	$(document).click(function(){
		clearTimeout(timerAdmin);
		timerAdmin = setTimeout('test()',1740000);
	});

	function test() {
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		var popupLft = ($(window).width() / 2)
				- ($(".detail-box.inner").width() / 2);
		// Set height and width to mask to fill up the
		// whole screen

		$('#popup-mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		}).show().fadeTo("slow", 0.8);
		$(".detail-box133").css({
			"visibility" : "visible",
			"left" : popupLft
		});
	}
</script>
  
</head>
<body>
<div id="popup-mask" style="width: 1350px;
    height: 690px;
    display: none;
    opacity: 0.8;"></div>
    
    <div class="detail-box inner detail-box133" id="detailsBox"
	style="width: 554px; visibility: none; left: 368.5px;">
	<div class="detailbox-model-name">
		<span class="title top">Alert !</span>
	</div>
	<div class="detail-content">
		<div class="address-box">
			<p class="time">
				<span id="error_variant_msg">Your session expiring in 30
					seconds please refresh page to avoid session expiry.</span>
			</p>
			<br />
			<div style="float: right;">
				<span class="btnWrap" onclick="javascript:window.location.reload()"><span
					class="btnbgRightpopup"><span
						style="color: rgb(255, 255, 255); line-height: 24px;"
						class="btnTxt">Refresh</span></span></span>
			</div>
		</div>
		<br>
	</div>
	<span style="display: block; clear: both"></span>
	<!-- <p class="resp-text">Your contact details have been emailed to the dealer.</p> -->
</div>
    
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
    
      <li><a class="navbar-brand" href="/UserPortal/userRegController/viewMyProfile">PROFILE</a></li>
      <li class="active"><a href="#">HOME</a></li>
      <li><a href="/UserPortal/CreditController/CreditDetails">ADD-CREDIT</a>
      
     <!--  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li> -->
      <li><a href="/UserPortal/showEmiList?userName=${userName}">EMI-LIST</a></li>
      <li><a href="#">CURRENTLY LOGGED IN: ${userName}</a></li>
      <li><a href="https://netbanking.hdfcbank.com/netbanking/CCLogin.html">CREDIT LINK</a></li>
      <li><a href="/UserPortal/showlaptopEmi?userName=${userName}">LOAN-EMI</a></li>
      <li><a href="/UserPortal/CreditController/showDetailsForCreditEmi?userName=${userName}">SHOW-CRED-DETAILS</a></li>
      
      <c:if test="${techStatus eq 'HCLTECH' }">
      	 <li><a href="/UserPortal/showEmiList?userName=${userName}">HCL</a></li>
      </c:if>
      
      <c:if test="${techStatus eq 'STRAWBERRY INFOTECH' }">
      	 <li><a href="/UserPortal/showEmiList?userName=${userName}">STRW</a></li>
      </c:if>
       <c:if test="${techStatus eq 'KMG INFOTECH' }">
      	 <li><a href="/UserPortal/showEmiList?userName=${userName}">KMG</a></li>
      </c:if>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/UserPortal/showSetup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/UserPortal/Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

</body>
</html>
