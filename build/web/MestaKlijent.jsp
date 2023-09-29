<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="modeli.Mesto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metode.MestaCM"%>
<%@page import="metode.DestinacijaCM"%>
<!DOCTYPE html>
<%
    DestinacijaCM destinacijacm = new DestinacijaCM();
    HttpSession sesija = request.getSession();
    ArrayList<Mesto> mesta = (ArrayList<Mesto>)sesija.getAttribute("svamestaklijent");
    int id = (int)sesija.getAttribute("iddestinacije");
    String x = destinacijacm.NazivDestinacijeByID(id);
    boolean auth = (boolean)sesija.getAttribute("auth");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezervisanje</title>
        <link rel="stylesheet" href="css/mestaklijent.css">
    </head>
    <body>
        <%
        if (!auth) {
        %>
        <%@include file="layout/navbar.jsp" %>
        <%
        } else {
        %>
        <%@include file="layout/navbarKlijent.jsp" %>
        <%
        }
        %>
        <div class="kontejnerMesto">
    <%
    for(Mesto element : mesta) {
    %>
    <div class="okvirMesto">
        
        <label>Naziv:<%=element.getNazivMesta()%></label><br>
        <label>Adresa:<%=element.getAdresa()%></label><br><br>
        <label>Cena:<%=element.getCena()%></label><br><br>
        <label>Datum:<%=element.getDatum()%></label><br><br>
        <label>Destinacija:<%=x%></label><br><br>
        <a class="Rezervacija" href="RezervisiServlet?id=<%=element.getId_mesta()%>">Rezervisi</a><br><br>
        
         <div class="slider">
  <img id="img-1" src="./images/1.png" alt="Image 1"/>
  <img id="img-2" src="./images/2.jpg" alt="Image 2"/>
  <img id="img-3" src="./images/3.jpg" alt="Image 3"/>
</div>
<div class="navigation-button">
  <span class="dot active" onclick="changeSlide(0)"></span>
  <span class="dot" onclick="changeSlide(1)"></span>
  <span class="dot" onclick="changeSlide(2)"></span>
</div>
    <%
    }
    %>
</div>

    </body>
</html>
    
<script>
    
  var imgs = document.querySelectorAll('.slider img');
var dots = document.querySelectorAll('.dot');
var currentImg = 0; // index of the first image 
const interval = 3000; // duration(speed) of the slide
function changeSlide(n) {
  for (var i = 0; i < imgs.length; i++) { // reset
    imgs[i].style.opacity = 0;
    dots[i].className = dots[i].className.replace(' active', '');
  }

  currentImg = n;

  imgs[currentImg].style.opacity = 1;
  dots[currentImg].className += ' active';
}

</script>