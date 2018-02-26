<%-- 
    Document   : products_pending
    Created on : Feb 7, 2018, 10:51:19 AM
    Author     : smart
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <jsp:include page="headermenu.jsp"/>

        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Products</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->
        <!--products-->
        <div class="products">	 
            <div class="container">
                <div class="col-md-12 product-model-sec">
                    <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g1.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Girl Dress </a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$2000.00</del></p>
                                <p><span class="item_price">$500.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".7s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g5.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Baby Romper</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$1200.00</del></p>
                                <p><span class="item_price">$800.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".9s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g7.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Bear Diaper Bag</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$570.00</del></p>
                                <p><span class="item_price">$200.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g3.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Doctor Play Set</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$2000.00</del></p>
                                <p><span class="item_price">$500.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".7s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g6.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Baby Frock</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$180.00</del></p>
                                <p><span class="item_price">$100.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".9s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g2.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Pikachu Onesies</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span >☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$2000.00</del></p>
                                <p><span class="item_price">$500.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g8.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Police Bike</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$9050.00</del></p>
                                <p><span class="item_price">$9000.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".7s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g10.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Crocs Sandals</a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$25.00</del></p>
                                <p><span class="item_price">$20.00</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".9s">
                        <span class="time-request">01:02:00</span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g12.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                                    <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">Child Print Bike </a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p class="pric1"><del>$4000.00</del></p>
                                <p><span class="item_price">$3100.00</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal video-modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModal6">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <section>
                            <div class="modal-body">
                                <div id="gallery" class="col-md-5 modal_body_left">
                                    <div id="panel">
                                        <img width="365px" height="460px" id="largeImage" src="<%=request.getContextPath()%>/asset/client/images/s1.jpg" />
                                    </div>
                                    <div id="thumbs">
                                        <img src="<%=request.getContextPath()%>/asset/client/images/s1.jpg" alt="1st image description" />
                                        <img src="<%=request.getContextPath()%>/asset/client/images/s2.jpg" alt="2nd image description" />
                                        <img src="<%=request.getContextPath()%>/asset/client/images/s3.jpg" alt="3rd image description" />
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $('#thumbs img').click(function () {
                                        $('#largeImage').attr('src', $(this).attr('src').replace('thumb', 'large'));
                                        $('#description').html($(this).attr('alt'));
                                    });
                                </script>
                                <div class="col-md-7 modal_body_right">
                                    <h4>a good look women's Long Skirt</h4>
                                    <p>Ut enim ad minim veniam, quis nostrud 
                                        exercitation ullamco laboris nisi ut aliquip ex ea 
                                        commodo consequat.Duis aute irure dolor in 
                                        reprehenderit in voluptate velit esse cillum dolore 
                                        eu fugiat nulla pariatur. Excepteur sint occaecat 
                                        cupidatat non proident, sunt in culpa qui officia 
                                        deserunt mollit anim id est laborum.</p>
                                    <div class="rating">
                                        <div class="rating-left">
                                            <img src="<%=request.getContextPath()%>/asset/client/images/star1.png" alt=" " class="img-responsive" />
                                        </div>
                                        <div class="rating-left">
                                            <img src="<%=request.getContextPath()%>/asset/client/images/star1.png" alt=" " class="img-responsive" />
                                        </div>
                                        <div class="rating-left">
                                            <img src="<%=request.getContextPath()%>/asset/client/images/star1.png" alt=" " class="img-responsive" />
                                        </div>
                                        <div class="rating-left">
                                            <img src="<%=request.getContextPath()%>/asset/client/images/star.png" alt=" " class="img-responsive" />
                                        </div>
                                        <div class="rating-left">
                                            <img src="<%=request.getContextPath()%>/asset/client/images/star.png" alt=" " class="img-responsive" />
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="input-group modal_body_right_cart simpleCart_shelfItem">
                                        <span style="margin: 10xp;" class="time-request">01:02:00</span>
                                        <span style="left: 120px;" class="time-request">18:00 - 26/02/2018</span>
                                        <p><span>$320</span> <i class="item_price">$250</i></p>
                                        <input style="margin-bottom: 10px;" type="text" class="price form-control" placeholder="Price" aria-label="Price" aria-describedby="basic-addon2">
                                        <p><a class="item_add" href="#">Aution now</a></p>
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <!--//products-->
            <!--footer-->
            <jsp:include page="footer.jsp" />
            <!--//footer-->		
            <jsp:include page="jsfooter.jsp"/>
    </body>
</html>
