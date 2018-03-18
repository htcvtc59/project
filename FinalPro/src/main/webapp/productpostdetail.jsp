<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="org.bson.Document"%>
<%@page import="org.bson.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usernameclient") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String objclient = (String) session.getAttribute("objclient");
        JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
        String jobjname = object.get("name").getAsString();
        String jobjusername = object.get("username").getAsString();
        String jobjaddress = object.get("address").getAsString();

        JsonObject jobjphone = object.get("phone").getAsJsonObject();
        String phonename = jobjphone.get("name").getAsString();
        int phonestatus = jobjphone.get("status").getAsInt();

        JsonObject jobjemail = object.get("email").getAsJsonObject();
        String emailname = jobjemail.get("name").getAsString();
        int emailstatus = jobjemail.get("status").getAsInt();

        JsonObject jobjoption = object.get("option").getAsJsonObject();
        double jobjmoney = jobjoption.get("money").getAsDouble();

        JsonObject jobjid = object.get("_id").getAsJsonObject();
        String clientid = jobjid.get("$oid").getAsString();


%>


<!DOCTYPE html>
<html>
    <head>

        <jsp:include page="head.jsp"/>
        <link href="<%=request.getContextPath()%>/asset/vendors/datatables.net-bs/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons-bs/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/asset/vendors/datatables.net-responsive-bs/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/asset/vendors/datatables.net-scroller-bs/scroller.bootstrap.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--header-->
        <jsp:include page="headermenu.jsp"/>
        <!--//header-->

        <!--breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Bid History</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->
        <!--Short codes-->
        <div class="codes">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                    <h3 class="title">Bid<span> Post</span></h3>

                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <table id="tblBidPost" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>nameproduct</th>
                                        <th>createddate</th>
                                        <th>timebegin</th>
                                        <th>timeend</th>
                                        <th>pricemin</th>
                                        <th>stepprice</th>
                                        <th>quantity</th>
                                        <th>image</th>
                                        <th>description</th>
                                    </tr>
                                </thead>
                                <tbody class="tblpost">



                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>

        </div>

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>


    </body>
    <script lang="javascript">
        $(document).ready(function () {
            $('#table_domains').dataTable().fnClearTable();

            $.ajax({
                url: "/servletProductPostDetail",
                type: 'GET',
                data: {
                    post: "postdetail"
                },
                success: function (data) {
                    console.log(data);

                    $.each(JSON.parse(JSON.stringify(data)), function (index, value) {
                        var doc = JSON.stringify(value);
                        var res = JSON.parse(doc);
                        var id = res._id.$oid;
                        var nameproduct = res.nameproduct;
                        var createddate = res.createddate;
                        var timebegin = res.timebegin;
                        var timeend = res.timeend;
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
                                des += description[i] + " ";
                            }
                        }

                        var winner = res.winner;
                        console.log(winner.idwinbid);
                        var btnpost;
                        if (winner.idwinbid == null) {
//                            btnpost = `<td data-id="` + id + `" class="btn btn-success report">Repost</td>`;
                               btnpost = `<td >
                               <form method="POST" action="servletProductPostDetail">
                          <input type="hidden" name="repost" value="repost">
                            <input type="hidden" name="id" value="`+id+`">
                            <input class="btn btn-success" type="submit" value="Repost">
                                 </form>
                                      </td>`;
                        } else {
                            btnpost = "<td></td>";
                        }

                        $('.tblpost').append(`<tr>
                                        ` + btnpost + `
                                        <td>` + nameproduct + `</td>
                                        <td>` + moment(createddate)
                                .format("DD-MM-YYYY HH:mm:ss A").toString() + `</td>
                                        <td>` + moment(timebegin)
                                .format("DD-MM-YYYY HH:mm:ss A").toString() + `</td>
                                        <td>` + moment(timeend)
                                .format("DD-MM-YYYY HH:mm:ss A").toString() + `</td>
                                    <td>` + pricemin + `</td>
                                    <td>` + stepprice + `</td>
                                    <td>` + quantity + `</td>
                                    <td><img src="` + image + `" width="100" height="100"></td>
                                  <td>` + description + `</td>
                                    </tr>`);
                    });
                }

            });


//            $('.tblpost').off('click').on('click', '.report', function () {
//                var id = $(this).data('id');
//                $.ajax({
//                    url: "/servletProductPostDetail",
//                    type: 'POST',
//                    data: {
//                        repost: "repost",
//                        id:id
//                    },
//                    success: function (data) {
//                     
//                    }
//                });
//            });





        });


    </script>

    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-bs/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons-bs/buttons.bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/buttons.flash.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/buttons.html5.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/buttons.print.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-responsive/dataTables.responsive.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-responsive-bs/responsive.bootstrap.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-scroller/dataTables.scroller.min.js" type="text/javascript"></script>

    <script src="<%=request.getContextPath()%>/asset/vendors/jszip/jszip.min.js" type="text/javascript"></script>
</html>

<%}%>