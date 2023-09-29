<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="modeli.Korisnik"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="baza.Konekcija" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    
    <%
        // Dohvati ID korisnika iz URL-a
        String userIdStr = request.getParameter("id");
        if (userIdStr != null && !userIdStr.isEmpty()) {
            int userId = Integer.parseInt(userIdStr);
            
            // Inicijaliziraj objekt za korisnika
            Korisnik korisnik = null;

            // Povezivanje s bazom i dohvaćanje podataka o korisniku
            try (Connection connection = Konekcija.createConnection()) {
                PreparedStatement stmt = connection.prepareStatement("SELECT * FROM klijent WHERE ID_Klijenta = ?");
                stmt.setInt(1, userId);
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
        <!-- Prikaz trenutnih podataka o korisniku -->
        Ime: <input type="text" name="ime" value="<%= korisnik.getIme() %>"><br>
        Prezime: <input type="text" name="prezime" value="<%= korisnik.getPrezime() %>"><br>
        Kontakt: <input type="text" name="kontakt" value="<%= korisnik.getKontakt() %>"><br>
        Datum rođenja: <input type="text" name="datumRodjenja" value="<%= korisnik.getDatumRodjenja() %>"><br>
        Email: <input type="text" name="email" value="<%= korisnik.getEmail() %>"><br>
        Sifra: <input type="password" name="sifra" value="<%= korisnik.getSifra() %>"><br>
        Username: <input type="text" name="userName" value="<%= korisnik.getUserName() %>"><br>
        Uloga:
        <select name="uloga">
            <option value="admin" <%= korisnik.getUloga().equals("admin") ? "selected" : "" %>>Admin</option>
            <option value="Klijent" <%= korisnik.getUloga().equals("Klijent") ? "selected" : "" %>>Klijent</option>
            <option value="Urednik" <%= korisnik.getUloga().equals("Urednik") ? "selected" : "" %>>Urednik</option>
        </select><br>
        <!-- Ostali podaci o korisniku -->
        <input type="submit" value="Spremi promjene">
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
