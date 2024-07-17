/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thait
 */
public class UserDAO extends DBContext {

    public User getUserByEmail(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM `user`\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<User> getSuppliers(int page, int supplierInPage) {
        List<User> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT u.userid, u.name, u.phone, u.email "
                + "FROM User u "
                + "JOIN Account a ON u.email = a.email "
                + "WHERE a.roleID = 2 "
                + "LIMIT ? OFFSET ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int offset = (page - 1) * supplierInPage;
            st.setInt(1, supplierInPage);
            st.setInt(2, offset);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("userid"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public static void main(String[] args) {
//        // Define the page and number of suppliers per page for testing
//        int page = 1;
//        int supplierInPage = 5;
//
//        // Create an instance of UserDAO
//        UserDAO userDAO = new UserDAO();
//
//        // Call getSuppliers method to retrieve suppliers
//        List<User> suppliers = userDAO.getSuppliers(page, supplierInPage);
//
//        // Print the retrieved suppliers
//        for (User supplier : suppliers) {
//            System.out.println("ID: " + supplier.getId());
//            System.out.println("Name: " + supplier.getName());
//            System.out.println("Phone: " + supplier.getPhone());
//            System.out.println("Email: " + supplier.getEmail());
//            System.out.println("----------------------");
//        }
//    }
    public int getTotalSuppliers() {
        int total = 0;
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) as total FROM account WHERE status = 1 AND roleID = 2";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the error for better troubleshooting
        }
        return total;
    }

    public List<User> getRegisteredUser(int page, int supplierInPage) {
        List<User> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT u.userid, u.name, u.phone, u.email "
                + "FROM User u "
                + "JOIN Account a ON u.email = a.email "
                + "WHERE a.roleID = 3 "
                + "LIMIT ? OFFSET ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int offset = (page - 1) * supplierInPage;
            st.setInt(1, supplierInPage);
            st.setInt(2, offset);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("userid"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalRegisteredUser() {
        int total = 0;
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) as total FROM account WHERE status = 1 AND roleID = 3";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

//    public static void main(String[] args) {
//        UserDAO ud = new UserDAO();
//        int totalHotels = ud.getTotalRegisteredUser();
//        System.out.println(totalHotels);
//    }
    public void insert(User u) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO `user` ( name,phone,email)\n"
                + "VALUES(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getName());
            st.setString(2, u.getPhone());
            st.setString(3, u.getEmail());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateName(String name, String email) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE `user` SET name = ?\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating user: " + e.getMessage());
        }
    }

    public void updatePhone(String phone, String email) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE `user` SET phone = ?\n"
                + "WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating user: " + e.getMessage());
        }
    }

    public List<User> searchSuplier(String query) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.userid, u.name, u.phone, u.email "
                + "FROM User u "
                + "JOIN Account a ON u.email = a.email "
                + "WHERE a.roleID = 2 AND (u.phone = ? OR u.email = ?)";
//    DBContext d = new DBContext();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, query);
            st.setString(2, query);
            ResultSet resultSet = st.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("userid"));
                user.setName(resultSet.getString("name"));
                user.setPhone(resultSet.getString("phone"));
                user.setEmail(resultSet.getString("email"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<User> searchRegisteredUser(String query) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.userid, u.name, u.phone, u.email "
                + "FROM User u "
                + "JOIN Account a ON u.email = a.email "
                + "WHERE a.roleID = 3 AND (u.phone = ? OR u.email = ?)";
//    DBContext d = new DBContext();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, query);
            st.setString(2, query);
            ResultSet resultSet = st.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("userid"));
                user.setName(resultSet.getString("name"));
                user.setPhone(resultSet.getString("phone"));
                user.setEmail(resultSet.getString("email"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<User> getTopUsersByTotalPrice() {
        List<User> topUsers = new ArrayList<>();
        String sql = "SELECT u.name, u.phone, u.email, SUM(o.price) AS total_price "
                + "FROM `user` u "
                + "JOIN `order` o ON u.email = o.email "
                + "GROUP BY u.name, u.phone, u.email "
                + "ORDER BY total_price DESC "
                + "LIMIT 20";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                u.setTotalPrice(rs.getDouble("total_price"));
                topUsers.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return topUsers;
    }

//    public static void main(String[] args) {
//        UserDAO u = new UserDAO();
//
//        List<User> topUsers = u.getTopUsersByTotalPrice();
//
//        for (User user : topUsers) {
//            System.out.println(user.getName());
//            System.out.println(user.getPhone());
//            System.out.println(user.getEmail());
//            System.out.println(user.getTotalPrice());
//        }
//    }

}
