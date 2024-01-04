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
		top:25%;
		left:50%;
		transform:translate(-50%,-50%);
		
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
</style>
</head>
<body scroll="no" style="overflow:hidden;">

	<img src="https://wallpaperaccess.com/full/1679742.jpg">
	<!-- Compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<section id="adminlogin">
		<div class="card z-depth-3">
			<div class="card-panel center blue darken-1">
				<span class="card-title" style="color: white; font-family:Helvetica;">Admin Login</span>
			</div>
			<form class="form" action="AdminLoginServlet" method="post" onsubmit="return validate()">
				<div class="input-field">
					<input type="email" class="validate" name="email" id="email" required>
					<label>Email</label>
				</div>
				
				<div class="input-field">
					<input type="password" class="validate" name="password" id="password" required>
					<label>Password</label>
				</div>
				<div class="center">
					<button type="submit" class="btn-large blue darken-1">
						Sign In
					</button>
				</div>
				<div class="center pt-1">
					<a href="forgotPassword.jsp">Reset Password</a>
				</div>
			</form>
		</div>
	</section>
	<script src="adminjs.js"></script>
</body>
</html>