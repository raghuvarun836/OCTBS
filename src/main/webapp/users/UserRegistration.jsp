<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<link rel="stylesheet" href="css/userregistrationstyle.css">
<script src="https://kit.fontawesome.com/2a9201dda7.js"  crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="container">
		<form id="form" action="<%=request.getContextPath()%>/register" method=post>
		<h1>Create Account</h1>
			<div class="input-group">
				<label>UserID:</label><br></br>
				<input type="text" name=txtUserId id="userID" onkeydown="userid()" readonly>
			</div>
			<div class="input-group">
				<label>Enter Password:</label>
				<input type="password" id="epassword" placeholder="Enter Password" onkeydown="passwordvalidation()" required>
				<span id="epass-error"></span>
			</div>
			<div class="input-group">
				<label>Confirm Password:</label>
				<input type="password" name=txtPwd id="cpassword" placeholder="Confirm Password" onkeydown="passwordvalidation()" required>
				<span id="cpass-error"></span>
			</div>
			<div class="input-group">
				<label>First Name:</label>
				<input type="text" name=txtFirstName id="firstname" placeholder="Enter First Name" required>
			</div>
			<div class="input-group">
				<label>Last Name:</label>
				<input type="text" name=txtLastName id="lastname" placeholder="Enter last Name" required>
			</div>
			<div class="input-group">
				<label>DOB:</label>
				<input type="date" name=dob id="dob" required>
			</div>
			<div class="input-group">
				<label>Gender:</label>
					<div class="input-group-category">
						<input type="radio" name="gender" id="gender" value="M" required>
						<label>Male</label>
						<input type="radio" name="gender" id="gender" value="F" required>
						<label>Female</label>
					</div>
			</div>
			<div class="input-group">
				<label>Present Address:</label>
				<input type="text" name=PresentAddress id="preadd" placeholder="Enter Present Address" required>
			</div>
			<div class="input-group">
				<label>Permanent Address:</label>
				<input type="text" name=PermanentAddress id="peradd" placeholder="Enter Permanent Address" required>
			</div>
			<div class="input-group">
				<label>Mobile No:</label>
				<input type="text" name=Mnumber required id="mno" placeholder="Enter Mobile No." onkeydown="mnovalidation()">
				<span id="phone-error"></span>
			</div>
			<div class="input-group">
				<label>Mail ID:</label>
				<input type="email" name=mailId required id="email" placeholder="Enter Email Address">
				<span id="email-error"></span>
			</div>
			<button type=submit value=Register onclick="validation()">Register</button>
		</form>
	</div>
	<script src="js/userregistrationvalidation.js"></script>
	<script>
		var d=new Date().getTime().toString();
		document.getElementById('userID').value=d;
	</script>
</body>
</html>