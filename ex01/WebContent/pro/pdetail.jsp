<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<h2>[상품상세정보]</h2>
<style>
	span a:hover{color:pink;}
</style>
<form name="frm" enctype="multipart/form-data">
	<div style="overflow:hidden; text-align:center; margin-left:30px;">
      <div>
         <input type="file" name="image" size=100 style="display:none; padding-left:20px;" accept="image/*"/>
         	<img src="/product/img/${vo.image}" width=550 id="image"/>
      </div>
      <div>
      	<h1 id="proInfo" style="text-align:center" prod_id="${vo.prod_id}" prod_name="${vo.prod_name}">(${vo.prod_id})${vo.prod_name}</h1> 
      	<h2 id="proPrice" style="text-align:right; margin-right:80px;" price="${vo.price}">${vo.price}원</h2>
      	<h3 style="margin-left:700px;">색상선택</h3>
      		<select style="margin-left:700px; margin-bottom:15px;">
      			<option>아이보리</option>
      			<option>블랙</option>
      			<option selected>챠콜</option>
      			<option>소라</option>
      			<option>민트</option>
      			<option>라임</option>
      		</select>
      	
 		<span class="pur" style="text-align:right; cursor:pointer; margin-left:700px; font-size:20px; background:black; color:white; padding:5px;">장바구니에 담기</span>
 		<h2 class="mapp" style="text-align:right;cursor:pointer; color:#312E41;">유사상품 오프라인 매장 둘러보기</h2>
      </div>
      <h3>제품 상세 설명 </h3>
      <textarea id="proDetail"rows="10" cols="93" name="detail" detail="${vo.detail}">${vo.detail}</textarea>
    </div>  
</form>
<script>
   var url="/pro/list.json";
   
   //장바구니에 넣기 버튼을 클릭한 경우
   $(frm).on("click", ".pur", function(){
	   	  var prod_id=$("#proInfo").attr("prod_id");
	   	  var prod_name=$("#proInfo").attr("prod_name");
	   	  var price=$("#proprice").attr("price");
		  if(!confirm(prod_name + "를 장바구니에 넣습니다")) return;
		  $.ajax({
			  type:"get",
			  url:"/cart/insert",
			  data:{"prod_id":prod_id,"prod_name":prod_name,"price":price},
			  success:function(){
				if(!confirm("장바구니에서 물건을 확인하시겠습니까?")) return;
				location.href="/cart/list";
			  }
		  });
	   });
   
   //유사상품 오프라인 매장 둘러보기 버튼을 클릭한경우
   $(frm).on("click",".mapp",function(){
	   var detail=$("#proDetail").attr("detail");
	   alert(detail);
	   $.ajax({
			  type:"get",
			  url:"/pro/pdetail",
			  data:{"detail":detail},
			  success:function(){
				  alert("...");
				location.href="/pro/simage";
			  }
		  });
   });
</script>