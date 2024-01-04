<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>
<body>
	<form id="form" action="<%=request.getContextPath()%>/deletemovie" method=post>
		<div class="crud">
		<h3>Deleting Movie Details</h3>
			<div class="form">
				<label>Movie ID:</label>
				<input type="text" name=txtmovieid required>
			</div>
			<button type=submit value=submit>delete</button>
		</div>
	</form>
</body>
</html>