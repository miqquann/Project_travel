/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Hotel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Time;
import java.time.LocalDate;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author thait
 */
public class HotelDAO extends DBContext {

    public void insert(Hotel h) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO hotel\n"
                + "(`name`,address,refund,checkin,checkout,imagemain,imagesub,imagesub1,emailOwn,locationId,`status`,poststatus,`describe`,utilities)\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, h.getName());
            st.setString(2, h.getAddress());
            st.setBoolean(3, h.isRefund());
            st.setTime(4, h.getCheckin());
            st.setTime(5, h.getCheckout());
            st.setString(6, h.getImagemain());
            st.setString(7, h.getImagesub());
            st.setString(8, h.getImagesub1());
            st.setString(9, h.getEmailOwn());
            st.setInt(10, h.getLocationId());
            st.setBoolean(11, h.isStatus());
            st.setBoolean(12, h.isPoststatus());
            st.setString(13, h.getDescribe());
            st.setString(14, h.getUtilities());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Hotel> getAllHotelNot() {
        List<Hotel> list = new ArrayList<Hotel>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM hotel AS h JOIN location AS l ON h.locationId=l.id\n"
                + "WHERE `status` = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address") + "-" + rs.getString("city"));
                h.setRefund(rs.getBoolean("refund"));
                h.setCheckin(rs.getTime("checkin"));
                h.setCheckout(rs.getTime("checkout"));
                h.setImagemain(rs.getString("imagemain"));
                h.setImagesub(rs.getString("imagesub"));
                h.setImagesub1(rs.getString("imagesub1"));
                h.setEmailOwn(rs.getString("emailOwn"));
                h.setLocationId(rs.getInt("locationId"));
                h.setStatus(rs.getBoolean("status"));
                h.setPoststatus(rs.getBoolean("poststatus"));
                h.setDescribe(rs.getString("describe"));
                h.setUtilities(rs.getString("utilities"));
                list.add(h);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Hotel> getAllHotelTrue(String email) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM hotel AS h JOIN location AS l ON h.locationId=l.id\n"
                + "WHERE `status` = 1 and emailOwn = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address") + "-" + rs.getString("city"));
                h.setRefund(rs.getBoolean("refund"));
                h.setCheckin(rs.getTime("checkin"));
                h.setCheckout(rs.getTime("checkout"));
                h.setImagemain(rs.getString("imagemain"));
                h.setImagesub(rs.getString("imagesub"));
                h.setImagesub1(rs.getString("imagesub1"));
                h.setEmailOwn(rs.getString("emailOwn"));
                h.setLocationId(rs.getInt("locationId"));
                h.setStatus(rs.getBoolean("status"));
                h.setPoststatus(rs.getBoolean("poststatus"));
                h.setDescribe(rs.getString("describe"));
                h.setUtilities(rs.getString("utilities"));
                list.add(h);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Hotel> ShowHotel() {
        List<Hotel> list = new ArrayList<Hotel>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT h.id,h.`name`,h.address,h.imagemain,h.`status`,h.poststatus,MIN(r.price) AS price,AVG(rv.hotel_rating) AS rating\n"
                + "FROM hotel AS h JOIN room AS r ON h.id = r.hotel_id left JOIN review AS rv ON rv.hotel_id = h.id\n"
                + "GROUP by h.id\n"
                + "HAVING h.`status` =1 AND h.poststatus = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setImagemain(rs.getString("imagemain"));
                h.setPrice(rs.getInt("price"));
                h.setRating(rs.getDouble("rating"));
                list.add(h);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Hotel getHotelById(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM hotel \n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setRefund(rs.getBoolean("refund"));
                h.setCheckin(rs.getTime("checkin"));
                h.setCheckout(rs.getTime("checkout"));
                h.setImagemain(rs.getString("imagemain"));
                h.setImagesub(rs.getString("imagesub"));
                h.setImagesub1(rs.getString("imagesub1"));
                h.setEmailOwn(rs.getString("emailOwn"));
                h.setLocationId(rs.getInt("locationId"));
                h.setStatus(rs.getBoolean("status"));
                h.setPoststatus(rs.getBoolean("poststatus"));
                h.setDescribe(rs.getString("describe"));
                h.setUtilities(rs.getString("utilities"));
                return h;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            DBContext.close(connection);
        }

        return null;
    }

    public List<Hotel> getHotelByLocationID(int locationId) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT h.id, h.`name`, h.address, h.imagemain, h.`status`, h.poststatus, MIN(r.price) AS price, AVG(rv.hotel_rating) AS rating\n"
                + "FROM hotel AS h\n"
                + "JOIN room AS r ON h.id = r.hotel_id left JOIN review AS rv ON rv.hotel_id = h.id\n"
                + "WHERE h.`status` = 1 AND h.poststatus = 1 AND h.locationId = ?\n"
                + "GROUP BY h.id, h.`name`, h.address, h.imagemain, h.`status`, h.poststatus";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, locationId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setImagemain(rs.getString("imagemain"));
                h.setPrice(rs.getInt("price"));
                h.setRating(rs.getDouble("rating"));
                list.add(h);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Hotel> getHotelByFilter(int minPrice, int maxPrice, int locationId) {
        return getHotelByFilter(minPrice, maxPrice, null, locationId, null);
    }

    public List<Hotel> getHotelByFilter(int minPrice, int maxPrice, int locationId, Double rating) {
        return getHotelByFilter(minPrice, maxPrice, rating, locationId, null);
    }

    public List<Hotel> getHotelByFilter(int minPrice, int maxPrice, int locationId, String[] utilities) {
        return getHotelByFilter(minPrice, maxPrice, null, locationId, utilities);
    }

    public List<Hotel> getHotelByFilter(int minPrice, int maxPrice, Double rating, int locationId, String[] utilities) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            connection = DBContext.getConnection();
            StringBuilder sql = new StringBuilder("SELECT h.id, h.name, h.utilities, h.address, h.imagemain, h.locationId, h.status, h.poststatus, MIN(r.price) AS price, AVG(rv.hotel_rating) AS rating "
                    + "FROM hotel AS h "
                    + "JOIN room AS r ON h.id = r.hotel_id "
                    + "LEFT JOIN review AS rv ON rv.hotel_id = h.id "
                    + "WHERE h.status = 1 AND h.poststatus = 1 AND h.locationId = ? "
                    + "GROUP BY h.id, h.name, h.address, h.imagemain, h.status, h.poststatus "
                    + "HAVING MIN(r.price) BETWEEN ? AND ?");

            List<Object> params = new ArrayList<>();
            params.add(locationId);
            params.add(minPrice);
            params.add(maxPrice);

            if (rating != null) {
                sql.append(" AND AVG(rv.hotel_rating) BETWEEN ? AND ?");
                params.add(rating);
                params.add(rating + 0.99);
            }

            if (utilities != null && utilities.length > 0) {
                sql.append(" AND (");
                for (int i = 0; i < utilities.length; i++) {
                    if (i > 0) {
                        sql.append(" AND ");
                    }
                    sql.append("h.utilities LIKE ?");
                    params.add("%" + utilities[i] + "%");
                }
                sql.append(")");
            }

            st = connection.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                st.setObject(i + 1, params.get(i));
            }

            rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setImagemain(rs.getString("imagemain"));
                h.setPrice(rs.getInt("price"));
                h.setRating(rs.getDouble("rating"));
                h.setLocationId(rs.getInt("locationId"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle or log the exception
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle or log the exception
            }
        }

        return list;
    }

    public void updateStatus(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE hotel\n"
                + "SET `status` = 1\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM hotel\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void update(Hotel h) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE hotel\n"
                + "SET `name` = ?,\n"
                + "`describe` = ?,\n"
                + "utilities =?,\n"
                + "address = ?,\n"
                + "refund = ?,\n"
                + "checkin = ?,\n"
                + "checkout = ?,\n"
                + "imagemain = ?,\n"
                + "imagesub = ?,\n"
                + "imagesub1 = ?,\n"
                + "emailOwn = ?,\n"
                + "locationId =?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, h.getName());
            st.setString(2, h.getDescribe());
            st.setString(3, h.getUtilities());
            st.setString(4, h.getAddress());
            st.setBoolean(5, h.isRefund());
            st.setTime(6, h.getCheckin());
            st.setTime(7, h.getCheckout());
            st.setString(8, h.getImagemain());
            st.setString(9, h.getImagesub());
            st.setString(10, h.getImagesub1());
            st.setString(11, h.getEmailOwn());
            st.setInt(12, h.getLocationId());
            st.setInt(13, h.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePostStatus(boolean s, int id) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE hotel\n"
                + "SET poststatus = ?\n"
                + "WHERE id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, s);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Hotel> searchHotels(String query) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT h.id, h.`name`, h.address, h.imagemain, h.`status`, h.poststatus, MIN(r.price) AS price, AVG(rv.hotel_rating) AS rating\n"
                + "FROM hotel AS h JOIN location AS l ON  h.locationId = l.id\n"
                + "JOIN room AS r ON h.id = r.hotel_id left JOIN review AS rv ON rv.hotel_id = h.id\n"
                + "WHERE h.`name` LIKE ? OR h.address LIKE ? OR l.city LIKE ? AND h.status = 1 AND h.poststatus = 1 \n"
                + "GROUP BY h.id, h.`name`, h.address, h.imagemain, h.`status`, h.poststatus";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + query + "%");
            st.setString(2, "%" + query + "%");
            st.setString(3, "%" + query + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setImagemain(rs.getString("imagemain"));
                h.setPrice(rs.getInt("price"));
                h.setRating(rs.getDouble("rating"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Hotel> getHotelReview(String email) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT h.id,h.`name`,h.`describe`,h.utilities,h.address,h.refund,h.checkin,h.checkout,h.imagemain,h.imagesub,h.imagesub1,h.emailOwn,h.locationId,h.poststatus,h.`status`\n"
                + "FROM order_detail AS od JOIN hotel AS h ON h.id = od.hotel_id JOIN `order` AS o ON od.order_id=o.id\n"
                + "WHERE od.checkout <= CURDATE() AND  email = ? AND od.`status` = 2\n"
                + " GROUP BY h.id\n"
                + " HAVING COUNT(*) > (\n"
                + "select x\n"
                + "from ( select COUNT(*) as x\n"
                + "	from review AS r\n"
                + "WHERE r.hotel_id = h.id and r.email = ?\n"
                + ")t\n"
                + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setRefund(rs.getBoolean("refund"));
                h.setCheckin(rs.getTime("checkin"));
                h.setCheckout(rs.getTime("checkout"));
                h.setImagemain(rs.getString("imagemain"));
                h.setImagesub(rs.getString("imagesub"));
                h.setImagesub1(rs.getString("imagesub1"));
                h.setEmailOwn(rs.getString("emailOwn"));
                h.setLocationId(rs.getInt("locationId"));
                h.setStatus(rs.getBoolean("status"));
                h.setPoststatus(rs.getBoolean("poststatus"));
                h.setDescribe(rs.getString("describe"));
                h.setUtilities(rs.getString("utilities"));
                list.add(h);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Hotel> getListByPage(List<Hotel> list,
            int start, int end) {
        ArrayList<Hotel> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Hotel> searchHomeOfAdmin(String query) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM `swp-project`.`hotel` "
                + "WHERE `name` LIKE ? OR `emailOwn` = ? or id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + query + "%");
            st.setString(2, query);
            st.setString(3, query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setImagemain(rs.getString("imagemain"));
                h.setEmailOwn(rs.getString("emailOwn"));
//                h.setPrice(rs.getInt("price"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Hotel> getHotel(int page, int homeInPage) {
        List<Hotel> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT id, name, address, imagemain, emailOwn FROM hotel WHERE status = 1 LIMIT ? OFFSET ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int offset = (page - 1) * homeInPage;
            st.setInt(1, homeInPage);
            st.setInt(2, offset);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setImagemain(rs.getString("imagemain"));
                h.setEmailOwn(rs.getString("emailOwn"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int getTotalHotel() {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) FROM hotel WHERE status = 1";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateHotelStatus(int id, int status) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE hotel SET status = ? WHERE id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getTotalHotelsAddedToday() {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) FROM hotel WHERE DATE(created_at) = CURRENT_DATE() AND status = 1";
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

}
