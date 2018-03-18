
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
                <div class="col-md-12 product-model-sec prodonedata">
                    
                </div>
            </div>
        </div>
        
        <div class="buttonshowmorepro">
            <button type="button" class="btn btn-primary btn-block btnmoredonedata">More</button>
        </div>
            
            <!-- Button trigger modal -->
        <div class="modal-data-done">
         
            <div class="modal" id="myModalDone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                                    <h4 id="modalNameProdo"></h4>
                                    <p class="dodatades"></p>
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
                                        <span style="" class="date-request dodatatimeend"></span>
                                        <p><span>Price Start</span> <i class="item_price item_pricemin"></i></p>
                                        <p><span>Price Step</span> <i class="item_price item_pricestep"></i></p>
                                        
                                    </div>
                                    <div class="col-12">
                                        <h2 class="nameclientwin"></h2>
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
//                                console.log(JSON.parse(JSON.stringify(data)));
                                
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
                                    var colbid = res.colbid;

                                    var nameclientwin;
                                    
                                    
                                    
                                     if(colbid.length>0){
                                         nameclientwin =`<h2>The winner is : </h2><h2 style="color:red;">`+JSON.parse(JSON.stringify(colbid))[0].nameclient+` $`+JSON.parse(JSON.stringify(colbid))[0].startprice+` usd <h2>`;
                                   console.log(JSON.parse(JSON.stringify(colbid))[0].startprice);
                                      }else{
                                        nameclientwin="";
                                    }

                                    console.log(id + "\n" + moment(timebegin)
                                            .format("DD-MM-YYYY HH:mm:ss A").toString());
                                    
                                    $('.prodonedata').append(` <div style="margin-bottom: 2em;" class="itemdo` + id + ` product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated animated" data-wow-delay=".7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                        <span class="time-request" style="color: red;">Done</span>
                        <div class="new-top">
                            <a href="single.html"><img style="width: 220px;margin-left: 35px;" src="<%=request.getContextPath()%>` + image + `" class="img-responsive" alt=""/></a>
                            <div class="new-text">
                                <ul>
                                    <li><a href="#" data-toggle="modal" class="mdoneidView" data-target="#myModalDone" data-id="` + id + `">Quick View </a></li>
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
                                    
                                    
                            });
                            }
                        });
                        
                        
                         $('.product-model-sec').off('click').on('click', '.mdoneidView', function () {
                        var id = $(this).data('id');
                        
                        var pricereplace = null;

                    $('#doingautionput').data("id", id);

                    $('#doinglist_content_value').html('');
                    $('#doinglist_content_value').removeAttr("class");
                    $('#doinglist_content_value').addClass("dolist_user_value" + id);
                    
                        $.ajax({
                            url: "/servletDoneProduct",
                            type: 'POST',
                            data: {
                                donedata: "donedataclickmodal",
                                id:id
                            },
                            success: function (data) {
//                                console.log(JSON.parse(JSON.stringify(data)));
                                
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
                                    var colbid = res.colbid;

                                    var nameclientwin;
                                     if(colbid.length>0){
                                          nameclientwin =`<h2>The winner is : </h2><h2 style="color:red;">`+JSON.parse(JSON.stringify(colbid))[0].nameclient+` $`+JSON.parse(JSON.stringify(colbid))[0].startprice+` usd <h2>`;
                                    }else{
                                        nameclientwin="";
                                    }
//                                    console.log(value);


                                $('.nameclientwin').html(nameclientwin);
                                  $("#largeImage").attr("src", "<%=request.getContextPath()%>" + image);
                            $('#modalNameProdo').text(nameproduct);
                            if (pricereplace === null) {
                                $('.item_pricemin').text("$" + pricemin);
                            }
                            $('.item_pricestep').text("$" + stepprice);
                            $('.dodatades').html(des + `...<a href="servletDetailProduct?detail=` + id + `">more</a>`);
                            $('.dodatatimeend').html(`END `+moment(timeend).format("DD-MM-YYYY HH:mm:ss A").toString());
                            $('#timedoingdo').removeAttr("class");
                            $('#timedoingdo').addClass("time-request " + id);

                            $('#doingautionput').data("timebegin", moment(timebegin).format("DD/MM/YYYY HH:mm:ss a").toString());
                            $('#doingautionput').data("timeend", moment(timeend).format("DD/MM/YYYY HH:mm:ss a").toString());
                            $('#doingautionput').data("stepprice", stepprice);
                                   
                            });
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
                                 <%

                                String objclient = (String) session.getAttribute("objclient");
                                if(objclient!=null){
                                JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
                                JsonObject jobjid = object.get("_id").getAsJsonObject();
                                String clientid = jobjid.get("$oid").getAsString();
                                 %>
                                 if(idclient=="<%=clientid%>"){
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
                                    <li><a href="#" data-toggle="modal" class="mdoneidView" data-target="#myModalDone" data-id="` + id + `">Quick View </a></li>
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