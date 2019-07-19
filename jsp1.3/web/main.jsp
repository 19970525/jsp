<%@ page import="java.net.InetAddress" %><%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/16
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<!-- 客户端可见   html注释 -->
<%-- 客户端不可见  jsp注释 --%>

    <%@ include file="head.jsp"%>
    <%! int a=100; %>
    <%
        request.setCharacterEncoding("utf-8");
        String uname = request.getParameter("username");
        Integer num = Integer.valueOf(request.getParameter("num"));
    %>
    <h3>
        欢迎你,<%=uname %>&nbsp;<%=num %>
    </h3>
    <%
        InetAddress inet = InetAddress.getLocalHost();
    %>
    访问用户IP：<%=inet.getHostAddress()%><br>
    访问用户主机名：<%=inet.getHostName()%><br>
    <c:out value="我是核心标签库输出的内容"></c:out>
    <%@ include file="footer.jsp"%>
</body>
</html>
