<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>[ 상품 등록 ]</h2>
<form name="frm" enctype="multipart/form-data">
     <table>
        <tr>
           <td width=100 class="title">상품코드</td>
           <td width=100><input type="text" name="prod_id"  size=6  value="${prod_id}" readonly style="text-align:center;font-weight:bold;"/></td>
           <td width=100 class="title">제조/수입원</td>
           <td width=100><input type="text" name="company"  size=10 value=""  style="text-align:center;"/></td>
           <td width=100 class="title">판매가격</td>
           <td width=100><input type="text" name="price1"  size=5 value=""  style="text-align:center;"/></td>
        </tr>
        <tr>
           <td width=100 class="title">업체정보</td>
           <td width=600 colspan=3>
           		<input type="text" name="mall_id" size=7 placeholder="업체코드" style="text-align:center;" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		<input type="text" name="mall_name" size=32 placeholder="업체이름" style="text-align:center;" readonly/>
           </td>
           <td width=100 class="title">일반가격</td>
           <td width=100><input type="text" name="price2" size=5 value="" style="text-align:center;"/></td>
        </tr>
        <tr>
           <td width=100 class="title">상품이름</td>
           <td width=700 colspan=5><input type="text" name="prod_name" size=90 value="" style=""/></td>
        </tr>
        <tr>
           <td width=100 class="title">상품이미지</td>
           <td width=700 colspan=5>
              <img src="http://placehold.it/200x150" width=200 id="image" style="float:left; margin-left:27px;"/>
              <input type="file" name="image" size=3 accept="image/*" style="visibility:hidden;float:right;"/>
              
           </td>
        </tr>
        <tr>
           <td width=100 class="title">상품설명</td>
           <td width=700 colspan=5>
             <input type="text" name="detail" size=90 value="" style="height:100px;margin:10px;"/>
           </td>
        </tr>                           
     </table>
     <div id="pagination">
        <input type="submit" value="상품등록"> 
        <input type="reset" value="등록취소"> 
        <input type="button" value="목록이동" onClick="location.href='list'"> 
     </div>
</form>
<script>
	$("#image").on("click",function(){
		$(frm.image).click();
	});
	//상품등록하기
	$(frm).on("submit",function(e){
		e.preventDefault();
		if(!confirm("상품을 등록하시겠습니까?")) return;
			frm.action="/pro/insert";
			frm.method="post";
			frm.submit();
	});
	//이미지 미리보기
	$(frm.image).on("change",function(){
		var reader=new FileReader();
		reader.onload=function(e){
			$("#image").attr("src", e.target.result);
		}
		reader.readAsDataURL(this.files[0]);
	});
	//업체정보 불러오기
	$(frm.mall_id).on("click",function(){
		window.open("/mall/listAll.jsp","mall_id","width=400,height=300,top=200,right=600");
	});
	
</script>