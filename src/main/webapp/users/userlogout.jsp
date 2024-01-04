
<%
response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("some_token")==null)
    response.sendRedirect("userlogin.jsp");




%>