<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<meta charset="UTF-8">
	<title>홍길동의 쇼핑몰</title>
	<link rel="stylesheet" href="/style2.css"/>
</head>
<body>
	<div id="divPage">
		<div id="divTop">
			<h1 id="homeTop">홍길동의 쇼핑몰</h1>
			<a href="/home"><img src="/image04.jpg" width=970/></a>
		</div>
		<div id="divCenter">
			<div id="divMenu"><jsp:include page="/menu.jsp"/></div>
			<div id="divContent">
				<jsp:include page="${pageName}"></jsp:include>
			</div>
		</div>
		<div id="divBottom">
			<h4>Copyright © ICIA All Rights Reserved.</h4>
		</div>
	</div>
</body>	
</html>