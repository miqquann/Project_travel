/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author thait
 */
public class AccountDAO extends DBContext {

    public Account getAccountByEmail(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM `account` WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Account ac = new Account();
                ac.setEmail(rs.getString("email"));
                ac.setPass(rs.getString("pass"));
                ac.setRoleID(rs.getInt("roleID"));
                ac.setStatus(rs.getBoolean("status"));
                ac.setTravelmoney(rs.getInt("travelmoney"));
                return ac;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account getAccountByEmailAndPass(String email, String pass) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM `account` WHERE email = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account ac = new Account();
                ac.setEmail(rs.getString("email"));
                ac.setPass(rs.getString("pass"));
                ac.setRoleID(rs.getInt("roleID"));
                ac.setStatus(rs.getBoolean("status"));
                ac.setTravelmoney(rs.getInt("travelmoney"));
                return ac;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void insert(Account a) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO `account` ( email,pass,roleID,`status`)\n"
                + "VALUES(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getEmail());
            st.setString(2, a.getPass());
            st.setInt(3, a.getRoleID());
            st.setBoolean(4, a.isStatus());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePass(String email, String pass) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE `account`\n"
                + "SET pass = ?\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateStatus(String email, boolean boo) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE `account`\n"
                + "SET status = ?\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, boo);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void payByTravelmoney(int price,String email) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE `account`\n"
                + "SET travelmoney = travelmoney - ?\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, price);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void depositTravelmoney(int price,String email){
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE `account`\n"
                + "SET travelmoney = travelmoney + ?\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, price);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getTotalSuplierAddedToday() {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) FROM account WHERE DATE(created_at) = CURRENT_DATE() AND status = 1 AND roleID = 2";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalUserReAddedToday() {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) FROM account WHERE DATE(created_at) = CURRENT_DATE() AND status = 1 AND roleID = 3";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

//    public static void main(String[] args) {
//        AccountDAO hd = new AccountDAO();
//        int totalHotels = hd.getTotalSuplierAddedToday();
//        System.out.println(totalHotels);
//    }
}
