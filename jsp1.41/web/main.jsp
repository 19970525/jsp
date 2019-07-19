<%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/19
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<%
    Integer count = (Integer) application.getAttribute("count");
    if (count == null){
        count = 0;
    }
    else {
        count++;
    }
%>
第<%=count %>次访问网页！
<center>
    <%
        //从session对象获取用户名的属性值
        String name= (String) request.getSession().getAttribute("username");
        if(name==null){//如果取不到，意味着用户未登录
            out.println("<h1>您未登录，3秒后跳转到登录页面！</h1>");
            response.setHeader("refresh", "3;url=login.jsp");
        }else{//如果不到，意味着用户登录了
            out.println("<h1>欢迎,"+name+",来到我的主页！</h1>");
        }
    %>

</center>
</body>
</html>
