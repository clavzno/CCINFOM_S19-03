/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pc_rental_management;

import java.sql.*;
import java.util.*;
/**
 *
 * @author ccslearner
 */
public class top_up {
    
    public enum payment_method {
        CASH,
        GCASH,
        PAYMAYA,
        CARD,
    }
    
    public Integer              topup_id;
    public Integer              user_id;
    public String               topup_date;
    public Integer              amount_paid;
    public payment_method       payment_type;
        
    public ArrayList<Integer>           topup_idlist = new ArrayList<>();
    public ArrayList<Integer>           user_idlist = new ArrayList<>();
    public ArrayList<String>            topup_datelist = new ArrayList<>();
    public ArrayList<Integer>           amount_paidlist = new ArrayList<>();
    public ArrayList<String>            payment_typelist = new ArrayList<>();

    
    public int add_topup() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sqlstmt = conn.prepareStatement("SELECT MAX(topup_id) + 1  AS NewTopUpID FROM user_topup");
            ResultSet result = sqlstmt.executeQuery();

            while (result.next()) {
                topup_id = result.getInt("NewTopUpID");
                System.out.println("topup_id: " + topup_id);
            }

            PreparedStatement sql_statement = conn.prepareStatement("INSERT INTO user_topup (topup_id, user_id, topup_date, amount, payment_method) VALUES (?, ?, NOW(), ?, ?)");

            sql_statement.setInt(1, topup_id);
            sql_statement.setInt(2, user_id);
            sql_statement.setInt(3, amount_paid);
            sql_statement.setString(4, payment_type.name());

            sql_statement.executeUpdate();

            sql_statement.close();
            conn.close();
            return 1;

        } catch (SQLException e) {
            e.printStackTrace(); 
            return 0;
        }
    }

    
    public int del_topup() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("DELETE FROM user_topup WHERE topup_id=?");
            sql_statement.setInt(1, topup_id);

            sql_statement.executeUpdate();
            sql_statement.close();
            conn.close();

            return 1;
        } catch(SQLException e) {
            return 0;
        }
    }
    
    
   public int update_topup(){
       try{
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
           PreparedStatement sql_statement = conn.prepareStatement("UPDATE user_topup SET amount_paid=?, topup_date=NOW(), payment_method=? WHERE user_id = ?");
           sql_statement.setInt(1, topup_id);
           sql_statement.setInt(2, user_id);
           sql_statement.setString(3, topup_date);
           sql_statement.setInt(4, amount_paid);
           sql_statement.setString(5, payment_type.name());

           sql_statement.executeUpdate();
           sql_statement.close();
           conn.close();
           return 1;
           
       }catch(SQLException e) {
            return 0;
       }
   }
   
      public int getUser_idlist() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("SELECT user_id FROM user_information");
            ResultSet result = sql_statement.executeQuery();

            user_idlist.clear();
            
            while(result.next()) {
                this.user_id = result.getInt("user_id");
                user_idlist.add(user_id);
            }
            
            sql_statement.executeUpdate();
            sql_statement.close();
            conn.close();
            return 1;

        } catch (SQLException e) {
            return 0;
        }
   }
   
      public int getTopUpIDList() {
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
                 PreparedStatement sql_statement = conn.prepareStatement("SELECT topup_id FROM user_topup");
                 ResultSet result = sql_statement.executeQuery()) {

                topup_idlist.clear();

                while (result.next()) {
                    topup_idlist.add(result.getInt("topup_id"));
                }

                return 1;
            } catch (SQLException e) {
                e.printStackTrace();  // Add this line for logging SQL exceptions
                return 0;
            }
        }
      
    public int view_topups() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM user_topup");
             ResultSet result = sql_statement.executeQuery()) {

            topup_idlist.clear();
            user_idlist.clear();
            topup_datelist.clear();
            amount_paidlist.clear();
            payment_typelist.clear();

            while (result.next()) {
                int topupID = result.getInt("topup_id");
                int userID = result.getInt("user_id");
                String topupDate = result.getString("topup_date");
                int amountPaid = result.getInt("amount");
                String paymentType = result.getString("payment_method");

                // Add top-up details to lists
                topup_idlist.add(topupID);
                user_idlist.add(userID);
                topup_datelist.add(topupDate);
                amount_paidlist.add(amountPaid);
                payment_typelist.add(paymentType);
            }

            return 1; // Success

        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Error
        }
    }



}

    

