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
	<link rel="stylesheet" href="css/bookTableNotUsedNow.css" />
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
					<li><a href="Main.html"><span class="glyphicon glyphicon-home"></span>HomePage</a></li>
					<li><a href="MyAccount.jsp"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                    <li><a href="Tutorial.html"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                    <li><a href="Debugging.html"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                     <li><a href="Logout.html"><span class="glyphicon glyphicon-logout"></span> Logout</a></li>
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

<!-- TUTORIAL LANGUAGES -->
    <div class="container">
        <div class="col-md-3">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Tutorials</h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
						<li><a href="Python.html" class="text-danger">PYTHON</a></li>
						<li><a href="Html.html" class="text-danger">HTML</a></li>
						<li><a href="Cplus.html" class="text-danger">C++</a></li>
                    </ul>
                </div>
            </div>

<!-- SEARCH -->
           <div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">Search for Tutorial</h3>
				</div>
				<div class="container">
		        <div class="row">
			     <form class="form"  id="searchForm" action="" method="POST">
				  <fieldset class="form__panel">
					</br>
					<label>Enter Tutorial Title</label>
					<input type="text" class="textbox" name="TutorialSearch" value="">
					</br>
					</br>
					<button type="submit" class="btn btn-danger">Submit</button>
					</fieldset>
					</form>
					</div>
					</div>
			</div>       
		</div>
		
<!-- DISPLAY TUTORIAL TITLES -->
<div class="container">
<div class="col-md-9">
<%String text=request.getParameter("title"); %>

	
			  <h2>Display Tutorial here</h2>
			  <div class="card">
			    <div class="card-header">Tutorial Title</div>
			    <div class="card-body"><p><%=text %></p>
			
			    </div> 
			    <div class="card-footer">		
				<div class="comment-wrapper">
					<div class="panel panel-danger">
						<div class="panel-heading">
							Comment panel
						</div>
						<div class="panel-body">
							<textarea class="form-control" placeholder="write a comment..." rows="3"></textarea>
							<br>
							<button type="button" class="btn btn-danger pull-right">Post</button>
							<div class="clearfix"></div>
							<hr>
							<ul class="media-list">
								<li class="media">
									<strong class="text-danger">User_123</strong>
									<p>
										excellent tutorial!  <a href="#"> username ??  </a>.
									</p>
									<p><input type="button" class="btn btn-danger btn-sm" value="Helpful"> 8   
									<input type="button" class="btn btn-danger btn-sm" value="Unhelpful"> 2 </p>
								</li>
								<li class="media">
									<strong class="text-danger">User_234</strong>
									<p>
										good tutorial!  <a href="#"> username ??  </a>.
									</p>
									<p><input type="button" class="btn btn-danger btn-sm" value="Helpful"> 81  
									<input type="button" class="btn btn-danger btn-sm" value="Unhelpful"> 5 </p>
								</li>
								<li class="media">
									<strong class="text-danger">User_444</strong>
									<p>
										complicated instructions  <a href="#"> username ??  </a>.
									</p>
									<p><input type="button" class="btn btn-danger btn-sm" value="Helpful"> 2  
									<input type="button" class="btn btn-danger btn-sm" value="Unhelpful"> 2 </p>	
								</li>
							</ul>
						</div>
						</div>
						</div>
					</div>
			  </div>
			</div>
		</div>
    </div>  <!-- end container -->
 
<!-- FOOTER -->    
<footer>
	<div id="mainNavigationRow" >
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li><a href="AboutUs.html">About Us</a></li>
						<li><a href="howToUse.html">How to Use</a></li>                               
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
</footer>
</body>
</html>



