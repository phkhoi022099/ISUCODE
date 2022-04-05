<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginValidation</title>
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
        String email=request.getParameter("email"); 
        String password=request.getParameter("password"); 
       
        Statement st = con.createStatement();
        String sql = "SELECT * FROM accounts WHERE Email = ? and Password = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);
 
        ResultSet result = statement.executeQuery();
        if(result.next())
        {
        	out.println("Login Success");
        	response.sendRedirect("MyAccount.jsp");
        	}
        else
        {
        	out.println("Login failed! Please <a href='Login.html'> Login </a> to continue.");
        }
        
        
        }
        	catch (SQLException ex) {
        System.out.println("SQLException: " + ex.getMessage());
        out.println("Login failed Database Error! Please <a href='ContactUs.html'>Let us know</a>this error.");
    }
    %>
</body>
</html>