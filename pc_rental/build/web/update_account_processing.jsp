<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account</title>
</head>
<body>
    <jsp:useBean id="C" class="pc_rental_management.account" scope="session" />
    
    <% 
        C.lastname = request.getParameter("lastname");
        C.firstname = request.getParameter("firstname");
        C.contactnumber = request.getParameter("contactnumber");
        C.username = request.getParameter("username");
        C.password = request.getParameter("password");
        C.balance = Float.parseFloat(request.getParameter("balance"));

 
        if(C.update_account() == 1){
    %>
        <h1>Account has been updated successfully</h1>
    <%
        } else {
    %>
        <h1>Error updating the account</h1>
    <%
        }
    %>

    <form action="index.html">
        <input type="submit" value="Return to Home">
    </form>
</body>
</html>
