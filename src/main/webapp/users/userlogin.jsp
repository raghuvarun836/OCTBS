<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link rel="stylesheet" href="css/userloginstyle.css">
<script src="https://kit.fontawesome.com/2a9201dda7.js"  crossorigin="anonymous">
window.history.forward();
function noBack() { window.history.forward(); }

</script>
</head>
<body>
<div class="container">
    <form action=LoginServlet method=post>
      <i class="fa-solid fa-film"></i>
      <div class="input-group">
        <label>UserId/MailId:</label>
        <input type="text" placeholder="Enter UserId or MailId" name=txtUserName required>
      </div>

      <div class="input-group">
        <label>Password:</label>
        <input type="password" placeholder="Enter Password" name=txtPwd required>
      </div>
     <p>Didn't have an Account ?</p>
    <a href="UserRegistration.jsp">Create one!</a>
    <button type=submit value=Login>Login</button>
  </form>
</div>
</body>
</html>