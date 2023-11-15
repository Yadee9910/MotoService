package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MotoservicesDAO {
    // Database connection parameters
    private static final String dbUrl = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
    private static final String dbUser = "isec";
    private static final String dbPassword = "EUHHaYAmtzbv";

    public static void main(String[] args) {
        Connection conn = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            if (conn != null) {
                System.out.println("Database connection established successfully.");
                // Now you can use 'conn' to perform database operations
            } else {
                System.out.println("Failed to establish a database connection.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    //inserting data values

    public int insertService(String location, String mileageStr, String vehicle_no, String message, String userName, String dateStr, String timeStr, Connection conn) throws ParseException {
        int mileage = Integer.parseInt(mileageStr);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse(dateStr);

        Time time = null;

        try {
            // Check if the timeStr matches the expected format "hh:mm"
            if (timeStr.matches("^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$")) {
                // If it matches, add ":00" to the end of the string to match SQL TIME format
                timeStr += ":00";
                // Create a Time object
                time = Time.valueOf(timeStr);
            } else {
                // Handle invalid time format
                return -1;
            }
        } catch (IllegalArgumentException e) {
            return -2;
        }

        try {
        	
            // Create a SQL INSERT statement
            String sql = "INSERT INTO vehicle_service (date, time, location, mileage, vehicle_no, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)";

            // Create a PreparedStatement
            PreparedStatement preparedStatement = conn.prepareStatement(sql);

            // Set the parameter values
            preparedStatement.setDate(1, new java.sql.Date(date.getTime())); // Current date
            preparedStatement.setTime(2, time); // Current time
            preparedStatement.setString(3, location);
            preparedStatement.setInt(4, mileage);
            preparedStatement.setString(5, vehicle_no);
            preparedStatement.setString(6, message);
            preparedStatement.setString(7, userName);
            
            // Execute the INSERT statement
            int rowsInserted = preparedStatement.executeUpdate();
            conn.close();
            // Check if the insertion was successful
            return rowsInserted;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
  
    
    

//getting the past result set
public ResultSet getPastServices(String username,Connection conn) {
	
	ResultSet pastResultSet = null;
	

try {

// Create a SQL SELECT query for past reservations
String pastSql = "SELECT * FROM vehicle_service WHERE username = ? AND CONCAT(date, ' ', time) < ? ORDER BY date, time";

PreparedStatement pastPreparedStatement = conn.prepareStatement(pastSql);

pastPreparedStatement.setString(1, username);

// Set the parameter value (current date and time)
SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String currentDateTime = dateTimeFormat.format(new Date());
pastPreparedStatement.setString(2, currentDateTime);

// Execute the SELECT queries
pastResultSet = pastPreparedStatement.executeQuery();

return pastResultSet;
	} catch (SQLException e) {
	e.printStackTrace();
	return pastResultSet;
	}


}
    


//getting the future result set
public ResultSet getFutureServices(String username,Connection conn){
	
	ResultSet futureResultSet = null;

try {

    // Create a SQL SELECT query for future reservations
    String futureSql = "SELECT * FROM vehicle_service WHERE username = ? AND CONCAT(date, ' ', time) >= ? ORDER BY date, time";
    
    // Create PreparedStatements for both queries
    PreparedStatement futurePreparedStatement = conn.prepareStatement(futureSql);
    futurePreparedStatement.setString(1, username);
    
    // Set the parameter value (current date and time)
    SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentDateTime = dateTimeFormat.format(new Date());
    futurePreparedStatement.setString(2, currentDateTime);
    
    // Execute the SELECT queries
	 futureResultSet = futurePreparedStatement.executeQuery();
	
	 return futureResultSet;
	 

		}catch (SQLException e) {
		e.printStackTrace();
		return futureResultSet;
		}
    
}
    
}
