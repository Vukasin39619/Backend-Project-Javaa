<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
</head>
<body>
    <h1>Delete User</h1>
    
    <form action="DeleteUserServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <p>Da li ste sigurni da želite izbrisati ovog korisnika?</p>
        <input type="submit" value="Da">
        <a href="Korisnici.jsp">Ne</a>
    </form>
</body>
</html>
