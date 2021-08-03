<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Glothes</title>
      <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
 	  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1ee4046f14588b16d3533f145895bfcb"></script> 	  
		<link rel="stylesheet" href="/style.css"/>
</head>
<body>
   <div id="divPage">
   	
      <div id="divTop">
      <a href="/home"><img src="/title.png" width=250; height=100;/></a>
      </div>
      <div id="divCenter">
      <div id="divMenu" ><jsp:include page="/menu.jsp"/></div>
      <div id="divContent">
      	<jsp:include page="${pageName}"></jsp:include>
      </div>
      </div>
      <div id="divBottom">
          <h4>Copyright © Glothes All Rights Reserved.</h4>
      </div>
   </div>
</body>
	<script src="script.js"></script>
</html>