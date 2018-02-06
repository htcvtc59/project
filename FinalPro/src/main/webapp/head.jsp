<%-- 
    Document   : head
    Created on : Feb 5, 2018, 9:53:25 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<title>Auction</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/asset/client/favicon.ico" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath()%>/asset/client/favicon.ico" type="image/x-icon">

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Shoppe Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
      Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--//for-mobile-apps -->
<!--Custom Theme files -->
<link href="<%=request.getContextPath()%>/asset/client/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/asset/client/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/asset/client/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/client/css/flexslider.css" type="text/css" media="screen" />
<!--//Custom Theme files -->
<!--js-->
<script src="<%=request.getContextPath()%>/asset/client/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/client/js/modernizr.custom.js"></script>
<!--//js-->
<!--cart-->
<script src="<%=request.getContextPath()%>/asset/client/js/simpleCart.min.js"></script>
<!--cart-->

<!-- datetime -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.js"></script>
<script src="<%=request.getContextPath()%>/asset/client/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/asset/client/js/moment-with-locales.js"></script>
<!-- datetime -->

<!-- particle ground -->
<script src="<%=request.getContextPath()%>/asset/client/js/jquery.particleground.js"></script>
<!--web-fonts-->
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'><link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Pompiere' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Fascinate' rel='stylesheet' type='text/css'>
<!--web-fonts-->
<!--animation-effect-->
<link href="<%=request.getContextPath()%>/asset/client/css/animate.min.css" rel="stylesheet"> 
<script src="<%=request.getContextPath()%>/asset/client/js/wow.min.js"></script>
<script>
new WOW().init();
</script>
<!--//animation-effect-->
<!--start-smooth-scrolling-->
<script type="text/javascript" src="<%=request.getContextPath()%>/asset/client/js/move-top.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/asset/client/js/easing.js"></script>	
<script type="text/javascript">
jQuery(document).ready(function ($) {
    $(".scroll").click(function (event) {
        event.preventDefault();
        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
    });
});
</script>
<!--//end-smooth-scrolling-->