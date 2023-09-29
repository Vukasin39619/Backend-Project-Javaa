<%-- 
    Document   : navbar
    Created on : Sep 22, 2023, 4:43:00 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Korisnik"%>
<%
    
    Korisnik k = (Korisnik)sesija.getAttribute("Korisnik");

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
                    <a href="index.jsp"><img src="./images/logo.png" alt="neucitava" width="120px" height="120px"/></a>
                </div> 
                <div class="nav2">
                    <a class="aNavbar" href="index.jsp">Početna Stranica</a>
                    <a class="aNavbar" href="ONama.jsp">O Nama</a>
                    <a class="aNavbar" href="kontakt.jsp">Kontakt</a>
                    <a class="aNavbar" href="profil.jsp"><label><i class="fa-solid fa-user fa-lg"></i><%=k.getIme()%></label></a>
                    <a class="aNavbar" href="OdjavljivanjeServlet">Odjavi se</a>
                </div>
            </div>

            <!-- END Navbar-->
    </body>
</html>
