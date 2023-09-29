<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="modeli.Korisnik"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="baza.Konekcija" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    
    <%
        // Dohvati ID korisnika iz URL-a
        HttpSession sesija = request.getSession();
        int userIdStr = (int)sesija.getAttribute("idklijenta2");
        
            
            
            // Inicijaliziraj objekt za korisnika
            Korisnik korisnik = null;

            // Povezivanje s bazom i dohvaćanje podataka o korisniku
            try (Connection connection = Konekcija.createConnection()) {
                PreparedStatement stmt = connection.prepareStatement("SELECT * FROM klijent WHERE ID_Klijenta = ?");
                stmt.setInt(1, userIdStr);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("ID_Klijenta");
                    String ime = rs.getString("Ime");
                    String prezime = rs.getString("Prezime");
                    String kontakt = rs.getString("Kontakt");
                    String datumRodjenja = rs.getString("DatumRodjenja");
                    String email = rs.getString("Email");
                    String sifra = rs.getString("Sifra");
                    String userName = rs.getString("UserName");
                    String uloga = rs.getString("Uloga");

                    korisnik = new Korisnik(id, ime, prezime, kontakt, datumRodjenja, email, sifra, userName, uloga);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (korisnik != null) {
    %>
    <form action="EditUserServlet" method="post">
        <input type="hidden" name="id" value="<%= korisnik.getId_Klijenta() %>">

        Sifra: <input type="password" name="sifra" value="<%= korisnik.getSifra() %>"><br>

        <!-- Ostali podaci o korisniku -->
        <input type="submit" value="Spremi promjene">
    </form>
    <%
            } else {
                // Ako korisnik nije pronađen, prikažite poruku o grešci ili preusmjerite na odgovarajuću stranicu.
                response.sendRedirect("error.jsp");
            }
        
    %>
</body>
</html>
