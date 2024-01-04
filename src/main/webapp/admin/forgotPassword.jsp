<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<style type="text/css">
	#adminlogin{
		position: absolute;
		width: 600px;
		height: 100px;
		padding: 20px;
		top:15%;
		left:27%;
		tranform:translate(-50%,-50%);
		
	}
	.form{
		padding: 20px;
	}
	.pt-1{
		padding-top:1rem;
	}
	img{
		width: 100%;
		height: auto;
	}
	h6{
	font-size: 20px;
	text-align: center;
	padding-top: 0;
	}
</style>
</head>
<body>

	<img src="https://wallpaperaccess.com/full/1679742.jpg">
	<!-- Compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<section id="adminlogin">
		<div class="card z-depth-3">
			<div class="card-panel center blue darken-1">
				<span class="card-title" style="color: white; font-family:Helvetica;">Reset Password</span>
			</div>
			<%String msg = request.getParameter("msg");
	if("done".equals(msg))
	{
	%>
	<h6>Password Changed Successfully!</h6>
	<%} %>
	<%
	if("invalild".equals(msg)){
	%>
	<h6>Some thing Went Wrong Try Again !</h6>
	<%} %>
			<form class="form" action="forgotPasswordAction.jsp" method="post">
				<div class="input-field">
					<input type="email" class="validate" name="email"required>
					<label>Enter Email Id</label>
				</div>
				<div class="input-field">
					<input type="password" class="validate" name="Password"  required>
					<label>Enter Old Password</label>
				</div>
				<div class="input-field">
					<input type="password" class="validate" name="newPassword" required>
					<label>Enter New Password</label>
				</div>
				<div class="center">
					<button type="submit" class="btn-large blue darken-1">
						reset
					</button>
				</div>
				<div class="center pt-1">
					<a href="adminlogin.jsp">Login</a>
				</div>
			</form>
		</div>
	</section>
	
</body>
</html>