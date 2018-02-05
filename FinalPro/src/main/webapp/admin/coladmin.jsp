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
                            <!-- Small modal -->

                            <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                    aria-hidden="true">×</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel2"></h4>
                                        </div>
                                        <div class="modal-body">

                                            <form data-parsley-validate class="form-horizontal form-label-left">

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user-name">
                                                        Username<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-9 col-xs-12">
                                                        <input type="text" id="user-name" required="required" name="username"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">
                                                        Password<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-9 col-xs-12">
                                                        <input type="password" id="password" required="required" name="password"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary btnsavedata">Save changes</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /modals -->
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
                                                    <th>Id</th>
                                                    <th>Username</th>
                                                    <th>Password</th>
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
                                                                String username = document.getString("username");
                                                                String password = document.getString("password");

                                                                String encrypt = new EncryptionDecryption().encrypt(password);


                                                %>
                                                <tr class="row_<%=id%>">
                                                    <td>
                                                        <button data-id="<%=id%>" type="button" class="fa fa-edit btn btn-round btn-primary btnedit"
                                                                data-toggle="modal" data-target=".bs-example-modal-sm"></button>

                                                        <button type="button" data-id="<%=id%>"
                                                                class="fa fa-bitbucket-square btn btn-round btn-danger btndelete"></button>
                                                    </td>
                                                    <td><%=id%></td>
                                                    <td class="col1<%=id%>" ><%=username%></td>
                                                    <td class="col2<%=id%>"><%=encrypt%></td>

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

                var valc = 0;
                var id;

                $('.btnadd').click(function () {
                    valc = 1;


                });

                $('.btnedit').click(function () {
                    valc = 2;
                    id = $(this).data('id');
                    jQuery('input[name="username"]').val($('.col1' + id).text());
                    jQuery('input[name="password"]').val($('.col2' + id).text());

                });

                $('.btnsavedata').click(function () {
                    var username = jQuery('input[name="username"]').val();
                    var password = jQuery('input[name="password"]').val();

                    switch (valc) {
                        case 1:
                            $.ajax({
                                url: "/admin/coladmin?col=add",
                                type: 'POST',
                                data: {
                                    username: username,
                                    password: password
                                },
                                success: function (data) {
                                    var id = data._id.$oid;
                                    var username = data.username;
                                    var password = CryptoJS.MD5(data.password);

                                    $('.contentdata').append(`<tr class="row_` + id + `">
                                                    <td>
                                                        <button data-id="` + id + `" type="button" class="fa fa-edit btn btn-round btn-primary btnedit"
                                                                data-toggle="modal" data-target=".bs-example-modal-sm"></button>

                                                        <button type="button" data-id="` + id + `"
                                                                class="fa fa-bitbucket-square btn btn-round btn-danger btndelete"></button>
                                                    </td>
                                                    <td>` + id + `</td>
                                                    <td class="col1` + id + `" >` + username + `</td>
                                                    <td class="col2` + id + `">` + password + `</td>

                                                </tr>`)

                                }

                            });


                            break;
                        case 2:
                            $('.col1' + id).text(username);
                            $('.col2' + id).text(CryptoJS.MD5(password));


                            $.ajax({
                                url: "/admin/coladmin?col=update",
                                type: 'POST',
                                data: {
                                    username: username,
                                    password: password,
                                    id: id
                                },
                                success: function () {

                                }

                            });

                            break;
                    }

                });
                $('.btndelete').click(function () {
                    var id = $(this).data('id');
                    $('.row_' + id).remove();

                    $.get("/admin/coladmin?col=delete", {id: id}, function (data) {

                    });
                });


            });


        </script>
    </body>
</html>
