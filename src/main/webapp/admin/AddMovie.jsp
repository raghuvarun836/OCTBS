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
	<form id="form" action="<%=request.getContextPath()%>/storemovie" method=post>
		<div class="crud">
			<h3>Adding Movie Details</h3>
			<div class="form">
				<label>Movie ID:</label>
				<input type="text" name=txtmovieid required>
			</div>
			<div class="form">
				<label>Movie name:</label>
				<input type="text" name=txtmoviename required>
			</div>
			<div class="form">
				<label>Poster:</label>
				<input type="text" name=poster required>
			</div>
			<div class="form">
				<label>Trailer:</label>
				<input type="text" name=trailer required>
			</div>
			<div class="form">
				<label>Theatre :</label>
				<input type="text" name=theatre required>
			</div>
			<div class="form">
				<label>Timings:</label>
				<input type="text" name=timings required>
			</div>
			<div class="form">
				<label>Description:</label>
				<input type="text" name=description required>
			</div>
				<button type=submit value=submit>add</button>
		</div>
	</form>
</body>
</html>