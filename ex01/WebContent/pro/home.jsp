<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	 #tbl {width:1400px; overflow:hidden;margin: 0px auto;}
   	 #tbl .box {width:250px; float:left; margin:10px; padding:10px;}
	 .del0{color:black; font-weight:bold;}
 	 .del1{background:red; color:#BAD1E6; font-weight:bold; width:80px;text-align:center;}
 	 .prod_name{white-space:nowrap; overflow:hidden; text-overflow:ellipsis; 
                font-size:14px; width:250px;}
</style>
<div>
	<div style="float:left;">
				<select id="key">
			<option value="prod_id">��ǰ�ڵ�</option>
			<option value="prod_name">��ǰ��</option>
		</select>
		<input type="text" id="word" placeholder="�˻���"/>
		<select id="perpage">
			<option value=4>4��</option>
			<option value=8 selected>8��</option>
			<option value=12>12��</option>
		</select>
		<span id="count"></span>
	</div>
	<div style="float:right;">
		<select id="order">
			<option value="prod_id">�ڵ��</option>
			<option value="prod_name">��ǰ���</option>
			<option value="price">���ݼ�</option>
		</select>
		<select id="desc">
			<option value="desc">��������</option>
			<option value="asc">��������</option>
		</select>
	</div>
</div>
<div id="tbl"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each array}}
	<div class="box" pid="{{prod_id}}" pname="{{prod_name}}" price={{price}}>
	
	<img src="{{pntImage image}}" style="cursor:pointer" width=200 height=220 onClick="location.href='/pro/pdetail?prod_id={{prod_id}}'"/>
	
		<div>{{prod_id}}</div>
		<div class="prod_name">{{prod_name}}</div>
		<div>{{nf price}}��</div>
		<div class="del{{prod_del}}">{{status prod_del}}</div>
	</div>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("pntImage", function(image){
		if(!image){
			return "http://placehold.it/150x115";
		}else{
			return "/product/img/" + image;
		}
	});

	Handlebars.registerHelper("nf", function(price){
		var regexp= /\B(?=(\d{3})+(?!\d))/g;
		return price.toString().replace(regexp, ",");
	});
	
	Handlebars.registerHelper("status", function(prod_del){
		if(prod_del==0){
			return "�Ǹ���";
		}else{
			return "������";
		}
	});
</script>
<div id="pagination">
		<button id="btnPre">����</button>
		<span id="pageInfo"></span>
		<button id="btnNext">����</button>
</div>

<script>
   var url="/pro/list.json";
</script>