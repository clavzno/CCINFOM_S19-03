<%@ page import="java.util.*, pc_rental_management.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All PCs</title>
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
    <h1>View All PCs</h1>

    <table>
        <thead>
            <tr>
                <th>PC ID</th>
                <th>PC Type</th>
                <th>Username</th>
                <th>Last Maintenance Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                pc_information pc = new pc_information();
                int result = pc.getListOfPcIds();

                if (result == 1 && !pc.pcIdList.isEmpty()) {
                    for (int i = 0; i < pc.pcIdList.size(); i++) {
                        int pcID = pc.pcIdList.get(i);
                        int viewResult = pc.view_pc(pcID);

                        if (viewResult == 1) {
            %>
                            <tr>
                                <td><%= pc.pc_id %></td>
                                <td><%= pc.pc_type %></td>
                                <td><%= pc.username %></td>
                                <td><%= pc.last_maintenance_date %></td>
                                <td><%= pc.status %></td>
                            </tr>
            <%
                        }
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">No PCs available.</td>
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
