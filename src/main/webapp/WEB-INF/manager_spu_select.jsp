<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function (){
		$("#class_1_select_spu").append("<option>请选择</option>");
		
		$.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,json){
				$("#class_1_select_spu").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
		});
	});
	
	function spu_get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#class_2_select_spu").empty();
			$(data).each(function(i,json){
				$("#class_2_select_spu").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});
		
		// 加载tm信息
		spu_get_tm(class_1_id);
	}
	
	function spu_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_select_spu").empty();
			$(data).each(function(i,json){
				$("#tm_select_spu").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
</script>
<title>硅谷商城</title>
</head>
<body>

	一级分类<select name="flbh1" id="class_1_select_spu" onchange="spu_get_class_2(this.value)"></select>
	二级分类<select name="flbh2" id="class_2_select_spu"></select>
	商标<select name="pp_id" id="tm_select_spu"></select>

</body>
</html>