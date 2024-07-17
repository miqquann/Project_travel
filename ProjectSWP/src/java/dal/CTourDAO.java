/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartTour;

/**
 *
 * @author thait
 */
public class CTourDAO extends DBContext {

    public void insert(CartTour ct) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO cartoftour\n"
                + "(tour_id,quantity,price,DATE,email)\n"
                + "values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ct.getTour_id());
            st.setInt(2, ct.getQuantity());
            st.setInt(3, ct.getPrice());
            st.setDate(4, ct.getTour_date());
            st.setString(5, ct.getEmail());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insert(int id, int price) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE cartoftour\n"
                + "SET quantity = quantity + 1,\n"
                + "	price = price + ?\n"
                + "WHERE id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, price);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertDesc(int id, int price) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE cartoftour\n"
                + "SET quantity = quantity - 1,\n"
                + "	price = price - ?\n"
                + "WHERE id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, price);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM cartoftour\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int check(CartTour ct) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT id FROM cartoftour\n"
                + "WHERE tour_id =? AND DATE=? AND email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ct.getTour_id());
            st.setDate(2, ct.getTour_date());
            st.setString(3, ct.getEmail());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<CartTour> getAllCartByEmail(String email) {
        List<CartTour> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT ct.id,ct.tour_id,quantity,price,DATE,ct.email,t.tour_name,t.tour_img\n"
                + "FROM cartoftour AS ct\n"
                + "JOIN tour AS t ON ct.tour_id = t.id\n"
                + "WHERE DATE > CURDATE() AND ct.email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartTour ct = new CartTour();
                ct.setId(rs.getInt("id"));
                ct.setTour_id(rs.getInt("tour_id"));
                ct.setQuantity(rs.getInt("quantity"));
                ct.setPrice(rs.getInt("price"));
                ct.setTour_date(rs.getDate("DATE"));
                ct.setEmail(rs.getString("email"));
                ct.setTour_name(rs.getString("tour_name"));
                ct.setTour_img(rs.getString("tour_img"));
                list.add(ct);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotal(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT SUM(price) AS total FROM cartoftour\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return  rs.getInt("total");
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
