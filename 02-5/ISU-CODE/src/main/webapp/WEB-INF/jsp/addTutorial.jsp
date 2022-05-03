<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bean.User"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISU CODE</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bookTableNotUsedNow.css" />
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>
	<script type="text/javascript">

	$(document).ready(function(){
		
		  $("#add").click(function(){
       //      $('#ipTable').append("<tr><td><input class='TF form-control' type='checkbox' placeholder='Source Ip' name='record' /></td><td><input type='text' class='form-control' placeholder='Tutorial Sub-Totic' name='tutorialTitle' required/></td><td><input type='text' class='form-control' placeholder='Tutorial Description' name='tutorialDesc' required/></td><tr>");
			  $('#ipTable').append("<tr><td><input class='TF form-control' type='checkbox' placeholder='Source Ip' name='record' /></td><td><input type='text' class='form-control' placeholder='Tutorial Sub-Totic' name='tutorialTitle' required/></td><td><textarea row='4' col='4' name='tutorialDesc' class='form-control'></textarea></td><tr>");
              });
	});
	function removeRow()
	{
       ;
        /* $('#ipTable tr:last').remove(); */ 
       $("table tbody").find('input[name="record"]').each(function(){
           if($(this).is(":checked")){
               $(this).parents("tr").remove();
           }
       });
       
		}
	</script>
			 
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
                    <li><a href="logout" ><span class="glyphicon glyphicon-logout"></span>Logout</a></li>
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
						
						 <div class="col-md-9">
            <span class="text-success">${msg }</span>
            <form action="${pageContext.request.contextPath}/isucode/saveTutorial" method="POST" role="form" class="form-horizontal" >
                <div class="page-header">
                    <h2>Add Tutorial</h2>
                </div>
                
                
                <div class="form-group">
                    <label for="email" class="col-md-3 control-label">Tutorial Name</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="tutorialName" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email" class="col-md-3 control-label"></label>
                    <div class="col-md-9">
                        <button id="add" class="btn btn-success">Add</button>
                        <button id="remove" class="btn btn-danger" onclick="removeRow()">Remove</button>
                    </div>
                </div>
                 <table  class="table table-striped table-bordered" style="width:100%" id="ipTable">
                      <thead>
                        <tr>
                        <th>Select</th>
                          <th>Tutorial Sub-Topic</th>
                          <th>Description</th>
          
                          
                        </tr>
                      </thead>


                      <tbody>
                      </tbody>
                      </table>
                      <div class="form__box">
                    <div class="col-md-offset-3 col-md-9">
                        <input type="submit" class="btn btn-success"> <input type="reset" value="Clear" class="btn btn-danger">
                    </div>
                </div>
            </form> 
            
           
        </div>
        
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
