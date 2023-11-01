<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="modeli.Mesto"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="baza.Konekcija" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="baza.Konekcija" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Mesto</title>
</head>
<body>
    <h1>Edit Mesto</h1>
    <%
    Connection connection2 = Konekcija.createConnection();
    Statement statement2 = connection2.createStatement();
    ResultSet resultSet2 = statement2.executeQuery("SELECT * FROM destinacija");
    
    %>
    <%
        Mesto mesto = null;
        // Dohvati ID korisnika iz URL-a
        String userIdStr = request.getParameter("id");
        if (userIdStr != null && !userIdStr.isEmpty()) {
            int userId = Integer.parseInt(userIdStr);
            
            // Inicijaliziraj objekt za korisnika
            

            // Povezivanje s bazom i dohvaćanje podataka o korisniku
            try (Connection connection = Konekcija.createConnection()) {
                PreparedStatement stmt = connection.prepareStatement("SELECT * FROM mesto WHERE id_mesta = ?");
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id_mesta");
                    String adresa = rs.getString("Adresa");
                    String nazivmesta = rs.getString("NazivMesta");
                    String datum = rs.getString("Datum");
                    int cena = rs.getInt("Cena");
                    int id_destinacije = rs.getInt("id_destinacije");
                    

                    mesto = new Mesto(id, adresa, nazivmesta,cena,datum, id_destinacije);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (mesto != null) {
    %>
    <form action="EditMestoServlet" method="post">
        <input type="hidden" name="id" value="<%= mesto.getId_mesta() %>">
        <!-- Prikaz trenutnih podataka o korisniku -->
        Adresa: <input type="text" name="adresa" value="<%= mesto.getAdresa() %>"><br><br>
        Naziv Mesta: <input type="text" name="naziv" value="<%= mesto.getNazivMesta() %>"><br><br>
        Cena: <input type="text" name="cena" value="<%= mesto.getCena() %>"><br><br>
        Datum: <input type="text" name="datum" value="<%= mesto.getDatum() %>"><br><br>
        
       Destinacija:<select id="destinacija" name="destinacija" required onchange="izabranaDrzava()">
                        <option value="" disabled selected>Odaberite destinaciju</option>
                        <% while (resultSet2.next()) { %>
                        <option value="<%=resultSet2.getString("id_destinacije") %>"><%= resultSet2.getString("NazivDestinacije") %></option>
                        <% }
                        %>
       </select> <br><br>
        <!-- Ostali podaci o korisniku -->
        <input type="submit" value="Spremi promene">
    </form>
    <%
            } else {
                // Ako korisnik nije pronađen, prikažite poruku o grešci ili preusmjerite na odgovarajuću stranicu.
                response.sendRedirect("error.jsp");
            }
        } else {
            // Ako nije dostavljen ID korisnika putem URL-a, korisnika će se preusmjeriti na stranicu s porukom o grešci ili na odgovarajuću stranicu.
            response.sendRedirect("error.jsp");
        }
    %>
</body>
</html>
