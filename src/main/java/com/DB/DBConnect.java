package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    public static Connection getConnection() {
    	Connection conn = null;
        String host = "Ferbman";
        String instanceName = "MSSQLSERVER";
        String databaseName = "jojacart";
        String username = "sa";
        String password = "kerem";

        // JDBC URL for SQL Server with SSL encryption and certificate trust
        String url = "jdbc:sqlserver://" + host + "\\" + instanceName + ";databaseName=" + databaseName +
                     ";user=" + username + ";password=" + password +
                     ";encrypt=true;trustServerCertificate=true";
        
        try {
            // Load the SQL Server JDBC driver (if not loaded already)
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            // Attempt to establish the connection
            conn = DriverManager.getConnection(url);
            System.out.println("Connected to the database!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error: SQL Server JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Failed to connect to the database!");
            e.printStackTrace();
        }
        
        return conn;
    }
    

   
}
