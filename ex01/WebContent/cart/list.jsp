<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
 
<!DOCTYPE html>
<h2>[장바구니]</h2>
<c:if test="${cartList.size()==0 || cartList==null}">
   <table>
      <tr class="title">
      	<td width=800>장바구니가 비어있습니다.</td>
      </tr>
   </table>
</c:if>
<c:if test="${cartList.size()>0}">
   <table id="tbl">
   <tr class="title">
      <td><input type="checkbox" id="chkAll"></td>
      <td width=100>상품코드</td>
      <td width=300>상품이름</td>
      <td width=100>상품단가</td>
      <td width=100>상품수량</td>
      <td width=100>상품금액</td>
      <td width=100>삭제</td>
   </tr>
   <c:forEach items="${cartList}" var="vo">
   <tr class="row">
      <td><input type="checkbox" class="chk"/></td>
      <td class="prod_id">${vo.prod_id}</td>
      <td class="prod_name">${vo.prod_name}</td>
      <td class="price">${vo.price}</td>
      <td>
         <input type="text" value="${vo.quantity}" class="quantity" size=1/>
         <button class="btnUpdate">수정</button>
      </td>
      <td class="sum"><fmt:formatNumber value="${vo.price*vo.quantity}" pattern="#,###원"/></td>
      <td><button class="btnDelete">삭제</button></td>
   </tr>
   </c:forEach>
	</table>
	<div style="width:900px; text-align:center;">
		<button id="btnAll">전체상품 주문</button>
		<button id="btnSell">선택상품 주문</button>
	</div>
