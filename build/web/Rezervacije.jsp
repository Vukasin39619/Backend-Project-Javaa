<%-- 
    Document   : Rezervacije
    Created on : Sep 27, 2023, 9:27:42 PM
    Author     : Vukisha
--%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="baza.Konekcija" %>
<%@page import="modeli.rezervacija"%>
<%@page import="modeli.Korisnik"%>
<%@page import="metode.RezervacijaCM"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        // Dohvati ID korisnika iz URL-a
                    HttpSession sesija = request.getSession();
            int idmesta = (int)sesija.getAttribute("idmesta");

        Korisnik k = (Korisnik)sesija.getAttribute("Korisnik");
        int idklijenta = k.getId_Klijenta();
        
         int iddestinacije = (int)sesija.getAttribute("iddestinacije");
         
         RezervacijaCM rezcm = new RezervacijaCM();
         rezcm.dodajrezervaciju(idklijenta,idmesta, iddestinacije);
         
         ArrayList<rezervacija>sverez = rezcm.GetAll(idklijenta);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <table>
            <th>id_rezervacije</th>
            <th>id_klijenta</th>
            <th>id_mesta</th>
            <th>id_destinacije</th>
        <%
        for(rezervacija element : sverez)
        {
        %>
       
            <tr>
                <td><%=element.getId_rezervacije()%></td>
                <td><%=element.getId_klijenta()%></td>
                <td><%=element.getId_mesta()%></td>
                <td><%=element.getId_destinacije()%></td>
                
            </tr>
            <%}%>
        </table>
        <a href="index.jsp">Nazad na pocetnu
    </body>
</html>
