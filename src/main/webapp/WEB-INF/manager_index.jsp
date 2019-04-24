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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	$(function(){
		var url = "${url}";
		var title = "${title}";
		if(url!=""&&title!=""){
			add_tab(url,title);
		}
		
		
	});
	
	function add_tab(url,title){
		
/* 		$.post("goto_spu.do",function(data){
			// 这样加载会加载goto_spu返回的页面上的head中的js函数
			// 如果head中的js函数里有jquery-1.7.2.min.js，会覆盖元来的jquery
			// 会导致easyui.min.js失效
			$('#tt').tabs('add',{    
			    title:'New Tab',    
			    content:data,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			}); 
		}); */
		
		var b = $('#tt').tabs("exists",title);
		if(b){
			// 选中当前tabs选项卡
			$('#tt').tabs("select",title);
		}else{
			// 添加新的tabs选项卡
			$('#tt').tabs('add',{ 
				// 这样加载不会加载goto_spu返回的页面上的head中的js函数
				// 会导致head中js函数加载不过来
			    title:title,    
			    href:url,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});
		}
 
	}
</script>
<title>硅谷商城</title>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:180px;padding:10px;">
			
			<div class="easyui-accordion" style="width:150px;">
				<div title="商品信息管理" >
					<ul class="easyui-tree">
						<li>
							<span>商品发布管理</span>
							
							<ul>
								<li>
									<span>i</span>
									<ul>
										<li>1</li>
									</ul>
								</li>
								<li><a href="javascript:add_tab('goto_spu.do','商品spu信息发布');" >商品spu信息发布</a></li>
								<li><a href="javascript:add_tab('goto_sku.do','商品sku信息发布');" >商品sku信息发布</a></li>
								<li><a href="javascript:add_tab('goto_attr.do','商品属性信息发布');" >商品属性信息发布</a></li>
							</ul>
						</li>
						
						<li>
							<span>商品内容管理</span>
							<ul>
								<li>
									<span>...</span>
									<ul>
										<li>...</li>
										<li>...</li>	
									</ul>
								</li>
								<li>...</li>
								<li>...</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>	
			
			<div class="easyui-accordion" style="width:150px;">
				<div title="缓存信息管理" >
					<a href="javascript:add_tab('goto_spu.do','缓存管理');">缓存管理</a><br>
					<a href="javascript:add_tab('goto_spu.do','测试');">测试</a><br>
				</div>	
			</div>		
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="tt" class="easyui-tabs" style="height:700px"></div>
	</div>
</body>

</body>
</html>