<%-- 
    Document   : inputemail
    Created on : Feb 18, 2018, 8:43:31 AM
    Author     : Admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp"/>

    </head>
    <body>
        <!--header-->
        <jsp:include page="headermenu.jsp"/>
        <!--//header-->

        <!--breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Change Password</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->

        <!--login-->

        <div class="login-page">
            <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                <h3 class="title">Change <span> Password</span></h3>
                <p>Enter your email address</p>
            </div>
            <div class="widget-shadow">
                <div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
                    <h4></h4>
                </div>
                <div class="login-body">
                    <form method="POST" action="" class="wow fadeInUp animated" data-wow-delay=".7s">
                         <input type="text" name="email" class="lock" placeholder="Enter your email">
                        <input type="submit"  value="Send">
                    </form>
                   
                </div>
            </div>
        </div>
        <!--//login-->


        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>

