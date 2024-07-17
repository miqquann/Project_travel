/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import model.Discount;
import model.Wallet;

/**
 *
 * @author thait
 */
public class WalletDAO extends DBContext {

    public void insert(Wallet w) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO wallet\n"
                + "(email,discount_id)\n"
                + "VALUES(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, w.getEmail());
            st.setString(2, w.getDiscount_id());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Wallet checkWallet(Wallet ww) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM wallet\n"
                + "WHERE email = ? AND discount_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ww.getEmail());
            st.setString(2, ww.getDiscount_id());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Wallet w = new Wallet();
                w.setId(rs.getInt("id"));
                w.setEmail(rs.getString("email"));
                w.setDiscount_id(rs.getString("discount_id"));
                return w;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Discount> getWalletByEmail(String email) {
        List<Discount> list = new ArrayList<>();
        String sql = "SELECT w.discount_id,d.img_discount,da.percent,da.type_percent,da.startdate,da.enddate FROM wallet AS w \n"
                + "JOIN discount AS d ON d.discount_id = w.discount_id\n"
                + "JOIN discount_apply AS da ON da.discount_id = w.discount_id\n"
                + "WHERE w.email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscount_id(rs.getString("discount_id"));
                d.setImg_discount(rs.getString("img_discount"));
                d.setPercent(rs.getInt("percent"));
                d.setType_percent(rs.getInt("type_percent"));
                d.setStartdate(rs.getDate("startdate"));
                d.setEnddate(rs.getDate("enddate"));
                list.add(d);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void delete(String email, String discount_id) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE from wallet\n"
                + "WHERE email = ? AND discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, discount_id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addwallet(String discount_id) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE discount_apply\n"
                + "SET quantity = quantity -1 \n"
                + "WHERE discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, discount_id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void removewallet(String discount_id) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE discount_apply\n"
                + "SET quantity = quantity + 1 \n"
                + "WHERE discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, discount_id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
}
