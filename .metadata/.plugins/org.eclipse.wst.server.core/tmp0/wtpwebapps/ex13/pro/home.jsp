<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	

	

</style>
<h2>[상품목록]</h2>
<div id="divCondition">
	<div style="float:left;">
		<select id="key">
			<option value="prod_id">상품코드</option>
			<option value="prod_name">상품이름</option>
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
			<option value="prod_id">상품코드</option>
			<option value="prod_name">상품이름</option>
			<option value="price1">상품가격</option>
		</select>
		<select id="desc">
			<option value="desc">내림차순</option>
			<option value="asc">오름차순</option>
		</select>
	</div>
</div>
<div id="tbl"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each array}}
	<div class="box1" pid="{{prod_id}}" pname="{{prod_name}}" price={{price1}}>
		<img src="{{pntImage image}}" width=150 height=120 onClick="location.href='/pro/read?prod_id={{prod_id}}'"/>
		<div>{{prod_id}}</div>
		<div class="prod_name">{{prod_name}}</div>
		<div>{{nf price1}}원</div>
		<div class="del{{prod_del}}">{{status prod_del}}</div>
	</div>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("pntImage", function(image){
		if(!image){
			return "http://placehold.it/150x115";
		}else{
			return "/product/img/"+image;
		}
	});
	Handlebars.registerHelper("nf", function(price1){
		var regexp = /\B(?=(\d{3})+(?!\d))/g; 
		return price1.toString().replace(regexp, ",");
	});
	Handlebars.registerHelper("status", function(prod_del){
		if(prod_del==0){
			return "장바구니에 담기";
		}else{
			return "일시품절";
		}
	});
</script>
<div id="pagination">
	<button id="btnPre">◀</button>
	<span id="pageInfo"></span>
	<button id="btnNext">▶</button>
</div>
<script>
	var url="/pro/list.json";
	
	
	$("#tbl").on("click", ".box1 .del0", function(){
		var box=$(this).parent();
		var prod_id=box.attr("pid");
		var prod_name=box.attr("pname");
		var price=box.attr("price");
		var id="${user.id}";
		
		$.ajax({
			type:"get",
			url:"/cart/insert",
			data:{"prod_id":prod_id,"prod_name":prod_name,"price":price},
			success:function(){
				
				if(id==""){
					alert("로그인을 하신 후 이용해 주시기 바랍니다.");
					return;
					
				}
				if(!confirm(prod_name +"을(를) 장바구니에 넣으실래요?")) return;
				if(!confirm("장바구니로 이동하실래요?")) return;
				location.href="/cart/list";
				
			}
		});
	});
	
</script>
<script src="/script.js"></script>


