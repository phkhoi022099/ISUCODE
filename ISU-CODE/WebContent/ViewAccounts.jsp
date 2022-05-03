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
					<li><a href="Admin_MyAccount.jsp"><span class="glyphicon glyphicon-Account"></span> Admin Account</a></li>  
                    <li><a href="Admin.html"><span class="glyphicon glyphicon-Debugging"></span> Admin</a></li> 
                    <li><a href="Logout.jsp"><span class="glyphicon glyphicon-logout"></span> Logout</a></li>
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
        <div class="col-md-2">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Admin Options</h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                    	<li><a href="PostTutorial.html" class="text-danger">Post Tutorial</a></li>
						<li><a href="ViewAccount.html" class="text-danger">View Accounts</a></li>
						<li><a href="ViewComment.html" class="text-danger">View Comments</a></li>
						<li><a href="" class="text-danger"></a></li>
                    </ul>
                </div>
            </div>
            </div>
		 
			
<!-- DISPLAY ACOOUNTS -->
<h1>List of Accounts</h1>

<div class="col-md-9">
<% 
try{
DatabaseConnect dbc=new DatabaseConnect();
Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
Statement st = con.createStatement();
st=con.createStatement();
ResultSet resultSet = null;
String sql ="select * from accounts";
String text = "";
resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>

<table class="table table-condensed">
		<tbody>
			<tr>
				<td><%=resultSet.getString("Name") %></td>
				<td><%=resultSet.getString("Email") %></td>
				<td><%=resultSet.getString("Password") %></td>
				<td><%=resultSet.getString("Role") %></td>						
			</tr>
		  </tbody>		
	    </table>
<%
}%>   
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


