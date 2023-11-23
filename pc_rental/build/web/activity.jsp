<%-- 
    Document   : activity
    Created on : 11 21, 23, 6:18:57 PM
    Author     : ccslearner
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="pc_rental_management.useractivity"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
        <title>View User Activity</title>
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
                font-family: 'Bebas Neue';
                font-size: 3em;
                color: #3498db;
                margin-bottom: 20px;
            }

            table {
                padding: 20px;
                border-collapse: collapse;
            }

            th, td {
                padding: 5px;
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
            
            a {
                padding-top: 20px;
                color: #ecf0f1;
            }
        </style>
    </head>
    <body>
        <div height="20px">
            <h1>User Activity Table</h1>
        </div> 
        <table border="1">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Last Name</th>
                    <th>First Name</th>
                    <th>Account Balance</th>
                    <th>Rental Transaction ID</th>
                    <th>Rental Date</th>
                    <th>PC ID</th>
                    <th>Hours Spent</th>
                    <th>Top-Up ID</th>
                    <th>Top-Up Date</th>
                    <th>Top-Up Amount</th>
                    <th>Top-Up Payment Method</th>
                </tr>
            </thead>
            <tbody>
                <%
                    useractivity UA = new useractivity();
                    int pass = UA.getUserActivityDefault();

                    if (pass == 1 && !UA.userIdList.isEmpty()) {
                        for (int i = 0; i < UA.userIdList.size(); i++) {
                            Integer user_id = UA.userIdList.get(i);
                            String last_name = UA.lastNameList.get(i);
                            String first_name = UA.firstNameList.get(i);
                            Float account_balance = UA.accountBalanceList.get(i);

                            Integer rental_id = UA.rentIdList.get(i);
                            String rental_date = UA.rentalDateList.get(i);
                            Integer pc_id = UA.pcIdList.get(i);
                            Float hours_spent = UA.hoursSpentList.get(i);

                            Integer topup_id = UA.topupIdList.get(i);
                            String topup_date = UA.topupDateList.get(i);
                            Float amount = UA.topupAmountList.get(i);
                            String payment_method = UA.paymentMethodList.get(i);
                %>
                <tr>
                    <td><%= user_id%></td>
                    <td><%= last_name%></td>
                    <td><%= first_name%></td>
                    <td><%= account_balance%></td>
                    <td><%= rental_id%></td>
                    <td><%= rental_date%></td>
                    <td><%= pc_id%></td>
                    <td><%= hours_spent%></td>
                    <td><%= topup_id%></td>
                    <td><%= topup_date%></td>
                    <td><%= amount%></td>
                    <td><%= payment_method%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="12">No accounts available.</td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>
                <a href="activity2.jsp">Sort by ID</a>
        <form action="index.html">
            <input type="submit" value="Return to Home">
        </form>
    </body>
</html>
