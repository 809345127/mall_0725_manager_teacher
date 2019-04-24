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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function (){
		$("#class_1_select_attr").append("<option>请选择</option>");
		
		$.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,json){
				$("#class_1_select_attr").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
		});
	});
	
	function attr_get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#class_2_select_attr").empty();
			$(data).each(function(i,json){
				$("#class_2_select_attr").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});

	}
	
	function attr_get_attr_list(class_2_id){
		$.post("get_attr_list.do",{class_2_id:class_2_id},function(data){
			$("#attr_list").html(data);
		});
		
		// 通过datagrid控件加载属性列表
		/* $('#attr_list').datagrid({    
		    url:'get_attr_list_json.do', 
		    queryParams: {
		    	class_2_id:class_2_id
			},
		    columns:[[    
		        {field:'id',title:'属性编号',width:100},    
		        {field:'shxm_mch',title:'属性名称',width:100},    
		        {field:'chjshj',title:'创建时间',width:200,
		        	formatter: function(value,row,index){
		        		var date = new Date(value);
						return date.toLocaleString();
					}	
		        }, 
		        {field:'list_value',title:'属性值',width:300,
		        	formatter: function(value,row,index){
		        		var name = "";
						$(value).each(function(i,json){
							name = name + " "+json.shxzh+json.shxzh_mch;
						});
						return name;
					}	
		        }
		    ]]    
		}); */
	}
</script>
<title>硅谷商城</title>
</head>
<body>

	一级分类<select name="flbh1" id="class_1_select_attr" onchange="attr_get_class_2(this.value)"></select>
	二级分类<select name="flbh2" id="class_2_select_attr" onchange="attr_get_attr_list(this.value)"></select>

</body>
</html>