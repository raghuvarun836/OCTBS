package com.wipro.ctb.user.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wipro.ctb.admin.dao.AdminDao;
import com.wipro.ctb.admin.model.Admin;
import com.wipro.ctb.connection.ConnectionDB;
import com.wipro.ctb.user.dao.UserDao;
import com.wipro.ctb.user.model.StoringUserDetails;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		response.setContentType("text/html;charset=UTF=8");
		
		RequestDispatcher dispatcher = null;
		try(PrintWriter out = response.getWriter()) {
			String email = request.getParameter("txtUserName");
			String password = request.getParameter("txtPwd");
			
			UserDao ado = new UserDao(ConnectionDB.getCon());
			StoringUserDetails admin = ado.logUser(email, password);
			if(admin!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("loggedUser", admin);
				response.sendRedirect("WelcomeUser.jsp");
			}else {
				//out.println("<font color=red size=18>Login Failed!!<br>");
				//out.println("<a href=adminlogin.jsp>Try Again!!</a>");
				out.println("<font color=red size=3 face=verdana>Username or Password Incorrect!</font>");
				RequestDispatcher rd=request.getRequestDispatcher("userlogin.jsp");
				rd.include(request,response);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			processRequest(request, response);
		}
		catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}
}