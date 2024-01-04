package com.wipro.ctb.movie.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.wipro.ctb.movie.model.StoringMovieDetails;
import com.wipro.ctb.theatre.model.StoringTheatreDetails;

public class MovieDao {
	public int registerTheatre(StoringMovieDetails smd)throws ClassNotFoundException, SQLException{
		String Insert_Movie_SQL = "insert into movies"+"(movie_id,movie_name,movie_poster,movie_trailer,movie_theatre,movie_timings,movie_description) values"+"(?,?,?,?,?,?,?);";
		int res=0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
				PreparedStatement ps=con.prepareStatement(Insert_Movie_SQL)){
				ps.setString(1,StoringMovieDetails.getMovieID());
				ps.setString(2,StoringMovieDetails.getMovieName());
				ps.setString(3,StoringMovieDetails.getPoster());
				ps.setString(4,StoringMovieDetails.getTrailer());
				ps.setString(5,StoringMovieDetails.getTheatre());
				ps.setString(6,StoringMovieDetails.getTimings());
				ps.setString(7,StoringMovieDetails.getDescription());

				
				System.out.println(ps);
				res=ps.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}

	public void deleteMovie(StoringMovieDetails smd) throws ClassNotFoundException {
		// TODO Auto-generated method stub
		String query = "delete from movies where movie_id=?";
		int res=0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
			PreparedStatement ps=con.prepareStatement(query)){
			ps.setString(1,StoringMovieDetails.getMovieID());
			
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
