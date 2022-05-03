<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*,Validation.*" %>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
  </head>
<body>

 <%   
 String str = "";
 try
 {
DatabaseConnect dbc=new DatabaseConnect();
Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
PreparedStatement ps = null;
String question=request.getParameter("q"); 
String title =request.getParameter("title"); 
String category= request.getParameter("category");
boolean ans = false;
String id = "d@isu.edu";

 Statement st = con.createStatement();
 str = "insert into question(Title,Question,Category,Answered,UserQID) values('" + title + "','" + question +"','" + category +"','" + false + "','" + id + "');";
 System.out.println(str);
 int i = st.executeUpdate(str);

      %>
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
        <center> <h3 class="navbar-text"><strong>Tutorial Posted Successfully</strong></h3></center>
    </div>
</div>

<footer>
	<div id="mainNavigationRow" >
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
					</ul>  
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
</footer>

<script>
        var timer = setTimeout(function(){
            window.location='Admin.html'
        }, 2000);
    </script>

<%
//Tutorial tutor = (Tutorial)session.getAttribute("tutoral"); 
//Account acc=(Account)session.getAttribute("acc"); 
//User user=acc.getUser();
//user.setName(name);
    	   
    	   %>   

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
        <center> <h3 class="navbar-text"><strong>Tutorial Not Posted Successfully</strong></h3></center>
    </div>
</div>

<footer>
	<div id="mainNavigationRow" >
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
					</ul>  
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
</footer>

 <script>
        var timer = setTimeout(function(){
            window.location='Admin.html'
        }, 2000);
    </script>
        
     <%  
    	   
    	   
      
   %>
     <%  
}
        	catch (SQLException ex) {       
        System.out.println("SQLException: " + ex.getMessage());
        out.println(str);
        out.println("Registration failed Database Error! Please <a href='ContactUs.html'>Let us know</a>this error." + str);
    }
 
 %>


