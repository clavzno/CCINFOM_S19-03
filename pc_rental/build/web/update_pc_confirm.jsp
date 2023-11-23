<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, pc_rental_management.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update PC Information</title>
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
    <jsp:useBean id="uppc" class="pc_rental_management.pc_information" scope="session" />
    
    <form action="update_pc.jsp" method="post">
        <label for="pc_id">Select PC ID to Update:</label>
        <select id="pc_id" name="pc_id">
            <%
                
            int result = uppc.getListOfPcIds();

            if (result == 1 && !uppc.pcIdList.isEmpty()) {
 
                for (Integer pc_id : uppc.pcIdList) {
            %>
            <option value="<%= pc_id %>"><%= pc_id %></option>
            <%
                }
            } else {
            %>
            <option value="" disabled>No PC IDs available</option>
            <%
            }
            %>
        </select><br>

        <input type="submit" value="Update PC">
    </form>

</body>
</html>
