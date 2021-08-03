<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>[주문목록]</h2>
<div id="divCondition">
	<div style="float:left;">
		<select id="key">
			<option value="order_id">구매코드</option>
			<option value="name">구매자 이름</option>
			<option value="address">구매자 주소</option>
			<option value="tel">구매자 전화</option>
		</select>
		<input type="text" id="word" placeholder="검색어"/>
		<select id="perpage">
			<option value="4">4개씩출력</option>
			<option value="8">8개씩출력</option>
			<option value="12">12개씩출력</option>
		</select>
		<span id="count"></span>
	</div>
	<div style="float:right;">
		<select id="order">
			<option value="order_id">구매코드</option>
			<option value="name">구매자 이름</option>
			<option value="address">구매자 주소</option>
			<option value="tel">구매자 전화</option>
		</select>
		<select id="desc">
			<option value="desc">내림차순</option>
			<option value="asc">오름차순</option>
		</select>
	</div>
</div>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=100>구매코드</td>
		<td width=100>구매자명</td>
		<td width=300>구매자 주소</td>
		<td width=200>구매자 전화번호</td>
		<td width=80>구매정보</td>
	</tr>
	{{#each array}}
	<tr class="row" pdate="{{pdate}}" paytype="{{paytype}}" email="{{email}}" status="{{status}}">
		<td class="order_id">{{order_id}}</td>
		<td class="name">{{name}}</td>
		<td class="address">{{address}}</td>
		<td class="tel">{{tel}}</td>
		<td><button>구매정보</button></td>
	</tr>
	{{/each}}
</script>
<div id="pagination">
	<button id="btnPre">◀</button>
	<span id="pageInfo"></span>
	<button id="btnNext">▶</button>
</div>

<table id="tbl1" style="margin-top:20px;">
	<tr>
		<td class="title" width=50>이름</td>
		<td class="name" width=50></td>
		<td class="title" width=50>전화</td>
		<td class="tel" width=150></td>
		<td class="title" width=100>이메일</td>
		<td class="email" width=100></td>
		<td class="title" width=100>구매일</td>
		<td class="pdate" width=150></td>
	</tr>
	<tr>
		<td class="title" width=50>주소</td>
		<td class="address" colspan="3"></td>
		<td class="title" width=50>결제</td>
		<td class="paytype" width=150></td>
		<td class="title" width=50>상태</td>
		<td class="status" width=150></td>
	</tr>
</table>

<!-- 구매상품목록 -->
<table id="tbl2"></table>
<script id="temp2" type="text/x-handlebars-template">
	<tr class="title">
		<td width=100>상품번호</td>
		<td width=380>상품이름</td>
		<td width=100>상품가격</td>
		<td width=100>주문수량</td>
		<td width=100>주문금액</td>
	</tr>
	{{#each array}}
	<tr class="row">
		<td>{{prod_id}}</td>
		<td>{{prod_name}}</td>
		<td style="text-align:right">{{nf price}}원</td>
		<td style="text-align:right">{{nf quantity}}개</td>
		<td style="text-align:right">{{nf sum}}원</td>
	</tr>	
	{{/each}}
	<tr>
		<td class="title" colspan=3>총 결제금액</td>
		<td colspan=2 id="total"></td>
	</tr>
</script>
<script>
	Handlebars.registerHelper("nf", function(price1){
		var regexp = /\B(?=(\d{3})+(?!\d))/g; 
		return price1.toString().replace(regexp, ",");
	});
</script>
<script>
	var url="/pur/list.json";
	$("#tbl1").hide();
	
	$("#tbl").on("click", ".row button", function(){
		$("#tbl1").show();
		var row=$(this).parent().parent();
		
		$("#tbl1 .name").html(row.find(".name").html());
		$("#tbl1 .tel").html(row.find(".tel").html());
		$("#tbl1 .email").html(row.attr("email"));
		$("#tbl1 .pdate").html(row.attr("pdate"));
		$("#tbl1 .address").html(row.find(".address").html());
		
		var paytype=row.attr("paytype")=="0" ? "현금":"카드";
		$("#tbl1 .paytype").html(paytype);
		var status=row.attr("status")=="0" ? "처리중":"처리완료"; 
		$("#tbl1 .status").html(status);
		
		//구매상품 목록출력
		var order_id=row.find(".order_id").html();
		$.ajax({
			type:"get",
			url:"/pur/plist.json",
			data:{"order_id": order_id},
			dataType:"json",
			success:function(result){
				var temp=Handlebars.compile($("#temp2").html());
				$("#tbl2").html(temp(result));
				
				$("#total").html(result.total+"원");
				
			}
		});
	});
</script>
<script src="/script.js"></script>


