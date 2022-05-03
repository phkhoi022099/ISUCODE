<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*,Validation.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <link href="bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
	
  </head>
  <header>
   <div id="topHeaderRow" >
      <div class="container" >
         <nav class="navbar navbar-inverse " role="navigation" >
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
               </button>
               <p class="navbar-text">Welcome to <strong>ISU CODE</strong></p>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse pull-right">
				<ul class="nav navbar-nav">
					<li><a href="User_MyAccount.jsp"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                    <li><a href="Tutorial.html"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                    <li><a href="Debugging.html"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                    <li><a href="Logout.jsp" ><span class="glyphicon glyphicon-logout"></span>Logout</a></li>
				</ul>
            </div>
         </nav>
      </div>
	  <div style="height: 180px; display:flex; align-items:center; justify-content:center;">
		<img style="height: 180px;"src="images\shot pic\sealISU.png" alt="seal  test">
	  </div>
   </div>
</header>   

<body>
<%
Account acc=(Account)session.getAttribute("acc"); 
if(acc==null)
{
	RequestDispatcher rd = request.getRequestDispatcher("Login.html");

    rd.forward(request,response);
}
	User user=acc.getUser();
    %>
    	<div class="container">
			<div class="row">
				<div class="col-md-3">
					<img style="width: 100%;" src="images/shot pic/redbirdISU.jpg" alt="redbird">
				</div>
				<div class="col-md-5">
					<table class="table table-bordered" style="	font-weight: bold;font-size: 15px;">
						<caption class="results__caption">Account</caption>
						<tr>
						<br/>
						<br/>
						</tr>
						<tr>
							<td >Email</td>    
							<td ><%=user.getEmail() %> </td> 
						</tr>
						<tr>
						</tr>
						<tr>
							<td >Name</td>    
							<td ><%=user.getName() %> </td> 
						</tr>
						<tr>
						</tr>
						
					</table>
				</div>
   
    	
				<div class="col-md-4">
					<section class="results">
						<br/>
						<br/>
						
					</section>
				</div>
					<div class="container rounded bg-white mt-5">
					<div class="row">
						
						<div class="col-md-8">
							<div class="p-3 py-5">
							 <form action="UpdateAccount.jsp" method="POST" role="form" class="form-horizontal" >
							<h2>Update Account Name</h2>
								<div class="d-flex justify-content-between align-items-center mb-3">
								
								<div class="row mt-2">
									<div class="col-md-6"><input type="text" class="form-control" placeholder="name" name="name"></div>
								</div>
								<div class="row mt-2">
									<div class="col-md-6"><input type="text" class="form-control" placeholder="email" name="email"></div>
								</div>
								<input type="submit" class="form__btn">
							</div>
							 </form>
							 
							 							<!-- form card change password -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Change Password</h3>
                        </div>
                        </div>
						 
							    <form action="UpdateAccountPassword.jsp" method="POST" class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                <div class="row mt-2">
									<div class="col-md-6"><input type="text" class="form-control" placeholder="email" name="email"></div>
								</div>
                                    <label for="inputPasswordOld">Current Password</label>
                                    <input type="password" class="form-control" name="inputPasswordOld" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">New Password</label>
                                    <input type="password" class="form-control" name="inputPasswordNew" required="">
                                    <span class="form-text small text-muted">
                                            The password must be 8-20 characters, and must <em>not</em> contain spaces.
                                        </span>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">Verify</label>
                                    <input type="password" class="form-control" name="inputPasswordNewVerify" required="">
                                    <span class="form-text small text-muted">
                                            To confirm, type the new password again.
                                        </span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg float-right">Save</button>
                                </div>
                            </form>
                            
						</div>
					</div>
				</div>
	</div>
			</div>
            <footer>
                <div id="mainNavigationRow" >
                    <div class="container">
                        <nav class="navbar navbar-inverse" role="navigation">
                            <div class="collapse navbar-collapse navbar-ex1-collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="AboutUs.html">About Us</a></li>                             
                                    				
                                </ul>  
                            </div>
                        </nav>
                    </div>  <!-- end container -->
                </div>  <!-- end mainNavigationRow -->
              
                <div id="copyrightRow">
                    <div class="container">
                        <div class="row">
                            <p class="text-muted">All images are copyright to their owners.
                            <span class="pull-right">&copy; 2019 Copyright</span></p>
                        </div>
                    </div>
                </div>
            </footer>
              </body>
            </html>
