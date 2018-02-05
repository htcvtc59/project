<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2/1/18
  Time: 16:08
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

    <title>Admin Login | </title>

    <jsp:include page="cssheader.jsp"/>

</head>

<body class="login">
<div>


    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="loginadmin" method="POST">
                    <h1>Login Form</h1>
                    <div>
                        <input type="text" name="username" class="form-control" placeholder="Username" required=""/>
                    </div>
                    <div>
                        <input type="password" name="password" class="form-control" placeholder="Password" required=""/>
                    </div>

                    <div>
                        <input class="btn btn-default submit" type="submit" value="Log in">
                    </div>

                    <div class="clearfix"></div>
                </form>
            </section>
        </div>


    </div>
</div>
</body>
</html>

