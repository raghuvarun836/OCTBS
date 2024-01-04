<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Theatre Details</title>
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>
<body>
	<form id="form" action="<%=request.getContextPath()%>/storetheatre" method=post>
		<div class="crud">
			<h3>Adding Theatre Details</h3>
			<div class="form">
				<label>Theatre ID:</label>
				<input type="text" name=txtTheatreId required>
			</div>
			<div class="form">
				<label>Theatre name:</label>
				<input type="text" name=txtTheatreName required>
			</div>
			<div class="form">
				<label>Theatre Location:</label>
				<input type="text" name=txtTheatreLocation required>
			</div>
			<button type=submit value=submit>add</button>
		</div>
	</form>
</body>
</html>