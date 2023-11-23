<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, pc_rental_management.*" %>
<%@page import="pc_rental_management.top_up"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PC Rental Transaction Processing</title>
    </head>
    <body>
        <jsp:useBean id="B" class="pc_rental_management.top_up" scope="session"/>
        <%
        Integer v_user_id = Integer.parseInt(request.getParameter("user_id"));
        Integer v_amount_paid = Integer.parseInt(request.getParameter("amount_paid"));
        top_up.payment_method v_payment_type = top_up.payment_method.valueOf(request.getParameter("payment_type"));
        
        B.user_id = v_user_id;
        B.amount_paid = v_amount_paid;
        B.payment_type = v_payment_type;
        
        if(B.add_topup()== 1){
        %>
        <h1>Transaction Successful!</h1>
        <%} else {
        %>
        <h1>Transaction Failed!</h1>
        <%} 
        %>
        <form action="index.html">
            <input type="submit" value="Return">
        </form>
    </body>
</html>
