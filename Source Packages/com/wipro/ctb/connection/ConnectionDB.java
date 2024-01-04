package com.wipro.ctb.connection;

import java.sql.*;

public class ConnectionDB {
	public static Connection getCon() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
		
	}
}