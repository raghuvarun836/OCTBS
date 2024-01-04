<%@page import="java.sql.DriverManager"%>
<%@page import="com.wipro.ctb.connection.ConnectionDB"%>
<%@page import="com.wipro.ctb.user.model.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Details</title>
	<link rel="stylesheet" type="text/css" href="css/all.css">
	<script src="https://kit.fontawesome.com/2a9201dda7.js"  crossorigin="anonymous"></script>

</head>
<body>
	<p><br/></p>
	<%
		String id=(String)session.getAttribute("uid");
		String host="jdbc:mysql://localhost:3306/users";
		Statement stat=null;
		ResultSet res=null;
		Connection conn=null;
		PreparedStatement stmt=null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn=DriverManager.getConnection(host,"root","Raghu@1234");
	%>
	
	
	<form id="form" action="" method="post">
	
			<%
			
				stat=conn.createStatement();
				String u=(String)session.getAttribute("mail");
				
				System.out.println(u);
				
				String data="select * from user where user_id='"+id+"'";
				res=stat.executeQuery(data);
				
				System.out.println("outside of  loop");

				while(res.next())
				{
					System.out.println("in loop");
			%>
			<div class="crud">
		<!-- <input type="hidden" name="id" readonly value='<%=res.getString("user_id") %>' /> -->
		<div class="form">
			<label>First Name</label>
			<input type="text" class="form-control" name="fn" value='<%=res.getString("first_name") %>' />
		</div>
		<div class="form">
			<label>Last Name</label>
			<input type="text" class="form-control" name="ln" value='<%=res.getString("last_name") %>' />
		</div>
		<div class="form">
			<label>DOB:</label>
			<input type="date" class="form-control" name="dob" value='<%=res.getString("date_of_birth") %>' />
		</div>
		<div class="form">
			<label>Present Address:</label>
			<input type="text" class="form-control" name="preadd" value='<%=res.getString("present_address") %>' />
		</div>
		<div class="form">
			<label>Permanent Address:</label>
			<input type="text" class="form-control" name="peradd" value='<%=res.getString("permanent_address") %>' />
		</div>
		<div class="form">
			<label>Mobile No:</label>
			<input type="text" class="form-control" name="mno" id="mno" value='<%=res.getString("mnumber") %>' onkeydown="mnovalidation()" />
			<span id="phone-error" style="margin-bottom: 5px;color:red;"></span>
		</div>
		<div class="form">
			<label>Mail ID:</label>
			<input type="email" class="form-control" name="mid" value='<%=res.getString("mailid") %>' />
			<span id="email-error"></span>
		</div>
		
		<%
		}
		%>
		
		<button type="submit" class="btn btn-primary">Submit</button>
		<a href="WelcomeUser.jsp" style="margin-left:100px;margin-top:20px;;float:left;">Back</a>
		</div>
	</form>
	<script src="js/updatedetailsvalidation.js"></script>
</body>
</html>
<%
	//String x=request.getParameter("id");
	String a=(String)request.getParameter("fn");
	String b=(String)request.getParameter("ln");
	String c=(String)request.getParameter("dob");
	String d=(String)request.getParameter("preadd");
	String e=(String)request.getParameter("peradd");
	String f=(String)request.getParameter("mno");
	String g=(String)request.getParameter("mid");
	System.err.println("outside of loop"+a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g);

	if(a!=null&&b!=null&&c!=null&&d!=null&&e!=null&&f!=null&&g!=null){
		String query="update user set first_name=?,last_name=?,date_of_birth=?,present_address=?,permanent_address=?,mnumber=?,mailid=? where user_id='"+id+"'";
		stmt=conn.prepareStatement(query);
		stmt.setString(1,a);
		stmt.setString(2,b);
		stmt.setString(3,c);
		stmt.setString(4,d);
		stmt.setString(5,e);
		stmt.setString(6,f);
		stmt.setString(7,g);
		
		stmt.executeUpdate();
		response.sendRedirect("WelcomeUser.jsp");
	}
%>