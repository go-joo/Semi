<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${user.id==null}">	
	
	<div class="menuItem"><a href="/pro/list">상품목록</a></div>
	<div class="menuItem"><a href="/pro/client">고객센터</a></div>
		
		
		
</c:if>

<c:if test="${user.id=='admin'}">
	<div class="menuItem"><a href="/mall/list">업체목록</a></div>
	<div class="menuItem"><a href="/pro/list">상품목록</a></div>
	<div class="menuItem"><a href="/pro/insert">상품등록</a></div>
	<div class="menuItem"><a href="/pur/list">주문목록</a></div>
	<div class="menuItem"><a href="/cart/list">장바구니</a></div>
	<div class="menuItem"><a href="/pro/client">고객센터</a></div>
</c:if>
<c:if test="${user.id!='admin' && user.id!=null}">
	<div class="menuItem"><a href="/pro/list">상품목록</a></div>
	<div class="menuItem"><a href="/pur/list">주문목록</a></div>
	<div class="menuItem"><a href="/cart/list">장바구니</a></div>
	<div class="menuItem"><a href="/pro/client">고객센터</a></div>
</c:if>


<div style="float:right;">
	<c:if test="${user.id==null}">
		
		<button id="login">Login</button>
		
	</c:if>
	<c:if test="${user.id!=null}">
		안녕하세요, <b>${user.name}님</b>
		<button id="logout">Logout</button>
	</c:if>
</div>
<div id="darken-background">
	<div id="lightbox">
		<form name="frmLogin" class="box2" action="login" method="post">
		  <h1>Login</h1>
		  <input type="text" name="id" placeholder="Username" />
		  <input type="password" name="pass" placeholder="Password" />
		  <input type="submit" value="Login">
		</form>
		<button id="btnClose">close</button>
	</div>

</div>	
<script>
	$("#login").on("click",function(){

		$("#darken-background").show();
		$(document).keydown(function(event) {
		    if ( event.keyCode == 27 || event.which == 27 ) {
		    	$("#darken-background").hide();
		    }
		});
	});
	$(frmLogin).on("submit",function(e){
		e.preventDefault();
		$("#darken-background").show();
		var id=$(frmLogin.id).val();
		var pass=$(frmLogin.pass).val();
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{"id":id,"pass":pass},
			success:function(result){
				if(result==1){
					alert("로그인 성공");
					location.href="/home";
				}else if(result==0){
					alert("아이디가 존재하지 않습니다.");
				}else{
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		});
	});
	$("#logout").on("click",function(){
		if(!confirm("로그아웃 하시겠습니까?")) return;
		location.href="/user/logout";
	});
	$("#btnClose").on("click",function(){
		$("#darken-background").hide();
		$(frmLogin.id).val("");
		$(frmLogin.pass).val("");
	});
	
</script>