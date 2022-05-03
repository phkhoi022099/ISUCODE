<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bean.User"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bookTableNotUsedNow.css" />
  </head>
  <body>

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
                     <li><a href="index"><span class="glyphicon glyphicon-home"></span> HomePage</a></li>
                     <li><a href="Login.html"><span class="glyphicon glyphicon-login"></span> Login</a></li>
                     <li><a href="createAccount"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
             <!--    <li><a href="${pageContext.request.contextPath}/isucode/getAccount"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                     <li><a href="${pageContext.request.contextPath}/isucode/getTutorials"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                     <li><a href="${pageContext.request.contextPath}/isucode/getDebugger"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                     <li><a href="Admin.html"><span class="glyphicon glyphicon-admin"></span> Admin</a></li>
                     <li><a href="Logout.html"><span class="glyphicon glyphicon-logout"></span> Logout</a></li> -->
                 </ul>
             </div>
          </nav>
       </div>
       
       <div style="height: 180px; display:flex; align-items:center; justify-content:center;">
         <img style="height: 180px;"src="${pageContext.request.contextPath}/resources/images\shot pic\sealISU.png" alt="seal  test">
       </div>
    </div>  
   
 </header>   

 <div class="container">
    <div class="row">
        <div class="col-md-3">
            <img style="width: 100%;" src="${pageContext.request.contextPath}/resources/images/shot pic/redbirdISU.jpg" alt="redbird">
        </div>
        <div class="col-md-9">
           <span class="text-danger">${msg }</span>
            <form action="${pageContext.request.contextPath}/isucode/createAccountAction" method="POST" role="form" class="form-horizontal" >
                <div class="page-header">
                    <h2>Register Account</h2>
                    <p>If you already have an account with us, please login at the login page.</p>   
                </div>
                
                <div class="form-group">
                    <label for="email" class="col-md-3 control-label">Email</label>
                    <div class="col-md-9">
                        <input type="email" class="form-control" name="email" required/>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="name" class="col-md-3 control-label">Name</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="name" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-md-3 control-label">Mobile</label>
                    <div class="col-md-9">
                        <input type="number" class="form-control" name="mob" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password1" class="col-md-3 control-label">Password</label>
                    <div class="col-md-9">
                        <input type="password" class="form-control" name="password1" required/>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="password2" class="col-md-3 control-label">Password Confirm</label>
                    <div class="col-md-9">
                        <input type="password" class="form-control" name="password2" required/>
                    </div>
                </div>
                

                <div class="form__box">
                    <div class="col-md-offset-3 col-md-9">
                        <input type="submit" class="btn btn-success"> <input type="reset" value="Clear" class="btn btn-danger">
                    </div>
                </div>
            </form>
            
        </div>
    </div>
</div>

<footer>
	<div id="mainNavigationRow" >
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/isucode/AboutUs">About Us</a></li>
						<li><a href="${pageContext.request.contextPath}/isucode/ContactUs">Contact Us</a></li>                               
						     						
					</ul>  
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
  

</footer>

</body>
</html>
