<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<h2>[��ǰ������]</h2>
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
      	<h2 id="proPrice" style="text-align:right; margin-right:80px;" price="${vo.price}">${vo.price}��</h2>
      	<h3 style="margin-left:700px;">������</h3>
      		<select style="margin-left:700px; margin-bottom:15px;">
      			<option>���̺���</option>
      			<option>��</option>
      			<option selected>í��</option>
      			<option>�Ҷ�</option>
      			<option>��Ʈ</option>
      			<option>����</option>
      		</select>
      	
 		<span class="pur" style="text-align:right; cursor:pointer; margin-left:700px; font-size:20px; background:black; color:white; padding:5px;">��ٱ��Ͽ� ���</span>
 		<h2 class="mapp" style="text-align:right;cursor:pointer; color:#312E41;">�����ǰ �������� ���� �ѷ�����</h2>
      </div>
      <h3>��ǰ �� ���� </h3>
      <textarea id="proDetail"rows="10" cols="93" name="detail" detail="${vo.detail}">${vo.detail}</textarea>
    </div>  
</form>
<script>
   var url="/pro/list.json";
   
   //��ٱ��Ͽ� �ֱ� ��ư�� Ŭ���� ���
   $(frm).on("click", ".pur", function(){
	   	  var prod_id=$("#proInfo").attr("prod_id");
	   	  var prod_name=$("#proInfo").attr("prod_name");
	   	  var price=$("#proprice").attr("price");
		  if(!confirm(prod_name + "�� ��ٱ��Ͽ� �ֽ��ϴ�")) return;
		  $.ajax({
			  type:"get",
			  url:"/cart/insert",
			  data:{"prod_id":prod_id,"prod_name":prod_name,"price":price},
			  success:function(){
				if(!confirm("��ٱ��Ͽ��� ������ Ȯ���Ͻðڽ��ϱ�?")) return;
				location.href="/cart/list";
			  }
		  });
	   });
   
   //�����ǰ �������� ���� �ѷ����� ��ư�� Ŭ���Ѱ��
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