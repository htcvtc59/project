<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Account Kit</li>
                </ol>
            </div>
        </div>
        <!--//breadcrumbs-->

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

        <form method="get" action="https://www.accountkit.com/v1.0/basic/dialog/sms_login/">
            <input type="hidden" name="app_id" value="155995278391113">
            <input type="hidden" name="redirect" value="http://localhost:8084/accountkit">
            <input type="hidden" name="state" value="452266c718a9e6219c861efea01f5fe6">
            <input type="hidden" name="country_code" value="84">
            <input type="hidden" name="locale" value="VN">
            <input type="hidden" name="phone_number" value="1666407873">
            <input type="hidden" name="fbAppEventsEnabled" value=true>
            <button type="submit" class="btn-success">Login</button>
        </form>



        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>