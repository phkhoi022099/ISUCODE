<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
					<li><a ><span class="glyphicon glyphicon-home"></span> HomePage</a></li>
					<li><a href="login"><span class="glyphicon glyphicon-login"></span> Login</a></li>
					<li><a href="${pageContext.request.contextPath}/isucode/createAccount"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
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
                <img style="width: 100%;" src="${pageContext.request.contextPath}/resources/images\shot pic\redbirdISU.jpg" alt="redbird">
            </div>
            <div class="col-md-9">
                <div class="page-header">
                    <h1>ISU-CODE!</h1>
                    <h1>The place for tutorials and code questions</h1>
                </div>
                <div>
                  <span class="text-success">${msg}</span>
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
    