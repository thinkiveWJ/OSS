<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MQ TEST</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function senderFetch(){
		var styleID = $.trim($("#styleID").val());
		var colorID = $.trim($("#colorID").val());
		var sizeID = $.trim($("#sizeID").val());
		if(styleID=='' || colorID=='' || sizeID==''){
			alert("参数有误");
			return false;
		}
		$.ajax({
			url:"http://localhost:8080/hw-posOSS/addGoods.do",
			data:{"styleID":styleID,"colorID":colorID,"sizeID":sizeID},
			type:"POST",
			dataType:"json",
			success:function(data){
				alert("添加成功");
			}
		});
	}
	function addBatchGoods(){
		$.ajax({
			url:"http://localhost:8080/hw-posOSS/addBatchGoods.do",
			data:{},
			type:"POST",
			dataType:"json",
			success:function(data){
				alert("添加成功");
			}
		});
	}
	
</script>
</head>
<body>
<center>
<table Style="width:1200px;" border="1">
      <caption>OSS消息测试</caption>
      <tr>
         <th>styleID</th>
         <td><input type="text" id="styleID" /></td>
      </tr>
      <tr>
         <th>colorID</th>
         <td><input type="text" id="colorID" /></td>
      </tr>
      <tr>
         <th>sizeID</th>
         <td><input type="text" id="sizeID" /></td>
      </tr>
      <tr>
         <th>OSS添加商品</th>
         <td><button onclick="senderFetch()">提交</button></td>
      </tr>
      <tr>
         <th>
         OSS批量添加商品(56821条记录，每秒添加一个)<br/>
         <button onclick="addBatchGoods()">提交</button></th>
      </tr>
      
</table>
<div>操作信息</div>
<div id="ossResultId"></div>
</center>
</body>
</html>