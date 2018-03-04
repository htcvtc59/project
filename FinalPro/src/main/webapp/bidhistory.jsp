<%-- 
    Document   : bidhistory
    Created on : Feb 28, 2018, 8:57:02 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <h3 class="title">Bid<span> History</span></h3>
                    <p><a href="accountdetail.jsp">Back Account Profile</a></p>

                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                             <table id="tblBid" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID_Record</th>
                                        <th>ID Auction</th>
                                        <th>Date time</th>
                                        <th>Bid Price</th>
                                        <th>View</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tiger</td>
                                        <td>Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td></td>

                                    </tr>
                                    <tr>
                                        <td>Garrett</td>
                                        <td>Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td></td>

                                    </tr>
                                    <tr>
                                        <td>Ashton</td>
                                        <td>Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>San Francisco</td>
                                        <td></td>
                                        <
                                    </tr>
                                    <tr>
                                        <td>Cedric</td>
                                        <td>Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td></td>

                                    </tr>

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
            $('#tblBid').DataTable();
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
