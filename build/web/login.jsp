<%-- 
    Document   : login
    Created on : Sep 25, 2023, 4:32:09 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%

HttpSession sesija = request.getSession();

    String poruka = (String)sesija.getAttribute("Poruka");
    String x="";
    if(poruka != null)
    {
    x=poruka;
    }
    
     boolean auth = false;
    sesija.setAttribute("auth", auth);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <%@include file="layout/navbar.jsp" %>
        
        <form action="Logovanje" method="post">
            <div class="loginKontejner">
            <div class="login">
                
                <div class="h1Kontejner">
                <h1 class="h1Login">Log in</h1>
                </div>
                
            <input type="text" name="username" id="username" placeholder="UserName:" class="inputLogin" required><br><br>
            <input type="text" name="password" id="password" placeholder="Password:" class="inputLogin" required><br><br>
            <input type="submit" value="Log in" class="dugmeLogin"><br>
            
            <div class="aKontejner">
            <a class="aLogin" href="Registracija.jsp">Registruj se </a>
            <a class="aLogin" href="index.jsp">Nastavi bez</a>
            <label><%=x%>
                
            </label>
            </div>
            </div>
            </div>
        </form>
        
    </body>
</html>
