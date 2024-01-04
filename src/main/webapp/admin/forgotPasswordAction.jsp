<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<% 
String email = request.getParameter("email");
String Password = request.getParameter("Password");
String newPassword = request.getParameter("newPassword");

int check = 0;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from admin where email='"+email+"' and password='"+Password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update admin set password='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("forgotPassword.jsp?msg=Invalid");
	}
}catch(Exception e){
	e.printStackTrace();
}
%>