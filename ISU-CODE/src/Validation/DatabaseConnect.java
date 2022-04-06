package Validation;
import java.sql.*;
public class DatabaseConnect {
	String driverName="com.mysql.jdbc.Driver";
    String dbUsername="root";
    String dbPassword="redbird!";
    String dbName="ISU_CODE";
    String dbURL = "jdbc:mysql:// localhost:3306/";
	public Connection connection() {
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
