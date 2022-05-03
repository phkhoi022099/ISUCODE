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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 $( document ).ready(function() {
	    $('#otpDiv').hide();
	    $('#newPasswordDiv').hide();
	    $('#confirmPasswordDiv').hide();
	    
	});


 </script>
  <script>
  
  function forgotPass()
  {
	  var btnVal=$('#submitBtn').text();
	 
	  if(btnVal=='Submit')
		 { 
	  
  var email=$('#email').val();
  var baseUrl = "${pageContext.request.contextPath}/isucode/forgotPasswordAction/"+email;
		$.ajax({
			type : "POST",
			cache: false,
		    contentType: false,
		    processData: false,
			dataType : "json",
			url : baseUrl,
			data: JSON.stringify({ email:email}),
			success : function(data) {
					alert(data);
					var ind=data.indexOf("OTP");
					if(ind>=0)
						{
						$('#submitBtn').text('validate');
					   $('#otpDiv').show();
				       $('#newPasswordDiv').show();
				        $('#confirmPasswordDiv').show();
						}
			},
			error : function(err) {
				//alert("error===" + JSON.stringify(err));
				console.log("error===" + JSON.stringify(err));
			}
		});
		 }
	  else if(btnVal=="validate")
		  {
		  
		  var email=$('#email').val();
		  var otp=$('#otp').val();
		  var newPassword=$('#newPassword').val();
		  var confirmPassword=$('#confirmPassword').val();
		  var baseUrlchange = "${pageContext.request.contextPath}/isucode/changePassword/"+email+"/"+otp+"/"+newPassword+"/"+confirmPassword;
				$.ajax({
					type : "POST",
					cache: false,
				    contentType: false,
				    processData: false,
					dataType : "json",
					url : baseUrlchange,
					data: JSON.stringify({ email:email,otp:otp,newPassword:newPassword,confirmPassword:confirmPassword}),
					success : function(data) {
							alert(data);
							window.location.href = "${pageContext.request.contextPath}/isucode/login";
							
					},
					error : function(err) {
						//alert("error===" + JSON.stringify(err));
						console.log("error===" + JSON.stringify(err));
					}
				});


		  
		  } 
		return false;
  }
  
		</script>
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
                         
                         <li><a href="login"><span class="glyphicon glyphicon-login"></span> Login</a></li>
                         <li><a href="${pageContext.request.contextPath}/isucode/createAccount""><span class="glyphicon glyphicon-Create"></span> Create Account</a></li>
                        <!--  <li><a href="${pageContext.request.contextPath}/isucode/getAccount"><span class="glyphicon glyphicon-Account"></span> My Account</a></li>  
                         <li><a href="${pageContext.request.contextPath}/isucode/getTutorials"><span class="glyphicon glyphicon-Tutorials"></span> Tutorials</a></li> 
                         <li><a href="${pageContext.request.contextPath}/isucode/getDebugger"><span class="glyphicon glyphicon-Debugging"></span> Debugging</a></li> 
                         <li><a href="Admin.html"><span class="glyphicon glyphicon-admin"></span> Admin</a></li>
                         <li><a href="Logout.html"><span class="glyphicon glyphicon-logout"></span> Logout</a></li> -->
                     </ul>
                 </div>
              </nav>
           </div>
           
           <div style="height: 180px; display:flex; align-items:center; justify-content:center;">
             <img style="height: 180px;"src="${pageContext.request.contextPath}/resources/images\shot pic\sealISU.png" alt="seal  test">
           </div>
        </div>  
       
     </header>   

     <div class="container">
        <div class="row">
            <div class="col-md-3">
                <img style="width: 100%;" src="${pageContext.request.contextPath}/resources/images\shot pic\redbirdISU.jpg" alt="redbird">
            </div>
            <div class="col-md-9">
               <span class="text-success">${msg}</span>
                <div class="page-header">
                    <h2>Forgot Password</h2>
                </div>
                
                <form action="${pageContext.request.contextPath}/isucode/forgotPasswordAction" method="post" onSubmit="return forgotPass();">	
              
                
                
                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label">Email</label>
                        <div class="col-md-9">
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                    </div>

                    <div class="form-group" id="otpDiv" >
                        <label for="password1" class="col-md-3 control-label">OTP</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="otp" id="otp" >
                        </div>
                    </div>
                     <div class="form-group" id="newPasswordDiv">
                        <label for="password1" class="col-md-3 control-label">New Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="newPassword" id="newPassword" >
                        </div>
                    </div>
                     <div class="form-group" id="confirmPasswordDiv">
                        <label for="password1" class="col-md-3 control-label">Confirm Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" >
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <div class="col-md-offset-9 col-md-3">
                           <div class="row">
                            <button type="submit" id="submitBtn" class="btn btn-primary">Submit</button>
                            
                            </div>
                        </div>
                    </div> 
                </form>
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
                            <li><a href="${pageContext.request.contextPath}/isucode/ContactUs">Contact Us</a></li>                               
                                    						
                        </ul>  
                    </div>
                </nav>
            </div>  <!-- end container -->
        </div>  <!-- end mainNavigationRow -->
    </footer>
    
    </body>
    </html>


