<%@page import="pc_rental_management.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Top-ups</title>
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
    <h1>View All Top-ups</h1>

    <table>
        <thead>
            <tr>
                <th>Top-up ID</th>
                <th>User ID</th>
                <th>Top-up Date</th>
                <th>Amount Paid</th>
                <th>Payment Type</th>
            </tr>
        </thead>
        <tbody>
            <%
                top_up topup = new top_up();
                
                int result = topup.view_topups();

                if (result == 1 && !topup.topup_idlist.isEmpty()) {
                    for (int i = 0; i < topup.topup_idlist.size(); i++) {
                        int topupID = topup.topup_idlist.get(i);
                        int userID = topup.user_idlist.get(i);
                        String topupDate = topup.topup_datelist.get(i);
                        int amountPaid = topup.amount_paidlist.get(i);
                        String paymentType = topup.payment_typelist.get(i);
            %>
                        <tr>
                            <td><%= topupID %></td>
                            <td><%= userID %></td>
                            <td><%= topupDate %></td>
                            <td><%= amountPaid %></td>
                            <td><%= paymentType %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">No top-ups available.</td>
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
