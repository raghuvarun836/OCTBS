package com.wipro.ctb.admin.dao;
import java.sql.*;
import com.wipro.ctb.admin.model.Admin;
import com.wipro.ctb.admin.services.AdminService;

public class AdminDao implements AdminService{
	private final Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet  rs;
	
	public AdminDao(Connection con) {
		this.con = con;
	}
	@Override
	public Admin logAdmin(String email,String password) {
		Admin admin = null;
		try {
		query = "select * from admin where email=? and password=?";
		pst = this.con.prepareStatement(query);
		pst.setString(1, email);
		pst.setString(2, password);
		rs=pst.executeQuery();
		if(rs.next()) {
			admin=new Admin();
			admin.setId(rs.getInt("id"));
			admin.setName(rs.getString("name"));
			admin.setEmail(rs.getString("email"));
			admin.setDob(rs.getString("dob"));
			admin.setRoles(rs.getString("role"));
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return admin;
	}
	
}
