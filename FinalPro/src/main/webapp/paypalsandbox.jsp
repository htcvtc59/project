
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <span id='lippButton'></span>
        <script src='https://www.paypalobjects.com/js/external/api.js'></script>
        <script>
            paypal.use(['login'], function (login) {
                login.render({
                    "appid": "AUZ7WrRGbwW7eerS3gEr62dFzxc5u6t7dgF6QdQbDtbJo75r5GTMhoHRHCfRVucurp_d7zKrMV7YZIrm",
                    "authend": "sandbox",
                    "scopes": "openid",
                    "containerid": "lippButton",
                    "locale": "en-us",
                    "returnurl": "http://localhost:8084"
                });
            });
        </script>
    </body>
</html>
