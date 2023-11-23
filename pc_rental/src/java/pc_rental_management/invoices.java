/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pc_rental_management;

import java.util.*;
import java.sql.*;

/**
 *
 * @author ccslearner
 */

public class invoices {
    //pc_information.java    
    public Integer              pc_id;
    public String               pc_type;
    public String               latest_username;
    public String               last_maintenance_date;
    
    public ArrayList<Integer>   pcIdList = new ArrayList<>();
    public ArrayList<String>    pcTypeList = new ArrayList<>();
    public ArrayList<String>    latestUsernameList = new ArrayList<>();
    public ArrayList<String>    lastMaintenanceDateList = new ArrayList<>();
    

    //rental_transaction.java
    public Integer rt_user_id;
    public String  rt_rental_date;
    public Integer rt_pc_id;
    public Float   rt_hours_spent;
    
    public ArrayList<Integer> userIdList = new ArrayList<>();
    public ArrayList<String> rentalDateList = new ArrayList<>();
    public ArrayList<Float> hoursSpentList = new ArrayList<>();
    

    //pc_maintenance_info.java
    public int      pm_maintenance_id;
    public int      pm_pc_id;
    public String   maintenance_status;
    public String   pm_maintenance_date;
    public String   pm_repair_companyname;
    
    public static ArrayList<Integer>   maintenance_idlist = new ArrayList<>();
    public static ArrayList<String>    maintenance_statuslist = new ArrayList<>();
    public static ArrayList<String>    maintenance_datelist = new ArrayList<>();
    public static ArrayList<String>    repair_companynamelist = new ArrayList<>();

    
    public invoices() {
        //constructor
    }
    
