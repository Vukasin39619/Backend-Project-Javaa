<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dodaj Novog Korisnika</title>
</head>
<body>
    <h1>Dodaj Novog Korisnika</h1>
    
    <form action="DodajkorisnikaServlet" method="post">
        <!-- Polja za unos informacija o korisniku -->
        Ime: <input type="text" name="ime"><br>
        Prezime: <input type="text" name="prezime"><br>
        Kontakt: <input type="text" name="kontakt"><br>
        Datum rođenja: <input type="text" name="datumRodjenja"><br>
        Email: <input type="text" name="email"><br>
        Šifra: <input type="password" name="sifra"><br>
        Korisničko ime: <input type="text" name="userName"><br>
        Uloga:
        <select name="uloga">
            <option value="admin">Admin</option>
            <option value="Klijent">Klijent</option>
            <option value="Urednik">Urednik</option>
        </select><br>
        
        <!-- Dugme za slanje podataka -->
        <input type="submit" value="Dodaj Korisnika">
    </form>
</body>
</html>
