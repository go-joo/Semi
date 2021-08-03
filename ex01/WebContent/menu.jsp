<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#log{color:white;}
</style>
<c:if test="${user.id=='manager'}">
<div class="menuItem"><a href="/pro/list">Product</a></div>
</c:if>       
<div class="menuItem"><a href="/home">Home</a></div>
<div class="menuItem"><a href="#">Top</a></div>
<div class="menuItem"><a href="#">Outer</a></div>
<div class="menuItem"><a href="#">Pants</a></div>
<div class="menuItem"><a href="#">Shoes</a></div>
<div class="menuItem"><a href="#">ACC</a></div>
<div class="menuItem"><a href="/cart/list">Basket</a></div>


<div style="float:right" id="log">
	<c:if test="${user.id==null}">
		<form name="frmLogin" method="post" action="login">
			<input type="text" name="id" size=7 placeholder="ID"/>
			<input type="password" name="pass" size=7 placeholder="Pass"/>
			<input type="submit" value="로그인"/>
		</form>
	</c:if>
	<c:if test="${user.id!=null}">
		${user.uname}님
		<button onClick="location.href='/user/logout'">로그아웃</button>
	</c:if>
</div>

<script>
	$(frmLogin).on("submit", function(e){
		e.preventDefault();
		var id=$(frmLogin.id).val();
		var pass=$(frmLogin.pass).val();
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{"id":id, "pass":pass},
			success:function(result){
				if(result==0){
					alert("아이디가 존재하지 않습니다.");
					$(frmLogin.id).focus();
				}else if(result==2){
					alert("비밀번호가 틀립니다");
					$(frmLogin.pass).focus();
				}else{
					alert("로그인 성공");
					location.href="/home";
				}
			}
		});
	});
</script>