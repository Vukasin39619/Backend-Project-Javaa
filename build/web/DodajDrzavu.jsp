<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dodaj Novu Drzavu</title>
</head>
<body>
    <h1>Dodaj Novu Drzavu</h1>
    
    <form action="DodajDrzavuServlet" method="post">
        <!-- Polja za unos informacija o korisniku -->
        Naziv_Drzave <input type="text" name="ime"><br>
        
        
        
        <!-- Dugme za slanje podataka -->
        <input type="submit" value="Dodaj Drzavu">
    </form>
</body>
</html>
