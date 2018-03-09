<%-- 
    Document   : product_detail
    Created on : Feb 7, 2018, 1:25:20 PM
    Author     : smart
--%>

<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
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

        <%
            if (request.getAttribute("datadetail") != null) {
                MongoCursor<Document> cursor = (MongoCursor<Document>) request.getAttribute("datadetail");

                while (cursor.hasNext()) {
                    Document document = cursor.next();
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
                            des += deschar[i]+" ";;
                        }
                    }
                    des +="...";


        %>

        <!--single-page-->
        <div class="single">
            <div class="container">
                <div class="single-info">		
                    <div class="col-md-6 single-top wow fadeInLeft animated" data-wow-delay=".5s">	
                        <div class="flexslider">
                            <ul class="slides">
                                <%                      
                                    for (String imgimore : slide.split(",")) {

                                %>
                                <li data-thumb="<%=request.getContextPath()%><%=imgimore%>">
                                    <div class="thumb-image"> <img src="<%=request.getContextPath()%><%=imgimore%>" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>
                                <%
                                    }
                                %>

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 single-top-left simpleCart_shelfItem wow fadeInRight animated" data-wow-delay=".5s">
                        <h3><%=nameproduct%></h3>
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
                        <h6 class="item_price">$<%=pricemin%></h6>			
                        <p>
                            <%=des%>
                        </p>

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
                                    
                                    <%=description%>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--//collapse -->
            </div>
        </div>

        <%                }
            }
        %>
        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>