package com.wipro.ctb.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.wipro.ctb.admin.dao.AdminDao;
import com.wipro.ctb.admin.model.Admin;
import com.wipro.ctb.connection.ConnectionDB;



public class AdminLoginServlet extends HttpServlet {


	protected void processRequest(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		response.setContentType("text/html;charset=UTF=8");
		
		RequestDispatcher dispatcher = null;
		HttpSession session = null;;
		try(PrintWriter out = response.getWriter()) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			AdminDao ado = new AdminDao(ConnectionDB.getCon());
			Admin admin = ado.logAdmin(email, password);
			
			if(admin!=null) {
				session = request.getSession();
				session.setAttribute("loggedAdmin", admin);
				response.sendRedirect("adminpanel.jsp");
			}else {
				//out.println("<font color=red size=18>Login Failed!!<br>");
				//out.println("<a href=adminlogin.jsp>Try Again!!</a>");
				out.println("<font color=red size=3 face=verdana>Username or Password Incorrect!</font>");
				RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");
				rd.include(request,response);
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
