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
    ResultSet resultSet = statement.executeQuery("SELECT * FROM destinacija");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dodaj Novo Mesto</title>
</head>
<body>
    <h1>Dodaj Novo Mesto</h1>
    
    <form action="DodajMestoServlet" method="post">
        <!-- Polja za unos informacija o korisniku -->
       Adresa <input type="text" name="Adresa"><br><br>
        Naziv_Mesta <input type="text" name="NazivMesta"><br><br>
       Cena <input type="text" name="Cena"><br><br>
        Datum <input type="text" name="Datum"><br><br>
         Destinacija:<select id="destinacija" name="destinacija" required onchange="izabranaDrzava()">
                        <option value="" disabled selected>Odaberite destinaciju</option>
                        <% while (resultSet.next()) { %>
                        <option value="<%=resultSet.getString("id_destinacije") %>"><%= resultSet.getString("NazivDestinacije") %></option>
                        <% }
                        %>
        </select><br><br>
        
        
        
        <!-- Dugme za slanje podataka -->
        <input type="submit" value="Dodaj Mesto">
    </form>
</body>
</html>
