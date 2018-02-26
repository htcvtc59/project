<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="endecode.EncryptionDecryption" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Dashboard | </title>

        <jsp:include page="cssheader.jsp"/>


    </head>

    <body class="nav-md">

        <div class="container body">
            <div class="main_container">

                <jsp:include page="menu.jsp"/>

                <!-- top navigation -->
                <jsp:include page="head.jsp"/>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">

                        </div>

                        <div class="clearfix"></div>
                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">

                                        <button type="button" class="fa fa-plus-square btn btn-round btn-primary btnadd"
                                                data-toggle="modal" data-target=".bs-example-modal-sm"></button>

                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>status</th>
                                                    <th>id</th>
                                                    <th>name</th>                                                
                                                    <th>username</th>
                                                    <th>phone</th>
                                                    <th>email</th>
                                                    <th>address</th>
                                                </tr>
                                            </thead>


                                            <tbody class="contentdata">
                                                <%
                                                    if (request.getAttribute("datacol") != null) {
                                                        MongoCursor<Document> cursor = (MongoCursor<Document>) request.getAttribute("datacol");

                                                        try {
                                                            while (cursor.hasNext()) {
                                                                Document document = cursor.next();

                                                                String id = new Gson().fromJson(document.getObjectId("_id").toString(),
                                                                        JsonElement.class).getAsString();
                                                                Integer status = document.getInteger("status");
                                                                String name = document.getString("name");
                                                                String username = document.getString("username");
                                                                String address = document.getString("address");

                                                                Document dphone = (Document) document.get("phone");
                                                                Document demail = (Document) document.get("email");
                                                                String phone = dphone.getString("name");
                                                                String email = demail.getString("name");

                                                %>
                                                <tr class="row_<%=id%>">
                                                    <td>
                                                        <button type="button" data-id="<%=id%>"
                                                                class="fa fa-bitbucket-square btn btn-round btn-danger btndelete"></button>
                                                    </td>
                                                    <td> 
                                                        <button data-id="<%=id%>" type="button" data-val="<%=status%>"
                                                                class="fa fa-edit btn btn-round btn-success btnstatus <%=id%>">
                                                            <% if (status == 1) {%>Show<%} else {%>Hide<%}%></button>
                                                    </td>
                                                    <td><%=id%></td>
                                                    <td class="col1<%=id%>"><%=name%></td>
                                                    <td class="col2<%=id%>"><%=username%></td>
                                                    <td class="col3<%=id%>"><%=phone%></td>
                                                    <td class="col4<%=id%>"><%=email%></td>
                                                    <td class="col5<%=id%>"><%=address%></td>
                                                </tr>
                                                <%
                                                            }
                                                        } finally {
                                                            cursor.close();
                                                        }
                                                    }

                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


                <!-- /page content -->

                <!-- footer content -->
                <jsp:include page="footer.jsp"/>
                <!-- /footer content -->
            </div>
        </div>

        <jsp:include page="jsfooter.jsp"/>

        <script src="https://cdn.jsdelivr.net/webjars/org.webjars/cryptojs/3.1.2/components/md5-min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/webjars/org.webjars/cryptojs/3.1.2/rollups/md5.js" type="text/javascript"></script>


        <script type="text/javascript">
            $(document).ready(function () {

                $('.btnstatus').click(function () {
                    var id = $(this).data('id');
                    var val = $(this).data('val');
                    if (val === 1) {
                        $('.' + id).text(" Hide");
                        $(this).data('val', 0);
                        $.post("/admin/colclient?col=status", {id: id, status: 0}, function (data) {
                        });
                    } else {
                        $('.' + id).text(" Show");
                        $(this).data('val', 1);
                        $.post("/admin/colclient?col=status", {id: id, status: 1}, function (data) {
                        });
                    }

                });

                $('.btndelete').click(function () {
                    var id = $(this).data('id');
                    $('.row_' + id).remove();

                    $.get("/admin/colclient?col=delete", {id: id}, function (data) {

                    });
                });


            });


        </script>
    </body>
</html>
