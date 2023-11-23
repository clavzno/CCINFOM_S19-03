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
public class rental_transaction {
    
    public int          transaction_id;
    public String       transaction_date;
    public int          user_id;
    public int          pc_id;
    public Float        hours_spent;     
    
    public ArrayList<Integer>   transaction_idList = new ArrayList<>();
    public ArrayList<String>    transaction_dateList = new ArrayList<>();
    public ArrayList<Integer>   user_idList = new ArrayList<>();
    public ArrayList<Integer>   pc_idList = new ArrayList<>();
    public ArrayList<Float>     hours_spentList = new ArrayList<>();

    
    public int add_transaction(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(transaction_id) + 1 as newTransactionID FROM user_information");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()){
                transaction_id = rst.getInt("newTransactionID");
                System.out.println("transaction_id: " + transaction_id);
            }
            
            PreparedStatement sqlstatement = conn.prepareStatement("INSERT INTO rental_transaction (rentaltransaction_id, rental_date, user_id, pc_id, hours_spent) VALUE (?, NOW(), ?, ?, ?, )");
            sqlstatement.setInt(1, transaction_id);
            sqlstatement.setString(2, transaction_date);
            sqlstatement.setInt(3, user_id);
            sqlstatement.setInt(4, pc_id);  
            sqlstatement.setFloat(5, hours_spent);                        
            

            sqlstatement.executeUpdate();
            sqlstatement.close();
            conn.close();
            return 1;
            
        }catch(SQLException e){ 
            return 0;
        }
    }
    
    
    public int delete_transaction(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            PreparedStatement sql_statement = conn.prepareStatement("DELETE FROM rental_transaction WHERE rentaltransaction_id=?");
            sql_statement.setInt(1, transaction_id);
            
            sql_statement.executeUpdate();
            sql_statement.close();
            conn.close();

            return 1;
         
        }catch(SQLException e){ 
            return 0;
        }
    }
    
    public int update_transaction(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(transaction_id) + 1 as newTransactionID FROM rental_transaction");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                transaction_id = rst.getInt("newTransactionID");   
            }
            
            PreparedStatement sql_statement = conn.prepareStatement("UPDATE rental_transaction SET transaction_id=?, transaction_date=?, pc_id=?, hours_spent=? WHERE user_id = ?");
            sql_statement.setInt(1, transaction_id);
            sql_statement.setString(2, transaction_date);
            sql_statement.setInt(3, pc_id);  
            sql_statement.setFloat(4, hours_spent);            
            sql_statement.setInt(5, user_id);
            
            
            sql_statement.executeUpdate();
            sql_statement.close();
            conn.close();

            return 1;
        }catch(SQLException e){ 
            return 0;
        }
    
    }
    
    public int view_transaction() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM rental_transaction WHERE rentaltransaction_id = ?")) {

            sql_statement.setInt(1, transaction_id);

            ResultSet result = sql_statement.executeQuery();

            if (result.next()) {
                // Retrieve transaction details
                transaction_id = result.getInt("rentaltransaction_id");
                transaction_date = result.getString("rental_date");
                user_id = result.getInt("user_id");
                pc_id = result.getInt("pc_id");
                hours_spent = result.getFloat("hours_spent");

                return 1; // Success
            } else {
                return 0; // Transaction not found
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Error
        }
    }

    
    public int getUserIds() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT user_id FROM user_information");
            ResultSet rst = pstmt.executeQuery();

            user_idList.clear();

            while (rst.next()) {
                this.user_id = rst.getInt("user_id");
                user_idList.add(user_id);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (SQLException e) {
            return 0;
        }
    }

    public int getPcIds() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT pc_id FROM pc_information");
            ResultSet rst = pstmt.executeQuery();

            pc_idList.clear();

            while (rst.next()) {
                this.pc_id = rst.getInt("pc_id");
                pc_idList.add(pc_id);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (SQLException e) {
            return 0;
        }
    }
    
    public int getTransactionIds() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT rentaltransaction_id FROM rental_transaction");
             ResultSet result = sql_statement.executeQuery()) {

            transaction_idList.clear();

            while (result.next()) {
                int transactionId = result.getInt("rentaltransaction_id");
                transaction_idList.add(transactionId);
            }

            return 1; // Success

        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Error
        }
    }
    
    public int getTransactionDetails(int transactionId) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?useTimeZone=true&serverTimeZone=UTC&user=root&password=12345678");
             PreparedStatement sql_statement = conn.prepareStatement("SELECT * FROM rental_transaction WHERE rentaltransaction_id = ?")) {

            sql_statement.setInt(1, transactionId);

            ResultSet result = sql_statement.executeQuery();

            if (result.next()) {
                // Retrieve transaction details
                transaction_id = result.getInt("rentaltransaction_id");
                transaction_date = result.getString("rental_date");
                user_id = result.getInt("user_id");
                pc_id = result.getInt("pc_id");
                hours_spent = result.getFloat("hours_spent");

                return 1; // Success
            } else {
                return 0; // Transaction not found
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Error
        }
    }

}
