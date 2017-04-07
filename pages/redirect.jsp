<%--
  Created by IntelliJ IDEA.
  User: lican
  Date: 2016/5/5
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/page.common.js"></script>
    <script type="text/javascript">
    	$(function(){
    		POST('../screen/showStoreSecondScreenList.do',JSON.stringify({}),function(result){});
    	});
    </script>
</head>
<body>
<p>文件上传中，请稍后。</p>
<jsp:forward page="/screen/showStoreSecondScreenList.do"/>
</body>
</html>
