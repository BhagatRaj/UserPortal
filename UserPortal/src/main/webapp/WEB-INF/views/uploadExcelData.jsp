<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.uploadDiv{

    background-image: url(/UserPortal/backgroundWall/background6.jpg);
    margin: 0 auto;
    min-height: 335px;
    height: auto;
    border-radius: 8px;

}


</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Page</title>
</head>
<body>
	<div class="uploadDiv">
<form:form method="POST" action="${pageContext.request.contextPath}/fileUploadController/upload" enctype="multipart/form-data">
    <input type="file" name="file" /><br/>
    <input type="submit" value="Submit" />
</form:form>


<h1>Upload Status</h1>
<h2>Message : ${message}</h2>

	</div>
</body>
</html>