    public int getInvoices() {
        pcIdList.clear();
        pcTypeList.clear();
        latestUsernameList.clear();
        lastMaintenanceDateList.clear();
        
        userIdList.clear();
        rentalDateList.clear();
        hoursSpentList.clear();
        maintenance_idlist.clear();
        maintenance_statuslist.clear();
        maintenance_datelist.clear();
        repair_companynamelist.clear();

        try {
            // 1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getInvoices Connection Successful.");

            // 2. Prepare SQL Statements
            String query = "SELECT pc.pc_id, pc.pc_type, pc.latest_username , pc.last_maintenance_date,"
                    + "NULL AS maintenance_id, NULL AS maintenance_status, NULL AS maintenance_date,"
                    + "NULL AS repair_companyname, rt.rental_date, rt.user_id, rt.hours_spent,"
                    + "FROM pc_information pc "
                    + "LEFT JOIN rental_transaction rt ON pc.pc_id = rt.pc_id "
                    + "UNION "
                    + "SELECT pc.pc_id, pc.pc_type, pc.latest_username ,pc.last_maintenance_date,"
                    + "pm.maintenance_id, pm.maintenance_status, pm.maintenance_date,"
                    + "pm.repair_companyname, NULL AS rental_date, NULL AS user_id, NULL AS pc_id, NULL AS hours_spent,"
                    + "FROM pc_information pc "
                    + "LEFT JOIN pc_maintenanceinfo pm ON pc.pc_id = pm.pc_id";

            PreparedStatement preparedStatement = conn.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            // 3. Process the result
            while (resultSet.next()) {
                // Process pcinformation.java details
                pc_id = resultSet.getInt("pc_id");
                pcIdList.add(pc_id);
                pc_type = resultSet.getString("pc_type");
                pcTypeList.add(pc_type);
                latest_username = resultSet.getString("latest_username");
                latestUsernameList.add(latest_username);
                last_maintenance_date = resultSet.getString("last_maintenence_date");
                latestUsernameList.add(latest_username);
                

                // Process rental_transaction.java details
                
                rt_user_id = resultSet.getInt("user id");
                userIdList.add(rt_user_id);
                rt_rental_date = resultSet.getString("rental_date");
                rentalDateList.add(rt_rental_date);
                rt_pc_id = resultSet.getInt("pc_id");
                pcIdList.add(rt_pc_id);
                rt_hours_spent = resultSet.getFloat("hours_spent");
                hoursSpentList.add(rt_hours_spent);
                

                // Process pc_maintenanceinfo.java details
                pm_maintenance_id = resultSet.getInt("maintenance_id");
                maintenance_idlist.add(pm_maintenance_id);
                maintenance_status = resultSet.getString("maintenance_status");
                maintenance_statuslist.add(maintenance_status);
                pm_maintenance_date = resultSet.getString("maintenance_date");
                maintenance_datelist.add(pm_maintenance_date);
                pm_repair_companyname = resultSet.getString("repair_companyname");
                repair_companynamelist.add(pm_repair_companyname);
            }

            resultSet.close();
            preparedStatement.close();
            conn.close();
            return 1;

        } catch (Exception e) {
            System.out.println("getUserActivity Error: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

    public int getRowCount() {
        int rowCount = 0;

        try {
            // 1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getRowCount Connection Successful.");

            // 2. Prepare SQL Statements
            String query = "SELECT COUNT(*) AS row_count FROM ("
                    + "SELECT "
                    + "pc.pc_id,"
                    + "pc.pc_type,"
                    + "pc.latest_username," 
                    + "pc.last_maintenance_date," 
                    +"NULL AS maintenance_id," 
                    +"NULL AS maintenance_status," 
                    +"NULL AS maintenance_date," 
                    +"NULL AS repair_companyname, "
                    + "rt.rental_date,, "
                    + "rt.user_id,, "
                    +" rt.hours_spent, "
                    + "FROM pc_information pc "
                    + "LEFT JOIN rental_transaction rt ON pc.pc_id = rt.pc_id "
                    + "UNION "
                    + "SELECT "
                    + "pc.pc_id," 
                    +"pc.pc_type," 
                    +"pc.latest_username," 
                    +"pc.last_maintenance_date,"
                    +"pm.maintenance_id," 
                    +"pm.maintenance_status," 
                    +"pm.maintenance_date," 
                    +"pm.repair_companyname,"
                    +"NULL AS rental_date," 
                    +"NULL AS user_id," 
                    +"NULL AS hours_spent" 
                    + "FROM user_information ui "
                    + "LEFT JOIN user_topup ut ON ui.user_id = ut.user_id"
                    + ") AS combined_results";

            PreparedStatement preparedStatement = conn.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            // 3. Process the result
            if (resultSet.next()) {
                rowCount = resultSet.getInt("row_count");
                System.out.println("Number of rows: " + rowCount);
            }

            resultSet.close();
            preparedStatement.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("getRowCount Connection Unsuccessful.");
            e.printStackTrace(); // Handle the exception properly in a real application
        }

        return rowCount;
    }

    public static void main(String[] args) {
        invoices in = new invoices();
        in.getInvoices();

        
        // Print contents of pcIdList
        System.out.println("Contents of pcIdList: " + in.pcIdList);

        // Print contents of pcTypeList
        System.out.println("Contents of pcTypeList: " + in.pcTypeList);

        // Print contents of latestUsernameList
        System.out.println("Contents of latestUsernameList: " + in.latestUsernameList);

        // Print contents of lastMaintenanceDateList
        System.out.println("Contents of lastMaintenanceDateList: " + in.lastMaintenanceDateList);

        // Print contents of userIdList
        System.out.println("Contents of userIdList: " + in.userIdList);

        // Print contents of rentalDateList
        System.out.println("Contents of rentalDateList: " + in.rentalDateList);

        // Print contents of hoursSpentList
        System.out.println("Contents of hoursSpentList: " + in.hoursSpentList);

        // Print contents of maintenance_idlist
        System.out.println("Contents of maintenance_idlist: " + in.maintenance_idlist);

        // Print contents of maintenance_statuslist
        System.out.println("Contents of maintenance_statuslist: " + in.maintenance_statuslist);

        // Print contents of maintenance_datelist
        System.out.println("Contents of maintenance_datelist: " + in.maintenance_datelist);

        // Print contents of repair_companynamelist
        System.out.println("Contents of repair_companynamelist: " + in.repair_companynamelist);

        System.out.println("Number of Rows + 1: " + in.getRowCount());
        System.out.println("Size of pcIdList: " + in.pcIdList.size());
        System.out.println("Size of userIdList: " + in.userIdList.size());
        System.out.println("Size of maintenance_idlist: " + in.maintenance_idlist.size());
    }
}

