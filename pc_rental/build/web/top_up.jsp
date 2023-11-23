<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="pc_rental_management.top_up"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Top Up</title>
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

        b {
            font-size: 2em;
            margin-bottom: 15px;
            font-family: 'Bebas Neue', cursive;
            font-weight: bold;
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
            background-color: #2980b9;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2c3e50;
        }
    </style>
</head>
<body>
    <form action="topup_processing.jsp">
        <jsp:useBean id="B" class="pc_rental_management.top_up" scope="session" />        
        <b>Top Up</b> <br>
        Select a user id to top up. <br><br>
        
        User ID: <select id="user_id" name="user_id">
            <%
                B.getUser_idlist();
                for (int i = 0; i < B.user_idlist.size(); i++) {
            %>
            <option value ="<%= B.user_idlist.get(i) %>"><%= B.user_idlist.get(i) %></option>
            <%
            }
            %>  
        </select> <br>
        
        Amount Paid: 
        <input type="number" name="amount_paid" required><br>
        
        Payment Type: 
        <select name="payment_type">
            <option value="CASH">Cash</option>
            <option value="GCASH">GCash</option>
            <option value="PAYMAYA">PayMaya</option>
            <option value="CARD">Card</option>

        </select><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
