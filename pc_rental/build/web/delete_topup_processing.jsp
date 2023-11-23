<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Top-Up</title>
</head>
<body>
    <jsp:useBean id="D" class="pc_rental_management.top_up" scope="session" />
      <%
        String delete_topupID = request.getParameter("topup_id");

             if (delete_topupID != null) {
                 try {
                     int topupID = Integer.parseInt(delete_topupID);

                     D.topup_id = topupID;

                     int result = D.del_topup();

                     if (result == 1) {
      %>
                        <p>Top-up record deleted successfully.</p>
      <%
                    } else {
      %>
                        <p>Error deleting top-up record.</p>
      <%
                    }
                } catch (NumberFormatException e) {
      %>
                    <p>Error parsing parameters.</p>
      <%
                }
            } else {
      %>
                <p>Invalid parameters provided.</p>
      <%
            }
      %>

    <form action="index.html">
        <input type="submit" value="Return to Home">
    </form>
</body>
</html>
