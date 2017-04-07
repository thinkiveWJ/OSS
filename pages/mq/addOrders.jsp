<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MQ TEST</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function addBatchOrders(){
		$.ajax({
			url:"http://localhost:8080/hw-pos-service/addBatchOrders.do",
			data:{},
			type:"POST",
			dataType:"json",
			success:function(data){
				alert("发送成功");
			}
		});
	}
	
</script>
</head>
<body>
<center>
<table Style="width:1200px;" border="1">
      <caption>PO订单消息测试</caption>
      <tr>
         <th>
         OSS批量添加商品(100000条记录)<br/>
         <button onclick="addBatchOrders()">提交</button></th>
      </tr>
      
</table>
<div>操作信息</div>
<div id="ossResultId"></div>
</center>
</body>
</html>