<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.wipro.ctb.connection.ConnectionDB"%>
<%@page import="com.wipro.ctb.movie.model.*"%>
<%@page import="com.wipro.ctb.movie.model.*"%>
<%@page import="com.wipro.ctb.theatre.model.*"%>
<%@page import="java.sql.*"%>
<% String loc=(String)session.getAttribute("address"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Booking</title>
<link rel="stylesheet" href="css/bookingstyle.css" />
</head>
<body>
<div class="movie-container">
      <label> Select a movie:</label>
      <select id="movie">
       <!--  <option value="220">Godzilla vs Kong (RS.220)</option>
        <option value="320">Radhe (RS.320)</option>
        <option value="250">RRR (RS.250)</option>
        <option value="260">F9 (RS.260)</option> -->
        <option>Select</option>
        
        <%
        try{
        	String host="jdbc:mysql://localhost:3306/users";
    		Statement stat=null;
    		ResultSet res=null;
    		Connection conn=null;
    		PreparedStatement stmt=null;
    		Class.forName("com.mysql.jdbc.Driver").newInstance();
    		conn=DriverManager.getConnection(host,"root","Raghu@1234");
    		stat=conn.createStatement();
    		String query="select * from movies";
    		res=stat.executeQuery(query);
    		
    		while(res.next()){
    		%>
    		<option id="movieid" value="200"><%=res.getString("movie_name")%></option>
    		<%
    		//mov_th=res.getString("movie_theatre");
    		//System.out.println(mov_th);
    		}
    		
        }catch(Exception e)
        {
        	
        }
        
        %>
        
      </select>
      
       <label> Select a Theatre:</label>
      <select id="theatre">
       <!--  <option value="220">Godzilla vs Kong (RS.220)</option>
        <option value="320">Radhe (RS.320)</option>
        <option value="250">RRR (RS.250)</option>
        <option value="260">F9 (RS.260)</option> -->
        <option>Select</option>
        
        <%
        try{
        	String host="jdbc:mysql://localhost:3306/users";
    		Statement stat=null;
    		ResultSet res=null;
    		Connection conn=null;
    		PreparedStatement stmt=null;
    		Class.forName("com.mysql.jdbc.Driver").newInstance();
    		conn=DriverManager.getConnection(host,"root","Raghu@1234");
    		stat=conn.createStatement();
    		System.err.println("In thetare"+loc);
    		String query="select * from theatre where theatre_location='"+loc+"'";
    		res=stat.executeQuery(query);
    		
    		while(res.next()){
    		%>
    		System.err.println("In while thetare"+loc);
    		<option ><%=res.getString("theatre_name")%></option>
    		<%
    		
    		}	
    		System.err.println("In out while thetare"+loc);
        }catch(Exception e)
        {
        	
        }
        
        %>
        
      </select>
      
      
    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>Available</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>
      <li>
        <div class="seat sold"></div>
        <small>Sold</small>
      </li>
    </ul>
    <div class="container">
      <div class="screen"></div>

      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
      </div>
    </div>

    <p class="text">
      You have selected <span id="count">0</span> seat for a price of RS.<span
        id="total"
        >0</span
      >
    </p>
    <button type="submit" class="btn btn-primary">Submit</button>
		<a href="WelcomeUser.jsp" style="margin-left:100px;margin-top:20px;;float:left;">Back</a>
		
    <script src="js/booking.js"></script>
</body>
</html>