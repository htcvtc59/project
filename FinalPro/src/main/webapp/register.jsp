

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
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Register</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->
        <!--//login-->
	<div class="login-page">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">Register<span> Form</span></h3>
			<p>Welcome to our Auction website </p>
		</div>
		<div class="widget-shadow">
			<div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
				<h4>Already have an Account ?<a href="signin.jsp">  Sign In »</a> </h4>
			</div>
			<div class="login-body">
				<form class="wow fadeInUp animated" data-wow-delay=".7s">
					<input type="text" placeholder="First Name" required="">
					<input type="text" placeholder="Last Name" required="">
					<input type="text" class="email" placeholder="Email Address" required="">
					<input type="password" name="password" class="lock" placeholder="Password">
                                        <input type="password" name="password_confirm" class="lock" placeholder="Password Confirm">
                                        <div class="g-recaptcha" data-sitekey="6LdX_TQUAAAAAG8PZYBLbuHRFHMrUkwUW95eAkth"></div>
					<input type="submit" name="Register" value="Register">
				</form>
                             <%
                        if (request.getAttribute("qrCodePath") != null) {
                            String qr = (String) request.getAttribute("qrCodePath");
                    %>
                    <img src="<%=request.getContextPath()%>/2fa-qr-code.png" height="100" width="100" />

                    <%
                        }
                    %>
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