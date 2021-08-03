<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<h2>[상품정보]</h2>
<style>
table{border: 1px solid #E8E1D5;}
 tr{border: 1px solid #E8E1D5;}
 td{border: 1px solid #E8E1D5;}
</style>
<form name="frm" enctype="multipart/form-data">
   <table>
      <tr>
         <td width=100 class="title">상품코드</td>
         <td width=100><input type="text" name="prod_id" size=3 value="${vo.prod_id}"/></td>
      
         <td width=100 class="title">판매가격</td>
         <td width=130><input type="text" name="price" size=10 value="${vo.price}"/>원</td>
      </tr>
      <tr>
         <td width=100 class="title">업체코드</td>
         <td width=100 colspan="3">
         <input type="text" name="mall_id" size=3 value="${vo.mall_id}"/>
         </td>
      </tr>
      <tr>
         <td class="title">상품이름</td>
         <td colspan="3">
         <input type="text" name="prod_name" size=105 value="${vo.prod_name}"/></td>
         <td class="title">판매상태</td>
         <td>
         <input type="checkbox" name="prod_del" value="${vo.prod_del}" <c:out value="${vo.prod_del=='1'?'checked':''}"/>>판매중지</td>
      </tr>
      <tr>
         <td class="title">상품이미지</td>
         <td colspan="5">
         <input type="file" name="image" size=100 style="display:none;" accept="image/*"/>
         <c:if test="${vo.image==null}">
         	<img src="http://placehold.it/150x130" width=150 id="image"/>
         </c:if>
         <c:if test="${vo.image!=null}">
         	<img src="/product/img/${vo.image}" width=150 id="image"/>
         </c:if>
         </td>
      </tr>
      <tr>
         <td class="title">상품설명</td>
         <td  colspan="5">
         <textarea rows="10" cols="93" name="detail">${vo.detail}</textarea>
         </td>
      </tr>
   </table>
   <div style="width:900px;margin-top:10px;text-align:center;margin-left:43px;">
   <input type="submit" value="상품수정"/>
   <input type="button" value="상품삭제" id="btnDelete"/>
   </div>
</form>
<script>
	var prod_id="${vo.prod_id}";
   $("#image").on("click",function(){
      $(frm.image).click();
   });
   //판매중지 체크박스를 체크한 경우
   $(frm.prod_del).on("click", function(){
	  if($(frm.prod_del).is(":checked")){
		  $(frm.prod_del).val("1");
		  alert("판매를 중지합니다.")
	  }else{
		  $(frm.prod_del).val("0");
		  alert("판매를 시작합니다.")
	  }
   });
   //상품삭제하기
   $("#btnDelete").on("click", function(){
	  if(!confirm("삭제 ㄱ?")) return;
	  location.href="/pro/delete?prod_id=" + prod_id;
   });
   
   //상품등록하기
   $(frm).on("submit", function(e){
	   e.preventDefault();
	   if(!confirm("상품을 수정합니다")) return;
	   frm.action="/pro/update";
	   frm.method="post"
	   frm.submit();
   });
   
   //이미지미리보기
   $(frm.image).on("change",function(){
      var reader=new FileReader();
      reader.onload=function(e){
         $("#image").attr("src",e.target.result);
      }
      reader.readAsDataURL(this.files[0]);
   });
</script>