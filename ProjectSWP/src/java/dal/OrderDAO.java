/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import java.text.DecimalFormat;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.*;
import java.util.Calendar;

/**
 *
 * @author thait
 */
public class OrderDAO extends DBContext {

    public void insert(Order o) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO `order`\n"
                + "(id,email,datepay,price)\n"
                + "VALUES(?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, o.getId());
            st.setString(2, o.getEmail());
            st.setDate(3, o.getDate());
            st.setInt(4, o.getPrice());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrderByEmail(String email) {
        Connection connection = DBContext.getConnection();
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM `order`\n"
                + "WHERE price > 0 AND email = ?\n"
                + "Order BY datepay desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getString("id"));
                o.setEmail(rs.getString("email"));
                o.setDate(rs.getDate("datepay"));
                o.setPrice(rs.getInt("price"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getTotalMonney() {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT SUM(price) FROM `order` ";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                DecimalFormat formatter = new DecimalFormat("#,###");
                return formatter.format(total);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0";
    }

    public String getTotalMoneyToday() {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT SUM(price) FROM `order` WHERE DATE(created_at) = CURRENT_DATE()";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                DecimalFormat formatter = new DecimalFormat("#,###");
                return formatter.format(total);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0";
    }

//    public static void main(String[] args) {
//        OrderDAO od = new OrderDAO();
//        String total = od.getTotalMonney();
//        System.out.println(total);
//    }
    public List<Order> selectOrdersByDateRange(Date startDate, Date endDate) {
        List<Order> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = """
                 SELECT datepay, SUM(price) as total_price 
                 FROM `order` 
                 WHERE datepay BETWEEN ? AND ?
                 GROUP BY datepay
                 """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setDate(1, startDate);
            st.setDate(2, endDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setDate(rs.getDate("datepay"));
                order.setPrice(rs.getInt("total_price"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Order> selectOrdersByCurrentDate() {
        Calendar calendar = Calendar.getInstance();
        Date currentDate = new Date(calendar.getTimeInMillis());
        return selectOrdersByDateRange(currentDate, currentDate);
    }
//    
//    public static void main(String[] args) {
//        Date d1 = new Date(2024,6,1);
//        Date d2 = new Date(2024,6,13);
//        List<Order> od = selectOrdersByDateRange(d1,d2 ); 
//        System.out.println(od.size());
//    }

    //////////////////////////////////// thống kê của trang hotelier
    public String getTotalMonneyHotelier(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT h.emailOwn,SUM(price) as total FROM order_detail AS od JOIN hotel AS h ON h.id = od.hotel_id\n"
                + "WHERE h.emailOwn = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                DecimalFormat formatter = new DecimalFormat("#,###");
                return formatter.format(total);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0";
    }

    public int getTotalBookingHotelier(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT SUM(quantity) AS total FROM order_detail AS od JOIN hotel AS h ON h.id = od.hotel_id\n"
                + "WHERE h.emailOwn = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                return total;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int checkId(int order_id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT id  FROM  `order`\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,order_id );
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }
        } catch (Exception e) {
        }
        return 0;
    }

}
