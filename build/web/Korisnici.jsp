<%-- 
    Document   : Korisnici
    Created on : Sep 26, 2023, 5:42:30 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Korisnik"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metode.KorisnikCM"%>
<%
    HttpSession sesija = request.getSession();
    
    ArrayList<Korisnik>korisnicisvi=(ArrayList<Korisnik>)sesija.getAttribute("svikorisnici");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/korisnici.css">
    </head>
    <body>
        <%@include file="layout/navbarAdmin.jsp" %>
        <div class="korisniciKontejner">
            <a class="button" href="dodajKorisnika.jsp">Dodaj Novog Korisnika</a>
        </div>
          
          
        <div class="korisniciKontejner">

            <table border="1">
                <th>ID_Klijenta</th>
                <th>Ime</th>
                <th>Prezime</th>
                <th>Kontakt</th>
                <th>Datum rodjenja</th>
                <th>Email</th>
                <th>Sifra</th>
                <th>UserName</th>
                <th>Uloga</th>
                <th colspan="2">Opcije</th>
                    <% 
                    for(Korisnik element : korisnicisvi)
                    {
            
                    %>
                <tr>
                    <td><%=element.getId_Klijenta()%></td>
                    <td><%=element.getIme()%></td>
                    <td><%=element.getPrezime()%></td>
                    <td><%= element.getKontakt()%></td>

                    <td><%= element.getDatumRodjenja()%></td>
                    <td><%= element.getEmail()%></td>
                    <td><%= element.getSifra()%></td>
                    <td><%= element.getUserName()%></td>

                    <td><%=element.getUloga()%></td>

                   <td><a class="button" href="editUser.jsp?id=<%= element.getId_Klijenta() %>">Edit</a></td>

                    <td><a class="button" href="deleteUser.jsp?id=<%= element.getId_Klijenta() %>">Delete</a></td>


                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
