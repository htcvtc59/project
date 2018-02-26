<%-- 
    Document   : contact
    Created on : Feb 12, 2018, 3:10:39 PM
    Author     : smart
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
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Contact Us</li>
			</ol>
		</div>
	</div>
	<!--//breadcrumbs-->
	<!--contact-->
	<div class="contact">
		<div class="container">
			<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
				<h3 class="title">How To <span> Find Us</span></h3>
				<p>If you have any questions, please do not hesitate to send us a message. </p>
			</div>
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.097945951297!2d105.77952571530452!3d21.028766593153087!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abbfa96f309f%3A0x7917af0f83effe1b!2sFPT+University%2C+Hanoi!5e0!3m2!1sen!2s!4v1518423289706" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>	
	</div>
	<div class="address"><!--address-->
		<div class="container">
			<div class="address-row">
				<div class="col-md-6 address-left wow fadeInLeft animated" data-wow-delay=".5s">
					<div class="address-grid">
						<h4 class="wow fadeIndown animated" data-wow-delay=".5s">DROP US A LINE </h4>
						<form>
							<input class="wow fadeIndown animated" data-wow-delay=".6s" type="text" placeholder="Name" required="">
							<input class="wow fadeIndown animated" data-wow-delay=".7s" type="text" placeholder="Email" required="">
							<input class="wow fadeIndown animated" data-wow-delay=".8s" type="text" placeholder="Subject" required="">
							<textarea class="wow fadeIndown animated" data-wow-delay=".8s" placeholder="Message" required=""></textarea>
							<input class="wow fadeIndown animated" data-wow-delay=".9s" type="submit" value="SEND">
						</form>
					</div>
				</div>
				<div class="col-md-6 address-right">
					<div class="address-info wow fadeInRight animated" data-wow-delay=".5s">
						<h4>ADDRESS</h4>
						<p>Tòa nhà Detech, Số 8, Tôn Thất Thuyết, Mỹ Đình, Cầu Giấy, Hà Nội</p>
					</div>
					<div class="address-info address-mdl wow fadeInRight animated" data-wow-delay=".7s">
						<h4>PHONE </h4>
						<p>+222 111 333 4444</p>
						<p>+222 111 333 5555</p>
					</div>
					<div class="address-info wow fadeInRight animated" data-wow-delay=".6s">
						<h4>MAIL</h4>
						<p><a href="mailto:auction_master@fpt.edu.vn"> auction_master@fpt.edu.vn</a></p>
						<p><a href="mailto:action_developer@fpt.edu.vn"> action_developer@fpt.edu.vn</a></p>
					</div>
				</div>
			</div>	
		</div>	
	</div>
	<!--//contact-->	
        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>
