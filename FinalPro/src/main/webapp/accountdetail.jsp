<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="asset/client/css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="head.jsp"/>




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
                    <li class="active">Account Detail</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->
        <!--Short codes-->
        <div class="codes">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                    <h3 class="title">Account<span> Detail</span></h3>
                    <p><a href="changepass.jsp">Change your password</a></p>
                </div>

                <form>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                           <div class="row">
                                 <label  class="col-md-12">First Name </label>
                              
                                    
                                <p  class="col-md-10 text-left" id="">dfgdssdfsdfsdfdsf</p>
                              
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="row">
                                 <label  class="col-md-12">Last Name </label>
                              
                                    
                                <p  class="col-md-10 text-left" id="">dfgdssdfsdfsdfdsf</p>
                              
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <div class="row">
                                <label for="inputEmail4" class="col-md-12">Email</label>
                                <p type="email" class="col-md-10 text-left" id="inputEmail">dfgdssdfsdfsdfdsf</p>
                                <p type="email" class="col-md-2 text-right" id="inputEmail">&#9989; &#10060;</p>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="row">
                                <label  class="col-md-12">Address</label>
                              
                                    
                                <p  class="col-md-10 text-left" id="">dfgdssdfsdfsdfdsf</p>
                              
                            </div>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <div class="row">
                                <label  class="col-md-12">Phone number  &nbsp; <a href = ""><i class="far fa-check-circle"></i></a></label>
                                <p type="email" class="col-md-10 text-left" id="inputEmail">dfgdssdfsdfsdfdsf</p>
                                <p type="email" class="col-md-2 text-right" id="input">&#9989; &#10060;</p>
                            </div>

                        </div>
                        <div class="form-group col-md-6">
                             <div class="row">
                                 <label  class="col-md-12">Account Balance &nbsp;  <a href = ""><i class="fas fa-plus-square"></i></a> </label>
                              
                                    
                                <p  class="col-md-10 text-left" id="">dfgdssdfsdfsdfdsf</p>
                              
                            </div>

                        </div>

                    </div>
            




                </form>
            </div>
        </div>
        <!--//short-codes-->	

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>

        <script src="asset/client/js/fontawesome-all.min.js" type="text/javascript"></script>
    </body>
</html>