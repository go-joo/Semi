<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>[ 고객센터 ]</h1>
<br>
<form name="frm" method="post" action="/pro/client">
	<table>
		<tr>
			<td width=100 class="title">아이디</td>
			<td><input type="text" name="user_id" value="${user.id}"size=20 readonly/></td>
		</tr>
		<tr>
			<td width=100 class="title">제목</td>
			<td><input type="text" name="name" size=20 autofocus/></td>
		</tr>
		<tr>
           <td width=100 class="title">건의 내용</td>
           <td width=700>
             <textarea rows="10" cols="91" name="detail" style="padding:10px;"></textarea>
           </td>
        </tr>
		
	</table>
	<br>
	<div id="pagination">
		<input type="submit" value="등록"/>
		<input type="reset" value="초기화"/>
	</div>
</form>