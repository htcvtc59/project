<%-- 
    Document   : content
    Created on : Feb 5, 2018, 9:56:53 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--banner-->

<div class="banner">
    <div id="particles">
        <div id="intro">
            <div class="banner-text">			
                <div class="col-sm-5 banner-left wow fadeInLeft animated clearTop" data-wow-delay=".5s">			
                    <h2>On Entire Fashion range</h2>
                    <h3>Coming Soon </h3>
                    <h4>Our New Designs</h4>
                    <div class="count main-row">
                        <ul id="example">
                            <li><span class="hours">00</span><p class="hours_text">Hours</p></li>
                            <li><span class="minutes">00</span><p class="minutes_text">Minutes</p></li>
                            <li><span class="seconds">00</span><p class="seconds_text">Seconds</p></li>
                        </ul>
                        <div class="clearfix"> </div>
                        <script type="text/javascript" src="<%=request.getContextPath()%>/asset/client/js/jquery.countdown.min.js"></script>
                        <script type="text/javascript">
                            $('#example').countdown({
                                date: '12/24/2020 15:59:59',
                                offset: -8,
                                day: 'Day',
                                days: 'Days'
                            }, function () {
                                alert('Done!');
                            });
                        </script>
                    </div>

                </div>
                <div class="col-sm-7 banner-right wow fadeInRight animated clearTop" data-wow-delay=".5s">			
                    <section class="slider grid">
                        <div class="flexslider">
                        </div>
                    </section>
                    <!--FlexSlider-->
                    <script defer src="<%=request.getContextPath()%>/asset/client/js/jquery.flexslider.js"></script>
                    <script type="text/javascript">
                            $(window).load(function () {
                                $('.flexslider').flexslider({
                                    animation: "pagination",
                                    start: function (slider) {
                                        $('body').removeClass('loading');
                                    }
                                });
                            });
                    </script>
                    <!--End-slider-script-->
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>	
    </div>
</div>		
<!--//banner-->
<!--new-->
<div class="new">
    <div class="container">
        <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
            <h3 class="title">New <span>Arrivals</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
        </div>
        <div class="new-info">
            <div class="col-md-3 new-grid simpleCart_shelfItem wow flipInY animated" data-wow-delay=".5s">
                <span class="time-request">01:02:00</span>
                <div class="new-top">
                    <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g9.jpg" class="img-responsive" alt=""/></a>
                    <div class="new-text">
                        <ul>
                            <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                            <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                        </ul>
                    </div>
                </div>
                <div class="new-bottom">
                    <h5><a class="name" href="single.html">Baby Red Dress </a></h5>
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
            <div class="col-md-3 new-grid new-mdl simpleCart_shelfItem wow flipInY animated" data-wow-delay=".7s">
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
                    <h5><a class="name" href="single.html">Crocs Sandals </a></h5>
                    <div class="rating">
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span>☆</span>
                    </div>	
                    <div class="ofr">
                        <p><span class="item_price">$50.00</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 new-grid new-mdl1 simpleCart_shelfItem wow flipInY animated" data-wow-delay=".9s">
                <span class="time-request">01:02:00</span>
                <div class="new-top">
                    <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g11.jpg" class="img-responsive" alt=""/></a>
                    <div class="new-text">
                        <ul>
                            <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                            <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                        </ul>
                    </div>
                </div>
                <div class="new-bottom">
                    <h5><a class="name" href="single.html">Pink Sip Cup </a></h5>
                    <div class="rating">
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span>☆</span>
                    </div>	
                    <div class="ofr">
                        <p><span class="item_price">$150.00</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 new-grid simpleCart_shelfItem wow flipInY animated" data-wow-delay="1.1s">
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
                        <span class="on">☆</span>
                        <span>☆</span>
                    </div>	
                    <div class="ofr">
                        <p class="pric1"><del>$5050.00</del></p>
                        <p><span class="item_price">$3020.00</span></p>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>		
