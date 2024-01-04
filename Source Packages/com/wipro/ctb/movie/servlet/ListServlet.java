package com.wipro.ctb.movie.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.wipro.ctb.movie.dao.MovieDaoOperation;
import com.wipro.ctb.movie.model.StoringMovieDetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 
@WebServlet("/list")
public class ListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listCategory(request, response);
    }
 
    private void listCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDaoOperation dao = new MovieDaoOperation();
 
        try {
 
            List<StoringMovieDetails> listCatagory = dao.list();
            request.setAttribute("listCategory", listCatagory);
 
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryId = (String)request.getParameter("movie");
        
        System.out.println("Movie id"+" is "+categoryId);
 
        request.setAttribute("selectedCatId", categoryId);
 
        listCategory(request, response);
    }
}