<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h2>[상품등록]</h2>
<style>
table{border: 1px solid #E8E1D5;}
 tr{border: 1px solid #E8E1D5;}
 td{border: 1px solid #E8E1D5;}
</style>
<form name="frm" enctype="multipart/form-data">
   <table>
      <tr>
         <td width=100 class="title">상품코드</td>
         <td width=100><input type="text" name="prod_id" size=3 value="${prod_id}"/></td>
      
         <td width=100 class="title">판매가격</td>
         <td width=150><input type="text" name="price" size=10 value="0"/>원</td>
      </tr>
      <tr>
         <td width=100 class="title" >업체코드</td>
         <td width=100 colspan="3" >
         <input type="text" name="mall_id" size=3 value="G101"/>
         </td>
      </tr>
      <tr>
         <td class="title">상품이름</td>
         <td colspan="5">
         <input type="text" name="prod_name" size=105/>
         </td>
      </tr>
      <tr>
         <td class="title">상품이미지</td>
         <td colspan="5">
         <input type="file" name="image" size=100 style="display:none;" accept="image/*"/>
         <img src="http://placehold.it/150x120" width=150 id="image"/>
         </td>
      </tr>
      <tr>
         <td class="title">상품설명</td>
         <td  colspan="5">
         <textarea rows="10" cols="93" name="detail"></textarea>
         </td>
      </tr>
   </table>
   <div style="width:900px;margin-top:10px;text-align:center;margin-left:43px;">
   <input type="submit" value="상품등록"/>
   <input type="reset" value="등록취소"/>
   </div>
</form>
<script>
   $("#image").on("click",function(){
      $(frm.image).click();
   });
   
   //상품등록하기
   $(frm).on("submit", function(e){
	   e.preventDefault();
	   if(!confirm("상품을 등록합니다")) return;
	   frm.action="/pro/insert";
	   frm.method="post"
	   frm.submit();
   })
   //이미지미리보기
   $(frm.image).on("change",function(){
      var reader=new FileReader();
      reader.onload=function(e){
         $("#image").attr("src",e.target.result);
      }
      reader.readAsDataURL(this.files[0]);
   });
</script>