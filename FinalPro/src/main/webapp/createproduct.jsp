<%-- 
    Document   : createproduct
    Created on : Feb 5, 2018, 10:02:59 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <jsp:include page="head.jsp"/>

        <!-- datetime -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.js"></script>
        <script src="<%=request.getContextPath()%>/asset/client/js/bootstrap-datetimepicker.js"></script>
        <script src="<%=request.getContextPath()%>/asset/client/js/moment-with-locales.js"></script>
        <!-- datetime -->

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
                    <li class="active">Short Codes</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->
        <!--Short codes-->
        <div class="codes">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                    <h3 class="title">Create<span> Product</span></h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
                </div>

                <form>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">First Name</label>
                            <input type="text" class="form-control" id="inputFirstname" placeholder="Firstname">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputLastname">Last Name</label>
                            <input type="text" class="form-control" id="inputLastname" placeholder="Lastname">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputProductName">Product Name</label>
                            <input type="text" class="form-control" id="inputProductName" placeholder="Product Name">
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" id="inputAddress" placeholder="Please Address">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputPrice">Price Start</label>
                        <input type="text" class="form-control" id="inputPrice" placeholder="Price Start">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputQuatity">Quatity</label>
                        <input type="text" class="form-control" id="inputQuatity" placeholder="Product Quatity">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">City</label>
                            <input type="text" class="form-control" id="inputCity">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="inputPhone">Phone Number</label>
                            <input type="text" class="form-control" id="inputPhone">
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="exampleFormControlFile1">Import Image</label>
                        <input type="file" class="form-control-file" id="exampleFormControlFile1">
                    </div>

                    <div class='col-sm-4'>
                        <div class="form-group">
                            <label for="inputDateTimeStart">Datetime Start</label>
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class='col-sm-4'>
                        <div class="form-group">
                            <label for="inputDateTimeStart">Datetime End</label>
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class='col-sm-4'>
                        <div class="form-group">
                            <label for="inputTime">Time</label>
                            <div class='input-group date' id='datetimepicker3'>
                                <input data-format="hh:mm:ss" type='text' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class='col-sm-12'><button type="submit" class="btn btn-primary">Sign in</button></div>  
                </form>
            </div>
        </div>
        <!--//short-codes-->	

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>