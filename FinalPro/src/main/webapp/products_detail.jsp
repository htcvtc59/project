<%-- 
    Document   : product_detail
    Created on : Feb 7, 2018, 1:25:20 PM
    Author     : smart
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp"/>
        <!--flex slider-->
        <script defer src="<%=request.getContextPath()%>/asset/client/js/jquery.flexslider.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/client/css/flexslider1.css" type="text/css" media="screen" />

        <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>
        <!--flex slider-->
        <script src="<%=request.getContextPath()%>/asset/client/js/imagezoom.js"></script>
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
                    <li class="active">Single page</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->
        <!--single-page-->
        <div class="single">
            <div class="container">
                <div class="single-info">		
                    <div class="col-md-6 single-top wow fadeInLeft animated" data-wow-delay=".5s">	
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="<%=request.getContextPath()%>/asset/client/images/s1.jpg">
                                    <div class="thumb-image"> <img src="<%=request.getContextPath()%>/asset/client/images/s1.jpg" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>
                                <li data-thumb="<%=request.getContextPath()%>/asset/client/images/s2.jpg">
                                    <div class="thumb-image"> <img src="<%=request.getContextPath()%>/asset/client/images/s2.jpg" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>
                                <li data-thumb="<%=request.getContextPath()%>/asset/client/images/s3.jpg">
                                    <div class="thumb-image"> <img src="<%=request.getContextPath()%>/asset/client/images/s3.jpg" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li> 
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 single-top-left simpleCart_shelfItem wow fadeInRight animated" data-wow-delay=".5s">
                        <h3>Babyhug Kurta And Jodhpuri Breeches</h3>
                        <div class="single-rating">
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5" checked>
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3">
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1">
                                <label for="rating1">1</label>
                            </span>
                           
                        </div>
                        <h6 class="item_price">$600.00</h6>			
                        <p>Etiam faucibus viverra libero vel efficitur. Ut semper nisl ut laoreet ultrices. Maecenas dictum arcu purus, sit amet volutpat purus viverra sit amet. Quisque lacinia quam sed tortor interdum, malesuada congue nunc ornare. Cum sociis natoque penatibus et magnis dis parturient montes</p>
                     
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <!--collapse-tabs-->
                <div class="collpse tabs">
                    <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default wow fadeInUp animated" data-wow-delay=".5s">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Description
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!--//collapse -->
            </div>
        </div>
        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>