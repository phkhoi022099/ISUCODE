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
					<li><a href="Debug_MyAccount.jsp"><span class="glyphicon glyphicon-Account"></span> Debugger Account</a></li>  
                    <li><a href="Debugger.html"><span class="glyphicon glyphicon-Debugging"></span> Debugger</a></li> 
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

<!-- DISPLAY TUTORIAL TITLES -->
<div class="container">
<div class="col-md-9">
<h1>List of Questions</h1>
<%
try{
DatabaseConnect dbc=new DatabaseConnect();
Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
String answer=request.getParameter("answer"); 
PreparedStatement ps = null;
String title=request.getParameter("title"); 
String sql="Update question set Answered = TRUE where Title =" +'"' + title+'"' +';';
ps = con.prepareStatement(sql);
System.out.println(sql);
System.out.println(answer);
System.out.println(title);

int i = ps.executeUpdate();

sql="Update question set Answer = " +'"'+ answer +'"' +" where Title =" +'"' + title+'"' +';';
ps = con.prepareStatement(sql);

ps.executeUpdate();

con.close();

} catch (Exception e) {
e.printStackTrace();
}
%>

