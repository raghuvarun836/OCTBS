
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Dynamic Drop Down List Demo - CodeJava.net</title>
</head>
<body>
 
<div align="center">
    <h2>Dynamic Drop Down List Demo</h2>
    <form action="<%=request.getContextPath()%>/list" method="post">
        Select a Category:&nbsp;
        <select name="movie">
            <c:forEach items="${listCategory}" var="movie">
                <option value="${movie.movie_id}"
                    <c:if test="${movie.movie_id eq selectedCatId}">selected="selected"</c:if>
                    >
                    ${movie.movie_name}
                    
                </option>
            </c:forEach>
        </select>
        <br/><br/>
        <input type="submit" value="Submit" />
    </form>
</div>
</body>
</html>