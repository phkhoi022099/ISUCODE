<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*,Validation.DatabaseConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<%
    
        try
         {
        DatabaseConnect dbc=new DatabaseConnect();
        Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
        String name=request.getParameter("name"); 
        String email=request.getParameter("email"); 
        String password1=request.getParameter("password1");
        String password2=request.getParameter("password2");  
        if(password1.equals(password2))
        {
        Statement st = con.createStatement();
        st.executeUpdate("insert into accounts(Name,Email,Password,Role) values('" + name + "','" + email + "','" + password1 + "','0')");
        %>
        <html>
    <body>
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
   
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
                     <li><a href="Main.html"><span class="glyphicon glyphicon-home"></span> HomePage</a></li>
                     <li><a href="Login.html"><span class="glyphicon glyphicon-login"></span> Login</a></li>
                     <li><a href="CreateAccount.html"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
                 </ul>
             </div>
          </nav>
       </div>
       <div style="height: 180px; display:flex; align-items:center; justify-content:center;">
         <img style="height: 180px;"src="images\shot pic\sealISU.png" alt="seal  test">
       </div>
    </div>  
 </header>   

 <div class="container">
    <div class="row">
        <div class="col-md-3">
            <img style="width: 100%;" src="images/shot pic/redbirdISU.jpg" alt="redbird">
        </div>
        <center> <h3 class="navbar-text"><strong>Account Created Successfully</strong></h3></center>
    </div>
</div>

<footer>
	<div id="mainNavigationRow" >
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li><a href="AboutUs.html">About Us</a></li>
						<li><a href="ContactUs.html">Contact Us</a></li>                               
						     						
					</ul>  
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
  

</footer>


    <script>
        var timer = setTimeout(function(){
            window.location='Login.html'
        }, 2000);
    </script>
</body>
</html>
        <% 
       
   
        } 
        else
        	{
        	 %>
        	 
        	 <html>
    <body>
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
   
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
                     <li><a href="Main.html"><span class="glyphicon glyphicon-home"></span> HomePage</a></li>
                     <li><a href="Login.html"><span class="glyphicon glyphicon-login"></span> Login</a></li>
                     <li><a href="CreateAccount.html"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
                  <!--    <li><a href="MyAccount.jsp"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                     <li><a href="Tutorial.html"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                     <li><a href="Debugging.html"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                     <li><a href="Admin.html"><span class="glyphicon glyphicon-admin"></span> Admin</a></li>
                      <li><a href="Logout.html"><span class="glyphicon glyphicon-logout"></span> Logout</a></li> -->
                 </ul>
             </div>
          </nav>
       </div>
       
       <div style="height: 180px; display:flex; align-items:center; justify-content:center;">
         <img style="height: 180px;"src="images\shot pic\sealISU.png" alt="seal  test">
       </div>
    </div>  
   
 </header>   

 <div class="container">
    <div class="row">
        <div class="col-md-3">
            <img style="width: 100%;" src="images/shot pic/redbirdISU.jpg" alt="redbird">
        </div>
        <center> <h3 class="navbar-text"><strong>Password and Confirm Password do not match, please try again!</strong></h3></center>
    </div>
</div>

<footer>
	<div id="mainNavigationRow" >
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li><a href="AboutUs.html">About Us</a></li>
						<li><a href="ContactUs.html">Contact Us</a></li>                               
						     						
					</ul>  
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
  

</footer>


    <script>
        var timer = setTimeout(function(){
            window.location='CreateAccount.html'
        }, 2000);
    </script>
</body>
</html>
        	 
        	 
        	 <%
        	
        	}
        }

        	catch (SQLException ex) {
        
        System.out.println("SQLException: " + ex.getMessage());
        out.println("Registration failed Database Error! Please <a href='ContactUs.html'>Let us know</a>this error.");
    }
    %>
</body>
</html>