
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header">
    <div class="top-header navbar navbar-default"><!--header-one-->
        <div class="container">
            <div class="nav navbar-nav wow fadeInLeft animated" data-wow-delay=".5s">
                <%
                    if (session.getAttribute("usernameclient") == null) {
                %>
                <p>Welcome to <a href="register.jsp">Register </a> Or <a href="signin.jsp">Sign In </a></p>
                <%
                } else {
                %>
                <!-- Logout    -->
                <p>Welcome to <%=session.getAttribute("usernameclient")%>
                    <a href="accountdetail.jsp">Detail </a>
                    <a href="productpostdetail.jsp">Post </a>
                    <a href="servletBidHistory?action=bid">Bid History </a>
                    <a href="signin?action=logout">Logout</a></p>
                <%
                    }
                %>

            </div>
            <div class="nav navbar-nav navbar-right social-icons wow fadeInRight animated" data-wow-delay=".5s">
                <ul>
                    <li><a href="#"> </a></li>
                    <li><a href="#" class="pin"> </a></li>
                    <li><a href="#" class="in"> </a></li>
                    <li><a href="#" class="be"> </a></li>
                    <li><a href="#" class="you"> </a></li>
                    <li><a href="#" class="vimeo"> </a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="header-two navbar navbar-default"><!--header-two-->
        <div class="container">
            <div class="nav navbar-nav header-two-left">
                <ul>
                    <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+84 66666 6789</li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">auction_master@fpt.edu.vn</a></li>			
                </ul>
            </div>
            <div class="nav navbar-nav logo wow zoomIn animated" data-wow-delay=".7s">
                <h1><a href="index.jsp"><b style="color:#FF590F">AUCTION</b><span class="tag">Everything for Auction world </span> </a></h1>
            </div>
            <div class="nav navbar-nav navbar-right header-two-right">
                <div class="header-right my-account">
                    <a href="contact.jsp"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> CONTACT US</a>						
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="top-nav navbar navbar-default"><!--header-three-->
        <div class="container">
            <nav class="navbar" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!--navbar-header-->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav top-nav-info">
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/products_pending.jsp" >Product Pending</a></li>
                        <li><a href="<%=request.getContextPath()%>/products_doing.jsp">Product Doing</a></li>
                        <li><a href="<%=request.getContextPath()%>/products_done.jsp" >Product Done</a></li>
                            <%
                                if (session.getAttribute("usernameclient") == null) {
                            %>
                        <li><a href="#" data-toggle="modal" data-target="#modalCreate" disabled >Create Product</a></li> <%
                        } else {
                            %>
                        <li><a href="createproduct.jsp">Create Product</a></li>
                            <%
                                }
                            %>


                    </ul> 
                    <div class="clearfix"> </div>
                    <!--//navbar-collapse-->
                    <header class="cd-main-header">
                        <ul class="cd-header-buttons">
                            <li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
                        </ul> <!-- cd-header-buttons -->
                    </header>
                </div>
                <!--//navbar-header-->
            </nav>
            <div class="modal video-modal fade" id="modalCreate" tabindex="-1" role="dialog" aria-labelledby="modalCreate">
                <div class='modal-dialog'>
                    <div class='modal-content'>
                        <div class='modal-header'>
                            <button type='button' class='close' data-dismiss='modal'>&times;</button>
                        </div>

                        <div class='modal-body alert-warning'>
                            Please Sign In or Register for Auction price !!!
                        </div>
                        <div class='modal-footer'>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="cd-search" class="cd-search">
                <form>
                    <input type="search" placeholder="Search...">
                </form>
            </div>
        </div>
    </div>
</div>
