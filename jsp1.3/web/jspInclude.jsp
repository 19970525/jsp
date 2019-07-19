<%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/16
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>include</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:include page="main.jsp" flush="true">
        <jsp:param name="username" value="李四"/>
        <jsp:param name="num" value="123456"/>
    </jsp:include>
</body>
</html>
