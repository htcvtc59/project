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
                    <h3>Coming Soon </h3>
                    <h4>Product New Auction</h4>
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

<!--trend-->
<div class="trend wow zoomIn animated" data-wow-delay=".5s">
    <div class="container">
        <div class="trend-info">
            <section class="slider grid">
                <div class="flexslider trend-slider">
                    <ul class="slides">
                        <li>
                            <div class="col-md-5 trend-left">
                                <img width="350" height="300" src="<%=request.getContextPath()%>/asset/client/images/auction_1.jpg" alt=""/>
                            </div>
                            <div class="col-md-7 trend-right">
                                <h4>AUCTION</h4>
                                <h5>FAST AND CONVENIENT</h5>
                                <p>Auction site has one of the lowest final value fees and doesn’t charge you to list your items. If you’re looking for a cheap way to sell, Auction is our top value pick.</p>
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
<!--//new-->

<!--trend-->
<div class="trend wow zoomIn animated" data-wow-delay=".5s">
    <div class="container">
        <div class="trend-info">
            <section class="slider grid">
                <div class="flexslider trend-slider">
                    <ul class="slides">
                        <li>
                            <div class="col-md-5 trend-left">
                                <img width="350" height="300" src="<%=request.getContextPath()%>/asset/client/images/auction1.png" alt=""/>
                            </div>
                            <div class="col-md-7 trend-right">
                                <h4>AUCTION</h4>
                                <h5>FAST AND CONVENIENT</h5>
                                <p>Auction site has one of the lowest final value fees and doesn’t charge you to list your items. If you’re looking for a cheap way to sell, Auction is our top value pick.</p>
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


<!-- Button trigger modal -->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Product View</h4>
            </div>
            <!-- START OF MODAL BODY-->
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
                            <span style="left:100px;" class="date-request">18:00 - 26/-2/2018</span>
                            <p><span>Price Start</span> <i class="item_price">$250</i></p>
                            <p><span>Price Min</span> <i class="item_price">$250</i></p>
                            <input style="margin-bottom: 10px;" type="text" class="price form-control" placeholder="Price" aria-label="Price" aria-describedby="basic-addon2">
                            <p><a class="item_add" href="#modalUser" data-toggle="modal" data-target="#list-user">Aution now</a></p>


                            <div class="col-7 contentscollbar table-homeau-content">
                                <table class="table table-responsive-sm table-sm table-striped">
                                    <thead >
                                        <tr>
                                            <th style="font-weight: normal;" scope="col">List User Aution</th>
                                        </tr>
                                    </thead>
                                    <tbody id="buy_content_value">
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                        <tr>
                                            <td>Nguyễn Tuấn Anh</td>
                                            <td>100</td>
                                            <td>3/1/2018</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"> </div>
                </div>
            </section>

            <!-- END OF APPLICATION FORM MODAL BODY -->

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->


   
</div>

<!--<script type="text/javascript">
    $('#listViewCancel').click(function () {
        $('#list-user').modal('toggle');
    });
</script>-->

 <!--Modal for uploading photo-->
<!-- <div class="modal" id="list-user" tabindex="-1" role="dialog" aria-labelledby="list-user-title" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                 <h4 class="modal-title" id="list-user-title">List User Aution</h4>
             </div>
             <div class="modal-body">
                 <p>Nguyễn Tuấn Anh</p>
                 <p>Đinh Văn Trơn</p>
                 <p>Trần Quang Khải</p>
             </div>
             <div class="modal-footer">
                 <button id="listViewCancel" type="button" class="btn btn-default">Close</button>
             </div>
         </div> /.modal-content 
     </div> /.modal-dialog 
 </div>-->