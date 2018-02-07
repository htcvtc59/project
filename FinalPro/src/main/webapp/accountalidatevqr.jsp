

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
                    <li class="active">Register</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->

        <!--login-->
        <div class="login-page">
            <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                <h3 class="title">Account<span> Validation</span></h3>
                <p>Please read the instruction below</p>
            </div>
            <div class="widget-shadow">
                <div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
                    <h4>Already have an Account ?<a href="signin.jsp">  Sign In »</a> </h4>
                </div>
                <div class="login-body">
                    <h3>1. Install <a href="">Google Authenticator</a> on your phone</h3>
                    <h3>2. Open the Google Authenticator App</h3>
                    <h3>3. Tap Menu and tap "Set up account" then tap "Scan a barcode"</h3>
                    <h3>Your phone will now be in "Scanning mode" . When you are in this mode , Scan the barcode below</h3>
                    <img src="https://chart.googleapis.com/chart?chs=166x166&chld=L|0&cht=qr&chl=<%=(String) request.getAttribute("barCode")%>" width="100" height="100" />
                    <h3>Once you have scanned the barcode ,enter 6 digits number </h3>
                    <form action="/register?action=validate" method="POST" class="wow fadeInUp animated" data-wow-delay=".7s">
                        <input type="text" name="code" placeholder="123456" required="">
                        <input type="submit" value="Account Validate">
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
