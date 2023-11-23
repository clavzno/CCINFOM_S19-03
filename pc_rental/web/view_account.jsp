<%@page import="pc_rental_management.account"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Accounts</title>
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
    <h1>View All Accounts</h1>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>PC Type</th>
                <th>Latest Username</th>
                <th>Last Maintenance Date </th>
                <th>Status</th>
                <th>Password</th>
                <th>Balance</th>

            </tr>
        </thead>
        <tbody>
            <%
                account A = new account();
                int result = A.view_accounts();

                if (result == 1 && !A.account_idlist.isEmpty()) {
                    for (int i = 0; i < A.account_idlist.size(); i++) {
                        int userID = A.account_idlist.get(i);
                        String lastName = A.account_lastnamelist.get(i);
                        String firstName = A.account_firstnamelist.get(i);
                        String contactNumber = A.account_contactnumberlist.get(i);
                        String username = A.account_usernamelist.get(i);
                        String password = A.account_passwordlist.get(i);
                        float balance = A.account_balancelist.get(i);
            %>
                        <tr>
                            <td><%= userID %></td>
                            <td><%= lastName %></td>
                            <td><%= firstName %></td>
                            <td><%= contactNumber %></td>
                            <td><%= username %></td>
                            <td><%= password %></td>
                            <td><%= balance %></td>                
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="8">No accounts available.</td>
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
