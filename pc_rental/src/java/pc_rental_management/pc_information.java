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
public class pc_information {
    
    public enum pc_status{
            IN_USE,
            AVAILABLE,
            IN_MAINTENANCE,
    }
    
    public Integer              pc_id;
    public String               pc_type;
    public String               username;
    public String               last_maintenance_date;
    public pc_status            status;
    
    public ArrayList<Integer>   pcIdList = new ArrayList<>();
    public ArrayList<String>    pcTypeList = new ArrayList<>();
    public ArrayList<String>    latestUsernameList = new ArrayList<>();
    public ArrayList<String>    lastMaintenanceDateList = new ArrayList<>();
    public ArrayList<pc_status> statusList = new ArrayList<>();
    
    
    public int add_pc() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");

            // Get the next available pc_id
            PreparedStatement id_statement = conn.prepareStatement("SELECT MAX(pc_id) + 1  AS NewPCID FROM pc_information");
            ResultSet id_result = id_statement.executeQuery();

            while (id_result.next()) {
                pc_id = id_result.getInt("NewPCID");
                System.out.println("pc_id: " + pc_id);
            }

            // Insert a new pc_information record
            PreparedStatement sql_statement = conn.prepareStatement("INSERT INTO pc_information (pc_id, pc_type, latest_username, last_maintenance_date, pc_status) VALUES (?, ?, ?, ?, ?)");

            sql_statement.setInt(1, pc_id);
            sql_statement.setString(2, pc_type); 
            sql_statement.setString(3, username);
            sql_statement.setString(4, last_maintenance_date);  
            sql_statement.setString(5, status.name());

            sql_statement.executeUpdate();

            sql_statement.close();
            conn.close();
            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }


    
    public int delete_pc() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("DELETE FROM pc_information WHERE pc_id=?");
            sql_statement.setInt(1, pc_id);

            int rowsAffected = sql_statement.executeUpdate();

            sql_statement.close();
            conn.close();

            if (rowsAffected > 0) {
                // Delete successful
                return 1;
            } else {
                // No rows affected, PC not found
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Error
        }
    }
    
    public int update_pc() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("UPDATE pc_information SET pc_type=?, latest_username=?, last_maintenance_date=?, pc_status=? WHERE pc_id=?"); 

                    sql_statement.setString(1, pc_type);
                    sql_statement.setString(2, username);
                    sql_statement.setString(3, last_maintenance_date);
                    sql_statement.setString(4, status.name());
                    sql_statement.setInt(5, pc_id);

                    sql_statement.executeUpdate();
                    sql_statement.close();
                    conn.close();
                    return 1;
                            
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception (consider using a logger)
            return 0; // Error
        }
    }

    
    public ArrayList<String> getListOfUsernames() {   
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("SELECT  username FROM user_information");
            ResultSet result = sql_statement.executeQuery();

            while (result.next()) {
                String user = result.getString("latest_username");
                if (user != null) {
                    latestUsernameList.add(user);
                }
            }
            
            sql_statement.executeUpdate();
            result.close();
            sql_statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return latestUsernameList;
     }

    
    public int getListOfPcIds() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("SELECT pc_id FROM pc_information");
            ResultSet result = sql_statement.executeQuery()){

            pcIdList.clear();

            while (result.next()) {
                int pcId = result.getInt("pc_id");
                pcIdList.add(pcId);
            }
            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0; 
        }
    }
    
    public int getPCDetails(int pcID) {
    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
         PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM pc_information WHERE pc_id = ?")) {

        sql_statement.setInt(1, pcID);

        ResultSet result = sql_statement.executeQuery();

        if (result.next()) {
            // Retrieve PC details
            pc_id = result.getInt("pc_id");
            pc_type = result.getString("pc_type");
            username = result.getString("latest_username");
            last_maintenance_date = result.getString("last_maintenance_date");
            status = pc_status.valueOf(result.getString("pc_status"));

            return 1; // Success
        } else {
            return 0; // PC not found
        }

    } catch (SQLException e) {
        e.printStackTrace();
        return -1; // Error
    }
}

    public int view_pc(int pcID) {
    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
         PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM pc_information WHERE pc_id = ?")) {

        // Set the PC ID parameter in the SQL statement
        sql_statement.setInt(1, pcID);

        // Execute the query
        ResultSet result = sql_statement.executeQuery();

        if (result.next()) {
            // Retrieve PC details
            pc_id = result.getInt("pc_id");
            pc_type = result.getString("pc_type");
            username = result.getString("latest_username");
            last_maintenance_date = result.getString("last_maintenance_date");
            status = pc_status.valueOf(result.getString("pc_status"));

            return 1; // Success
        } else {
            return 0; // PC not found
        }

    } catch (SQLException e) {
        e.printStackTrace();
        return -1; // Error
    }
}
}
