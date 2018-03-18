
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="org.bson.Document"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
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
                    <%
                        if (request.getAttribute("datadetaildoing") != null) {

                            Document document = (Document) request.getAttribute("datadetaildoing");
                            String id = new Gson().fromJson(document.getObjectId("_id").toString(),
                                    JsonElement.class).getAsString();
                            String nameproduct = document.getString("nameproduct");
                            String clientid = new Gson().fromJson(document.getObjectId("clientid").toString(),
                                    JsonElement.class).getAsString();
                            Date createddate = document.getDate("createddate");
                            Date timebegin = document.getDate("timebegin");
                            Date timeend = document.getDate("timeend");
                            Double pricemin = document.getDouble("pricemin");
                            Double stepprice = document.getDouble("stepprice");
                            Integer quantity = document.getInteger("quantity");

                            String image = document.getString("image");
                            String slide = document.getString("slide");

                            String description = document.getString("description");
                            Integer status = document.getInteger("status");

                            String[] deschar = description.split(" ");
                            String des = "";
                            for (int i = 0; i < deschar.length; i++) {
                                if (i < 30) {
                                    des += deschar[i] + " ";;
                                }
                            }
                            des += "...";


                    %>
                    <script type="text/javascript">
                        var countDownDate = <%=timeend.getTime()%>
                        var x = setInterval(function () {
                            var now = new Date();
                            var distance = countDownDate - now;
                            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                            $('.<%=id%>').text(days + "d " + hours + "h "
                                    + minutes + "m " + seconds + "s ");
                            if (distance < 0) {
                                clearInterval(x);
                                $('.<%=id%>').text("EXPIRED");
                                $('.itemdo<%=id%>').remove();

                            }
                        }, 1000);

                    </script>
                    <div style="margin-bottom: 2em;" class="itemdo<%=id%> product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated animated" data-wow-delay=".7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                        <span class="time-request <%=id%>"></span>
                        <div class="new-top">
                            <a href="single.html"><img style="width: 220px;margin-left: 35px;" src="<%=request.getContextPath()%><%=image%>" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li ><a href="#" data-toggle="modal" data-target="#myModalDoing" class="mdoingidView" data-id="<%=id%>">Quick View </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html"><%=nameproduct%> </a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p><span class="item_price">$<%=pricemin%></span></p>
                            </div>
                        </div>
                    </div>

                    <!-- Button trigger modal -->
                    <div class="modal-data-doing">

                        <div class="modal" id="myModalDoing" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                                                    <img width="365px" height="460px" id="largeImage" src="" />
                                                </div>
                                            </div>
                                            <div class="col-md-7 modal_body_right">
                                                <h4 id="modalNameProdo" ></h4>
                                                <p class="dodatades"></p>
                                                <div style="margin-top: 50px;" class="rating">
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
                                                    <span style="margin: 10xp;" id="timedoingdo" class="time-request"></span>
                                                    <span style="left:80px;" class="date-request dodatatimeend"></span>
                                                    <p><span>Price Start</span> <i class="item_price item_pricemin"></i></p>
                                                    <p><span>Price Step</span> <i class="item_price item_pricestep"></i></p>
                                                        <%
                                                            if (session.getAttribute("usernameclient") == null) {
                                                        %>
                                                    <p><a href="signin.jsp" >Sign in</a></p>
                                                    <%
                                                    } else {

                                                        String objclient = (String) session.getAttribute("objclient");
                                                        JsonObject object = new Gson().fromJson(objclient, JsonObject.class);

                                                        JsonObject jobjphone = object.get("phone").getAsJsonObject();
                                                        String phonename = jobjphone.get("name").getAsString();
                                                        int phonestatus = jobjphone.get("status").getAsInt();
                                                    %>
                                                    <input style="margin-bottom: 10px;" type="text" class="price form-control pricedovalue" placeholder="Price" aria-label="Price" aria-describedby="basic-addon2">
                                                    <p><a class="item_add" id="doingautionput" href="#" data-status="<%=phonestatus%>" >Aution now</a></p>
                                                    <div class="errorstatusphone">

                                                    </div>
                                                    <%
                                                        }
                                                    %>

                                                </div>

                                                <div style="height: 200px;
                                                     width: 100%;
                                                     margin-top: 30px;" class="col-12 contentscollbar table-homeau-content">
                                                    <table class="table table-responsive-sm table-sm table-striped">
                                                        <thead >
                                                            <tr>
                                                                <th style="font-weight: normal;" scope="col">List User Aution</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="doinglist_content_value">


                                                        </tbody>
                                                    </table>
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


                    </div>

                    <!-- Button trigger modal -->


                    <%                        }
                    %>




                    <%
                        if (request.getAttribute("datadetaildone") != null) {

                            Document document = (Document) request.getAttribute("datadetaildone");
                            String id = new Gson().fromJson(document.getObjectId("_id").toString(),
                                    JsonElement.class).getAsString();
                            String nameproduct = document.getString("nameproduct");
                            String clientid = new Gson().fromJson(document.getObjectId("clientid").toString(),
                                    JsonElement.class).getAsString();
                            Date createddate = document.getDate("createddate");
                            Date timebegin = document.getDate("timebegin");
                            Date timeend = document.getDate("timeend");
                            Double pricemin = document.getDouble("pricemin");
                            Double stepprice = document.getDouble("stepprice");
                            Integer quantity = document.getInteger("quantity");

                            String image = document.getString("image");
                            String slide = document.getString("slide");

                            String description = document.getString("description");
                            Integer status = document.getInteger("status");

                            String[] deschar = description.split(" ");
                            String des = "";
                            for (int i = 0; i < deschar.length; i++) {
                                if (i < 30) {
                                    des += deschar[i] + " ";;
                                }
                            }
                            des += "...";

                            JsonObject rootibj = new Gson().fromJson(document.toJson().toString(),
                                    JsonElement.class).getAsJsonObject();

                            JsonArray colbid = rootibj.get("colbid").getAsJsonArray();
                            JsonObject colbidroot = colbid.get(0).getAsJsonObject();
                            String nameclient = colbidroot.get("nameclient").getAsString();
                            String startprice = colbidroot.get("startprice").getAsString();


                    %>

                    <script  type="text/javascript"> 
                        $(document).ready(function(){
                             $.ajax({
                        url: '/doingProductData',
                        type: 'POST',
                        data: {
                            dolist: "doingdatalist",
                            idlist: "<%=id%>"
                        },
                        success: function (data) {
                        $.each(JSON.parse(JSON.stringify(data)), function (index, value) {
                                var res = JSON.parse(JSON.stringify(value));
                                var name = res.nameclient;
                                var id = res._id.$oid;
                                var idclient = res.idclient.$oid;
                                var price = res.startprice;
                                var timecteate = res.createddate.$date;
                                pricereplace = price;
                                if (data.length > 0) {
                                    $('.item_pricemin').text('');
                                    $('.item_pricemin').text("$" + JSON.parse(JSON.stringify(data))[0].startprice);
                                }
                                 <%

                                String objclient = (String) session.getAttribute("objclient");
                                if(objclient!=null){
                                JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
                                JsonObject jobjid = object.get("_id").getAsJsonObject();
                                String clientidd = jobjid.get("$oid").getAsString();
                                 %>
                                 if(idclient=="<%=clientidd%>"){
                                          $('#doinglist_content_value').append(`
                                                <tr style="background-color: #9999ff;">
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);              
    
                                          }else{
                                        $('#doinglist_content_value').append(`
                                                <tr>
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);   
                                    }
                            <%
                            }else{
                            %>
                              $('#doinglist_content_value').append(`
                                                <tr>
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);   

                             <%
                            }
                            %>
                                                    
                            });
                           
                        }
                    });
                            
                        });
                        
                    </script>
                    <div style="margin-bottom: 2em;" class="itemdo<%=id%> product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated animated" data-wow-delay=".7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                        <span class="time-request" style="color: red;">Done</span>
                        <div class="new-top">
                            <a href="single.html"><img style="width: 220px;margin-left: 35px;" src="<%=request.getContextPath()%><%=image%>" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#<%=id%>">Quick View </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="new-bottom">
                            <h5><a class="name" href="single.html"><%=nameproduct%> </a></h5>
                            <div class="rating">
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span class="on">☆</span>
                                <span>☆</span>
                            </div>
                            <div class="ofr">
                                <p><span class="item_price">$<%=pricemin%></span></p>
                            </div>
                        </div>
                    </div>

                    <!-- Button trigger modal -->
                    <div class="modal-data-done">

                        <div class="modal" id="<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                                                    <img width="365px" height="460px" id="largeImage" src="<%=request.getContextPath()%><%=image%>" />
                                                </div>
                                            </div>
                                            <div class="col-md-7 modal_body_right">
                                                <h4><%=nameproduct%></h4>
                                                <p><%=des%><a href="servletDetailProduct?detail=<%=id%>">more</a></p>
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
                                                    <span style="" class="date-request"><script>
                                                        $('.date-request').text('END ' + moment(<%=timeend.getTime()%>).format("DD-MM-YYYY HH:mm:ss A").toString());
                                                        </script></span>
                                                    <p><span>Price Start</span> <i class="item_price">$<%=pricemin%></i></p>
                                                    <p><span>Price Step</span> <i class="item_price">$<%=stepprice%></i></p>
                                                </div>
                                                
                                            <div class="col-12">
                                                <h2><h2>The winner is : </h2><h2 style="color:red;"><%=nameclient%> $ <%=startprice%> usd <h2></h2>
                                            </div>
                                            <div style="height: 200px;
                                                 width: 100%;
                                                 margin-top: 30px;" class="col-12 contentscollbar table-homeau-content">
                                                <table class="table table-responsive-sm table-sm table-striped">
                                                    <thead >
                                                        <tr>
                                                            <th style="font-weight: normal;" scope="col">List User Aution</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="doinglist_content_value">

                                                    </tbody>
                                                </table>
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

                    </div>

                    <!-- Button trigger modal -->

                    <%
                        }
                    %>

                </div>
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
                                                        var socket3000 = io.connect('http://localhost:3000');
                                                        socket3000.on('connect', function () {
                                                            socket3000.emit('port3000', {socketid: socket3000.id, name: 'Oke'});
                                                        });
                                                        var socket4000 = io.connect('http://localhost:4000');
                                                        socket4000.on('connect', function () {
                                                            socket4000.emit('port4000', {socketid: socket4000.id, name: 'Oke'});
                                                        });

                                                        socket3000.on("serversendputbid", function (data) {
                                                            var res = JSON.parse(data);
                                                            console.log(res);
                                                            var name = res.nameclient;
                                                            var id = res._id;
                                                            var idclient = res.idclient;
                                                            var idproduct = res.idproduct;
                                                            var price = res.startprice;
                                                            var timecreate = res.createddate.$date;
//                                    pricereplace = price;

                                                            $('.item_pricemin').text('');
                                                            $('.item_pricemin').text("$" + price);
            <%
                                String objclientsera = (String) session.getAttribute("objclient");
                                if (objclientsera != null) {
                                    JsonObject objectser = new Gson().fromJson(objclientsera, JsonObject.class);
                                    JsonObject jobjidser = objectser.get("_id").getAsJsonObject();
                                    String clientidser = jobjidser.get("$oid").getAsString();

            %>
                                                            if (idclient == "<%=clientidser%>") {
                                                                $('.dolist_user_value' + idproduct).prepend(`
                                                <tr style="background-color: #9999ff;">
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecreate)
                                                                        .format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);

                                                            } else {
                                                                $('.dolist_user_value' + idproduct).prepend(`
                                                <tr>
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecreate)
                                                                        .format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);
                                                            }

            <%
                            } else {
            %>
                                                            $('.dolist_user_value' + idproduct).prepend(`
                                                <tr>
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecreate)
                                                                    .format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);

            <%
                                 }
            %>
//                            
//                            $('.dolist_user_value' + idproduct).prepend(`
//                                                <tr>
//                                                    <td>` + name + `</td>
//                                                    <td>` + price + `</td>
//                                                    <td>` + moment(timecreate)
//                                    .format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
//                                                </tr>
//                                                `);
                                                        });

                                                        $(document).ready(function () {
                                                            var pagenumber = 1;

                                                            $('.product-model-sec').off('click').on('click', '.mdoingidView', function () {
                                                                var id = $(this).data('id');
                                                                var pricereplace = null;

                                                                $('#doingautionput').data("id", id);

                                                                $('#doinglist_content_value').html('');
                                                                $('#doinglist_content_value').removeAttr("class");
                                                                $('#doinglist_content_value').addClass("dolist_user_value" + id);
                                                                $.ajax({
                                                                    url: "/doingProductData",
                                                                    type: 'POST',
                                                                    data: {
                                                                        do: "doingdatamodal",
                                                                        id: id
                                                                    },
                                                                    success: function (data) {
                                                                        var id = data._id.$oid;
                                                                        var nameproduct = data.nameproduct;
                                                                        var pricemin = data.pricemin;
                                                                        var stepprice = data.stepprice;
                                                                        var quantity = data.quantity;
                                                                        var image = data.image;
                                                                        var timebegin = data.timebegin.$date;
                                                                        var timeend = data.timeend.$date;
                                                                        var description = data.description.split(" ");
                                                                        ;
                                                                        var des = "";
                                                                        for (var i = 0, max = description.length; i < max; i++) {
                                                                            if (i < 20) {
                                                                                des += description[i] + " ";
                                                                            }
                                                                        }

                                                                        $("#largeImage").attr("src", "<%=request.getContextPath()%>" + image);
                                                                        $('#modalNameProdo').text(nameproduct);
                                                                        if (pricereplace === null) {
                                                                            $('.item_pricemin').text("$" + pricemin);
                                                                        }
                                                                        $('.item_pricestep').text("$" + stepprice);
                                                                        $('.dodatades').html(des + `...<a href="servletDetailProduct?detail=` + id + `">more</a>`);
                                                                        $('.dodatatimeend').html(moment(timeend).format("DD-MM-YYYY HH:mm:ss A").toString());
                                                                        $('#timedoingdo').removeAttr("class");
                                                                        $('#timedoingdo').addClass("time-request " + id);

                                                                        $('#doingautionput').data("timebegin", moment(timebegin).format("DD/MM/YYYY HH:mm:ss a").toString());
                                                                        $('#doingautionput').data("timeend", moment(timeend).format("DD/MM/YYYY HH:mm:ss a").toString());
                                                                        $('#doingautionput').data("stepprice", stepprice);
                                                                    }

                                                                });
                                                                $.ajax({
                                                                    url: '/doingProductData',
                                                                    type: 'POST',
                                                                    data: {
                                                                        dolist: "doingdatalist",
                                                                        idlist: id
                                                                    },
                                                                    success: function (data) {
                                                                        $.each(JSON.parse(JSON.stringify(data)), function (index, value) {
                                                                            var res = JSON.parse(JSON.stringify(value));
                                                                            var name = res.nameclient;
                                                                            var id = res._id.$oid;
                                                                            var idclient = res.idclient.$oid;
                                                                            var price = res.startprice;
                                                                            var timecteate = res.createddate.$date;
                                                                            pricereplace = price;
                                                                            if (data.length > 0) {
                                                                                $('.item_pricemin').text('');
                                                                                $('.item_pricemin').text("$" + JSON.parse(JSON.stringify(data))[0].startprice);
                                                                            }

//                                            $('#doinglist_content_value').append(`
//                                                <tr>
//                                                    <td>` + name + `</td>
//                                                    <td>` + price + `</td>
//                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
//                                                </tr>
//                                                `);


            <%

           String objclient = (String) session.getAttribute("objclient");
           if (objclient != null) {
               JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
               JsonObject jobjid = object.get("_id").getAsJsonObject();
               String clientid = jobjid.get("$oid").getAsString();
            %>
                                                                            if (idclient == "<%=clientid%>") {
                                                                                $('#doinglist_content_value').append(`
                                                <tr style="background-color: #9999ff;">
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);

                                                                            } else {
                                                                                $('#doinglist_content_value').append(`
                                                <tr>
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);
                                                                            }
            <%
                            } else {
            %>
                                                                            $('#doinglist_content_value').append(`
                                                <tr>
                                                    <td>` + name + `</td>
                                                    <td>` + price + `</td>
                                                    <td>` + moment(timecteate).format("DD/MM/YYYY HH:mm:ss a").toString() + `</td>
                                                </tr>
                                                `);

            <%
                                 }
            %>
                                                                        });
                                                                    }
                                                                });
                                                            });

                                                            $('#doingautionput').off('click').click(function (e) {
                                                                e.preventDefault();
                                                                var datastatus = $(this).data('status');
                                                                if (datastatus === 0) {
                                                                    $('.errorstatusphone').html(`<a class="badge badge-danger" href="accountdetail.jsp">Please,Verify Phone Number</a>`);
                                                                } else {
                                                                    var pricemin = $('.item_pricemin').text().replace("$", "");
                                                                    var pricestep = $('.item_pricestep').text().replace("$", "");
                                                                    var pricedovalue = $('.pricedovalue').val();
                                                                    var priceovercome = parseInt(pricemin) + parseInt(pricestep);
                                                                    if (parseInt(pricedovalue) > priceovercome && parseInt(pricedovalue) !== "NaN") {
                                                                        $('.errorstatusphone').html('');
                                                                        var idproduct = $(this).data('id');
                                                                        var timebegin = $(this).data('timebegin');
                                                                        var timeend = $(this).data('timeend');
                                                                        var stepprice = $(this).data('stepprice');
                                                                        $.ajax({
                                                                            url: "/servletDoingProductPut",
                                                                            type: 'GET',
                                                                            data: {
                                                                                do: "doingdataaution",
                                                                                value: parseInt(pricedovalue),
                                                                                idproduct: idproduct,
                                                                                timebegin: timebegin,
                                                                                timeend: timeend,
                                                                                stepprice: stepprice
                                                                            },
                                                                            success: function (data) {
                                                                                if (data === null) {
                                                                                    return;
                                                                                }
                                                                                if (data.status === "timeout") {
                                                                                    $('.errorstatusphone').html(`<p class="badge badge-danger">Enter Value Then 2 Minutes </p>`);
                                                                                } else {

                                                                                }
                                                                            }
                                                                        });
                                                                    } else {
                                                                        $('.errorstatusphone').html(`<p class="badge badge-danger">Enter Value is Number or Price must greater than ` + priceovercome + `</p>`);
                                                                    }

                                                                }
                                                            });


                                                        });


        </script>

        <!-- end socket io-->


    </body>
</html>