package com.wipro.ctb.movie.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.wipro.ctb.movie.model.StoringMovieDetails;
public class MovieDaoOperation {
    String databaseURL = "jdbc:mysql://localhost:3306/users";
    String user = "root";
    String password = "Raghu@1234";
     
    public List<StoringMovieDetails> list() throws SQLException {
        List<StoringMovieDetails> listCategory = new ArrayList<>();
         
        try (Connection connection = DriverManager.getConnection(databaseURL, user, password)) {
            String sql = "SELECT * FROM movies ORDER BY movie_name";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
             
            while (result.next()) {
                String id = result.getString("movie_id");
                String name = result.getString("movie_name");
                System.out.println(name);
                StoringMovieDetails category = new StoringMovieDetails(id, name);
                     
                listCategory.add(category);
            }   
            
            
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
        
        return listCategory;
    }
}