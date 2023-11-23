<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Transaction - Main</title>
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

        form {
            width: 80%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: #3498db;
            margin: auto;
        }

        select, input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ecf0f1;
            border-radius: 5px;
            background-color: #ecf0f1;
            color: #2c3e50;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #2ecc71;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <jsp:useBean id="rentalTransaction" class="pc_rental_management.rental_transaction" scope="session" />
    <form action="update_transaction.jsp" method="get">
        <label for="user_id">Select User ID:</label>
        <select id="user_id" name="user_id">
            <%

                int result = rentalTransaction.getTransactionIds();

                if (result == 1 && !rentalTransaction.user_idList.isEmpty()) {
                    for (int userID : rentalTransaction.user_idList) {
            %>
            <option value="<%= userID %>"><%= userID %></option>
            <%
                    }
                } else {
            %>
            <option value="" disabled>No User IDs available</option>
            <%
                }
            %>
        </select><br>
        <input type="submit" value="Update Transaction">
    </form>
</body>
</html>
