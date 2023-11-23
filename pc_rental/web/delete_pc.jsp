<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:useBean id="rm" class="pc_rental_management.pc_information" scope="session" />

        <%
            int result = rm.getListOfPcIds();
        %>

        <form action="delete_pc_processing.jsp" method="post">
            <label for="pc_id">Select User ID to Delete:</label>
            <select id="pc_id" name="pc_id">
        <%
            for (Integer pc_id : rm.pcIdList) {
        %>
        <option value="<%= pc_id %>"><%= pc_id %></option>
        <%
            }
        %>
    </select><br>

    <input type="submit" value="Delete PC">
</form>

</body>
</html>
