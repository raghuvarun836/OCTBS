package com.wipro.ctb.movie.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.wipro.ctb.movie.dao.MovieDao;
import com.wipro.ctb.movie.model.StoringMovieDetails;

/**
 * Servlet implementation class MovieServlet
 */

@WebServlet("/storemovie")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MovieDao md=new MovieDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher rd=request.getRequestDispatcher("/users/WelcomeUser.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mid=request.getParameter("txtmovieid");
		String mn=request.getParameter("txtmoviename");
		String p=request.getParameter("poster");
		String tr=request.getParameter("trailer");
		String th=request.getParameter("theatre");
		String ti=request.getParameter("timings");
		String d=request.getParameter("description");
		
		StoringMovieDetails smd=new StoringMovieDetails();
		smd.setMovieID(mid);
		smd.setMovieName(mn);
		smd.setPoster(p);
		smd.setTrailer(tr);
		smd.setTheatre(th);
		smd.setTimings(ti);
		smd.setDescription(d);
		
		try {
			md.registerTheatre(smd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("admin/adminpanel.jsp");
	}

}
