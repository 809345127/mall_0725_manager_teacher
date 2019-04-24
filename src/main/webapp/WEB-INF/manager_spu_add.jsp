<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<!-- <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>硅谷商城</title>
</head>
<body>
<script type="text/javascript">
	function image_click(index){
		$("#spu_file_"+index).click();
		

	}
	
	function show_image(index){
		// 获得加载后的图片缓存
		var file = $("#spu_file_"+index)[0].files[0];
		
		// 转化成js的url对象
		var url = window.URL.createObjectURL(file);
		
		// 用url替换image标签的src属性
		$("#spu_image_"+index).attr("src",url);
		
		// 用户点击的是当前最后一场空白图片
		var length = $(":file").length;
		if((index+1)==length){
			add_image(index);
		}
	}
	
	function add_image(index){
		var div_head='<div id="image_div_'+(index+1)+'" style="border:1px red solid">'
		var img = '<img  id="spu_image_'+(index+1)+'" width="100px;" height="100px;"  src="image/upload_hover.png" onclick="image_click('+(index+1)+')" style="cursor:pointer;"/>';
		var input = '<input id="spu_file_'+(index+1)+'" type="file" name="files" onchange="show_image('+(index+1)+')"/><br>';
		var div_foot="</div>";
		$("#image_div_"+index).after(div_head+img+input+div_foot);
	}
</script>
	添加商品信息<br>
	分类静态列表<br>
	<form action="save_spu.do" method="post" enctype="multipart/form-data">
		
		<%@ include file="manager_spu_select.jsp"%>
		商品名称：<input type="text" name="shp_mch"/><br>
		商品描述：<textarea rows="" cols="" name="shp_msh"></textarea><br>
		商品图片：<br>
		
		<div id="image_div_0" style="border:1px red solid">
			<img  id="spu_image_0" width="100px;" height="100px;"  src="image/upload_hover.png" onclick="image_click(0)" style="cursor:pointer;"/>
			<input id="spu_file_0" type="file" name="files" onchange="show_image(0)"/><br>
		</div>
		
		<input type="submit" value="发布spu"/>
	</form>
	
</body>
</html>