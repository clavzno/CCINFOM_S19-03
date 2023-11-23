<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Transaction - Processing</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #2ecc71;
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
            color: #ecf0f1;
            font-family: 'Bebas Neue', cursive;
            font-size: 5em;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
            padding: 10px 20px;
            font-size: 1.5em;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <jsp:useBean id="transaction" class="pc_rental_management.rental_transaction" scope="session"/>
    <%
        try {
            transaction.transaction_id = Integer.parseInt(request.getParameter("transaction_id"));

            if (transaction.delete_transaction() == 1) {
    %>
                <h1>Transaction has been deleted successfully</h1>
    <%
            } else {
    %>
                <h1>Error deleting transaction</h1>  
    <%
            }
        } catch (Exception e) {
    %>
            <h1>Error: <%= e.getMessage() %></h1>
    <%
        }
    %>

    <form action="index.html">
        <input type="submit" value="Return">
    </form>
</body>
</html>
