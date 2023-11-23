<%@ page import="pc_rental_management.rental_transaction" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Rental Transaction</title>
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

        label, select, input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ecf0f1;
            border-radius: 5px;
            background-color: #ecf0f1;
            color: #2c3e50;
            font-size: 1em;
            font-weight: bold;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }

        label {
            font-weight: bold;
            font-family: 'Bebas Neue', cursive;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <form action="delete_transaction_processing.jsp" method="post">
        <jsp:useBean id="trans" class="pc_rental_management.rental_transaction" scope="session" />        
        <label for="transaction_id">Transaction ID:</label>
        <select id="transaction_id" name="transaction_id">
            <%
                trans.getTransactionIds();
                for (Integer transactionId : trans.transaction_idList) {
            %>
                <option value="<%= transactionId %>"><%= transactionId %></option>
            <%
                }
            %>
        </select><br>
        
        <input type="submit" value="Delete Transaction">
    </form>
</body>
</html>
