
<%-- 
    Document   : activity
    Created on : 11 22, 23, 12:18:57 PM
    Author     : ccslearner
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="pc_rental_management.invoices"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>View User Activity</title>
    </head>
    <body>
        <h1>User Activity Table</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>PC ID</th>
                    <th>PC Type</th>
                    <th>Latest Username</th>
                    <th>Last Maintenance Date</th>
                    <th>Maintenance ID</th>
                    <th>Maintenance Status</th>
                    <th>Repair Company Name</th>
                    <th>Rental Date</th>
                    <th>User ID</th>
                    <th>Hours Spent</th>
                </tr>
            </thead>
            <tbody>
                
         
                <%
                    invoices in = new invoices();
                    int pass = in.getInvoices();

                    if (pass == 0 && !in.pcIdList.isEmpty()) {
                        for (int i = 0; i < in.pcIdList.size(); i++) {
                            Integer pc_id = in.pcIdList.get(i);
                            String pc_type = in.pcTypeList.get(i);
                            String latest_username = in.latestUsernameList.get(i);
                            String last_maintenance_date = in.lastMaintenanceDateList.get(i);

                            Integer maintenance_id = in.maintenance_idlist.get(i);
                            String maintenance_status = in.maintenance_statuslist.get(i);
                            String maintenance_date = in.maintenance_datelist.get(i);
                            String repair_companyname = in.repair_companynamelist.get(i);

                            String rentai_date = in.rentalDateList.get(i);
                            Integer user_Id = in.userIdList.get(i);
                            Float hours_spent = in.hoursSpentList.get(i);
                            
                %>
                <tr>
                    <td><%= pc_id%></td>
                    <td><%= pc_type%></td>
                    <td><%= latest_username%></td>
                    <td><%= last_maintenance_date%></td>
                    <td><%= maintenance_id%></td>
                    <td><%= maintenance_status%></td>
                    <td><%= maintenance_date%></td>
                    <td><%= repair_companyname%></td>
                    <td><%= rentai_date%></td>
                    <td><%= user_Id%></td>
                    <td><%= hours_spent%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="12">No accounts available.</td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>
    </body>
</html>