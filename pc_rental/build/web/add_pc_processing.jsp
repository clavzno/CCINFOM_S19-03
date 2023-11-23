<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*, pc_rental_management.*" %>
<%@page import="pc_rental_management.pc_information"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PC Information Addition - Processing</title>
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
    <jsp:useBean id="pc" class="pc_rental_management.pc_information" scope="session"/>
    <%
        try {
            
            pc.username = request.getParameter("username");  // Corrected property name
            pc.pc_type = request.getParameter("pc_type");
            pc.last_maintenance_date = request.getParameter("last_maintenance_date");
            pc.status = pc_information.pc_status.valueOf(request.getParameter("pc_status"));

            if (pc.add_pc() == 1) {
    %>
                <h1>PC Information has been added successfully</h1>
    <%
            } else {
    %>
                <h1>Error adding PC Information</h1>
                
    <%
            }
        } catch (IllegalArgumentException e) {
    %>
            <h1>Error: Invalid PC Status</h1>
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
