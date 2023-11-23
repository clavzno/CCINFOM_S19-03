/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pc_rental_management;

/**
 *
 * @author ccslearner
 */
import java.util.*;
import java.sql.*;


public class account {
    public int      id;
    public String   lastname;
    public String   firstname;
    public String   contactnumber;
    public String   username;
    public String   password;
    public float    balance;
    
    public ArrayList<Integer>   account_idlist = new ArrayList<>();
    public ArrayList<String>    account_lastnamelist = new ArrayList<>();
    public ArrayList<String>    account_firstnamelist = new ArrayList<>();
    public ArrayList<String>    account_contactnumberlist = new ArrayList<>();
    public ArrayList<String>    account_usernamelist = new ArrayList<>();
    public ArrayList<String>    account_passwordlist = new ArrayList<>();
    public ArrayList<Float>     account_balancelist = new ArrayList<>();
      
    public int create_account() {
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            
            /*PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(user_id) + 1 as newID FROM user_information");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                id = rst.getInt("newID");
            
            }*/
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO user_information (user_id, last_name, first_name, contact_number, username, user_password, account_balance) VALUE (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, id);
            pstmt.setString(2, lastname);
            pstmt.setString(3, firstname);
            pstmt.setString(4, contactnumber);  
            pstmt.setString(5, username);            
            pstmt.setString(6, password);
            pstmt.setFloat(7,balance);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
            
        }catch(SQLException e){ 
            return 0;
        }
 
    }
    
    public int delete_account() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("DELETE FROM user_information WHERE user_id=?");
            sql_statement.setInt(1, id);

            int rowsAffected = sql_statement.executeUpdate();

            sql_statement.close();
            conn.close();

            if (rowsAffected > 0) {
                // Deletion successful
                return 1;
            } else {
                // No rows affected, user not found
                return 0;
            }
        } catch (SQLException e) {
            // Handle the exception properly, you can log it or throw a custom exception
            e.printStackTrace();
            return -1; // Error code indicating a failure
        }
    }

        
    public int update_account() {
    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
         PreparedStatement sql_statement = conn.prepareStatement("UPDATE user_information SET last_name=?, first_name=?, contact_number=?, username=?, user_password=?, account_balance=? WHERE user_id = ?")) {

        sql_statement.setString(1, lastname);
        sql_statement.setString(2, firstname);
        sql_statement.setString(3, contactnumber);
        sql_statement.setString(4, username);
        sql_statement.setString(5, password);
        sql_statement.setFloat(6, balance);
        sql_statement.setInt(7, id);
        
        sql_statement.executeUpdate();

        return 1;

    } catch (SQLException e) {
        e.printStackTrace(); 
        return 0;
    }
}



    public int getUserIDList() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("SELECT user_id FROM user_information");
            ResultSet result = sql_statement.executeQuery()) {

            account_idlist.clear();

            while (result.next()) {
                int userID = result.getInt("user_id");
                account_idlist.add(userID);
            }
            
            return 1;

        } catch (SQLException e) {
            e.printStackTrace(); // Print the exception for debugging
            return 0;
        }
    }
    

    public int getUserDetails(int userID) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM user_information WHERE user_id = ?")) {

            sql_statement.setInt(1, userID);

            ResultSet result = sql_statement.executeQuery();

            if (result.next()) {
                // Retrieve user details
                id = result.getInt("user_id");
                lastname = result.getString("last_name");
                firstname = result.getString("first_name");
                contactnumber = result.getString("contact_number");
                username = result.getString("username");
                password = result.getString("user_password");
                balance = result.getFloat("account_balance");

                return 1; // Success
            } else {
                return 0; // User not found
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Error
        }
    }
    
        public int view_accounts() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM user_information");
             ResultSet result = sql_statement.executeQuery()) {

            account_idlist.clear();
            account_lastnamelist.clear();
            account_firstnamelist.clear();
            account_contactnumberlist.clear();
            account_usernamelist.clear();
            account_passwordlist.clear();
            account_balancelist.clear();

            while (result.next()) {
                int userID = result.getInt("user_id");
                String userLastName = result.getString("last_name");
                String userFirstName = result.getString("first_name");
                String userContactNumber = result.getString("contact_number");
                String userUsername = result.getString("username");
                String userPassword = result.getString("user_password");
                float userBalance = result.getFloat("account_balance");

                // Add user details to lists
                account_idlist.add(userID);
                account_lastnamelist.add(userLastName);
                account_firstnamelist.add(userFirstName);
                account_contactnumberlist.add(userContactNumber);
                account_usernamelist.add(userUsername);
                account_passwordlist.add(userPassword);
                account_balancelist.add(userBalance);
            }

            return 1; // Success

        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Error
        }
       }
        
    /*public static ArrayList<String> getAllUsernames() {
        ArrayList<String> usernames = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT username FROM user_information");
             ResultSet result = sql_statement.executeQuery()) {

            while (result.next()) {
                String username = result.getString("username");
                usernames.add(username);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception based on your application's needs
        }

        return usernames;
    }*/


          
}

