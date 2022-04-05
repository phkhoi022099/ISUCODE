<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<%
    String driverName="com.mysql.jdbc.Driver";
    String dbUsername="root";
    String dbPassword="redbird!";
    String dbName="ISU_CODE";
    String dbURL = "jdbc:mysql:// localhost:3306/";
    RequestDispatcher rd;
    try {
    	
    	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL + dbName,
                                                     dbUsername, 
                                                     dbPassword);
        String name=request.getParameter("name"); 
        String email=request.getParameter("email"); 
        String password1=request.getParameter("password1");
        String password2=request.getParameter("password2");  
        if(password1.equals(password2))
        {
        Statement st = con.createStatement();
        st.executeUpdate("insert into accounts(Name,Email,Password,Role) values('" + name + "','" + email + "','" + password1 + "','0')");
        out.println("Registration Success! Please <a href='Login.html'> Login </a> to continue.");
   
        } 
        else
        	{
        	 out.println("Both passwords are not same! Please <a href='CreateAccount.html'>create account</a>again to continue.");
        	
        	}
        }
        	catch (SQLException ex) {
        
        System.out.println("SQLException: " + ex.getMessage());
        out.println("Registration failed Database Error! Please <a href='ContactUs.html'>Let us know</a>this error.");
    }
    %>
</body>
</html>