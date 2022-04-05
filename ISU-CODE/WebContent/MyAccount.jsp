<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <link href="bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bookTableNotUsedNow.css" />
	<script type="text/javascript" src="IT353 project.js"></script>
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
					<li><a href="Main.html"><span class="glyphicon glyphicon-home"></span> Homepage</a></li>
					<li><a href="Login.html"><span class="glyphicon glyphicon-login"></span> Login</a></li>
					<li><a href="CreateAccount.html"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
					<li><a href="MyAccount.html"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                    <li><a href="Tutorial.html"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                    <li><a href="Debugging.html"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                    <li><a href="Admin.html"><span class="glyphicon glyphicon-admin"></span> Admin</a></li>
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
							<td > </td> 
						</tr>
						<tr>
						</tr>
						<tr>
							<td >Name</td>    
							<td > </td> 
						</tr>
						<tr>
						</tr>
						<tr>
							<td >Password </td>    
							<td > </td> 
						</tr>
					</table>
				</div>
				
				<div class="col-md-4">
					<section class="results">
						<br/>
						<br/>
						<p><strong>My info</strong></p>
						<!-- <?php
							$serverName = "itkmssql";
							$connectionOptions = array(
							//*****************************
								"Database" => "it426g5",
								"Uid" => "it426g5",
								"PWD" => "redbird!"
							);
							
							//Establishes the connection
							$conn = sqlsrv_connect($serverName, $connectionOptions);
							
							$id=$_SESSION["email"];
							$tableName = "Account";	
							$sql = "select * from Item where Account.name='Daniel F2';";
							
							$stmt = sqlsrv_query($conn, $sql);
							while($row = sqlsrv_fetch_array($stmt)){
								echo "<div class='panel panel-default'>
									<div class='panel-body'>
										<div class='card text-center' >";
											$name= $row[0];
											$num= $row[2];
											if(strpos($name,'Bus') !== false){ 
												$package='business';
											}
											if(strpos($name,'Tec') !== false){ 
												$package='technology';
											}
											if(strpos($name,'Eng') !== false){ 
												$package='english';
											}
											if(strpos($name,'Sci') !== false){ 
												$package='science';
											}
											if(strpos($name,'Art') !== false){ 
												$package='art';
											}
											echo"<tr><td><img src='images/$package/$num.jpg' class='pic'></td>";
										echo"</div>";
										echo "<td>" . $stmt . "</td>
									</div>
								</div>";
							}
						?> -->
					</section>
				</div>
			</div>
            <footer>
                <div id="mainNavigationRow" >
                    <div class="container">
                        <nav class="navbar navbar-inverse" role="navigation">
                            <div class="collapse navbar-collapse navbar-ex1-collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="aboutUs.html">About Us</a></li>
                                    <li><a href="howToUse.html">How to Use</a></li>                               
                                    <li><a href="#"><strong>Share:</strong></a></li>
                                    <li><a href="#"><img src="images/social/email_16.png" alt="Email this to someone" /></a></li>
                                    <li><a href="#"><img src="images/social/rss_16.png" alt="Syndicated content" /></a></li>  
                                    <li><a href="#"><img src="images/social/twitter_16.png" alt="Share this on Twitter" /></a></li>          
                                    <li><a href="#"><img src="images/social/facebook_16.png" alt="Share this on Facebook" /></a></li>          
                                    <li><a href="#"><img src="images/social/flickr_16.png" alt="Share this on Flickr" /></a></li>          						
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