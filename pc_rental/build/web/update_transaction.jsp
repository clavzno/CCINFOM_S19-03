<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, pc_rental_management.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Transaction</title>
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
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            display: flex;
            flex-direction: column;
            width: 80%;
            max-width: 800px;
            border-radius: 10px;
            background-color: #3498db;
            margin: auto;
            position: relative; 
        }

        .column {
            padding: 20px;
            box-sizing: border-box;
            width: 100%;
        }

        input, label {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ecf0f1;
            border-radius: 5px;
            background-color: #ecf0f1;
            color: #2c3e50;
            font-size: 1em;
            text-align: center;
            display: block;
        }

        input[type="submit"],
        input[type="button"] {
            background-color: #2ecc71;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #27ae60;
        }

        .column h1 {
            margin-bottom: 20px;
        }

        /* Added styles for cancel button */
        .cancel-button {
            position: bottom;
            bottom: 5px;
            right: 5px;
        }

        /* Added styles to create two columns */
        .column.left {
            border-right: 1px solid #ecf0f1;
        }

        .column.right {
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <jsp:useBean id="upTransaction" class="pc_rental_management.rental_transaction" scope="session" />
    <%
        String transactionIDParam = request.getParameter("transaction_id");

        if (transactionIDParam != null && !transactionIDParam.isEmpty()) {
            int transactionId = Integer.parseInt(transactionIDParam);

            int result = upTransaction.getTransactionDetails(transactionId);

            if (result == 1) {
    %>
                <form action="update_transaction_processing.jsp" method="post">
                    <div class="column left">
                        <h1>Previous Details</h1>

                        <label for="prev_transaction_date">Transaction Date:</label>
                        <input type="text" id="prev_transaction_date" name="prev_transaction_date" value="<%= upTransaction.transaction_date %>" readonly>

                        <label for="prev_user_id">User ID:</label>
                        <input type="text" id="prev_user_id" name="prev_user_id" value="<%= upTransaction.user_id %>" readonly>

                        <label for="prev_pc_id">PC ID:</label>
                        <input type="text" id="prev_pc_id" name="prev_pc_id" value="<%= upTransaction.pc_id %>" readonly>

                        <label for="prev_hours_spent">Hours Spent:</label>
                        <input type="text" id="prev_hours_spent" name="prev_hours_spent" value="<%= upTransaction.hours_spent %>" readonly>
                    </div>

                    <div class="column right">
                        <h1>New Details</h1>

                        <label for="transaction_date">Transaction Date:</label>
                        <input type="text" id="transaction_date" name="transaction_date" value="<%= upTransaction.transaction_date %>" readonly>

                        <label for="user_id">User ID:</label>
                        <input type="text" id="user_id" name="user_id" value="<%= upTransaction.user_id %>" readonly>

                        <label for="pc_id">PC ID:</label>
                        <input type="text" id="pc_id" name="pc_id" value="<%= upTransaction.pc_id %>" readonly>

                        <label for="hours_spent">Hours Spent:</label>
                        <input type="number" id="hours_spent" name="hours_spent" required>
                        
                        <input type="submit" value="Update">
                        <input type="button" class="cancel-button" value="Cancel">
                    </div>
                </form>
    <%
            } else {
    %>
                <p>Error retrieving transaction details.</p>
    <%
            }
        } else {
    %>
            <p>No Transaction ID provided.</p>
    <%
        }
    %>
</body>
</html>
