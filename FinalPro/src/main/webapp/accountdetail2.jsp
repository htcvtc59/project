<%-- 
    Document   : accountdetail2
    Created on : Feb 18, 2018, 7:53:52 AM
    Author     : Admin
--%>

<%-- 
    Document   : createproduct
    Created on : Feb 5, 2018, 10:02:59 PM
    Author     : apple
--%>

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
                            <label for="inputEmail4">First Name</label>
                            <input type="text" class="form-control" id="inputFirstname" placeholder="Firstname">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputLastname">Last Name</label>
                            <input type="text" class="form-control" id="inputLastname" placeholder="Lastname">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                        </div>
                          <div class="form-group col-md-6">
                           <label for="inputAddress">Address</label>
                           <input type="text" class="form-control" id="inputAddress" placeholder="Please Address">
                         </div>
                        
                    </div>
                    <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputPhone">Phone Number</label>
                        <input type="text" class="form-control" id="inputPhone" placeholder="Please Phone">
                        
                    </div>
                        <div class="form-group col-md-6">
                             <label for="validatephone">Validate your phone number </label>
                         
                             <a  href = "" class="form-control"   id="checkphone">Validate phone number</a>
                           
                         </div>
                            
                    </div>
                      <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputBalance">Account Balance</label>
                            <input type="text" class="form-control" id="inputBalance" readonly>
                        </div>
                          <div class="form-group col-md-6">
                           <label for="inputMoney">Money Recharge</label>
                           <input type="text" class="form-control" id="inputMoney" placeholder="Money Recharge">
                         </div>
                        
                    </div>
                
                 

                    <div class='col-sm-12'><button type="submit" class="btn btn-primary">Update Account Infomation </button></div>  
                </form>
            </div>
        </div>
        <!--//short-codes-->	

        <!--footer-->
        <jsp:include page="footer.jsp" />
        <!--//footer-->		
        <jsp:include page="jsfooter.jsp"/>

      
    </body>
</html>
