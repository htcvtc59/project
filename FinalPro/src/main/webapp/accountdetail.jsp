

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
                    <li class="active">Account Detail</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->

        <!--login-->

        <div class="login-page">
            <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                <h3 class="title">Account<span> Detail</span></h3>
                <p>Welcome to our Auction website </p>
            </div>
            <div class="widget-shadow">
                <div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
                    <h4>Back to home page <a href="index.jsp">  Homepage »</a> </h4>
                </div>
                <div class="login-body">
                    <form method="POST" action="" class="wow fadeInUp animated" data-wow-delay=".7s">
                        <input type="text" name="firstname" placeholder="First Name" required="">
                        <input type="text" name="lastname" placeholder="Last Name" required="">
                        <input type="text" name="email" class="email" placeholder="Email Address" required="">
                        <input type="password" name="password" class="lock" placeholder="Password">
                        <input type="password" name="newpassword" class="lock" placeholder="newPassword">
                        <input type="password" name="new_password_confirm" class="lock" placeholder="newPassword Confirm">
                        <input type="text" name="phone" placeholder="Phone" required="">
                        <input type="text" name="address" placeholder="Address" required="">
                        <input type="text" name="accountbalance" placeholder="account balance" readonly>
                         <input type="text" name="moneyadd" placeholder="Money Add" required="">
                        <input type="submit"  value="Update ">
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
