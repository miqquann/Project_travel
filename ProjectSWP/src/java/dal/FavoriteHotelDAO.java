/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import model.FavoriteHotel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thait
 */
public class FavoriteHotelDAO extends DBContext {

    /////////////////////  thêm vào khách sạn yêu thích
    public void insert(int hotel_id, String email) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "INSERT INTO favoritehotel\n"
                + "(hotel_id,email)\n"
                + "VALUES(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, hotel_id);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    //////////////// lấy hết id hotel đc yêu thích
    public List<Integer> getAllFH(String email) {
        List<Integer> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM favoritehotel where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int x = rs.getInt("hotel_id");
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }

    //////////////// bỏ yêu thích
    public void delete(int hotel_id, String email) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM favoritehotel\n"
                + "WHERE hotel_id =? AND email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, hotel_id);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public FavoriteHotel check(int hotel_id, String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM favoritehotel\n"
                + "WHERE hotel_id = ? AND email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, hotel_id);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                FavoriteHotel fh = new FavoriteHotel();
                fh.setId(rs.getInt("id"));
                fh.setHotel_id(rs.getInt("hotel_id"));
                fh.setEmail(rs.getString("email"));
                return fh;
            }
        } catch (Exception e) {
        }

        return null;
    }
}
