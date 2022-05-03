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
					<li><a href="Login.html"><span class="glyphicon glyphicon-login"></span> Login</a></li>
					<li><a href="CreateAccount.html"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
					<li><a href="MyAccount.jsp"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
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
<!-- TUTORIAL LANGUAGES -->
    <div class="container">
        <div class="col-md-3">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">CODE Q's</h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
						<li><a href="PythonQ.html" class="text-danger">PYTHON</a></li>
						<li><a href="HtmlQ.html" class="text-danger">HTML</a></li>
						<li><a href="CplusQ.html" class="text-danger">C++</a></li>
                    </ul>
                </div>
            </div>
		</div>
		
		<div class="container">
        <div class="col-md-9">
        <h2>Java Questions and Answers</h2>
		<div class="col-md-9">
	<!--  ANSWER Section -->
<% 
try{
DatabaseConnect dbc=new DatabaseConnect();
Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
Statement st = con.createStatement();
st=con.createStatement();
ResultSet resultSet = null;
String sql ="select * from question where Category = \"JAVA\" && Answered = True";
String text = "";
resultSet = st.executeQuery(sql);
System.out.println(sql);
while(resultSet.next()){
%>
<table class="table table-condensed">
		<tbody>
		<tr>
		<td>Title</td>
		<td>Question</td>
		<td>Answer</td>
			<tr>
				<td><%=resultSet.getString("Title") %></td>
				<td><%=resultSet.getString("Question") %></td>
				<td><%=resultSet.getString("Answer") %></td>								
			</tr>
		  </tbody>		
	    </table>
	    
<%
}%>   
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
						<li><a href="ContactUs.html">Contact Us</a></li>                               
				</div>
			</nav>
		</div>  <!-- end container -->
	</div>  <!-- end mainNavigationRow -->
</footer>
</body>
</html>
<%

con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	


