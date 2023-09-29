<%-- 
    Document   : AdminPanel
    Created on : Sep 25, 2023, 5:48:55 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>

<%
    HttpSession sesija = request.getSession();
   
        

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@include file="layout/navbarAdmin.jsp" %>

        
    </body>
</html>
