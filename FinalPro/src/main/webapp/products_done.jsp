
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
                <div class="col-md-12 product-model-sec prodonedata">
                    
                </div>
            </div>
        </div>
        
        <div class="buttonshowmorepro">
            <button type="button" class="btn btn-primary btn-block btnmoredonedata">More</button>
        </div>
            
            <!-- Button trigger modal -->
        <div class="modal-data-done">


        </div>

        <!-- Button trigger modal -->
           

                <script type="text/javascript">
                    $(document).ready(function () {
                        var pagenumber = 1;
                        
                        $.ajax({
                            url: "/servletDoneProduct",
                            type: 'GET',
                            data: {
                                done: "donedata"
                            },
                            success: function (data) {
                                 if (JSON.parse(JSON.stringify(data)).length < 3) {
                            $('.buttonshowmorepro').remove();
                        }
                                
                                $.each(JSON.parse(JSON.stringify(data)), function (index, value) {
                                    var doc = JSON.stringify(value);
                                    var res = JSON.parse(doc);
                                    var id = res._id.$oid;
                                    var nameproduct = res.nameproduct;
                                    var pricemin = res.pricemin;
                                    var stepprice = res.stepprice;
                                    var quantity = res.quantity;
                                    var image = res.image;
                                    var timebegin = res.timebegin.$date;
                                    var timeend = res.timeend.$date;
                                    var description = res.description.split(" ");
                                    var des = "";
                                    for (var i = 0, max = description.length; i < max; i++) {
                                        if (i < 10) {
                                            des += description[i]+" ";
                                        }
                                    }

                                    console.log(id + "\n" + moment(timebegin)
                                            .format("DD-MM-YYYY HH:mm:ss A").toString());
                                    
                                    $('.prodonedata').append(` <div style="margin-bottom: 2em;" class="itemdo` + id + ` product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated animated" data-wow-delay=".7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                        <span class="time-request" style="color: red;">Done</span>
                        <div class="new-top">
                            <a href="single.html"><img style="width: 220px;margin-left: 35px;" src="<%=request.getContextPath()%>` + image + `" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#` + id + `">Quick View </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">` + nameproduct + ` </a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p><span class="item_price">$` + pricemin + `</span></p>
                            </div>
                        </div>
                    </div>`);
                                    
                                    $('.modal-data-done').append(`<div class="modal" id="` + id + `" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                                        <img width="365px" height="460px" id="largeImage" src="<%=request.getContextPath()%>` + image + `" />
                                    </div>
                                </div>
                                <div class="col-md-7 modal_body_right">
                                    <h4>` + nameproduct + `</h4>
                                    <p>` +
                            des
                            + `...<a href="servletDetailProduct?detail=`+id+`">more</a></p>
                                    <div class="rating" style="margin-top:70px;">
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
                                        <span style="" class="date-request">END ` +
                            moment(timeend).format("DD-MM-YYYY HH:mm:ss A").toString() + `</span>
                                        <p><span>Price Start</span> <i class="item_price">$` + pricemin + `</i></p>
                                        <p><span>Price Step</span> <i class="item_price">$` + stepprice + `</i></p>
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
            </div>`);

                          
                                    
                                });
                            }
                        });
                        
                        
                        
                         $('.btnmoredonedata').off('click').click(function () {
                        
                    pagenumber++;

                    $.ajax({
                        
                         url: "/servletDoneProduct",
                            type: 'GET',
                            data: {
                                pageac: "pagination",
                            pageskip: (pagenumber - 1) * 3
                            },
                        success: function (data) {
                            if (JSON.parse(JSON.stringify(data)).length < 3) {
                                $('.buttonshowmorepro').remove();
                            }

                            $.each(JSON.parse(JSON.stringify(data)), function (index, value) {
                                 var doc = JSON.stringify(value);
                                    var res = JSON.parse(doc);
                                    var id = res._id.$oid;
                                    var nameproduct = res.nameproduct;
                                    var pricemin = res.pricemin;
                                    var stepprice = res.stepprice;
                                    var quantity = res.quantity;
                                    var image = res.image;
                                    var timebegin = res.timebegin.$date;
                                    var timeend = res.timeend.$date;
                                    var description = res.description.split(" ");
                                    var des = "";
                                    for (var i = 0, max = description.length; i < max; i++) {
                                        if (i < 10) {
                                            des += description[i]+" ";
                                        }
                                    }

                                    console.log(id + "\n" + moment(timebegin)
                                            .format("DD-MM-YYYY HH:mm:ss A").toString());
                                    
                                    $('.prodonedata').append(` <div style="margin-bottom: 2em;" class="itemdo` + id + ` product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated animated" data-wow-delay=".7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                        <span class="time-request" style="color: red;">Done</span>
                        <div class="new-top">
                            <a href="single.html"><img style="width: 220px;margin-left: 35px;" src="<%=request.getContextPath()%>` + image + `" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#` + id + `">Quick View </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html">` + nameproduct + ` </a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p><span class="item_price">$` + pricemin + `</span></p>
                            </div>
                        </div>
                    </div>`);
                                    
                                    $('.modal-data-done').append(`<div class="modal" id="` + id + `" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                                        <img width="365px" height="460px" id="largeImage" src="<%=request.getContextPath()%>` + image + `" />
                                    </div>
                                </div>
                                <div class="col-md-7 modal_body_right">
                                    <h4>` + nameproduct + `</h4>
                                    <p>` +
                            des
                            + `...<a href="servletDetailProduct?detail=`+id+`">more</a></p>
                                    <div class="rating" style="margin-top:70px;">
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
                                        <span style="" class="date-request">END ` +
                            moment(timeend).format("DD-MM-YYYY HH:mm:ss A").toString() + `</span>
                                        <p><span>Price Start</span> <i class="item_price">$` + pricemin + `</i></p>
                                        <p><span>Price Step</span> <i class="item_price">$` + stepprice + `</i></p>
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
            </div>`);
                            });
                        }
                    });
                    });

                        
                        
                    });
                </script>

                <!--footer-->
                <jsp:include page="footer.jsp" />
                <!--//footer-->		
                <jsp:include page="jsfooter.jsp"/>
                </body>
                </html>