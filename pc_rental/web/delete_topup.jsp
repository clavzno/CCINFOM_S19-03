<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Top-up</title>
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
    <jsp:useBean id="D" class="pc_rental_management.top_up" scope="session" />
    <form action="delete_topup_processing.jsp" method="post">
        <h1>Delete Top-up</h1>

        <label for="topup_id">Select Top-up ID:</label>
        <select id="topup_id" name="topup_id">
            <%

                int result = D.getTopUpIDList();

                if (result == 1 && !D.topup_idlist.isEmpty()) {
                    for (int topupID : D.topup_idlist) {
            %>
            <option value="<%= topupID %>"><%= topupID %></option>
            <%
                    }
                } else {
            %>
            <option value="" disabled>No Top-up IDs available</option>
            <%
                }
            %>
        </select><br>

        <input type="submit" value="Delete Top-up">
    </form>
</body>
</html>
