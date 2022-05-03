<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.bean.User"%>
   


<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bookTableNotUsedNow.css" />
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
					
					<%
					  User user=(User)session.getAttribute("user");
					  if(user.getRole().equals("admin"))
					  {
					%>
					<li><a href="${pageContext.request.contextPath}/isucode/adminPage"><span class="glyphicon glyphicon-Account"></span> Admin Part</a></li> 
					<%}else if(user.getRole().equals("debugger")) 
					{
					%> 
					<li><a href="${pageContext.request.contextPath}/isucode/debuggerPage"/isucode/adminPage"><span class="glyphicon glyphicon-Account"></span>Debugger Part</a></li> 
					<%} %>
					<li><a href="${pageContext.request.contextPath}/isucode/getAccount"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                    <li><a href="${pageContext.request.contextPath}/isucode/getTutorials"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                    <li><a href="${pageContext.request.contextPath}/isucode/getDebugger"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                   <!--  <li><a href="Admin.html"><span class="glyphicon glyphicon-admin"></span> Admin</a></li> -->
                     <li><a href="${pageContext.request.contextPath}/isucode/logout"><span class="glyphicon glyphicon-logout"></span> Logout</a></li>
				</ul>
            </div>
         </nav>
      </div>
	  
	  <div style="height: 180px; display:flex; align-items:center; justify-content:center;">
		<img style="height: 180px;"src="${pageContext.request.contextPath}/resources/images\shot pic\sealISU.png" alt="seal  test">
	  </div>
   </div>  
</header>  

<body>

<!-- Debugging LANGUAGES -->
    <div class="container">  
    <div class="container">
          
 	
		<h1>Forum for coding questions</h1>
		<h2>ask a question and get answers</h2>
		
		</div>
		
		<!--  TEXTBOX Coding Question -->
		<div class="container">
		<div class="col-md-9">
		<form action="${pageContext.request.contextPath}/isucode/saveQuestion" method="POST">  
  		<div class="form-group">
  		<span class="input-group-text">Ask a code question</span>
  		<textarea class="form-control" aria-label="With textarea" name="question"></textarea>
  		
		
		
		
    	<button type="submit" class="btn btn-primary">Submit</button>
		</div>
		</form>
		</div>
	</div>
		
		<!--  ANSWER Section -->
		 <div class="container">
		<div class="col-md-12">
		<caption class="results__caption"><h2>User Questions and Answers</h2></caption>
		<c:forEach items="${ques}" var="q">
					<table class="table table-bordered" style="	font-weight: bold;font-size: 15px;">
						
						
						<tr>
							<td >Q:- ${q.question }</td> 				 
						</tr>
						<tr>
							<td >Answer:- ${q.answer }</td> 				 
						</tr>
						<tr>
						<td><a  href="${pageContext.request.contextPath}/isucode/getHelpful/${q.qid }" class="btn btn-danger btn-sm" > Helpful </a>${q.helpful }
						<a href="${pageContext.request.contextPath}/isucode/getUnhelpful/${q.qid }" class="btn btn-danger btn-sm" > Unhelpful</a>${q.unhelpful }
						 </td>     
						</tr>
						<c:forEach items="${q.posts}" var="pst">
						<tr style="border-top: white ;">
							<td > ${pst.post }</td> 			 
						</tr>
						<tr>
							<td ><a href="${pageContext.request.contextPath}/isucode/deletePost/${pst.pid}" class="btn btn-danger btn-sm" >Delete</a></td> 			 
						</tr>
						</c:forEach>
						<tr>
						<td>
						 <form action="${pageContext.request.contextPath}/isucode/savePost" method="POST">  
  		                   <div class="form-group">
  		                     <span class="input-group-text">post a comment</span>
  		                        <textarea class="form-control" aria-label="With textarea" name="post"></textarea>
    	                        <input type="hidden" name="qid" value="${q.qid }"/>
    	                        <button type="submit" class="btn btn-primary">Submit</button>
		                   </div>
		                 </form>
		                <td>
		                </tr>
						
					</table>
					
					</c:forEach>
				</div>
             </div>
    </div> <!-- end container -->

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