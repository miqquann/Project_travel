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
import model.CateRoom;
/**
 *
 * @author thait
 */
public class CateRoomDAO extends  DBContext{
    
    public List<CateRoom> getAllCate(){
        List<CateRoom> list = new ArrayList<>();
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT * FROM cateofroom";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                CateRoom cr = new CateRoom();
                cr.setId(rs.getInt("id"));
                cr.setName(rs.getString("name"));
                cr.setDescribe(rs.getString("describe"));
                cr.setNop(rs.getInt("nop"));
                list.add(cr);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
}
