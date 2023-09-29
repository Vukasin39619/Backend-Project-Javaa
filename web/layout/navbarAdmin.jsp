<%-- 
    Document   : navbar
    Created on : Sep 22, 2023, 4:43:00 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    
    String ime = (String)sesija.getAttribute("Admin");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navstyle.css">
        <script src="https://kit.fontawesome.com/84b7058e15.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- START Navbar-->
            <div class="navKontejner">
                <div class="nav1">
                    <a href="AdminPanel.jsp"><img src="./images/logo.png" alt="neucitava" width="120px" height="120px"/> </a>
                </div> 
                <div class="nav2">
                    <a class="aNavbar" href="KorisniciServlet">Korisnici</a>
                    <a class="aNavbar" href="DrzaveServlet">Drzave</a>
                    <a class="aNavbar" href="DestinacijeServlet">Destinacija</a>
                    <a class="aNavbar" href="MestaServlet">Mesto</a>
                    <label><i class="fa-solid fa-user fa-lg"></i><%=ime%>(admin)</label>
                    <a class="aNavbar" href="OdjavljivanjeServlet">Odjavi se</a>
                </div>
            </div>

            <!-- END Navbar-->
            <h1 style="text-align: center">ADMIN PAGE</h1>
    </body>
</html>
