package com.wipro.ctb.theatre.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.wipro.ctb.theatre.dao.TheatreDao;
import com.wipro.ctb.theatre.model.StoringTheatreDetails;

/**
 * Servlet implementation class TheatreServlet
 */

@WebServlet("/storetheatre")
public class TheatreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TheatreDao td=new TheatreDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TheatreServlet() {
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
		//doGet(request, response);
		String tid=request.getParameter("txtTheatreId");
		String tn=request.getParameter("txtTheatreName");
		String tl=request.getParameter("txtTheatreLocation");
		
		StoringTheatreDetails std=new StoringTheatreDetails();
		std.setTheatreID(tid);
		std.setTheatreName(tn);
		std.setTheatreLocation(tl);
		
		try {
			td.registerTheatre(std);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("admin/adminpanel.jsp");
	}

}
