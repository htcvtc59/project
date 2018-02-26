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



                </div>
            </div>
            <!--//products-->
            <!--footer-->
            <jsp:include page="footer.jsp" />
            <!--//footer-->		
            <jsp:include page="jsfooter.jsp"/>


            <!--socket io-->
            <script src="<%=request.getContextPath()%>/asset/public/socket.io.js" type="text/javascript"></script>

            <script type="text/javascript" >
//                var socket3000 = io.connect('http://localhost:3000');
//                socket3000.on('connect', function () {
//                    socket3000.emit('port3000', {socketid: socket3000.id, name: 'Oke'});
//
//                });
//                var socket4000 = io.connect('http://localhost:4000');
//                socket4000.on('connect', function () {
//                    socket4000.emit('port4000', {socketid: socket4000.id, name: 'Oke'});
//                });


                $(function () {


                });

                $(document).ready(function () {
                    $.ajax({
                        url: "/penProductData",
                        type: 'GET',
                        data: {
                            pen: "pendingdata"
                        },
                        success: function (data) {
                            $.each(JSON.parse(JSON.stringify(data)), function (index, value) {
                                var doc = JSON.stringify(value);
                                console.log(doc);
                                var res = JSON.parse(doc);
                                var id = res._id.$oid;
                                var nameproduct = res.nameproduct;
                                var pricemin = res.pricemin;
                                var stepprice = res.stepprice;
                                var quantity = res.quantity;
                                var image = res.image;
                                var timebegin = res.timebegin.$date;
                                console.log(id + nameproduct + pricemin + stepprice + quantity + image + "\n" + moment(timebegin)
                                        .format("YYYY-MM-DD HH:mm:ss a").toString());

                                $('.product-model-sec').append(` <div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
                        <span class="time-request ` + id + `"></span>
                        <div class="new-top">
                            <a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g1.jpg" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="single.html">Quick View </a></li>
                                    <li><input type="number" class="item_quantity" min="1" value="1"></li>
                                    <li><a class="item_add" href=""> Add to cart</a></li>
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
                    </div>`);
                                var countDownDate = new Date(timebegin).getTime();

                                var x = setInterval(function () {

                                    var now = new Date().getTime();

                                    var distance = countDownDate - now;

                                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                    $('.' + id).text(days + "d " + hours + "h "
                                            + minutes + "m " + seconds + "s ");

                                    if (distance < 0) {
                                        clearInterval(x);
                                        $('.' + id).text("EXPIRED");
                                    }
                                }, 1000);





                            });


                        }
                    });


                });
            </script>

            <!-- end socket io-->

    </body>
</html>
