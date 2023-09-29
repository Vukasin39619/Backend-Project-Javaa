<%-- 
    Document   : index
    Created on : Sep 21, 2023, 2:56:57 PM
    Author     : Vukisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="baza.Konekcija" %>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%
    
    Connection connection = Konekcija.createConnection();
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT * FROM drzava");
    
    HttpSession sesija = request.getSession();
    
    
    
    boolean auth = (boolean)sesija.getAttribute("auth");
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="MainKontejner1">
            <!-- navbar -->
            
           <%
           if(!auth)
           {
           %>
            <%@include file="layout/navbar.jsp" %>
            <%
                }
                else
                {
            
            %>
            <%@include file="layout/navbarKlijent.jsp" %>
            <%
            
            }
            
            %>
            <!-- end navbar -->
             
            <!-- Main Page -->
            <form action="biranjedestinacije.jsp" method="post">
                <div>

                    <label for="">Država:</label>
                    <select id="country" name="country" required onchange="izabranaDrzava()">
                        <option value="" disabled selected>Odaberite državu</option>
                        <% while (resultSet.next()) { %>
                        <option value="<%=resultSet.getString("id_drzave") %>"><%= resultSet.getString("NazivDrzave") %></option>
                        <% }
                        %>
                    </select>
                    <br><br>


                    <label for="startDate">Datum od:</label>
                    <input type="date" id="startDate" name="startDate" onchange="updateEndDate()" required>

                    <label for="endDate">Datum do:</label>
                    <input type="date" id="endDate" name="endDate" required><br><br>

                    <label>Cena od(€):</label>
                    <input type="text">
                    <label>Cena do(€):</label>
                    <input type="text">
                </div>
                <br> 
                <input type="submit" value="Pretrazi">
                <!--END Main Page -->

                </div>
            </form>       
    </body>
</html>
<script>
    function updateEndDate() {
        // Dobijemo vrednost iz polja "Datum od"
        const startDateInput = document.getElementById("startDate");
        const endDateInput = document.getElementById("endDate");

        // Postavimo vrednost u polje "Datum do"
        endDateInput.value = startDateInput.value;
    }
</script>
