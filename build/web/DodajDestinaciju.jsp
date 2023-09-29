<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="baza.Konekcija" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<%

 Connection connection = Konekcija.createConnection();
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT * FROM drzava");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dodaj Novu Destinaciju</title>
</head>
<body>
    <h1>Dodaj Novu Destinaciju</h1>
    
    <form action="DodajDestinacijuServlet" method="post">
        <!-- Polja za unos informacija o korisniku -->
        Drzava:<select id="country" name="country" required onchange="izabranaDrzava()">
                        <option value="" disabled selected>Odaberite državu</option>
                        <% while (resultSet.next()) { %>
                        <option value="<%=resultSet.getString("id_drzave") %>"><%= resultSet.getString("NazivDrzave") %></option>
                        <% }
                        %>
        </select><br><br>
        Naziv_Destinaciju <input type="text" name="ime"><br><br>
        
        
        
        <!-- Dugme za slanje podataka -->
        <input type="submit" value="Dodaj Destinaciju">
    </form>
</body>
</html>
