/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import model.Tour;

/**
 *
 * @author thait
 */
public class TourDAO extends DBContext {

    public void insertTour(Tour t) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO tour\n"
                + "(tour_describe,tour_name,tour_img,location_id,email)\n"
                + "VALUES(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, t.getTour_describe());
            st.setString(2, t.getTour_name());
            st.setString(3, t.getTour_img());
            st.setInt(4, t.getLocation_id());
            st.setString(5, t.getEmail());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertTour_Apply(Tour t) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO tour_apply\n"
                + "(quantity,price,`status`)\n"
                + "VALUES(?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, t.getQuantity());
            st.setInt(2, t.getPrice());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateTour(Tour t) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE tour\n"
                + "Set tour_name = ?,\n"
                + "tour_describe = ?,\n"
                + "tour_img = ?,\n"
                + "location_id = ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, t.getTour_name());
            st.setString(2, t.getTour_describe());
            st.setString(3, t.getTour_img());
            st.setInt(4, t.getLocation_id());
            st.setInt(5, t.getTour_id());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateTour_Apply(Tour t) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE tour_apply\n"
                + "Set quantity = ?,\n"
                + "price = ?\n"
                + "WHERE tour_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, t.getQuantity());
            st.setInt(2, t.getPrice());
            st.setInt(3, t.getTour_id());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editStatus(int tour_id, boolean status) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE tour_apply\n"
                + "Set `status` = ?\n"
                + "WHERE tour_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, status);
            st.setInt(2, tour_id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Tour> getAllTour(String email) {
        List<Tour> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT t.id,t.tour_name,t.tour_describe,t.tour_img,l.city,ta.quantity,ta.price,ta.`status`\n"
                + "FROM tour AS t \n"
                + "JOIN tour_apply AS ta ON t.id = ta.tour_id\n"
                + "JOIN location AS l ON t.location_id = l.id\n"
                + "WHERE t.email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Tour t = new Tour();
                t.setTour_id(rs.getInt("id"));
                t.setTour_name(rs.getString("tour_name"));
                t.setTour_describe(rs.getString("tour_describe"));
                t.setTour_img(rs.getString("tour_img"));
                t.setCity(rs.getString("city"));
                t.setQuantity(rs.getInt("quantity"));
                t.setPrice(rs.getInt("price"));
                t.setStatus(rs.getBoolean("status"));
                list.add(t);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Tour> getAllTourByLocation(int location_id) {
        List<Tour> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT t.id,t.tour_name,t.tour_describe,t.tour_img,l.city,ta.quantity,ta.price,ta.`status`\n"
                + "FROM tour AS t \n"
                + "JOIN tour_apply AS ta ON t.id = ta.tour_id\n"
                + "JOIN location AS l ON t.location_id = l.id\n"
                + "WHERE t.location_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, location_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Tour t = new Tour();
                t.setTour_id(rs.getInt("id"));
                t.setTour_name(rs.getString("tour_name"));
                t.setTour_describe(rs.getString("tour_describe"));
                t.setTour_img(rs.getString("tour_img"));
                t.setCity(rs.getString("city"));
                t.setQuantity(rs.getInt("quantity"));
                t.setPrice(rs.getInt("price"));
                t.setStatus(rs.getBoolean("status"));
                list.add(t);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Tour getTourById(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM tour AS t\n"
                + "JOIN tour_apply AS ta \n"
                + "ON t.id = ta.tour_id\n"
                + "WHERE t.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Tour t = new Tour();
                t.setTour_id(rs.getInt("id"));
                t.setTour_name(rs.getString("tour_name"));
                t.setTour_describe(rs.getString("tour_describe"));
                t.setTour_img(rs.getString("tour_img"));
                t.setLocation_id(rs.getInt("location_id"));
                t.setQuantity(rs.getInt("quantity"));
                t.setPrice(rs.getInt("price"));
                return t;
            }
        } catch (Exception e) {
        }
        return null;
    }

}
