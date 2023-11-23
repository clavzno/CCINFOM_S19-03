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

/*
SELECT 
    ui.user_id,
    ui.last_name,
    ui.first_name,
    ui.username,
    ui.account_balance,
    rt.rentaltransaction_id,
    rt.rental_date,
    rt.pc_id,
    rt.hours_spent,
    ut.topup_id,
    ut.topup_date,
    ut.amount,
    ut.payment_method
FROM user_information ui
LEFT JOIN rental_transaction rt ON ui.user_id = rt.user_id
LEFT JOIN user_topup ut ON ui.user_id = ut.user_id;
 */
public class useractivity {

    //account.java
    public Integer ui_user_id;
    public String ui_last_name;
    public String ui_first_name;
    public String ui_username;
    public Float ui_account_balance;
    public ArrayList<Integer> userIdList = new ArrayList<>();
    public ArrayList<String> lastNameList = new ArrayList<>();
    public ArrayList<String> firstNameList = new ArrayList<>();
    public ArrayList<String> usernameList = new ArrayList<>();
    public ArrayList<Float> accountBalanceList = new ArrayList<>();

    //rental_transaction.java
    public Integer rt_rentaltransaction_id;
    public String rt_rental_date;
    public Integer rt_pc_id;
    public Float rt_hours_spent;
    public ArrayList<Integer> rentIdList = new ArrayList<>();
    public ArrayList<String> rentalDateList = new ArrayList<>();
    public ArrayList<Integer> pcIdList = new ArrayList<>();
    public ArrayList<Float> hoursSpentList = new ArrayList<>();

    //top_up.java
    public Integer ut_topup_id;
    public String ut_topup_date;
    public Float ut_amount;

    public enum ut_payment_method {
        CASH,
        GCASH,
        PAYMAYA,
        CARD
    }
    public String payment_method;

    public ArrayList<Integer> topupIdList = new ArrayList<>();
    public ArrayList<String> topupDateList = new ArrayList<>();
    public ArrayList<Float> topupAmountList = new ArrayList<>();
    public ArrayList<String> paymentMethodList = new ArrayList<>();

    public useractivity() {
        //constructor
    }

