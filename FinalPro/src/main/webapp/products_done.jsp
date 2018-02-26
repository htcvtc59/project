<%-- 
    Document   : products_done
    Created on : Feb 7, 2018, 10:51:19 AM
    Author     : smart
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <jsp:include page="headermenu.jsp"/>
        
        <div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Products</li>
			</ol>
		</div>
	</div>
	<!--//breadcrumbs-->
	<!--products-->
	<div class="products">	 
		<div class="container">
			<div class="col-md-12 product-model-sec">
				<div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
                                    <span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g1.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Girl Dress </a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$2000.00</del></p>
							<p><span class="item_price">$500.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".7s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g5.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Baby Romper</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$1200.00</del></p>
							<p><span class="item_price">$800.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".9s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g7.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Bear Diaper Bag</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$570.00</del></p>
							<p><span class="item_price">$200.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g3.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Doctor Play Set</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$2000.00</del></p>
							<p><span class="item_price">$500.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".7s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g6.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Baby Frock</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$180.00</del></p>
							<p><span class="item_price">$100.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".9s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g2.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Pikachu Onesies</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span >☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$2000.00</del></p>
							<p><span class="item_price">$500.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".5s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g8.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Police Bike</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$9050.00</del></p>
							<p><span class="item_price">$9000.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids product-grids-mdl simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".7s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g10.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Crocs Sandals</a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$25.00</del></p>
							<p><span class="item_price">$20.00</span></p>
						</div>
					</div>
				</div>
				<div class="product-grids simpleCart_shelfItem wow fadeInUp animated" data-wow-delay=".9s">
				<span class="time-request" style="color: red;">Done</span>
					<div class="new-top">
						<a href="single.html"><img src="<%=request.getContextPath()%>/asset/client/images/g12.jpg" class="img-responsive" alt=""/></a>
						<div class="new-text">
							<ul>
								<li><a href="single.html">Quick View </a></li>
								<li><input type="number" class="item_quantity" min="1" value="1"></li>
								<li><a class="item_add" href=""> Add to cart</a></li>
							</ul>
						</div>
					</div>
					<div class="new-bottom">
						<h5><a class="name" href="single.html">Child Print Bike </a></h5>
						<div class="rating">
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span class="on">☆</span>
							<span>☆</span>
							<span>☆</span>
						</div>
						<div class="ofr">
							<p class="pric1"><del>$4000.00</del></p>
							<p><span class="item_price">$3100.00</span></p>
						</div>
					</div>
				</div>
			</div>
	</div>
	<!--//products-->
        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>
    </body>
</html>
