<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="frmLogin" class="box2" action="login" method="post">
  <h1>회원가입</h1>
  <table id="tbl">
  	<tr>
  		<td class="title">
  		아이디 : 
  		</td>
  		<td>
  			<input type="text" name="id" placeholder="Username" style="ime-mode:inactive;">
  		</td>
  	</tr>
  	<tr>
  		<td class="title">
  		비밀번호 : 
  		</td>
  		<td>
  			<input type="password" name="pass" placeholder="Password" style="ime-mode:inactive;">
  		</td>
  	</tr>
	  <input type="submit" value="Login">
  </table>
</form>