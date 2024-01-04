<%@page import="java.sql.DriverManager"%>
<%@page import="com.wipro.ctb.connection.ConnectionDB"%>
<%@page import="com.wipro.ctb.admin.model.*"%>
<%@page import="com.wipro.ctb.user.model.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
Admin admin = (Admin) session.getAttribute("loggedAdmin");
if (admin == null) {
	response.sendRedirect("adminLogin.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" type="text/css" href="css/adminstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>

	<input type="checkbox" id="check">
	<!-- Header Area Start -->
	<header>
		<label for="check"> <i class="fa-solid fa-bars"
			id="sidebar_btn"></i>
		</label>
		<div class="left_area">
			<h3>
				Admin <span> LTE</span>
			</h3>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				<i class="fa-solid fa-user fa"></i>
			</button>
			<div class="dropdown-content">
				<a href="adminlogin.jsp"><i
					class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a> <a
					href="forgotPasswordAction.jsp"><i class="fa-solid fa-unlock"></i>
					Reset Password</a>
			</div>
		</div>
	</header>
	<!-- Header Area End  -->
	<!-- sidebar start -->
	<div class="sidebar">
		<center>
			<img
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjk0_XkA-wTB3lx2Q52LW07zU8b9EtQVrVUrY-UvPd_FDUFiMWN8hlLMWDNGjVMpuT8Rk&usqp=CAU"
				class="profile_image" alt="">
			<h4><%=admin.getName()%></h4>
		</center>

		<a href="#dash"><i class="fa-solid fa-house"></i><span>Dashboard</span></a>

		<a href="#Theatre"><i class="fa-solid fa-pen-to-square"></i><span>Movie Theatre</span></a> 
		<a href="#Movie"><i class="fa-solid fa-pen-to-square"></i><span>Movies</span></a>
		<a href="#show"><i class="fa-solid fa-pen-to-square"></i><span>Show Timing</span></a> 
		<a href="#Users"><i class="fa-solid fa-pen-to-square"></i><span>Users</span></a>
				
		<a href="#Bookings"><i class="fa-solid fa-pen-to-square"></i><span>Booking</span></a>

	</div>
	<!-- sidebar end -->

	<div class="content">
<!-- Start Of the DashBoard -->

		<div id="dash">
			<div class="header">
				<h1>Dashboard</h1>
			</div>
			<div class="cotainer">
				<div class="box">
			<% 	try{
					Connection con = ConnectionDB.getCon();
					Statement st = con.createStatement();
	
					String qry = "select count(*) as usercount from user";
					ResultSet rs = st.executeQuery(qry);
					while(rs.next()){
						int count =rs.getInt("usercount");
					%>
		
					<div class="icon"><%=count %></div>
		<%
					}
			
		}catch(Exception e){}
		%>
					
					<div class="text">
						<h3>Users</h3>
						<a href="#Users">More Info</a>
					</div>
				</div>
				<div class="box">
					<div class="icon">
					<% 	try{
					Connection con = ConnectionDB.getCon();
					Statement st = con.createStatement();
	
					String qry = "select count(*) as theatrecount from theatre";
					ResultSet rs = st.executeQuery(qry);
					while(rs.next()){
						int count =rs.getInt("theatrecount");
					%>
		
					<div class="icon"><%=count %></div>
		<%
					}
			
		}catch(Exception e){}
		%>
					</div>
					<div class="text">
						<h3>Theatres</h3>
						<a href="#Theatre">More Info</a>
					</div>
				</div>
				<div class="box">
					<div class="icon">
					
					<% 	try{
					Connection con = ConnectionDB.getCon();
					Statement st = con.createStatement();
	
					String qry = "select count(*) as moviescount from movies";
					ResultSet rs = st.executeQuery(qry);
					while(rs.next()){
						int count =rs.getInt("moviescount");
					%>
		
					<div class="icon"><%=count %></div>
		<%
					}
			
		}catch(Exception e){}
		%>
					
					</div>
					<div class="text">
						<h3>Movies</h3>
						<a href="#Movie">More Info</a>
					</div>
				</div>
				<div class="box">
					<div class="icon">04</div>
					<div class="text">
						<h3>Bookings</h3>
						<a href="#">More Info</a>
					</div>
				</div>
			</div>
		</div>

<!-- End Of the DashBoard -->
<!--Start of the Theatre  -->
		<div id="Theatre">
			<div class="header">
				<h1>Theatre List</h1>
			</div>
			<div class="opration">
				<a href="AddTheatre.jsp">Add New Theatre</a><br> <a href="DeleteTheatre.jsp">Delete
					Theatre</a>
			</div>
			<table class="styled-table">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Theatre Name</th>
						<th>Theatre Location</th>
						<th>Modify</th>
					</tr>
				</thead>
				
<%
	
	Statement st1 = null;
	ResultSet rs1 = null;
	try{
		Connection con = ConnectionDB.getCon();
		st1 = con.createStatement();
		
		String qry = "select * from theatre";
		rs1 = st1.executeQuery(qry);
		while(rs1.next()){
			%>
		
				<tbody>
					<tr>
						<td><%=rs1.getString(1) %></td>
						<td><%=rs1.getString(2) %></td>
						<td><%=rs1.getString(3) %></td>
						<td><button><i class="fa-regular fa-pen-to-square"></i></button></td>
					</tr>
					<!-- and so on... -->
				</tbody>
			<% }
		
	}catch(Exception e){}

%>
				
			</table>
		</div>
<!--End of the Theatre  -->		
<!--Start of the Movie -->		
		<div id="Movie">
			<div class="header">
				<h1>Movies List</h1>
			</div>
			<div class="opration">
				<a href="AddMovie.jsp">Add New Movie</a><br>
				<a href="DeleteMovie.jsp">Delete Movie</a>
			</div>
			<table class="styled-table">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Movie Name</th>
						<th>Trailer</th>
						<th>Theatre</th>
						<th>Description</th>
						<th>Modify</th>
					</tr>
				</thead>
<%
	
	Statement st = null;
	ResultSet rs = null;
	try{
		Connection con = ConnectionDB.getCon();
		st = con.createStatement();
		
		String qry = "select * from movies";
		rs = st.executeQuery(qry);
		while(rs.next()){
			%>
		
				<tbody>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(7) %></td>
						<td><button><i class="fa-regular fa-pen-to-square"></i></button></td>
					</tr>
					<!-- and so on... -->
				</tbody>
			<% }
		
	}catch(Exception e){}

%>

			</table>
		</div>
<!--End of the Movie-->
<!--Start of the Show  -->
	<div id="show">
			<div class="header">
				<h1>Show Timings</h1>
			</div>
			<div class="opration">
				<a href="#">Add Show</a><br>
				<a href="#">Delete show</a>
			</div>
			<table class="styled-table">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Theatre</th>
						<th>Movie</th>
						<th>Start/End Date</th>
						<th>Start/End Time</th>
						<th>Gold Full</th>
						<th>Gold Half</th>
						<th>ODC Full</th>
						<th>ODC Half</th>
						<th>Box</th>
						<th>Delete</th>
						<th>Modify</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<!-- and so on... -->
				</tbody>
			</table>
		</div>
<!--End of the Show  -->

<!--Start of the Users -->
	<div id="Users">
			<div class="header">
				<h1>Users</h1>
			</div>
			
			<table class="styled-table">
				<thead>
					<tr>
						<th>User Id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email Id</th>
						<th>Gender</th>
						<th>Present Address</th>
						<th>Mobile Number</th>
						<th>Delete</th>
						<th>Status</th>
					</tr>
				</thead>
<%
	
	Statement st3 = null;
	ResultSet rs3 = null;
	try{
		Connection con = ConnectionDB.getCon();
		st3 = con.createStatement();
		
		String qry = "select * from user";
		rs3 = st3.executeQuery(qry);
		while(rs3.next()){
			%>
		
				<tbody>
					<tr>
						<td><%=rs3.getString(1) %></td>
						<td><%=rs3.getString(3) %></td>
						<td><%=rs3.getString(4) %></td>
						<td><%=rs3.getString(10) %></td>
						<td><%=rs3.getString(6) %></td>
						<td><%=rs3.getString(7) %></td>
						<td><%=rs3.getString(9)%></td>
						<td><button><i class="fa-regular fa-trash-can"></i></button></td>
					</tr>
					<!-- and so on... -->
				</tbody>
			<% }
		
	}catch(Exception e){}

%>
			</table>
		</div>
<!--End of the Users-->

<!--Start of the Bookings -->
	<div id="Bookings">
			<div class="header">
				<h1>Bookings Details</h1>
			</div>
			
			<table class="styled-table">
				<thead>
					<tr>
						<th>S.No.</th>
						<th>User</th>
						<th>Show Id</th>
						<th>Show Date</th>
						<th>Status</th>
						<th>Booked On</th>
						<th>Seat</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<!-- and so on... -->
				</tbody>
			</table>
		</div>
<!--End of the Bookings -->
	</div>
	<!-- <h1>Hello World</h1><%=admin.getName()%> -->
</body>
</html>