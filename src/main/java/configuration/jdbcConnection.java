package configuration;

import java.sql.Connection;
import java.sql.DriverManager;


public class jdbcConnection
{
    public static Connection con;
    public static Connection getConnection()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/home_assistant","root","Root@123");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}

