<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2/1/18
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/asset/vendors/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="<%=request.getContextPath()%>/asset/vendors/bootstrap/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<%=request.getContextPath()%>/asset/vendors/fastclick/fastclick.js"></script>
<!-- NProgress -->
<script src="<%=request.getContextPath()%>/asset/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="<%=request.getContextPath()%>/asset/vendors/Chart.js/Chart.min.js"></script>
<!-- jQuery Sparklines -->
<script src="<%=request.getContextPath()%>/asset/vendors/jquery-sparkline/jquery.sparkline.min.js"></script>
<!-- Flot -->
<script src="<%=request.getContextPath()%>/asset/vendors/Flot/jquery.flot.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/Flot/jquery.flot.pie.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/Flot/jquery.flot.time.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/Flot/jquery.flot.stack.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="<%=request.getContextPath()%>/asset/vendors/flot.orderbars/jquery.flot.orderBars.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/flot-spline/jquery.flot.spline.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="<%=request.getContextPath()%>/asset/vendors/DateJS/date.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="<%=request.getContextPath()%>/asset/vendors/moment/moment.min.js"></script>

<script src="<%=request.getContextPath()%>/asset/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>


<!-- iCheck -->
<script src="<%=request.getContextPath()%>/asset/vendors/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-bs/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons-bs/buttons.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/buttons.flash.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-buttons/buttons.print.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-fixedheader/dataTables.fixedHeader.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-keytable/dataTables.keyTable.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-responsive/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-responsive-bs/responsive.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/datatables.net-scroller/dataTables.scroller.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/jszip/jszip.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/pdfmake/pdfmake.min.js"></script>
<script src="<%=request.getContextPath()%>/asset/vendors/pdfmake/vfs_fonts.js"></script>



<!-- Custom Theme Scripts -->
<script src="<%=request.getContextPath()%>/asset/vendors/js/custom.min.js"></script>


<!--socket io-->
<script src="<%=request.getContextPath()%>/asset/public/socket.io.js" type="text/javascript"></script>

<script type="text/javascript" >
    var socket3000 = io.connect('http://localhost:3000');
    socket3000.on('connect', function () {
        socket3000.emit('port3000', {socketid: socket3000.id, name: 'Oke'});
    });
//    colproduct
    socket3000.on("admindataproduct", function (data) {

        var jdata = JSON.parse(data);

        var id = jdata._id;
        var nameproduct = jdata.nameproduct;
        var clientid = jdata.clientid;
        var createddate = jdata.createddate;
        var timebegin = jdata.timebegin;
        var timeend = jdata.timeend;
        var pricemin = jdata.pricemin;
        var stepprice = jdata.stepprice;
        var quantity = jdata.quantity;
        var image = jdata.image;
        var slide = jdata.slide;
        var description = jdata.description;
        var status = jdata.status;

        if (status === 1) {
            var statusd = "Show";
        } else {
            var statusd = "Hide";
        }

        if (status === 3) {
            var sdisable = "disabled=true";
        }

        var arrslide = slide.split(',');


        $('.contentdatapro').prepend(`
      <tr class="row_` + id + `">
  <td>
      <button type="button" data-id="` + id + `"
              class="fa fa-bitbucket-square btn btn-round btn-danger btndelete"></button>
  </td>
  <td> 
      <button data-id="` + id + `" type="button" data-val="` + status + `" ` + sdisable + `
              class="fa fa-edit btn btn-round btn-success btnstatus">
` + statusd + `</button>
      </td>
      <td>` + id + `</td>
      <td class="col1` + id + `">` + nameproduct + `</td>
      <td class="col2` + id + `">` + clientid + `</td>
      <td class="col3` + id + `">` + createddate + `</td>
      <td class="col4` + id + `">` + timebegin + `</td>
      <td class="col5` + id + `">` + timeend + `</td>
      <td class="col6` + id + `">` + pricemin + `</td>
                                                    <td class="col7` + id + `">` + stepprice + `</td>
      <td class="col8` + id + `">` + quantity + `</td>
      <td class="col9` + id + `"><img src="` + image + `" height="40px" width="40px"></td>
      <td class="col10` + id + `">
        <img height="40px" width="40px" src="` + arrslide[0] + `" alt='...' />
        <img height="40px" width="40px" src="` + arrslide[1] + `" alt='...' />
        <img height="40px" width="40px" src="` + arrslide[2] + `" alt='...' />
           </td>
           <td class="col11` + id + `">` + description + `</td>

       </tr>

          `
                );

    });







    var socket4000 = io.connect('http://localhost:4000');
    socket4000.on('connect', function () {
        socket4000.emit('port4000', {socketid: socket4000.id, name: 'Oke'});
    });
</script>

<!-- end socket io-->