<%-- 
    Document   : biranjedestinacije
    Created on : Sep 21, 2023, 5:34:14 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="baza.Konekcija" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    Connection connection = Konekcija.createConnection();
    Statement statement = connection.createStatement();
    String idDrzave = request.getParameter("country");
    String sql = "SELECT * FROM destinacija where id_drzave="+idDrzave;
    ResultSet resultSet = statement.executeQuery(sql);
    
    HttpSession sesija = request.getSession();
    
    boolean auth = (boolean)sesija.getAttribute("auth");
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <%
           if(!auth)
           {
           %>
            <%@include file="layout/navbar.jsp" %>
            <%
                }
                else
                {
            
            %>
            <%@include file="layout/navbarKlijent.jsp" %>
            <%
            
            }
            
            %>

        <form action="biranjedestinacijeservlet" method="post">
        Izaberite destinaciju:
        <select id="destinacija" name="destinacija">
            <option value="" disabled selected>Odaberite destinaciju</option>
            <% while (resultSet.next()) { %>
            <option value="<%=resultSet.getString("id_destinacije") %>"><%= resultSet.getString("NazivDestinacije") %></option>
            <% } %>
        </select>
        
        <input type="submit" value="Prikazi">
        </form>
    </body>
</html>
