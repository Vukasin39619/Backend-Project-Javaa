<%-- 
    Document   : Korisnici
    Created on : Sep 26, 2023, 5:42:30 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Destinacija"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metode.DestinacijaCM"%>
<%
    HttpSession sesija = request.getSession();
    
    ArrayList<Destinacija>svedestinacije=(ArrayList<Destinacija>)sesija.getAttribute("svedestinacije");

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
            <a class="button" href="DodajDestinaciju.jsp">Dodaj Novu destinaciju</a>
        </div>
          
          
        <div class="korisniciKontejner">

            <table border="1">
                <th>ID_Destinacije</th>
                <th>Naziv Drzave</th>
                <th>ID_Drzave</th>
                
                <th>Opcije</th>
                    <% 
                    for(Destinacija element : svedestinacije)
                    {
            
                    %>
                <tr>
                    <td><%=element.getId_destinacije()%></td>
                    <td><%=element.getNazivDestinacije()%></td>
                    <td><%=element.getId_drzave()%></td>


                    <td><a class="button" href="DeleteDestinacija.jsp?id=<%= element.getId_destinacije()%>">Delete</a></td>


                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
