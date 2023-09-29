<%-- 
    Document   : Korisnici
    Created on : Sep 26, 2023, 5:42:30 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Drzava"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metode.DrzavaCM"%>
<%
    HttpSession sesija = request.getSession();
    
    ArrayList<Drzava>svedrzave=(ArrayList<Drzava>)sesija.getAttribute("svedrzave");

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
            <a class="button" href="DodajDrzavu.jsp">Dodaj Novu drzavu</a>
        </div>
          
          
        <div class="korisniciKontejner">

            <table border="1">
                <th>ID_Drzave</th>
                <th>Naziv Drzave</th>
                
                <th>Opcije</th>
                    <% 
                    for(Drzava element : svedrzave)
                    {
            
                    %>
                <tr>
                    <td><%=element.getId_drzave()%></td>
                    <td><%=element.getNazivDrzave()%></td>


                    <td><a class="button" href="DeleteDrzava.jsp?id=<%= element.getId_drzave() %>">Delete</a></td>


                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
