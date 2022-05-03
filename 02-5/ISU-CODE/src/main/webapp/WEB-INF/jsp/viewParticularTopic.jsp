<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.Tutorial"%>
<%@ page import="com.bean.User"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ISU CODE</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap-3.0.0/dist/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bookTableNotUsedNow.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
	<script type="text/javascript">

	$( document ).ready(function() {	
	    $(".topic").click(

	         function()
	         {
		         var titid=$(this).attr("id");
		         var descid=titid.replace("tit","des");
		         $('#description').html($('#'+descid).val());
	        	 /* var parentHtml=$(this).parent().html();
	        	 var valArr=parentHtml.split("value=");
	        	 var finalVal=valArr[1].replace('"',"").replace('"',"").replace(">","");
	        	 console.log(finalVal);
	        	 $('#description').text(finalVal); */

	          } );
	});
	</script>
<script type="text/javascript">
function searchShow(id)
{
	var titId=id;
	var desId=id.replace("tit","desc");
	 $('#description').html($('#'+desId).val());

	}


function  search()
{
	//alert("hi");
	
var searchTxt=$("#TutorialSearch").val();
var baseUrl = "${pageContext.request.contextPath}/isucode/searchTutorial/" + searchTxt;
	$.ajax({
		type : "GET",
		contentType : "application/json",
		dataType : "json",
		url : baseUrl,
		success : function(data) {
			
			var res=JSON.stringify(data);
			//alert(res);
			//searchT
			$("#searchRes tr").remove();
			for(var i=0;i<data.length;i++)
				{
				
			$('#searchRes').append("<tr><td><a href='javascript:void(0)' class='search1'  id=tit"+i+" onClick='searchShow(this.id);'>"+data[i].title+"</a><input type='hidden' value='"+data[i].desc+"' id=desc"+i+"></td></tr>");
				}
		},
		error : function(err) {
			//alert("error===" + JSON.stringify(err));
			console.log("error===" + JSON.stringify(err));
		}
	}); 

}


</script>

</head>
<header>
	<div id="topHeaderRow">

		<div class="container">
			<nav class="navbar navbar-inverse " role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-ex1-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<p class="navbar-text">
						Welcome to <strong>ISU CODE</strong>
					</p>
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
					<li><a href="${pageContext.request.contextPath}/isucode/debuggerPage"><span class="glyphicon glyphicon-Account"></span>Debugger Part</a></li> 
					<%} %>
						
						<!-- <li><a href="Login.html"><span class="glyphicon glyphicon-login"></span> Login</a></li>
					<li><a href="CreateAccount.html"><span class="glyphicon glyphicon-Create"></span> Create Account</a></li> -->
						<li><a href="${pageContext.request.contextPath}/isucode/getAccount"><span
								class="glyphicon glyphicon-Account"></span> My Account</a></li>
						<li><a href="${pageContext.request.contextPath}/isucode/getTutorials"><span
								class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li>
						<li><a href="${pageContext.request.contextPath}/isucode/getDebugger"><span
								class="glyphicon glyphicon-Debugging"></span> Debugging</a></li>
						<li><a href="${pageContext.request.contextPath}/isucode/logout"><span
								class="glyphicon glyphicon-logout"></span>Logout</a></li>
						<!--   <li><div class="form-group"><button type="submit" class="btn btn-danger">LOGOUT</button></li>  -->
						<%
							
						%>
					</ul>
				</div>
			</nav>
		</div>

		<div
			style="height: 180px; display: flex; align-items: center; justify-content: center;">
			<img style="height: 180px;"
				src="${pageContext.request.contextPath}/resources/images\shot pic\sealISU.png"
				alt="seal  test">
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

					<%
						List<Tutorial> tutorials = (List<Tutorial>) request.getAttribute("tutorials");
					 Tutorial tutorial = (Tutorial) request.getAttribute("totorial");
					 int tutid=tutorial.getTid();
					for (Tutorial tut : tutorials) {
					%>

					<ul class="nav nav-pills nav-stacked">
						<li><a
							href="${pageContext.request.contextPath}/isucode/viewParticularTopic/<%=tut.getTid() %>"
							class="text-danger"><%=tut.getTname()%></a>
							<ul class="nav nav-pills nav-stacked">
							<%
							String[] title=null;
		                      title=tut.getTitle();
		                      String[] desc=null;
		                      desc=tut.getTdesc();
		            			for(int i=0; i<title.length;i++)
		            			{ 
		            				if(tutid==tut.getTid())
		            				{
                                    System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"+desc[i]);
                                     
                      %>
								<li style="margin-left:10px;"><a href="javascript:void(0)" id="tit<%=i%>" class="text-success topic" ><%=title[i] %></a>
								
								<input type="hidden" id="des<%=i%>" value="<%=StringEscapeUtils.escapeHtml4(desc[i])%>"/>
								
								<%} }%>
							</ul></li>

					</ul>
					<%
						}
					%>

				</div>
			</div>

			<!-- SEARCH -->
			 <div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">Search for Tutorial</h3>
				</div>
				<div class="container">
		<div class="row">
			
				<fieldset class="form__panel">
					</br>
					<label>Enter Tutorial Title</label>
					<input type="text" class="textbox" name="TutorialSearch"  id="TutorialSearch" value="">
					</br>
					</br>
					<button class="btn btn-danger" onclick="search();">Submit</button>
					</fieldset>
					
					<table id="searchRes">
					<thead>
					  <tr><th>Search Results</th></tr>
					</thead>
					
					<tbody>
					
		
					
					</tbody>
					
					</table>
					</div>
					</div>
			</div>       
		</div>
		<h2 id="description"></h2>
		<div class="container">

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-5"></div>


				<div class="col-md-4">
					<section class="results">
						<br /> <br />

					</section>
				</div>
				<div class="container rounded bg-white mt-5">
					<div class="row">
					
					
					
					
					</div>
				</div>
			</div>
		</div>
		
		<footer>
			<div id="mainNavigationRow">
				<div class="container">
					<nav class="navbar navbar-inverse" role="navigation">
						<div class="collapse navbar-collapse navbar-ex1-collapse">
							<ul class="nav navbar-nav">
								<li><a href="${pageContext.request.contextPath}/isucode/AboutUs">About Us</a></li>

							</ul>
						</div>
					</nav>
				</div>
				<!-- end container -->
			</div>
			<!-- end mainNavigationRow -->

			<div id="copyrightRow">
				<div class="container">
					<div class="row">
						<p class="text-muted">
							All images are copyright to their owners. <span
								class="pull-right">&copy; 2019 Copyright</span>
						</p>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>
