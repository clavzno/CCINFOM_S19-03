<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, pc_rental_management.*" %>
<%@page import="pc_rental_management.pc_information"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete PC - Processing</title>
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
            color: #ecf0f1;
            font-size: 2em;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #ecf0f1;
            cursor: pointer;
            transition: background-color 0.3s;
            padding: 10px;
            border-radius: 5px;
            border: none;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <jsp:useBean id="rm" class="pc_rental_management.pc_information" scope="session" />

    <%
        try {
            int pc_idToDelete = Integer.parseInt(request.getParameter("pc_id"));

            rm.pc_id = pc_idToDelete;

            int deleteResult = rm.delete_pc();

            if (deleteResult == 1) {
    %>
                <h1>PC with ID <%= pc_idToDelete %> has been deleted successfully.</h1>
    <%
            } else if (deleteResult == 0) {
    %>
                <h1>Error: PC with ID <%= pc_idToDelete %> not found.</h1>
    <%
            } else {
    %>
                <h1>Error deleting PC with ID <%= pc_idToDelete %>.</h1>
    <%
            }
        } catch (Exception e) {
    %>
            <h1>Error: <%= e.getMessage() %></h1>
    <%
        }
    %>

    <form action="index.html">
        <input type="submit" value="Return to Home">
    </form>
</body>
</html>
