<%-- 
    Document   : profil
    Created on : Sep 27, 2023, 5:13:21 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Korisnik"%>
<%
            HttpSession sesija = request.getSession();

        Korisnik k1 = (Korisnik)sesija.getAttribute("Korisnik2");
        int i = k1.getId_Klijenta();
        int i2 = k1.getId_Klijenta();
        sesija.setAttribute("idklijenta", i);
        sesija.setAttribute("idklijenta2", i2);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profil</title>
        <link rel="stylesheet" href="css/profil.css">
        <script src="https://kit.fontawesome.com/84b7058e15.js" crossorigin="anonymous"></script>
    </head>
    <body>
      <%@include file="layout/navbarKlijent.jsp" %>

        <h1 style="text-align: center;">Dobro dosli "<%=k1.getIme()%>"</h1>
        <div class="kontejnerProfil">
            <div class="OkvirOpcije">
                <h2>Opcije</h2>
                <a href="promenilozinkuprofil.jsp"><i class="fa-solid fa-arrow-right"></i> Promeni lozinku</a><br><br>
                <a href="index.jsp"><i class="fa-solid fa-arrow-right"></i>Pogledaj Rezervacije</a><br><br>
                <a href="obrisiklijenta.jsp"><i class="fa-solid fa-arrow-right"></i> Obrisi Profil</a><br><br>
               
            </div>
            
            <div class="okvirProfil">
                
                <div class="profil1">
                    
               
                <label>Ime:<%=k1.getIme()%></label><br><br>
               
                <label>Prezime:<%=k1.getPrezime()%></label><br><br>
        
                <label>Kontakt:<%=k1.getKontakt()%></label><br><br>
             
                <label>Datum Rodjenja:<%=k1.getDatumRodjenja()%></label><br><br>
             
                
                
                 </div>
                <div class="profil2">
                    <label>Email:<%=k1.getEmail()%></label><br><br>
              
                <label>Sifra:<%=k1.getSifra()%></label><br><br>
              
                <label>UserName:<%=k1.getUserName()%></label><br><br>
                 
                </div>
            </div>
        </div>
        
        
    </body>
</html>
