<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*,Validation.DatabaseConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginValidation</title>
</head>
<body>
<%
    
    try {
    	DatabaseConnect dbc=new DatabaseConnect();
        Connection con=dbc.connection();
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