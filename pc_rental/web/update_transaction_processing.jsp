<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, pc_rental_management.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Transaction - Processing</title>
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
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <jsp:useBean id="trans" class="pc_rental_management.rental_transaction" scope="session" />

    <%
        try {
            if (trans == null) {
                trans = new pc_rental_management.rental_transaction();
            }

            // Retrieve updated transaction information from the form
            int transactionId = Integer.parseInt(request.getParameter("transaction_id"));
            float hoursSpent = Float.parseFloat(request.getParameter("hours_spent"));

            // Set values for the rental_transaction
            trans.transaction_id = transactionId;
            trans.hours_spent = hoursSpent;

            // Call the update_transaction method
            int updateResult = trans.update_transaction();
    %>

            <h1>
                <% if (updateResult == 1) { %>
                    Transaction <%=trans.transaction_id%> has been updated successfully
                <% } else { %>
                    Error updating Transaction
                <% } %>
            </h1>

    <%
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
