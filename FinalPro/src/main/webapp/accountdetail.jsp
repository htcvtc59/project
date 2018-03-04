<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
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
        <link href="<%=request.getContextPath()%>/asset/client/css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
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

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <div class="row">
                            <label  class="col-md-12">Name </label>


                            <p  class="col-md-10 text-left" id=""><%=jobjname%></p>

                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <div class="row">
                            <label  class="col-md-12">UserName </label>


                            <p  class="col-md-10 text-left" id=""><%=jobjusername%></p>

                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <div class="row">
                            <label for="inputEmail4" class="col-md-12">Email</label>
                            <p type="email" class="col-md-10 text-left" id="inputEmail"><%=emailname%></p>
                            <p type="email" class="col-md-2 text-right" id="inputEmail"><% if (emailstatus == 1) {%>
                                &#9989;  <%} else { %> &#10060; <%  }%> </p>
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <div class="row">
                            <label  class="col-md-12">Address</label>


                            <p  class="col-md-10 text-left" id=""><%=jobjaddress%></p>

                        </div>
                    </div>

                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <div class="row">
                            <label  class="col-md-12">Phone number  &nbsp; 
                                <script>
                                    window.fbAsyncInit = function () {
                                        FB.init({
                                            appId: '155995278391113',
                                            xfbml: true,
                                            version: 'v2.12'
                                        });
                                        FB.AppEvents.logPageView();
                                    };

                                    (function (d, s, id) {
                                        var js, fjs = d.getElementsByTagName(s)[0];
                                        if (d.getElementById(id)) {
                                            return;
                                        }
                                        js = d.createElement(s);
                                        js.id = id;
                                        js.src = "https://connect.facebook.net/en_US/sdk.js";
                                        fjs.parentNode.insertBefore(js, fjs);
                                    }(document, 'script', 'facebook-jssdk'));
                                </script>
                                <%if (phonestatus != 1) {%>
                                <form method="get" action="https://www.accountkit.com/v1.0/basic/dialog/sms_login/">
                                    <input type="hidden" name="app_id" value="155995278391113">
                                    <input type="hidden" name="redirect" value="http://localhost:8084/accountkit">
                                    <input type="hidden" name="state" value="452266c718a9e6219c861efea01f5fe6">
                                    <input type="hidden" name="country_code" value="84">
                                    <input type="hidden" name="locale" value="VN">
                                    <input type="hidden" name="phone_number" value="1666407873">
                                    <input type="hidden" name="fbAppEventsEnabled" value=true>
                                    <button type="submit" class="btn-success">Verify</button>
                                </form>
                                <%}%>
                            </label>
                            <p type="email" class="col-md-10 text-left" id="inputEmail"><%=phonename%></p>
                            <p type="email" class="col-md-2 text-right" id="input"><%if (phonestatus == 1) {%>
                                &#9989;  <%} else { %> &#10060; <%  }%></p>
                        </div>

                    </div>
                    <div class="form-group col-md-6">
                        <div class="row">
                            <label  class="col-md-12">Account Balance &nbsp;  <a href = ""><i class="fas fa-plus-square"></i></a> </label>


                            <p  class="col-md-10 text-left" id=""><%=jobjmoney%></p>

                        </div>

                    </div>

                </div>



            </div>
        </div>
        <!--//short-codes-->	

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>

        <script src="<%=request.getContextPath()%>/asset/client/js/fontawesome-all.min.js" type="text/javascript"></script>
    </body>
</html>

<%}%>