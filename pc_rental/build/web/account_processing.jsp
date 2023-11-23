<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, pc_rental_management.account.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Account Creation</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #3498db;
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
            background-color: #2c3e50;
            margin: auto;
        }

        h1 {
            color: #ecf0f1;
            font-family: 'Bebas Neue', cursive;
        }

        input, h1 {
            margin-bottom: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
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
    <jsp:useBean id="A" class="pc_rental_management.account" scope="session"/>
    
    <%
        String v_lastName = request.getParameter("lastname");
        String v_firstName = request.getParameter("firstname");
        String v_contactNumber = request.getParameter("contactnumber");
        String v_username = request.getParameter("username");
        String v_password = request.getParameter("password");
        float v_balance = Float.parseFloat(request.getParameter("balance"));

        A.lastname = v_lastName;
        A.firstname = v_firstName;
        A.contactnumber = v_contactNumber;
        A.username = v_username;
        A.password = v_password;
        A.balance = v_balance;

        if(A.create_account() == 1){
    %>
    <h1>Account has been created successfully</h1>
    <%
        } else {
    %>
    <h1>Account creation has failed</h1>       
    <%
        }
    %>

    <form action="index.html">
        <input type="submit" value="Return">
    </form>
</body>
</html>
