<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="pc_rental_management.rental_transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Transactions</title>
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

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ecf0f1;
            background-color: #3498db;
            color: #ecf0f1;
        }

        th {
            background-color: #2980b9;
        }

        form {
            width: 80%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: #3498db;
            margin: auto;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h1>View All Transactions</h1>

    <table>
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Transaction Date</th>
                <th>User ID</th>
                <th>PC ID</th>
                <th>Hours Spent</th>
            </tr>
        </thead>
        <tbody>
            <%
                rental_transaction transaction = new rental_transaction();
                int result = transaction.view_transaction();

                if (result == 1 && !transaction.transaction_idList.isEmpty()) {
                    for (int i = 0; i < transaction.transaction_idList.size(); i++) {
                        int transactionID = transaction.transaction_idList.get(i);
                        String transactionDate = transaction.transaction_dateList.get(i);
                        int userID = transaction.user_idList.get(i);
                        int pcID = transaction.pc_idList.get(i);
                        float hoursSpent = transaction.hours_spentList.get(i);
            %>
                        <tr>
                            <td><%= transactionID %></td>
                            <td><%= transactionDate %></td>
                            <td><%= userID %></td>
                            <td><%= pcID %></td>
                            <td><%= hoursSpent %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">No transactions available.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <form action="index.html">
        <input type="submit" value="Return to Home">
    </form>
</body>
</html>
