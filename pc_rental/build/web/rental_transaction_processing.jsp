<%@ page import="pc_rental_management.rental_transaction" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Transaction Processing</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #2c3e50;
            color: #ecf0f1;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            font-family: 'Bebas Neue', cursive;
            font-size: 2em;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>
    <jsp:useBean id="rentalTransaction" class="pc_rental_management.rental_transaction" scope="session" />

    <%
        // Retrieve form parameters
        int userId = Integer.parseInt(request.getParameter("user_id"));
        float hoursSpent = Float.parseFloat(request.getParameter("hours_spent"));

        // Set values for the rental_transaction
        rentalTransaction.user_id = userId;
        rentalTransaction.hours_spent = hoursSpent;

        // Call the add_transaction method to add the rental transaction
        int result = rentalTransaction.add_transaction();
    %>

    <h1>Rental Transaction Processing</h1>

    <%
        if (result == 1) {
    %>
            <p>Rental transaction added successfully!</p>
    <%
        } else {
    %>
            <p>Rental transaction failed. Please try again.</p>
    <%
        }
    %>
            <p><a href="rental_transaction_options.html">Go back</a></p>
</body>
</html>