</c:if>
<div id="orderInfo" style="margin-top:20px;">
	<h2>[주문정보]</h2>
	<table id="tblOrder"></table>
	<script id="tempOrder" type="text/x-handlebars-template">
		<tr class="title" style="text-align:center">
			<td width=100>상품코드</td>
			<td width=300>상품이름</td>
			<td width=150>상품가격</td>
			<td width=100>상품수량</td>
			<td width=150>합계</td>
		</tr>
	{{#each .}}
		<tr class="row">
			<td class="id">{{id}}</td>
			<td class="name">{{name}}</td>
			<td class="price">{{price}}</td>
			<td class="quantity">{{quantity}}</td>
			<td class="sum">{{sum}}</td>
		</tr>
	{{/each}}
	</script>
	<form name="frm">
	<table	id="tblInfo">
		<tr>
			<td class="title" width=100>주문자 성명</td>
			<td width=800><input type="text" name="name" value="${user.uname}"/></td>
		</tr>
		<tr>
			<td class="title" width=100>배송지 주소</td>
			<td width=800><input type="text" name="address" size=80 value="${user.address}"/></td>
		</tr>
		<tr>
			<td class="title" width=100>이메일주소</td>
			<td width=800><input type="text" name="email" size=20 value="${user.email}"/></td>
		</tr>
		<tr>
			<td class="title" width=100>전화번호</td>
			<td width=800><input type="text" name="tel" size=10 value="${user.tel}"/></td>
		</tr>
		<tr>
			<td class="title" width=100>결제방법</td>
			<td width=800>
                  <input type="radio" name="paytype" value="0"/>무통장입금
                  <input type="radio" name="paytype" checked value="1"/>신용카드
             </td>
		</tr>
	</table>
	<div style="width:880px; text-align:center; margin-top:10px;">
		<input type="submit" value="주문하기"/>
		<input type="reset" value="주문취소"/>
	</div>
	</form>
</div>


<script>
   $("#orderInfo").hide();
   
 //주문하기 버튼을 눌렀을 때 
   $(frm).on("submit",function(e){
      e.preventDefault();
      if(!confirm("해당 상품들을 주문하시겠습니까?")) return;
      var name=$(frm.name).val();
      var address=$(frm.address).val();
      var tel=$(frm.tel).val();
      var email=$(frm.email).val();
      var paytype=$("input[name='paytype']:checked").val();
      $.ajax({
         type:"post",
         url:"/pur/insert",
         data:{"name":name,"address":address,"tel":tel,"email":email,"paytype":paytype},
         success:function(order_id){
            $("#tblOrder .row").each(function(){   
               var prod_id=$(this).find(".id").html();
               var price=$(this).find(".price").html();
               var quantity=$(this).find(".quantity").html();
               //alert(prod_id+"\n"+price+"\n"+quantity);
               $.ajax({
                  type:"post",
                  url:"/pur/insert_product",
                  data:{"order_id":order_id,"prod_id":prod_id,"price":price,"quantity":quantity},
                  success:function(){}
               });
            });
         }
      });
      alert("주문완료!");
      frm.action="/pur/list";
      frm.method="get";
      frm.submit();
   });
 
   $("#btnAll").on("click",function(){
      var array=[];
      $("#tbl .row .chk").each(function(){   
         $("#orderInfo").show();
         var row=$(this).parent().parent();
         var id=row.find(".prod_id").html();
         var name=row.find(".prod_name").html();         
         var price=row.find(".price").html();
         var quantity=row.find(".quantity").val();
         var sum=row.find(".sum").html();
         var data={"id":id,"name":name,"price":price,"quantity":quantity,"sum":sum};
         array.push(data);
      });
         var temp=Handlebars.compile($("#tempOrder").html());
           $("#tblOrder").html(temp(array));
   });
   $("#btnSell").on("click",function(){
      if($("#tbl .row .chk:checked").length==0){
         alert("주문할 상품목록이 존재하지 않습니다");
         return;
      }
      var array=[];
      $("#tbl .row .chk:checked").each(function(){   
         $("#orderInfo").show();
         var row=$(this).parent().parent();
         var id=row.find(".prod_id").html();
         var name=row.find(".prod_name").html();         
         var price=row.find(".price").html();
         var quantity=row.find(".quantity").val();
         var sum=row.find(".sum").html();
         var data={"id":id,"name":name,"price":price,"quantity":quantity,"sum":sum};
         array.push(data);
      });
         var temp=Handlebars.compile($("#tempOrder").html());
           $("#tblOrder").html(temp(array));

   });
   //전체선택 클릭한 경우
   $("#chkAll").on("click",function(){
      if($(this).is(":checked")){
         $("#tbl .row .chk").each(function(){
            $(this).prop("checked",true);
         });
      }else{
         $("#tbl .row .chk").each(function(){
            $(this).prop("checked",false);
         });
      }
   });
   //각행의 체크버튼을 클릭한 경우
   $("#tbl").on("click",".row .chk",function(){
      var num1=$("#tbl .row .chk").length;
      var num2=$("#tbl .row .chk:checked").length;
      if(num1==num2){
         $("#chkAll").prop("checked",true);
      }else{
         $("#chkAll").prop("checked",false);
      }
   });
   //수정버튼을 클릭한 경우
   $("#tbl").on("click",".row .btnUpdate",function(){
      var row=$(this).parent().parent();
      var prod_id=row.find(".prod_id").html();
      var quantity=row.find(".quantity").val();
      if(!confirm(prod_id + "를 수정합니다")) return;
      $.ajax({         
         type:"get",
         url:"/cart/update",
         data:{"prod_id":prod_id,"quantity":quantity},
         success:function(){
            alert("수정완료");
            location.href="/cart/list";
         }
      });
   });
   $("#tbl").on("click",".row .btnDelete",function(){
      var prod_id=$(this).parent().parent().find(".prod_id").html();
      if(!confirm(prod_id + ("를 삭제합니다"))) return;
      $.ajax({
         type:"get",
         url:"/cart/delete",
         data:{"prod_id":prod_id},
         success:function(){
            alert("삭제완료");
            location.href="/cart/list";
         }
      });
   });
</script>