<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*,Validation.*" %>
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
    	Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
        String email=request.getParameter("email"); 
        String password=request.getParameter("password"); 
        Statement st = con.createStatement();
        String sql = "SELECT * FROM accounts WHERE Email = ? and Password = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);
        
        String name;
        int role;
        ResultSet result = statement.executeQuery();
        if(result.next())
        {
        	name=result.getString(1);
            role=result.getInt(4);
        	User user;
            Account acc;
            
            
        	if(role==0)
        	{
        		user = new User(name,email,password,role);
        		acc = new Account(user);
        		session.setAttribute("acc",acc);
        		response.sendRedirect("User_MyAccount.jsp");
        	}
        	else if(role==1)
        		{
        		user = new User(name,email,password,role);
        		acc = new Account(user);
        		session.setAttribute("acc",acc);
        		response.sendRedirect("Debugger_MyAccount.jsp");
        		}
        	else
        	{
        		user = new User(name,email,password,role);
        		acc = new Account(user);
        		session.setAttribute("acc",acc);
        		response.sendRedirect("Admin_MyAccount.jsp");
        	}
        	
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