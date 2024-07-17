/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thait
 */
public class OrderDetailDAO extends DBContext {

    public void insert(OrderDetail od) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO order_detail\n"
                + "(order_id,hotel_id,room_id,quantity,price,checkin,checkout)\n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, od.getOrder_id());
            st.setInt(2, od.getHotel_id());
            st.setInt(3, od.getRoom_id());
            st.setInt(4, od.getQuantity());
            st.setInt(5, od.getPrice());
            st.setDate(6, od.getCheckin());
            st.setDate(7, od.getCheckout());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<OrderDetail> getOdByO_id(String order_id) {
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        Connection connection = DBContext.getConnection();
        String sql = "CALL show_order_detail(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setId(rs.getInt("id"));
                od.setOrder_id(rs.getString("order_id"));
                od.setHotel_id(rs.getInt("hotel_id"));
                od.setRoom_id(rs.getInt("room_id"));
                od.setQuantity(rs.getInt("quantity"));
                od.setPrice(rs.getInt("price"));
                od.setCheckin(rs.getDate("checkin"));
                od.setCheckout(rs.getDate("checkout"));
                od.setRoom_name(rs.getString("name"));
                od.setImg(rs.getString("img1"));
                od.setStatus(rs.getInt("status"));
                od.setRefund(rs.getBoolean("refund"));
                list.add(od);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> getOdCheckInToday(String email) {
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT o.id,u.`name`,u.phone,u.email,h.`name` AS hotel_name,r.`name` AS room_name,od.quantity,od.checkin,od.checkout FROM \n"
                + "order_detail AS od JOIN `order` AS o ON o.id = od.order_id \n"
                + "JOIN hotel AS h ON od.hotel_id = h.id\n"
                + "JOIN room AS r ON r.id = od.room_id\n"
                + "JOIN `user` AS u ON u.email = o.email\n"
                + "WHERE h.emailOwn = ? AND od.checkin = CURDATE()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder_id(rs.getString("id"));
                od.setUsername(rs.getString("name"));
                od.setPhone(rs.getString("phone"));
                od.setEmail(rs.getString("email"));
                od.setHotel_name(rs.getString("hotel_name"));
                od.setRoom_name(rs.getString("room_name"));
                od.setQuantity(rs.getInt("quantity"));
                od.setCheckin(rs.getDate("checkin"));
                od.setCheckout(rs.getDate("checkout"));
                list.add(od);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> getOdCancel(String email) {
        List<OrderDetail> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT od.id,od.order_id,od.hotel_id,od.room_id,od.quantity,od.price,od.checkin,od.checkout,od.`status`,r.`name`,r.img1\n"
                + "FROM order_detail AS od JOIN `order` AS o ON o.id = od.order_id JOIN room AS r ON r.id = od.room_id \n"
                + "WHERE o.email= ? AND od.`status` =1 \n"
                + "order BY od.checkin";
        try {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, email);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    OrderDetail od = new OrderDetail();
                    od.setId(rs.getInt("id"));
                    od.setOrder_id(rs.getString("order_id"));
                    od.setHotel_id(rs.getInt("hotel_id"));
                    od.setRoom_id(rs.getInt("room_id"));
                    od.setQuantity(rs.getInt("quantity"));
                    od.setPrice(rs.getInt("price"));
                    od.setCheckin(rs.getDate("checkin"));
                    od.setCheckout(rs.getDate("checkout"));
                    od.setRoom_name(rs.getString("name"));
                    od.setImg(rs.getString("img1"));
                    list.add(od);
                }
            } catch (Exception e) {
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void cancel(int order_detail_id, String o_id, String email, int price) {
        Connection connection = DBContext.getConnection();
        String sql = "CALL cancel(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_detail_id);
            st.setString(2, o_id);
            st.setString(3, email);
            st.setInt(4, price);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int refund(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT SUM(od.price)as sum FROM  order_detail AS od JOIN `order` AS o ON o.id = od.order_id\n"
                + "WHERE o.email = ? AND od.`status` =1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("sum");
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public static void main(String[] args) {
        OrderDetailDAO od = new OrderDetailDAO();
        System.out.println(od.getOdCheckInToday("thaitung3888@gmail.com"));
    }

}
