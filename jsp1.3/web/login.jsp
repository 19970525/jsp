<%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/16
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
  <head>
    <title>登录</title>
  </head>
  <body>
  <center>
    <h1>用户登录</h1>
    <form action="main.jsp" method="post">
      用户名：<input type="text" name="username"/>
      <br><br>
      学 号：<input type="text" name="num">
      <br><br>
      <input type="submit" value="题交">
    </form>
  </center>
  </body>
</html>
