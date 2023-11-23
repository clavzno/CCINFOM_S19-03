<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account</title>
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
            position: relative; /* Added position property for absolute positioning */
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
    <jsp:useBean id="C" class="pc_rental_management.account" scope="session" />
    <%
        String userIDParam = request.getParameter("user_id");

        if (userIDParam != null && !userIDParam.isEmpty()) {
            int userID = Integer.parseInt(userIDParam);

            int result = C.getUserDetails(userID);

            if (result == 1) {
    %>
                <form action="update_account_processing.jsp" method="post">
                    <div class="column left">
                        <h1>Previous User Details</h1>

                        <label for="prev_lastname">Last Name:</label>
                        <input type="text" id="prev_lastname" name="prev_lastname" value="<%= C.lastname %>" readonly>

                        <label for="prev_firstname">First Name:</label>
                        <input type="text" id="prev_firstname" name="prev_firstname" value="<%= C.firstname %>" readonly>

                        <label for="prev_contactnumber">Contact Number:</label>
                        <input type="text" id="prev_contactnumber" name="prev_contactnumber" value="<%= C.contactnumber %>" readonly>

                        <label for="prev_username">Username:</label>
                        <input type="text" id="prev_username" name="prev_username" value="<%= C.username %>" readonly>

                        <label for="prev_password">Password:</label>
                        <input type="password" id="prev_password" name="prev_password" value="<%= C.password %>" readonly>

                        <label for="prev_balance">Balance:</label>
                        <input type="text" id="prev_balance" name="prev_balance" value="<%= C.balance %>" readonly>
                    </div>

                    <div class="column right">
                        <h1>New User Details</h1>

                        <label for="lastname">Last Name:</label>
                        <input type="text" id="lastname" name="lastname">

                        <label for="firstname">First Name:</label>
                        <input type="text" id="firstname" name="firstname">

                        <label for="contactnumber">Contact Number:</label>
                        <input type="text" id="contactnumber" name="contactnumber">

                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username">

                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password">

                        <label for="balance">Balance:</label>
                        <input type="text" id="balance" name="balance">

                         <input type="submit" value="Update">
                         <input type="button" value="Back to Main Menu" onclick="window.location.href='index.html'">
                    </div>

                </form>
    <%
            } else {
    %>
                <p>Error retrieving user details.</p>
    <%
            }
        } else {
    %>
            <p>No user ID provided.</p>
    <%
        }
    %>
</body>
</html>
