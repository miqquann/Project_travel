/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author thait
 */
public class CartDAO extends DBContext {

    public void insert(Cart c) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO cart\n"
                + "(email,hotel_id,room_id,name_hotel,name_room,quantity,price,checkin,checkout)\n"
                + "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getEmail());
            st.setInt(2, c.getHotel_id());
            st.setInt(3, c.getRoom_id());
            st.setString(4, c.getName_hotel());
            st.setString(5, c.getName_room());
            st.setInt(6, c.getQuantity());
            st.setInt(7, c.getPrice());
            st.setDate(8, c.getCheckin());
            st.setDate(9, c.getCheckout());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Cart> getCartByEmail(String email, int hotel_id) {
        List<Cart> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT email,hotel_id,room_id,h.name,name_room,h.imagemain,h.address,quantity,(DATEDIFF(c.checkout,c.checkin)*price) AS price,c.checkin,c.checkout  FROM cart AS c\n"
                + "JOIN hotel AS h ON h.id = c.hotel_id\n"
                + "WHERE email = ? AND c.hotel_id= ? AND c.checkin > CURDATE()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, hotel_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setEmail(rs.getString("email"));
                c.setHotel_id(rs.getInt("hotel_id"));
                c.setRoom_id(rs.getInt("room_id"));
                c.setName_hotel(rs.getString("name"));
                c.setName_room(rs.getString("name_room"));
                c.setImg(rs.getString("imagemain"));
                c.setAddress(rs.getString("address"));
                c.setQuantity(rs.getInt("quantity"));
                c.setPrice(rs.getInt("price"));
                c.setCheckin(rs.getDate("checkin"));
                c.setCheckout(rs.getDate("checkout"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Cart getcartByRoomId(int id, String email, Date checkin, Date checkout) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT email,hotel_id,room_id,h.name,name_room,h.imagemain,h.address,quantity,(DATEDIFF(c.checkout,c.checkin)*price) AS price,c.checkin,c.checkout FROM cart AS c\n"
                + "JOIN hotel AS h ON h.id = c.hotel_id\n"
                + "WHERE room_id = ? and email = ? AND c.checkin=? AND c.checkout=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, email);
            st.setDate(3, checkin);
            st.setDate(4, checkout);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Cart c = new Cart();
                c.setEmail(rs.getString("email"));
                c.setHotel_id(rs.getInt("hotel_id"));
                c.setRoom_id(rs.getInt("room_id"));
                c.setName_hotel(rs.getString("name"));
                c.setName_room(rs.getString("name_room"));
                c.setImg(rs.getString("imagemain"));
                c.setAddress(rs.getString("address"));
                c.setQuantity(rs.getInt("quantity"));
                c.setPrice(rs.getInt("price"));
                c.setCheckin(rs.getDate("checkin"));
                c.setCheckout(rs.getDate("checkout"));
                return c;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void updateQuantity(int id, String email) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE cart\n"
                + "SET quantity = quantity + 1\n"
                + "WHERE room_id = ? and email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateQuantity1(int id, String email) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE cart\n"
                + "SET quantity = quantity - 1\n"
                + "WHERE room_id = ? and email=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateQuantity2(int id, String email, int quantity) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE cart\n"
                + "SET quantity = ?\n"
                + "WHERE room_id = ? and email=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, id);
            st.setString(3, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(int id, String email, Date checkin, Date checkout) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE from cart\n"
                + "WHERE room_id = ? and email=? AND checkin=? AND checkout=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, email);
            st.setDate(3, checkin);
            st.setDate(4, checkout);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteAll(String email, int hotel_id) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM cart\n"
                + "WHERE email = ? AND hotel_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, hotel_id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int totalPrice(String email, int hotel_id) {
        Connection connection = DBContext.getConnection();
        String sql = "CALL show_cart(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, hotel_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                return total;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Cart> getCart1(String email) {
        List<Cart> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT hotel_id,h.imagemain,h.name,h.address,c.email FROM cart AS c\n"
                + "JOIN hotel AS h ON h.id = c.hotel_id\n"
                + "WHERE c.checkin > CURDATE()\n"
                + "GROUP BY hotel_id,h.imagemain,name_hotel,h.address,email\n"
                + "HAVING email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setHotel_id(rs.getInt("hotel_id"));
                c.setName_hotel(rs.getString("name"));
                c.setImg(rs.getString("imagemain"));
                c.setAddress(rs.getString("address"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
