<%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/16
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>forword</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        System.out.println("我运行............"); %>
    <jsp:forward page="main.jsp">
        <jsp:param name="username" value="湖人总冠军"/>
        <jsp:param name="num" value="555555556"/>
    </jsp:forward>
    <% System.out.print("我不运行............"); %>
</body>
</html>
