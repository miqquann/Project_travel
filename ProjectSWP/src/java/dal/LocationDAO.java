/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Location;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author thait
 */
public class LocationDAO extends DBContext {

    public List<Location> getAllLocation() {
        List<Location> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM location";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Location l = new Location();
                l.setId(rs.getInt("id"));
                l.setCity(rs.getString("city"));
                list.add(l);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Location getCityById(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM location WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Location l = new Location();
                l.setId(rs.getInt("id"));
                l.setCity(rs.getString("city"));
                return l;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Location> getLocationHot() {
        List<Location> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT l.id,l.city,l.img FROM order_detail AS od JOIN hotel AS h ON h.id = od.hotel_id\n"
                + "JOIN location AS l ON l.id = h.locationId\n"
                + "GROUP BY l.id,l.city,l.img\n"
                + "order BY COUNT(l.id) DESC\n"
                + "LIMIT 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Location l = new Location();
                l.setId(rs.getInt("id"));
                l.setCity(rs.getString("city"));
                l.setImg(rs.getString("img"));
                list.add(l);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        LocationDAO ld = new LocationDAO();
        Location l = ld.getCityById(30);
        System.out.println(l.getCity());

    }
}
