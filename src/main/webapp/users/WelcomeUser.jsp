<%@page import="java.sql.DriverManager"%>
<%@page import="com.wipro.ctb.connection.ConnectionDB"%>
<%@page import="com.wipro.ctb.user.model.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
String mail=StoringUserDetails.getMailID();
String uid=StoringUserDetails.getUserID();

String gender="";
String per_address="";
String mo="";
String address="";

try {
	//PrintWriter pw=response.getWriter();
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Raghu@1234");
	
	String qry="select * from user where user_id=?";
	PreparedStatement ps1=con.prepareStatement(qry);
	ps1.setString(1,uid);
	
	ResultSet rs=ps1.executeQuery();
	while(rs.next())
	{
		gender=rs.getString(6);
		address=rs.getString(7);
		per_address=rs.getString(8);
		mo=rs.getString(9);
	}
	
	}
	catch(Exception e)
{
		
}


session.setAttribute("mail",mail);
session.setAttribute("address",address);
session.setAttribute("uid",uid);


StoringUserDetails admin = (StoringUserDetails) session.getAttribute("loggedUser");
if (admin == null) {
	response.sendRedirect("userlogin.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
<link rel="stylesheet" type="text/css" href="css/userstyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">

<script type="text/javascript">
	document.querySelector(".sidebar .sidebar-menu").addEventListener("click",function(){
		document.querySelector(".sidebar").classList.toggle("active");
	});
</script>

<style type="text/css">
	.slider-frame{
		overflow: hidden;
		height: 800px;
		width: 950px;
		margin-left: 30px;
		margin-top: 30px;
	}
	
	@-webkit-keyframes slide_animation{
		0%{left:0px;}
		10%{left:0px;}
		20%{left:1200px;}
		30%{left:1200px;}
		40%{left:2400px;}
		50%{left:2400px;}
		60%{left:1200px;}
		70%{left:1200px;}
		80%{left:0px;}
		90%{left:0px;}
		100%{left:0px;}
	}
	.slide-images{
		width: 3600px;
		height: 800px;
		margin: 0 0 0 -2400px;
		position: relative;
		-webkit-animation-name: slide_animation;
		-webkit-animation-duration: 33s;
		-webkit-animation-iteration-count:infinite;
		-webkit-animation-direction: alternate;
		-webkit-animation-play-state: running;
	}
	.img-container{
		height: 800px;
		width: 1200px;
		position: relative;
		float: right;
	}
	img{
		object-fit: fill;
	}
	
	.section .details .h3{
		margin: 4px;
	}
	.section .update{
		margin-left: 50px;
		margin-top: 50px;
	}
	.section .details span{
		margin-left: 50px;
		color: grey;
	}
</style>

</head>
<body>
	<input type="checkbox" id="nav-toggle">
	<div class="sidebar">
		<div class="sidebar-brand">
			<h2><span class="fa-solid fa-ticket"></span><span>Welcome, <%=admin.getLastName()%></span></h2>
		</div>

		<div class="sidebar-menu">
			<ul>
				<li>
					<a href="#dashboard"><span class="fa-solid fa-house-user"></span>
					<span>Dashboard</span></a>
				</li>

				<li>
					<a href="#Movie"><span class="fa-solid fa-film"></span>
					<span>Movies</span></a>
				</li>

				<li>
					<a href="#profilesettings"><span class="fa-solid fa-gears"></span>
					<span>Profile Settings</span></a>
				</li>
			</ul>
		</div>
	</div>

	<div class="main-content">
		<header>
			<h2>
				<label for="nav-toggle">
					<span class="fa-solid fa-bars"></span>
				</label>
			</h2>
			<div class="search-wrapper">
				<span class="fa-solid fa-search"></span>
				<input type="search" placeholder="search here"/>
			</div>
			<div class="user-wrapper">
				<a href="userlogout.jsp" ><span class="fa-solid fa-right-from-bracket"></span><span>Logout</span></a>
			</div>
		</header>
		<main>
		
		<div class="section" id="dashboard">
			<h1>Dashboard  <small style="color:orange;">Trending</small></h1>
			<div class="slider-frame">
				<div class="slide-images">
					<div class="img-container">
						<img src="https://akm-img-a-in.tosshub.com/businesstoday/images/story/202204/untitled-1_15-sixteen_nine_0-sixteen_nine.jpg?size=948:533">
					</div>
					<div class="img-container">
						<img src="https://wallpapercave.com/dwp1x/wp8453227.jpg">
					</div>
					<div class="img-container">
						<img src="https://akm-img-a-in.tosshub.com/indiatoday/images/story/202107/Vikram_first_look_poster_out_1200x768.jpeg?WXowq9J6LjTNrSBPCOLncdCAO4eq7Kd9&size=770:433">
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="section" id="Movie">
			<div class="header">
				<h1 style="margin-bottom: 30px;">Movies</h1>
			</div>
			<table class="styled-table">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Movie Name</th>
						<th>Trailer</th>
						<th>Theatre</th>
						<th>Description</th>
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
						<!-- <td><%=rs.getString(4) %></td> -->
						<td><a href="<%=rs.getString(4) %>" style="color:red; padding-top: 0px; padding-left: 0px" 
									onMouseOut="this.style.color='red'"
        							onMouseOver="this.style.color='hotpink'">click here</a></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(7) %></td>
						
					</tr>
					
					<!-- and so on... -->
				</tbody>
			<% }
		
	}catch(Exception e){}
%>

			</table>
			<a href="BookTickets.jsp"><button  style="color:red; padding-top: 0px; padding-left: 0px; margin-top:10px;cursor:pointer;float:right; padding:10px; border-radius: 10px;"
												onMouseOut="this.style.color='red'"
        										onMouseOver="this.style.color='green'">Book Tickets</button></a>
		</div>
		
		<div class="section" id="profilesettings">
			<h1>Profile Settings</h1>
			<div class="update">
				<div class="details">
					<h3><label>First Name &emsp;&emsp;&emsp;&emsp;&emsp;:<span><%=admin.getFirstName()%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Last Name &emsp;&emsp;&emsp;&emsp;&emsp;:<span><%=admin.getLastName()%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Date of Birth &emsp;&emsp;&emsp;&emsp;:<span><%=admin.getDateofBirth()%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Gender &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;:<span><%=gender%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Present Address &emsp;&emsp;:<span><%=address%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Permanent Address &ensp;:<span><%=per_address%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Mobile No &emsp;&emsp;&emsp;&emsp;&emsp;:<span><%=mo%></span> </label></h3><br></br>
				</div>
				<div class="details">
					<h3><label>Mail Id &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;:<span><%=admin.getMailID()%></span> </label></h3><br></br>
				</div>
			</div>
		
			
			<a href="updateDetails.jsp"><button  style="color:red; padding-top: 0px; padding-left: 0px; margin-top:10px;cursor:pointer;float: right; padding:10px; border-radius: 10px;"
												onMouseOut="this.style.color='red'"
        										onMouseOver="this.style.color='green'">Edit Details</button></a>
		</div>
		
		</main>
	</div>
</body>
</html>