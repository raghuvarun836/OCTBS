package com.wipro.ctb.user.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.wipro.ctb.user.dao.UserDao;
import com.wipro.ctb.user.model.StoringUserDetails;


/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDao ud=new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		String uid=request.getParameter("txtUserId");
		String pwd=request.getParameter("txtPwd");
		String fn=request.getParameter("txtFirstName");
		String ln=request.getParameter("txtLastName");
		String dob=request.getParameter("dob");
		String g=request.getParameter("gender");
		String presentadd=request.getParameter("PresentAddress");
		String permanentadd=request.getParameter("PermanentAddress");
		String mn=request.getParameter("Mnumber");
		String mid=request.getParameter("mailId");
		
		StoringUserDetails sud=new StoringUserDetails();
		sud.setUserID(uid);
		sud.setPassword(pwd);
		sud.setFirstName(fn);
		sud.setLastName(ln);
		sud.setDateofBirth(dob);
		sud.setGender(g);
		sud.setPresentAddress(presentadd);
		sud.setPermanentAddress(permanentadd);
		sud.setMobileNo(mn);
		sud.setMailID(mid);
		
		try {
			ud.registerUser(sud);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("users/userlogin.jsp");
	}

}