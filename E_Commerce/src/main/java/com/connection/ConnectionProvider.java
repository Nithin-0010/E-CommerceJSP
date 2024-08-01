package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection getCon() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/online_shop";
			Connection con =DriverManager.getConnection(url, "root", "admin");
			return con;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
}
