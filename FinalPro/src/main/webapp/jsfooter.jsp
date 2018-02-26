<%-- 
    Document   : jsfooter
    Created on : Feb 5, 2018, 9:55:11 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--search jQuery-->
<script src="<%=request.getContextPath()%>/asset/client/js/main.js"></script>
<!--//search jQuery-->
<!--smooth-scrolling-of-move-up-->
<script type="text/javascript">
    $(document).ready(function () {
        $('.datetimepicker1').datetimepicker({
            format:"DD/MM/YYYY HH:mm:ss a"
        });
        $('.datetimepicker3').datetimepicker({
            format: "hh:mm:ss",
        });
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<!--//smooth-scrolling-of-move-up-->
<!--Bootstrap core JavaScript
================================================== -->
<!--Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/asset/client/js/bootstrap.js"></script>
