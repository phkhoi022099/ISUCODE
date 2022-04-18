<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*,Validation.DatabaseConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Account</title>
</head>
<body>
<%
    
        try
         {
        DatabaseConnect dbc=new DatabaseConnect();
        Connection con=dbc.connection("com.mysql.jdbc.Driver","root","redbird!","ISU_CODE","jdbc:mysql:// localhost:3306/");
        String name=request.getParameter("name");
        String old_password=request.getParameter("old_password");
        String new_password=request.getParameter("new_password");
        Statement st = con.createStatement();
        String sql="Update accounts set Name=?,Email=?,Password=? where email="";
        ps = con.prepareStatement(sql);
        ps.setString(1,id);
        ps.setString(2, first_name);
        ps.setString(3, last_name);
        ps.setString(4, city_name);
        ps.setString(5, email);
        int i = ps.executeUpdate();
        if(i > 0)
        {
        out.print("Record Updated Successfully");
        }
        else
        {
        out.print("There is a problem in updating Record.");
        } 
         }
        	catch (SQLException ex) {
        
        System.out.println("SQLException: " + ex.getMessage());
        out.println("Registration failed Database Error! Please <a href='ContactUs.html'>Let us know</a>this error.");
    }
    %>
</body>
</html>