<!--//new-->
<!--gallery-->
<div class="new">
    <div class="container">
        <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
            <h3 class="title">New <span>Arrivals</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
        </div>
        <div class="new-info">
            <div class="col-md-3 new-grid simpleCart_shelfItem wow flipInY animated" data-wow-delay=".5s">
                <span class="time-request">01:02:00</span>
                <div class="new-top">
                    <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g9.jpg" class="img-responsive" alt=""/></a>
                    <div class="new-text">
                        <ul>
                            <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                            <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                        </ul>
                    </div>
                </div>
                <div class="new-bottom">
                    <h5><a class="name" href="single.html">Baby Red Dress </a></h5>
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
            <div class="col-md-3 new-grid new-mdl simpleCart_shelfItem wow flipInY animated" data-wow-delay=".7s">
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
                    <h5><a class="name" href="single.html">Crocs Sandals </a></h5>
                    <div class="rating">
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span>☆</span>
                    </div>	
                    <div class="ofr">
                        <p><span class="item_price">$50.00</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 new-grid new-mdl1 simpleCart_shelfItem wow flipInY animated" data-wow-delay=".9s">
                <span class="time-request">01:02:00</span>
                <div class="new-top">
                    <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g11.jpg" class="img-responsive" alt=""/></a>
                    <div class="new-text">
                        <ul>  
                            <li><a href="#" data-toggle="modal" data-target="#myModal6">Quick View</a></li>
                            <li><a href="<%=request.getContextPath()%>/products_detail.jsp">Show Details </a></li>
                        </ul>
                    </div>
                </div>
                <div class="new-bottom">
                    <h5><a class="name" href="single.html">Pink Sip Cup </a></h5>
                    <div class="rating">
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span class="on">☆</span>
                        <span>☆</span>
                    </div>	
                    <div class="ofr">
                        <p><span class="item_price">$150.00</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 new-grid simpleCart_shelfItem wow flipInY animated" data-wow-delay="1.1s">
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
                        <span class="on">☆</span>
                        <span>☆</span>
                    </div>	
                    <div class="ofr">
                        <p class="pric1"><del>$5050.00</del></p>
                        <p><span class="item_price">$3020.00</span></p>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//gallery-->

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


<!--trend-->
<div class="trend wow zoomIn animated" data-wow-delay=".5s">
    <div class="container">
        <div class="trend-info">
            <section class="slider grid">
                <div class="flexslider trend-slider">
                    <ul class="slides">
                        <li>
                            <div class="col-md-5 trend-left">
                                <img src="<%=request.getContextPath()%>/asset/client/images/t1.png" alt=""/>
                            </div>
                            <div class="col-md-7 trend-right">
                                <h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
                                <h5>Flat 20% OFF</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
                            </div>
                            <div class="clearfix"></div>
                        </li>
                        <li>
                            <div class="col-md-5 trend-left">
                                <img src="<%=request.getContextPath()%>/asset/client/images/t2.png" alt=""/>
                            </div>
                            <div class="col-md-7 trend-right">
                                <h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
                                <h5>Flat 20% OFF</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
                            </div>
                            <div class="clearfix"></div>
                        </li>
                        <li>
                            <div class="col-md-5 trend-left">
                                <img src="<%=request.getContextPath()%>/asset/client/images/t3.png" alt=""/>
                            </div>
                            <div class="col-md-7 trend-right">
                                <h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
                                <h5>Flat 20% OFF</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
                            </div>
                            <div class="clearfix"></div>
                        </li>
                        <li>
                            <div class="col-md-5 trend-left">
                                <img src="<%=request.getContextPath()%>/asset/client/images/t4.png" alt=""/>
                            </div>
                            <div class="col-md-7 trend-right">
                                <h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
                                <h5>Flat 20% OFF</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
                            </div>
                            <div class="clearfix"></div>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
</div>
<!--//trend-->
