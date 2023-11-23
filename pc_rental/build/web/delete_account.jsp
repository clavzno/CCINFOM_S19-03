<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, pc_rental_management.*" %>
<%@page import="pc_rental_management.account" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account</title>
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
            background-color: #e74c3c;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <jsp:useBean id="A" class="pc_rental_management.account" scope="session" />

    <%
        int result = A.getUserIDList();
    %>

<form action="delete_account_processing.jsp" method="post">
    <label for="user_id">Select User ID to Delete:</label>
    <select id="user_id" name="user_id">
        <%
            for (Integer userID : A.account_idlist) {
        %>
        <option value="<%= userID %>"><%= userID %></option>
        <%
            }
        %>
    </select><br>

    <input type="submit" value="Delete Account">
</form>

</body>
</html>
