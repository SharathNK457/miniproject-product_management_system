package com.pms.dao ;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pms_db",
                "root",
                "password"
            );

        } catch (Exception e) {
            e.printStackTrace();
        	    System.out.println("DB Error: " + e.getMessage());
    
        
            
        }

        return con;
    }
}