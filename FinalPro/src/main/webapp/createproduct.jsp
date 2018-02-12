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


        <script type="text/javascript" src="<%=request.getContextPath()%>/ckplugin/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckplugin/ckfinder/ckfinder.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#clickfileImg').on('click', function () {
                    var finder = new CKFinder();
                    finder.basePath = '/Upload/';
                    finder.selectActionFunction = function (url) {
                        $('#urlimage').val(url);
                        $('#showimgbtn').html("<img height='80' width='80' src='" + url + "' alt='...' />");
                    };
                    finder.popup();
                });
            });
        </script>

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
                    <li class="active">Create Product</li>
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
                            <label for="inputProductName">Product Name</label>
                            <input type="text" class="form-control" id="inputProductName" placeholder="Product Name">
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputPrice">Price Start</label>
                        <input type="text" class="form-control" id="inputPrice" placeholder="Price Start">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputQuatity">Quatity</label>
                        <input type="text" class="form-control" id="inputQuatity" placeholder="Product Quatity">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="clickfileImg">Import Image</label>
                        <input type="button" class="form-control btn col-md-2" id="clickfileImg" value="Choose File" >
                        <input type="text" disabled="true" name="txtProImgUrl" id="urlimage" class="form-control col-md-3" />
                    </div>
                    <div class="form-group col-md-12" id="showimgbtn">

                    </div>
                    <div class="form-group col-md-12">
                        <label for="ckeditordes">Detail</label>
                        <textarea class="form-control" name="txtProDetail" id="ckeditordes" rows="3"></textarea>

                    </div>


                    <div class='col-sm-4'>
                        <div class="form-group">
                            <label for="inputDateTimeStart">Datetime Start</label>
                            <div class='input-group date datetimepicker1'>
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
                            <div class='input-group date datetimepicker1'>
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
                            <div class='input-group date datetimepicker3'>
                                <input data-format="hh:mm:ss" type='text' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class='col-sm-12'><button type="submit" class="btn btn-primary">Create</button></div>  
                </form>
            </div>
        </div>
        <!--//short-codes-->	

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>

        <script type="text/javascript" >
            var editor = CKEDITOR.replace('ckeditordes');
            CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckplugin/ckfinder');
        </script>
    </body>
</html>