<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Account - Processing</title>
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
    <jsp:useBean id="account" class="pc_rental_management.account" scope="session"/>
    <%
        try {
            account.id = Integer.parseInt(request.getParameter("user_id"));

            if (account.delete_account() == 1) {
    %>
                <h1>Account has been deleted successfully</h1>
    <%
            } else {
    %>
                <h1>Error deleting account</h1>  
    <%
            }
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
