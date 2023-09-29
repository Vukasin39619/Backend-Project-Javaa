<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registracija</title>
</head>
<body>
    <h1>Registracija</h1>
    
    <form action="RegistracijaServlet" method="post">
        <!-- Polja za unos informacija o korisniku -->
        Ime: <input type="text" name="ime" required><br>
        Prezime: <input type="text" name="prezime" required><br>
        Kontakt: <input type="text" name="kontakt" required><br>
        Datum rođenja: <input type="text" name="datumRodjenja" required><br>
        Email: <input type="text" name="email" required><br>
        Šifra: <input type="password" name="sifra" required><br>
        Korisničko ime: <input type="text" name="userName" required><br>
        <input type="hidden" value="Klijent" name="uloga" required><br>
        
        <!-- Dugme za slanje podataka -->
        <input type="submit" value="Registracija">
    </form>
</body>
</html>
