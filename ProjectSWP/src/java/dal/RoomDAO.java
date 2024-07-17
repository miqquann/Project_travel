/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Room;

/**
 *
 * @author thait
 */
public class RoomDAO extends DBContext {

    public void insert(Room r) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "INSERT INTO room \n"
                + "(hotel_id,img1,img2,img3,img4,img5,`name`,cate_id,quantity,price,`describe`,utilities)\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, r.getHotel_id());
            st.setString(2, r.getImg1());
            st.setString(3, r.getImg2());
            st.setString(4, r.getImg3());
            st.setString(5, r.getImg4());
            st.setString(6, r.getImg5());
            st.setString(7, r.getName());
            st.setInt(8, r.getCate_id());
            st.setInt(9, r.getQuantity());
            st.setInt(10, r.getPrice());
            st.setString(11, r.getDescribe());
            st.setString(12, r.getUtilities());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Room> getRoomByHotelId(int id) {
        List<Room> list = new ArrayList<>();
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT room.id,hotel_id,room.`describe`, utilities,img1,img2,img3,img4,img5,room.`name`,cate_id,quantity,price,cateofroom.nop FROM room JOIN cateofroom ON room.cate_id = cateofroom.id\n"
                + "WHERE hotel_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setHotel_id(rs.getInt("hotel_id"));
                r.setDescribe(rs.getString("describe"));
                r.setUtilities(rs.getString("utilities"));
                r.setImg1(rs.getString("img1"));
                r.setImg2(rs.getString("img2"));
                r.setImg3(rs.getString("img3"));
                r.setImg4(rs.getString("img4"));
                r.setImg5(rs.getString("img5"));
                r.setName(rs.getString("name"));
                r.setCate_id(rs.getInt("cate_id"));
                r.setQuantity(rs.getInt("quantity"));
                r.setPrice(rs.getInt("price"));
                r.setNop(rs.getInt("nop"));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Room getRoomById(int id) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT room.id,hotel_id,room.`describe`, utilities,img1,img2,img3,img4,img5,room.`name`,cate_id,quantity,price,cateofroom.nop FROM room JOIN cateofroom ON room.cate_id = cateofroom.id\n"
                + "WHERE room.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setHotel_id(rs.getInt("hotel_id"));
                r.setDescribe(rs.getString("describe"));
                r.setUtilities(rs.getString("utilities"));
                r.setImg1(rs.getString("img1"));
                r.setImg2(rs.getString("img2"));
                r.setImg3(rs.getString("img3"));
                r.setImg4(rs.getString("img4"));
                r.setImg5(rs.getString("img5"));
                r.setName(rs.getString("name"));
                r.setCate_id(rs.getInt("cate_id"));
                r.setQuantity(rs.getInt("quantity"));
                r.setPrice(rs.getInt("price"));
                r.setNop(rs.getInt("nop"));
                return r;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void update(Room r) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "UPDATE room\n"
                + "SET \n"
                + "hotel_id = ?,\n"
                + "`describe` = ?,\n"
                + "utilities =?,\n"
                + "img1 = ?,\n"
                + "img2 = ?,\n"
                + "img3 =?,\n"
                + "img4 = ?,\n"
                + "img5 =?,\n"
                + "`name` =?,\n"
                + "cate_id =?,\n"
                + "quantity =?,\n"
                + "price =?\n"
                + "WHERE id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, r.getHotel_id());
            st.setString(2, r.getDescribe());
            st.setString(3, r.getUtilities());
            st.setString(4, r.getImg1());
            st.setString(5, r.getImg2());
            st.setString(6, r.getImg3());
            st.setString(7, r.getImg4());
            st.setString(8, r.getImg5());
            st.setString(9, r.getName());
            st.setInt(10, r.getCate_id());
            st.setInt(11, r.getQuantity());
            st.setInt(12, r.getPrice());
            st.setInt(13, r.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(int id) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "DELETE FROM room\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getQuantityRoomEmpty(int room_id,Date checkin, Date checkout) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT SUM(od.quantity) AS qre FROM room AS r JOIN order_detail AS od ON r.id = od.room_id\n"
                + "WHERE room_id = ? AND od.`status` != 1 AND((od.checkout <= ? AND od.checkout > ?) OR (od.checkin < ? AND od.checkin >= ?) OR (od.checkin <= ? and od.checkout >= ?))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,room_id);
            st.setDate(2, checkout);
            st.setDate(3, checkin);
            st.setDate(4, checkout);
            st.setDate(5, checkin);
            st.setDate(6, checkin);
            st.setDate(7, checkout);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                int quantity = rs.getInt("qre");
                return quantity;
            }
        } catch (Exception e) {
        }
        return -1;
    }

}
