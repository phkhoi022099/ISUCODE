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
                    <li><a href="${pageContext.request.contextPath}/isucode/logout" ><span class="glyphicon glyphicon-logout"></span>Logout</a></li>
                   <%--  <li><a href="${pageContext.request.contextPath}/isucode/loginasuser" ><span class="glyphicon glyphicon-logout"></span>Login As User</a></li> --%>
                  <!--   <li><div class="form-group"><button type="submit" class="btn btn-danger">LOGOUT</button></li>  -->
                    <%
	
    %>
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

    	<div class="container">
			<div class="row">
				<div class="col-md-3">
					<img style="width: 100%;" src="${pageContext.request.contextPath}/resources/images/shot pic/redbirdISU.jpg" alt="redbird">
				</div>
				<div class="col-md-5">
					
				</div>
   
    	
				<div class="col-md-4">
					<section class="results">
						<br/>
						<br/>
						
					</section>
				</div>
					<div class="container rounded bg-white mt-5">
					<div class="row">
						 <table  class="table table-striped table-bordered" style="width:70%" >
						 <thead>
                        <tr>
                        <th>Question ID</th>
                          <th>Question</th>
                          <th>User Email</th>
                          <th>Comments</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
						 
						 <tr><td>${ques.qid}</td><td>${ques.question}</td><td>${ques.userEmail}</td>
						 <td style="width:300px;">
						 <c:forEach items="${ques.posts}" var="userPost">
						   <p><b>==>></b>${userPost.post}</p><br>
						 </c:forEach>
						 </td>
						 <td>
						 <form action="${pageContext.request.contextPath}/isucode/addOrUpdateAnswer" method="post">
						 <textarea class="form-control" rows="10" cols="10" aria-label="With textarea" name="answer">${ques.answer }</textarea>
						 <input type="hidden" name="qid" value="${ques.qid}"/>
						 <button type="submit" class="btn btn-primary">Submit</button>
						 </form>
						
						 </tr>
						 </tbody>
						 </table>
						
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
