<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, pc_rental_management.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update PC Information</title>
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
    <jsp:useBean id="uppc" class="pc_rental_management.pc_information" scope="session" />
    <%
        String pcIDParam = request.getParameter("pc_id");

        if (pcIDParam != null && !pcIDParam.isEmpty()) {
            int pcId = Integer.parseInt(pcIDParam);

            int result = uppc.getPCDetails(pcId);

            if (result == 1) {
    %>
                <form action="update_pc_processing.jsp" method="post">
                    <div class="column left">
                        <h1>Previous Details</h1>

                        <label for="prev_pc_type">PC Type:</label>
                        <input type="text" id="prev_pc_type" name="prev_pc_type" value="<%= uppc.pc_type %>" readonly>

                        <label for="prev_username">Username:</label>
                        <input type="text" id="prev_username" name="prev_username" value="<%= uppc.username %>" readonly>

                        <label for="prev_last_maintenance_date">Last Maintenance Date:</label>
                        <input type="text" id="prev_last_maintenance_date" name="prev_last_maintenance_date" value="<%= uppc.last_maintenance_date %>" readonly>

                        <label for="prev_status">Status:</label>
                        <input type="text" id="prev_status" name="prev_status" value="<%= uppc.status %>" readonly>
                    </div>

                    <div class="column right">
                        <h1>New Details</h1>

                    <label for="pc_type">PC Type:</label>
                    <input type="text" id="pc_type" name="pc_type">

                    <label for="username"> Latest Username:</label>
                    <select id="username" name="username">
                        <%
                            pc_information pc = new pc_information();
                            
                            ArrayList<String> latestUsernames = pc.getListOfUsernames();

                            if (!latestUsernames.isEmpty()) {
                                for (String username : latestUsernames) {
                        %>
                                    <option value="<%= username %>"><%= username %></option>
                        <%
                                }
                            }
                        %>
                    </select><br>
                    
                    <br>
                    <label for="last_maintenance_date">Last Maintenance Date:</label>
                    <input type="date" id="last_maintenance_date" name="last_maintenance_date">

                    <label for="status">Status:</label>
                    <select id="pc_status" name="pc_status">
                        <option value="IN_USE">In Use</option>
                        <option value="AVAILABLE">Available</option>
                        <option value="IN_MAINTENANCE">In Maintenance</option>
                    </select>

                    <input type="submit" value="Update">
                    <input type="button" class="cancel-button" value="Cancel">
                    </div>


                </form>
    <%
            } else {
    %>
                <p>Error retrieving PC details.</p>
    <%
            }
        } else {
    %>
            <p>No PC ID provided.</p>
    <%
        }
    %>
</body>
</html>
