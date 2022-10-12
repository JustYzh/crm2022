<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>演示文件上传</title>
</head>
<body>
<form action="workbench/activity/fileUpload.action" method="post" enctype="multipart/form-data">
    <input type="file" name="upload"><br>
    <input type="text" name="userName"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