    // run this to get account.java details
    private int getAccountDetails() {

        userIdList.clear();
        lastNameList.clear();
        firstNameList.clear();
        usernameList.clear();
        accountBalanceList.clear();

        try {
            //1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getAccountDetails Connection Successful.");

            //2. Prepare SQL Statements
            PreparedStatement accountDetails = conn.prepareStatement("SELECT user_id, last_name, first_name, username, account_balance FROM user_information");
            ResultSet resultAccountDetails = accountDetails.executeQuery();

            //3. Save Results to each ArrayList
            while (resultAccountDetails.next()) {
                ui_user_id = resultAccountDetails.getInt("user_id");
                userIdList.add(ui_user_id);
                ui_last_name = resultAccountDetails.getString("last_name");
                lastNameList.add(ui_last_name);
                ui_first_name = resultAccountDetails.getString("first_name");
                firstNameList.add(ui_first_name);
                ui_username = resultAccountDetails.getString("username");
                usernameList.add(ui_username);
                ui_account_balance = resultAccountDetails.getFloat("account_balance");
                accountBalanceList.add(ui_account_balance);
            }

            conn.close();
            accountDetails.close();
            resultAccountDetails.close();

            return 1;

        } catch (Exception e) {
            System.out.println("getAccountDetails Error: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

    // run this to get rental_transaction.java details
    private int getTransactionDetails() {

        rentIdList.clear();
        rentalDateList.clear();
        pcIdList.clear();
        hoursSpentList.clear();

        try {
            //1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getTransactionDetails Connection Successful.");

            //2. Prepare SQL Statements
            PreparedStatement rentalDetails = conn.prepareStatement("SELECT rentaltransaction_id, rental_date, pc_id, hours_spent FROM rental_transaction");
            ResultSet resultRentalDetails = rentalDetails.executeQuery();

            //3. Save Results to each ArrayList
            while (resultRentalDetails.next()) {
                rt_rentaltransaction_id = resultRentalDetails.getInt("rentaltransaction_id");
                rentIdList.add(rt_rentaltransaction_id);
                rt_rental_date = resultRentalDetails.getString("rental_date");
                rentalDateList.add(rt_rental_date);
                rt_pc_id = resultRentalDetails.getInt("pc_id");
                pcIdList.add(rt_pc_id);
                rt_hours_spent = resultRentalDetails.getFloat("hours_spent");
                hoursSpentList.add(rt_hours_spent);
            }

            conn.close();
            rentalDetails.close();
            resultRentalDetails.close();
            return 1;

        } catch (Exception e) {
            System.out.println("getTransactionDetails Error: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

    // run this to get top_up.java details
    private int getTopUpDetails() {
        topupIdList.clear();
        topupDateList.clear();
        topupAmountList.clear();
        paymentMethodList.clear();

        try {
            //1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getTopUpDetails Connection Successful.");

            //2. Prepare SQL Statements
            PreparedStatement topupDetails = conn.prepareStatement("SELECT topup_id, topup_date, amount, payment_method FROM user_topup");
            ResultSet resultTopupDetails = topupDetails.executeQuery();

            //3. Save Results to each ArrayList
            while (resultTopupDetails.next()) {
                ut_topup_id = resultTopupDetails.getInt("topup_id");
                topupIdList.add(ut_topup_id);
                ut_topup_date = resultTopupDetails.getString("topup_date");
                topupDateList.add(ut_topup_date);
                ut_amount = resultTopupDetails.getFloat("amount");
                topupAmountList.add(ut_amount);
                payment_method = resultTopupDetails.getString("payment_method");
                paymentMethodList.add(payment_method);
            }

            conn.close();
            topupDetails.close();
            resultTopupDetails.close();
            return 1;

        } catch (Exception e) {
            System.out.println("getTopUpDetails Error: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }

    }

    public int OLDgetUserActivity() {
        // Call individual functions to populate lists
        System.out.println("Accessing getAccountDetails");
        int accountResult = getAccountDetails();
        System.out.println("Accessing getTransactionDetails");
        int transactionResult = getTransactionDetails();
        System.out.println("Accessing getTopUpDetails");
        int topUpResult = getTopUpDetails();

        // Check if all functions were successful
        if (accountResult == 1 && transactionResult == 1 && topUpResult == 1) {
            return 1; // Success
        } else {
            System.out.println("getUserActivity Unsuccessful.");
            return 0; // Failure
        }
    }

    public int getUserActivityByUserId() {
        userIdList.clear();
        lastNameList.clear();
        firstNameList.clear();
        usernameList.clear();
        accountBalanceList.clear();
        rentIdList.clear();
        rentalDateList.clear();
        pcIdList.clear();
        hoursSpentList.clear();
        topupIdList.clear();
        topupDateList.clear();
        topupAmountList.clear();
        paymentMethodList.clear();

        try {
            // 1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getUserActivity Connection Successful.");

            // 2. Prepare SQL Statements
            String query = "SELECT * FROM ("
                    + "SELECT ui.user_id, ui.last_name, ui.first_name, ui.account_balance, NULL AS topup_id, "
                    + "NULL AS topup_date, NULL AS amount, NULL AS payment_method, rt.rentaltransaction_id, "
                    + "rt.rental_date, rt.pc_id, rt.hours_spent "
                    + "FROM user_information ui "
                    + "LEFT JOIN rental_transaction rt ON ui.user_id = rt.user_id "
                    + "UNION "
                    + "SELECT ui.user_id, ui.last_name, ui.first_name, ui.account_balance, ut.topup_id, "
                    + "ut.topup_date, ut.amount, ut.payment_method, NULL AS rentaltransaction_id, "
                    + "NULL AS rental_date, NULL AS pc_id, NULL AS hours_spent "
                    + "FROM user_information ui "
                    + "LEFT JOIN user_topup ut ON ui.user_id = ut.user_id "
                    + ") AS combined_results ORDER BY user_id"; // Updated ORDER BY clause

            PreparedStatement preparedStatement = conn.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            // 3. Process the result
            while (resultSet.next()) {
                // Process account.java details
                ui_user_id = resultSet.getInt("user_id");
                userIdList.add(ui_user_id);
                ui_last_name = resultSet.getString("last_name");
                lastNameList.add(ui_last_name);
                ui_first_name = resultSet.getString("first_name");
                firstNameList.add(ui_first_name);
                ui_account_balance = resultSet.getFloat("account_balance");
                accountBalanceList.add(ui_account_balance);

                // Process rental_transaction.java details
                rt_rentaltransaction_id = resultSet.getInt("rentaltransaction_id");
                rentIdList.add(rt_rentaltransaction_id);
                rt_rental_date = resultSet.getString("rental_date");
                rentalDateList.add(rt_rental_date);
                rt_pc_id = resultSet.getInt("pc_id");
                pcIdList.add(rt_pc_id);
                rt_hours_spent = resultSet.getFloat("hours_spent");
                hoursSpentList.add(rt_hours_spent);

                // Process top_up.java details
                ut_topup_id = resultSet.getInt("topup_id");
                topupIdList.add(ut_topup_id);
                ut_topup_date = resultSet.getString("topup_date");
                topupDateList.add(ut_topup_date);
                ut_amount = resultSet.getFloat("amount");
                topupAmountList.add(ut_amount);
                payment_method = resultSet.getString("payment_method");
                paymentMethodList.add(payment_method);
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

    public int getUserActivityDefault() {
        userIdList.clear();
        lastNameList.clear();
        firstNameList.clear();
        usernameList.clear();
        accountBalanceList.clear();
        rentIdList.clear();
        rentalDateList.clear();
        pcIdList.clear();
        hoursSpentList.clear();
        topupIdList.clear();
        topupDateList.clear();
        topupAmountList.clear();
        paymentMethodList.clear();

        try {
            // 1. Establish connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcRental?user=root&password=12345678");
            System.out.println("getUserActivity Connection Successful.");

            // 2. Prepare SQL Statements
            String query = "SELECT ui.user_id, ui.last_name, ui.first_name, ui.account_balance, NULL AS topup_id, "
                    + "NULL AS topup_date, NULL AS amount, NULL AS payment_method, rt.rentaltransaction_id, "
                    + "rt.rental_date, rt.pc_id, rt.hours_spent "
                    + "FROM user_information ui "
                    + "LEFT JOIN rental_transaction rt ON ui.user_id = rt.user_id "
                    + "UNION "
                    + "SELECT ui.user_id, ui.last_name, ui.first_name, ui.account_balance, ut.topup_id, "
                    + "ut.topup_date, ut.amount, ut.payment_method, NULL AS rentaltransaction_id, "
                    + "NULL AS rental_date, NULL AS pc_id, NULL AS hours_spent "
                    + "FROM user_information ui "
                    + "LEFT JOIN user_topup ut ON ui.user_id = ut.user_id";

            PreparedStatement preparedStatement = conn.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            // 3. Process the result
            while (resultSet.next()) {
                // Process account.java details
                ui_user_id = resultSet.getInt("user_id");
                userIdList.add(ui_user_id);
                ui_last_name = resultSet.getString("last_name");
                lastNameList.add(ui_last_name);
                ui_first_name = resultSet.getString("first_name");
                firstNameList.add(ui_first_name);
                ui_account_balance = resultSet.getFloat("account_balance");
                accountBalanceList.add(ui_account_balance);

                // Process rental_transaction.java details
                rt_rentaltransaction_id = resultSet.getInt("rentaltransaction_id");
                rentIdList.add(rt_rentaltransaction_id);
                rt_rental_date = resultSet.getString("rental_date");
                rentalDateList.add(rt_rental_date);
                rt_pc_id = resultSet.getInt("pc_id");
                pcIdList.add(rt_pc_id);
                rt_hours_spent = resultSet.getFloat("hours_spent");
                hoursSpentList.add(rt_hours_spent);

                // Process top_up.java details
                ut_topup_id = resultSet.getInt("topup_id");
                topupIdList.add(ut_topup_id);
                ut_topup_date = resultSet.getString("topup_date");
                topupDateList.add(ut_topup_date);
                ut_amount = resultSet.getFloat("amount");
                topupAmountList.add(ut_amount);
                payment_method = resultSet.getString("payment_method");
                paymentMethodList.add(payment_method);
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
                    + "ui.user_id, "
                    + "ui.last_name, "
                    + "ui.first_name, "
                    + "ui.account_balance, "
                    + "NULL AS topup_id, "
                    + "NULL AS topup_date, "
                    + "NULL AS amount, "
                    + "NULL AS payment_method, "
                    + "rt.rentaltransaction_id, "
                    + "rt.rental_date, "
                    + "rt.pc_id, "
                    + "rt.hours_spent "
                    + "FROM user_information ui "
                    + "LEFT JOIN rental_transaction rt ON ui.user_id = rt.user_id "
                    + "UNION "
                    + "SELECT "
                    + "ui.user_id, "
                    + "ui.last_name, "
                    + "ui.first_name, "
                    + "ui.account_balance, "
                    + "ut.topup_id, "
                    + "ut.topup_date, "
                    + "ut.amount, "
                    + "ut.payment_method, "
                    + "NULL AS rentaltransaction_id, "
                    + "NULL AS rental_date, "
                    + "NULL AS pc_id, "
                    + "NULL AS hours_spent "
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
        useractivity ua = new useractivity();
        ua.getUserActivityByUserId();

        // Print contents of userIdList
        System.out.println("Contents of userIdList: " + ua.userIdList);

        // Print contents of lastNameList
        System.out.println("Contents of lastNameList: " + ua.lastNameList);

        // Print contents of firstNameList
        System.out.println("Contents of firstNameList: " + ua.firstNameList);

        // Print contents of usernameList
        System.out.println("Contents of usernameList: " + ua.usernameList);

        // Print contents of accountBalanceList
        System.out.println("Contents of accountBalanceList: " + ua.accountBalanceList);

        // Print contents of rentIdList
        System.out.println("Contents of rentIdList: " + ua.rentIdList);

        // Print contents of rentalDateList
        System.out.println("Contents of rentalDateList: " + ua.rentalDateList);

        // Print contents of pcIdList
        System.out.println("Contents of pcIdList: " + ua.pcIdList);

        // Print contents of hoursSpentList
        System.out.println("Contents of hoursSpentList: " + ua.hoursSpentList);

        // Print contents of topupIdList
        System.out.println("Contents of topupIdList: " + ua.topupIdList);

        // Print contents of topupDateList
        System.out.println("Contents of topupDateList: " + ua.topupDateList);

        // Print contents of topupAmountList
        System.out.println("Contents of topupAmountList: " + ua.topupAmountList);

        // Print contents of paymentMethodList
        System.out.println("Contents of paymentMethodList: " + ua.paymentMethodList);

        System.out.println("Number of Rows + 1: " + ua.getRowCount());
        System.out.println("Size of userIdList: " + ua.userIdList.size());
        System.out.println("Size of rentIdList: " + ua.rentIdList.size());
        System.out.println("Size of topupIdList: " + ua.topupIdList.size());
    }

}
