
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp"/>

        <script type="text/javascript" src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
        <!--header-->
        <jsp:include page="headermenu.jsp"/>
        <!--//header-->

        <!--breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow fadeInUp" data-wow-delay=".5s">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Sign In</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->

        <!--login-->
        <div class="login-page">
            <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                <h3 class="title">SignIn<span> Form</span></h3>
                <p>Welcome to our Auction website </p>
            </div>
            <div class="widget-shadow">
                <div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
                    <h4>Welcome back to Auction website ! <br> Not a Member? <a href="register.jsp">  Register Now »</a> </h4>
                </div>
                <div class="login-body wow fadeInUp animated" data-wow-delay=".7s">
                    <form action="/signin?action=signin" method="POST">
                        <input type="text" class="user" name="username" placeholder="Enter your email" required="">
                        <input type="password" name="password" class="lock" placeholder="Password">
                        <div class="g-recaptcha" data-sitekey="6LdX_TQUAAAAAG8PZYBLbuHRFHMrUkwUW95eAkth"></div>

                        <input type="submit" name="Sign In" value="Sign In">
                        <div class="forgot-grid">
                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Remember me</label>
                            <div class="forgot">
                                <a href="#">Forgot Password?</a>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="login-page-bottom">

            </div>
        </div>
        <!--//login-->

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>