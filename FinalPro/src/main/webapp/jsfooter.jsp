

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--search jQuery-->
<!--<script src="<%=request.getContextPath()%>/asset/client/js/main.js"></script>-->



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



<!--socket io-->
<script src="<%=request.getContextPath()%>/asset/public/socket.io.js" type="text/javascript"></script>

<script type="text/javascript" >
    var socket3000 = io.connect('http://localhost:3000');
    socket3000.on('connect', function () {
        socket3000.emit('port3000', {socketid: socket3000.id, name: 'Oke'});
    });




    var socket4000 = io.connect('http://localhost:4000');
    socket4000.on('connect', function () {
        socket4000.emit('port4000', {socketid: socket4000.id, name: 'Oke'});
    });
</script>

<!-- end socket io-->


<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/client/scrollbar/jquery.mCustomScrollbar.css">
<script src="<%=request.getContextPath()%>/asset/client/scrollbar/jquery.mCustomScrollbar.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/asset/client/scrollbar/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>

<style type="text/css">
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
</style>

<script src="<%=request.getContextPath()%>/asset/client/scrollbar/customscrollbar.js" type="text/javascript"></script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/asset/client/scrollbar/scrollbar.css">