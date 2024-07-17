/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Hotel;
import model.Rating;
import model.ReviewUser;

/**
 *
 * @author thait
 */
public class ReviewDAO extends DBContext {

    public void insert(ReviewUser r) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO review\n"
                + "(hotel_id,email,location_rating,service_rating,convenient_rating,cleanliness_rating,hotel_rating,`comment`,date)\n"
                + "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, r.getHotel_id());
            st.setString(2, r.getEmail());
            st.setInt(3, r.getLocation_rating());
            st.setInt(4, r.getService_rating());
            st.setInt(5, r.getConvenient_rating());
            st.setInt(6, r.getCleanliness_rating());
            st.setDouble(7, r.getHotel_rating());
            st.setString(8, r.getComment());
            st.setDate(9, r.getDate());
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public List<ReviewUser> getReviewByHotelId(int id) {
        List<ReviewUser> list = new ArrayList<ReviewUser>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT *  FROM review AS r JOIN `user` AS u ON r.email = u.email\n"
                + "WHERE hotel_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ReviewUser r = new ReviewUser();
                r.setId(rs.getInt("id"));
                r.setHotel_id(rs.getInt("hotel_id"));
                r.setEmail(rs.getString("email"));
                r.setLocation_rating(rs.getInt("location_rating"));
                r.setService_rating(rs.getInt("service_rating"));
                r.setConvenient_rating(rs.getInt("convenient_rating"));
                r.setCleanliness_rating(rs.getInt("cleanliness_rating"));
                r.setHotel_rating(rs.getDouble("hotel_rating"));
                r.setComment(rs.getString("comment"));
                r.setDate(rs.getDate("date"));
                r.setUsername(rs.getString("name"));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Rating getRatingByHotelId(int hotel_id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT  AVG(hotel_rating) AS r1,AVG(location_rating) AS r2,AVG(service_rating) AS r3,AVG(convenient_rating) AS r4,AVG(cleanliness_rating) AS r5,COUNT(*) AS quantity FROM review\n"
                + "WHERE hotel_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, hotel_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Rating r = new Rating();
                r.setR1(rs.getDouble("r1"));
                r.setR2(rs.getDouble("r2"));
                r.setR3(rs.getDouble("r3"));
                r.setR4(rs.getDouble("r4"));
                r.setR5(rs.getDouble("r5"));
                r.setQuantity(rs.getInt("quantity"));
                return r;
            }
        } catch (Exception e) {
        }
        return null;
    }

    ////// thống kê trang hotelier
    public int getTotalReviewHotelier(String email) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) as total FROM review AS r JOIN hotel AS h ON h.id = r.hotel_id\n"
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

    public List<ReviewUser> getReviewOfHotelier(String email) {
        List<ReviewUser> list = new ArrayList<ReviewUser>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT r.id,r.hotel_id,r.email,r.location_rating,r.service_rating,r.convenient_rating,r.cleanliness_rating,r.hotel_rating,r.`comment`,r.date FROM review AS r JOIN hotel AS h ON h.id = r.hotel_id\n"
                + "WHERE h.emailOwn = ?\n"
                + "Order BY DATE desc \n"
                + "LIMIT 8";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ReviewUser r = new ReviewUser();
                r.setId(rs.getInt("id"));
                r.setHotel_id(rs.getInt("hotel_id"));
                r.setEmail(rs.getString("email"));
                r.setLocation_rating(rs.getInt("location_rating"));
                r.setService_rating(rs.getInt("service_rating"));
                r.setConvenient_rating(rs.getInt("convenient_rating"));
                r.setCleanliness_rating(rs.getInt("cleanliness_rating"));
                r.setHotel_rating(rs.getDouble("hotel_rating"));
                r.setComment(rs.getString("comment"));
                r.setDate(rs.getDate("date"));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }

    ///////
    public List<Hotel> getTopHotel() {
        List<Hotel> hotels = new ArrayList<>();
        String sql = "SELECT h.id, "
                + "h.name AS hotel_name, "
                + "h.imagemain, "
                + "ROUND(AVG(r.location_rating), 1) AS avg_location_rating, "
                + "ROUND(AVG(r.service_rating), 1) AS avg_service_rating, "
                + "ROUND(AVG(r.convenient_rating), 1) AS avg_convenient_rating, "
                + "ROUND(AVG(r.cleanliness_rating), 1) AS avg_cleanliness_rating, "
                + "ROUND(AVG(r.hotel_rating), 1) AS avg_hotel_rating, "
                + "ROUND((AVG(r.location_rating) + AVG(r.service_rating) + AVG(r.convenient_rating) + AVG(r.cleanliness_rating) + AVG(r.hotel_rating)) / 5, 1) AS avg_overall_rating "
                + "FROM review r JOIN hotel h ON r.hotel_id = h.id "
                + "GROUP BY h.id, h.name, h.imagemain "
                + "ORDER BY avg_overall_rating DESC "
                + "LIMIT 8";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                String hotelName = rs.getString("hotel_name");
                String imagemain = rs.getString("imagemain");
                int id = rs.getInt("id");
                double avgOverallRating = rs.getDouble("avg_overall_rating");

                Hotel hotel = new Hotel();
                hotel.setId(id);
                hotel.setName(hotelName);
                hotel.setImagemain(imagemain);
                hotel.setAvgOverallRating(avgOverallRating);

                hotels.add(hotel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotels;
    }

    public List<Hotel> getReviewHotel(boolean isOrder) {
        List<Hotel> hotels = new ArrayList<>();
        String sql = "";

        if (isOrder) {
            sql = "SELECT "
                    + "r.hotel_id AS id, "
                    + "ROUND(AVG((r.location_rating + r.service_rating + r.convenient_rating + r.cleanliness_rating + r.hotel_rating) / 5), 1) AS average_rating, "
                    + "h.imagemain, "
                    + "GROUP_CONCAT(r.comment SEPARATOR '; ') AS comments, "
                    + "h.name AS hotel_name "
                    + "FROM review r "
                    + "JOIN hotel h ON r.hotel_id = h.id "
                    + "GROUP BY r.hotel_id, h.imagemain, h.name "
                    + "ORDER BY average_rating";
        } else {
            sql = "SELECT "
                    + "r.hotel_id AS id, "
                    + "ROUND(AVG((r.location_rating + r.service_rating + r.convenient_rating + r.cleanliness_rating + r.hotel_rating) / 5), 1) AS average_rating, "
                    + "h.imagemain, "
                    + "GROUP_CONCAT(r.comment SEPARATOR '; ') AS comments, "
                    + "h.name AS hotel_name "
                    + "FROM review r "
                    + "JOIN hotel h ON r.hotel_id = h.id "
                    + "GROUP BY r.hotel_id, h.imagemain, h.name "
                    + "ORDER BY average_rating DESC";
        }

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                String hotelName = rs.getString("hotel_name");
                String imagemain = rs.getString("imagemain");
                int id = rs.getInt("id");
                String comments = rs.getString("comments");
                double avgOverallRating = rs.getDouble("average_rating");

                Hotel hotel = new Hotel();
                hotel.setId(id);
                hotel.setName(hotelName);
                hotel.setImagemain(imagemain);
                hotel.setComment(comments);
                hotel.setAvgOverallRating(avgOverallRating);

                hotels.add(hotel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotels;
    }

    public static void main(String[] args) {
        ReviewDAO a = new ReviewDAO();

        List<Hotel> topHotels = a.getReviewHotel(false);

        for (Hotel hotel : topHotels) {
            System.out.println(hotel.getId());
            System.out.println(hotel.getName());
            System.out.println(hotel.getImagemain());
            System.out.println(hotel.getComment());
            System.out.println(hotel.getAvgOverallRating());
        }

    }

}
