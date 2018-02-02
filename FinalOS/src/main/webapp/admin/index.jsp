<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2/1/18
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Dashboard | </title>

    <jsp:include page="cssheader.jsp"/>
</head>

<body class="nav-md">

<div class="container body">
    <div class="main_container">

        <jsp:include page="menu.jsp"/>

        <!-- top navigation -->
        <jsp:include page="head.jsp"/>
        <!-- /top navigation -->

        <!-- page content -->
        <jsp:include page="content.jsp"/>
        <!-- /page content -->

        <!-- footer content -->
        <jsp:include page="footer.jsp"/>
        <!-- /footer content -->
    </div>
</div>

<jsp:include page="jsfooter.jsp"/>

</body>
</html>
