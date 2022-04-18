package Validation;
import java.sql.*;
public class DatabaseConnect {
	
	public Connection connection(String driverName,String dbUsername,String dbPassword,String dbName,String dbURL) {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbURL + dbName,
                                                     dbUsername, 
                                                     dbPassword);
            return con;
		}
		catch(Exception e)
		{
			return null;
		}
		
	}

}
