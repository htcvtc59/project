
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                    if(session.getAttribute("usernameclient")==null){
                        response.sendRedirect("index.jsp");
                    }

%>

<!DOCTYPE html>
<html>
    <head>
        <!-- Font Awesome -->
        <link href="<%=request.getContextPath()%>/asset/vendors/font-awesome/font-awesome.min.css" rel="stylesheet">
        <jsp:include page="head.jsp"/>


        <script type="text/javascript" src="<%=request.getContextPath()%>/ckplugin/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckplugin/ckfinder/ckfinder.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {

                $('#urlimage').val('');
                $('#clickfileImg').on('click', function () {
                    var finder = new CKFinder();
                    finder.basePath = '/FinalPro/Upload/';
                    finder.selectActionFunction = function (url) {
                        $('#urlimage').val(url);
                        $('#showimgbtn').html("<img height='80' width='80' src='" + url + "' alt='...' />");
                    };
                    finder.popup();
                });
                var j = 0;
                var arrImgUrlmore = [];
                $('#Inimgurlsmore').val('');
                var arrImgIndex = [];
                $('#clickfileImgmore').on('click', function () {
                    if (arrImgUrlmore.length === 3) {
                        return;
                    }
                    j++;
                    var finder = new CKFinder();
                    finder.basePath = '/FinalPro/Upload/';
                    finder.selectActionFunction = function (url) {
                        arrImgUrlmore.push(url);
                        arrImgIndex.push(j);
                        $('#Inimgurlsmore').val(arrImgUrlmore);
                        $('#showimgbtnmore').append("<img height='80' id='Imgsmore" + j + "' width='80' src='" + url + "' alt='...' /><button class='fa fa-remove btn btn-sm btn-danger btndeleteimgsmore' data-id='" + j + "' ></button>");
                    };
                    finder.popup();
                });
                $('#showimgbtnmore').off('click').on('click', '.btndeleteimgsmore', function () {
                    var idimg = $(this).data("id");
                    $('#Imgsmore' + idimg).remove();
                    $(this).remove();
                    arrImgUrlmore.splice($.inArray(idimg, arrImgIndex), 1);
                    arrImgIndex.splice($.inArray(idimg, arrImgIndex), 1);
                    $('#Inimgurlsmore').val(arrImgUrlmore);
                });

            });
        </script>

        <!--alert message-->
        <style type="text/css">
            .alert_message{
                position: fixed;
                top:40px;
                right: 20px;
                z-index: 10000;
                display: none;
            }
        </style>

        <!--end alert message-->
    </head>
    <body>
        <!--alert message-->
        <div class="alert_message">
            <div class="alert alert-success" role="alert" data-dismiss="alert">
                <h4 class="alert-heading">Create !</h4>
                <p>Success</p>
            </div>
        </div>
        <!--end alert message-->


        <!--header-->
        <jsp:include page="headermenu.jsp"/>
        <!--//header-->

        <!--breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
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
                        <div class="form-group col-md-3">
                            <label for="inputProductName">Product Name</label>
                            <input type="text" class="form-control" id="inputProductName" name="proname" placeholder="Product Name">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputStep">Step</label>
                            <input type="text" class="form-control" id="inputStep" name="prostep" placeholder="Step">
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <label for="inputPrice">Price Start</label>
                        <input type="text" class="form-control" id="inputPrice" name="proprice" placeholder="Price Start">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputQuatity">Quatity</label>
                        <input type="text" class="form-control" id="inputQuatity" name="proquantity" placeholder="Product Quatity">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="clickfileImg">Import Image</label>
                            <input type="button" class="form-control btn col-md-2" id="clickfileImg" value="Choose File" >
                            <input type="text" disabled="true" name="proimgurl" id="urlimage" class="form-control col-md-3" />
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputDateTimeStart">Datetime Start</label>
                            <div class='input-group date datetimepicker1'>
                                <input type='text' class="form-control" name="protimestart" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="inputDateTimeStart">Datetime End</label>
                            <div class='input-group date datetimepicker1'>
                                <input type='text' class="form-control" name="protimeend" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>

                        </div>

                        <div class="form-group col-md-12" id="showimgbtn">

                        </div>

                        <div class="form-group col-md-6">
                            <label for="clickfileImgmore">More Images</label>
                            <input type="button" class="form-control btn col-md-2" id="clickfileImgmore" value="Choose File" >
                            <input type="text" disabled="true" name="proimgmoreurl" id="Inimgurlsmore" class="form-control col-md-6" />
                        </div>
                        <div class="form-group col-md-12" id="showimgbtnmore">

                        </div>
                    </div>


                    <div class="form-group col-md-12">
                        <label for="ckeditordes">Detail</label>
                        <textarea class="form-control" name="prodetail" id="ckeditordes" rows="3"></textarea>

                    </div>



                    <!--                    <div class='col-sm-4'>
                                            <div class="form-group">
                                                <label for="inputTime">Time</label>
                                                <div class='input-group date datetimepicker3'>
                                                    <input data-format="hh:mm:ss" type='text' class="form-control" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>-->

                    <div class='col-sm-12'><button type="submit" class="btn btn-primary createpro">Create</button></div>  
                </form>
            </div>
        </div>
        <!--//short-codes-->	

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>

        <script type="text/javascript" >
            $(document).ready(function () {

                var editor = CKEDITOR.replace('ckeditordes');
                CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckplugin/ckfinder');

//                create product

                $('.createpro').click(function (e) {
                    e.preventDefault();
                    var proname = jQuery('input[name="proname"]').val();
                    var prostep = jQuery('input[name="prostep"]').val();
                    var proprice = jQuery('input[name="proprice"]').val();
                    var proquantity = jQuery('input[name="proquantity"]').val();
                    var proimgurl = jQuery('input[name="proimgurl"]').val();
                    var protimestart = jQuery('input[name="protimestart"]').val();
                    var protimeend = jQuery('input[name="protimeend"]').val();
                    var proimgmoreurl = jQuery('input[name="proimgmoreurl"]').val();
                    var prodetail = editor.getData();

                    $.ajax({
                        url: "/createproduct?col=add",
                        type: 'POST',
                        data: {
                            proname: proname,
                            prostep: prostep,
                            proprice: proprice,
                            proquantity: proquantity,
                            proimgurl: proimgurl,
                            protimestart: protimestart,
                            protimeend: protimeend,
                            proimgmoreurl: proimgmoreurl,
                            prodetail: prodetail
                        },
                        success: function (data) {
                            if (data.success === "success") {
                                var audio = $("#sound_success")[0];
                                audio.play();

                                $('.alert_message').show();
                                $('.alert_message').fadeOut(4000);
                                
//                                function loadweb(){
//                                     window.location = "http://localhost:8084/createproduct.jsp";
//                                }
//                                window.setTimeout(loadweb(),3000);


                            }

                        }

                    });
                });

            });

        </script>
        <!-- load all sounds -->
        <div style="display: none;">
            <audio id="sound_success">
                <source src="<%=request.getContextPath()%>/asset/sounds/success.mp3" ></source>
            </audio>
            <audio id="sound_error">
                 <source src="<%=request.getContextPath()%>/asset/sounds/error.mp3" ></source>
            </audio>
        </div>
    </body>
</html>