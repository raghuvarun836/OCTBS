package com.wipro.ctb.theatre.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.wipro.ctb.theatre.model.StoringTheatreDetails;

public class TheatreDao {
	public int registerTheatre(StoringTheatreDetails std)throws ClassNotFoundException, SQLException
	{
		String Insert_Theatre_SQL="insert into theatre"+" (theatre_id,theatre_name,theatre_location) values "+" (?,?,?);";
		int res=0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
			PreparedStatement ps=con.prepareStatement(Insert_Theatre_SQL)){
			ps.setString(1,StoringTheatreDetails.getTheatreID());
			ps.setString(2,StoringTheatreDetails.getTheatreName());
			ps.setString(3,StoringTheatreDetails.getTheatreLocation());

			
			System.out.println(ps);
			res=ps.executeUpdate();
			
			
		}		
		catch(SQLException e){
			e.printStackTrace();
		}
		return res;
	}

	public void deleteTheatre(StoringTheatreDetails std) throws ClassNotFoundException,SQLException {
		// TODO Auto-generated method stub
		
		String query = "delete from theatre where theatre_id=?";
		
		String name="";
		int res=0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
			PreparedStatement ps=con.prepareStatement(query)){
			ps.setString(1,StoringTheatreDetails.getTheatreID());
			name=StoringTheatreDetails.getTheatreName();
			System.out.println(ps);
			res=ps.executeUpdate();
			
			if(res>0)
				;
			else
				System.out.println("Went wrong");
			
			
		}		
		catch(SQLException e){
			e.printStackTrace();
		}
		
		String del_movie_query="delete from movies where movie_theatre=?";
		try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
				PreparedStatement ps=con.prepareStatement(del_movie_query)){
				ps.setString(1,name);
				
				System.out.println(ps);
				res=ps.executeUpdate();
				
				if(res>0)
					;
				else
					System.out.println("Went wrong");
				
				
			}		
			catch(SQLException e){
				e.printStackTrace();
			}
		
	}
}