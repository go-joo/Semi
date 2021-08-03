<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAlAL</title>
      <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
 	  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1ee4046f14588b16d3533f145895bfcb"></script> 	  
		<link rel="stylesheet" href="/style.css"/>
		<style>
#darken-background {
    position:absolute;
    top:0px; 
    left:0px;
    right:0px;
    height:100%;
    display:none;
    background:rgba(0, 0, 0, 0.5);
    z-index:10000;
    overflow-y:scroll;
 }
 #lightbox {
    width:700px;
    margin:20px auto;
    padding:15px;
    border: 1px solid #333333;
    border-radius:5px;
    background:white;
    box-shadow:0px 5px 5px rgba(34, 25, 25, 0.4);
    text-align:center;
 }
		</style>
</head>
<body>
   <div id="divPage">
      <div id="divTop">
      <h1>고주몰</h1>
      <a href="/home"><img src="/mall.jpg" width=960 height=120;/></a>
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
	<script src="script.js"></script>
</html>