package com.wipro.ctb.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wipro.ctb.admin.model.Admin;
import com.wipro.ctb.user.model.StoringUserDetails;
import com.wipro.ctb.user.services.UserService;

public class UserDao implements UserService{
	
	private final Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet  rs;
	
	
	public UserDao()
	{
		this.con = null;
		
	}
	public UserDao(Connection con) {
		// TODO Auto-generated constructor stub
		this.con=con;
	}

	public StoringUserDetails logUser(String email,String password) {
		StoringUserDetails admin = null;
		try {
		query = "select * from user where mailid=? and password=?";
		pst = this.con.prepareStatement(query);
		pst.setString(1, email);
		pst.setString(2, password);
		rs=pst.executeQuery();
		if(rs.next()) {
			admin=new StoringUserDetails();
			admin.setUserID(rs.getString("user_id"));
			admin.setFirstName(rs.getString("first_name"));
			admin.setLastName(rs.getString("last_name"));
			admin.setMailID(rs.getString("mailid"));
			admin.setDateofBirth(rs.getString("date_of_birth"));
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return admin;
	}
	
	
	public int registerUser(StoringUserDetails sud)throws ClassNotFoundException
	{
		String Insert_Users_SQL="insert into user"+"(user_id,password,first_name,last_name,date_of_birth,gender,present_address,permanent_address,mnumber,mailID) values"+"(?,?,?,?,?,?,?,?,?,?);";
		int res=0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
			PreparedStatement ps=con.prepareStatement(Insert_Users_SQL)){
			ps.setString(1,StoringUserDetails.getUserID());
			ps.setString(2,StoringUserDetails.getPassword());
			ps.setString(3,StoringUserDetails.getFirstName());
			ps.setString(4,StoringUserDetails.getLastName());
			ps.setString(5,StoringUserDetails.getDateofBirth());
			ps.setString(6,StoringUserDetails.getGender());
			ps.setString(7,StoringUserDetails.getPresentAddress());
			ps.setString(8,StoringUserDetails.getPermanentAddress());
			ps.setString(9,StoringUserDetails.getMobileNo());
			ps.setString(10,StoringUserDetails.getMailID());
			
			System.out.println(ps);
			res=ps.executeUpdate();
		}		
		catch(SQLException e){
			e.printStackTrace();
		}
		return res;
	}
}
