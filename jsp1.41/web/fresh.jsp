<%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/19
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>刷新</title>
</head>
<body>
<%
    response.setIntHeader("Refresh",3);
//    response.setHeader("refresh","3");
%>
</body>
</html>
