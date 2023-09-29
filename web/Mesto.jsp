<%-- 
    Document   : Korisnici
    Created on : Sep 26, 2023, 5:42:30 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Mesto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metode.MestaCM"%>
<!DOCTYPE html>

<%
    HttpSession sesija = request.getSession();
    
    ArrayList<Mesto>Mesta=(ArrayList<Mesto>)sesija.getAttribute("svamesta");

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
            <a class="button" href="DodajMesto.jsp">Dodaj Novo mesto</a>
        </div>
          
          
        <div class="korisniciKontejner">

            <table border="1">
                <th>ID_Mesta</th>
                <th>Adresa</th>
                <th>NazivMesta</th>
                <th>ID_Destinacije</th>
                <th>Cena</th>
                <th>Datum</th>
                
                <th colspan="2">Opcije</th>
                    <% 
                    for(Mesto element : Mesta)
                    {
            
                    %>
                <tr>
                    <td><%=element.getId_mesta()%></td>
                    <td><%=element.getAdresa()%></td>
                    <td><%=element.getNazivMesta()%></td>              
                    <td><%=element.getId_destinacije()%></td>
                    <td><%=element.getCena()%></td>
                    <td><%=element.getDatum()%></td>
                    
                    
                    <td><a class="button" href="EditMesto.jsp?id=<%= element.getId_mesta() %>">Edit</a></td>
                    <td><a class="button" href="DeleteMesto.jsp?id=<%= element.getId_mesta() %>">Delete</a></td>


                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
