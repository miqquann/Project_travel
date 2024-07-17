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
import model.Discount;

/**
 *
 * @author thait
 */
public class DiscountDAO extends DBContext {

    ////// admin
    public void insertDiscount(Discount d) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO discount\n"
                + "(discount_id,describe_discount,img_discount)\n"
                + "VALUES(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getDiscount_id());
            st.setString(2, d.getDescribe_discount());
            st.setString(3, d.getImg_discount());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertApply(Discount d) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO discount_apply\n"
                + "(discount_id,quantity,percent,type_percent,startdate,enddate)\n"
                + "VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getDiscount_id());
            st.setInt(2, d.getQuantity());
            st.setInt(3, d.getPercent());
            st.setInt(4, d.getType_percent());
            st.setDate(5, d.getStartdate());
            st.setDate(6, d.getEnddate());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateDiscount(Discount d) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE discount\n"
                + "SET describe_discount = ?,\n"
                + "	 img_discount = ?\n"
                + "WHERE discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getDescribe_discount());
            st.setString(2, d.getImg_discount());
            st.setString(3, d.getDiscount_id());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateApply(Discount d) {
        Connection connection = DBContext.getConnection();
        String sql = "UPDATE discount_apply\n"
                + "SET 	quantity =? ,\n"
                + "      percent = ?,\n"
                + "      type_percent =?,\n"
                + "      startdate = ?,\n"
                + "      enddate = ?,\n"
                + "      percent = ?,\n"
                + "      type_percent = ?\n"
                + "WHERE discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, d.getQuantity());
            st.setInt(2, d.getPercent());
            st.setInt(3, d.getType_percent());
            st.setDate(4, d.getStartdate());
            st.setDate(5, d.getEnddate());
            st.setInt(6, d.getPercent());
            st.setInt(7, d.getType_percent());
            st.setString(8, d.getDiscount_id());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Discount getDiscountById1(String id) {
        Connection connection = DBContext.getConnection();
        String sql = """
                 SELECT da.discount_id, da.percent, da.type_percent, da.quantity, da.percent, 
                        da.startdate, da.enddate, d.describe_discount, d.img_discount
                 FROM discount_apply da
                 JOIN discount d 
                 ON da.discount_id = d.discount_id
                 WHERE da.discount_id = ?;
                 """;
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Discount discount = new Discount();
                discount.setDiscount_id(resultSet.getString("discount_id"));
                discount.setPercent(resultSet.getInt("percent"));
                discount.setType_percent(resultSet.getInt("type_percent"));
                discount.setQuantity(resultSet.getInt("quantity"));
                discount.setStartdate(resultSet.getDate("startdate"));
                discount.setEnddate(resultSet.getDate("enddate"));
                discount.setDescribe_discount(resultSet.getString("describe_discount"));
                discount.setImg_discount(resultSet.getString("img_discount"));
                return discount;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Discount> getListDiscount(int limit, int offset) {
        List<Discount> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = """
     SELECT 
         d.discount_id, 
         da.quantity, 
         CASE 
             WHEN da.type_percent = 1 THEN CONCAT(da.percent, ' %')
             WHEN da.type_percent = 2 THEN CONCAT(da.percent, ' VND')
         END AS percent, 
         da.startdate, 
         da.enddate,
         d.img_discount,
         d.describe_discount,
         CASE 
             WHEN da.quantity = 0 OR CURRENT_DATE > da.enddate THEN 'không hoạt động'
             ELSE 'hoạt động'
         END AS status
     FROM 
         discount d
     JOIN 
         discount_apply da ON d.discount_id = da.discount_id
     LIMIT ? OFFSET ?;
     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, limit);
            st.setInt(2, offset);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscount_id(rs.getString("discount_id"));
                d.setDescribe_discount(rs.getString("describe_discount"));
                d.setImg_discount(rs.getString("img_discount"));
                d.setQuantity(rs.getInt("quantity"));
                // Parse percent to handle both % and VND cases
                String percentStr = rs.getString("percent");
                if (percentStr.endsWith(" %")) {
                    d.setPercent(Integer.parseInt(percentStr.replace(" %", "")));
                    d.setType_percent(1);
                } else if (percentStr.endsWith(" VND")) {
                    d.setPercent(Integer.parseInt(percentStr.replace(" VND", "")));
                    d.setType_percent(2);
                }
                d.setStartdate(rs.getDate("startdate"));
                d.setEnddate(rs.getDate("enddate"));
                d.setStatus(rs.getString("status"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalEntrie() {
        int totalEntrie = 0;
        Connection connection = DBContext.getConnection();
        String sql = "SELECT COUNT(*) FROM discount";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalEntrie = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalEntrie;
    }

    public boolean getDiscountById(String id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT discount_id FROM discount_apply\n"
                + "WHERE discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    ///// admin
    //// user
    public List<Discount> getAllDiscount() {
        List<Discount> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT d.discount_id,d.describe_discount,d.img_discount FROM discount AS d JOIN discount_apply AS da ON d.discount_id = da.discount_id\n"
                + "WHERE CURDATE() >= da.startdate AND CURDATE() <= da.enddate AND da.quantity > 0\n"
                + "order BY da.startdate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscount_id(rs.getString("discount_id"));
                d.setDescribe_discount(rs.getString("describe_discount"));
                d.setImg_discount(rs.getString("img_discount"));
                list.add(d);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Discount> getSearchDiscount(String query, int type) {
        List<Discount> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT d.discount_id,d.describe_discount,d.img_discount FROM discount AS d JOIN discount_apply AS da ON d.discount_id = da.discount_id\n"
                + "WHERE CURDATE() >= da.startdate AND CURDATE() <= da.enddate AND da.quantity > 0\n";
        if (query != null) {
            sql += " AND d.discount_id like '%" + query + "%'\n";
        }
        if (type != 0) {
            sql += "  AND da.type_percent = " + type + "\n";
        }
        sql += "order BY da.startdate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscount_id(rs.getString("discount_id"));
                d.setDescribe_discount(rs.getString("describe_discount"));
                d.setImg_discount(rs.getString("img_discount"));
                list.add(d);
            }
        } catch (Exception e) {
        }
        return list;
    }

    /// user
    public List<Discount> searchDiscountsByName(String discountId) {
        List<Discount> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = """
     SELECT 
         d.discount_id, 
         da.quantity, 
         CASE 
             WHEN da.type_percent = 1 THEN CONCAT(da.percent, ' %')
             WHEN da.type_percent = 2 THEN CONCAT(da.percent, ' VND')
         END AS percent, 
         da.startdate, 
         da.enddate,
         d.img_discount,
         d.describe_discount,
         CASE 
             WHEN da.quantity = 0 OR CURRENT_DATE > da.enddate THEN 'không hoạt động'
             ELSE 'hoạt động'
         END AS status
     FROM 
         discount d
     JOIN 
         discount_apply da ON d.discount_id = da.discount_id
     WHERE 
         d.discount_id LIKE ? 
     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + discountId + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscount_id(rs.getString("discount_id"));
                d.setDescribe_discount(rs.getString("describe_discount"));
                d.setImg_discount(rs.getString("img_discount"));
                d.setQuantity(rs.getInt("quantity"));
                String percentStr = rs.getString("percent");
                if (percentStr.endsWith(" %")) {
                    d.setPercent(Integer.parseInt(percentStr.replace(" %", "")));
                    d.setType_percent(1);
                } else if (percentStr.endsWith(" VND")) {
                    d.setPercent(Integer.parseInt(percentStr.replace(" VND", "")));
                    d.setType_percent(2);
                }
                d.setStartdate(rs.getDate("startdate"));
                d.setEnddate(rs.getDate("enddate"));
                d.setStatus(rs.getString("status"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Discount> getListDiscountStatus(boolean isOrder, int limit, int offset) {
        List<Discount> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        String sql = "";
        if (isOrder) {
            sql = """
          SELECT 
              d.discount_id, 
              da.quantity, 
              CASE 
                  WHEN da.type_percent = 1 THEN CONCAT(da.percent, ' %')
                  WHEN da.type_percent = 2 THEN CONCAT(da.percent, ' VND')
              END AS percent, 
              da.startdate, 
              da.enddate,
              d.img_discount,
              d.describe_discount,
              CASE 
                  WHEN da.quantity = 0 OR CURRENT_DATE > da.enddate THEN 'không hoạt động'
                  ELSE 'hoạt động'
              END AS status
          FROM 
              discount d
          JOIN 
              discount_apply da ON d.discount_id = da.discount_id
          WHERE 
              (da.quantity > 0 and CURRENT_DATE <= da.enddate)
          LIMIT ? OFFSET ?
          """;
        } else {
            sql = """
          SELECT 
              d.discount_id, 
              da.quantity, 
              CASE 
                  WHEN da.type_percent = 1 THEN CONCAT(da.percent, ' %')
                  WHEN da.type_percent = 2 THEN CONCAT(da.percent, ' VND')
              END AS percent, 
              da.startdate, 
              da.enddate,
              d.img_discount,
              d.describe_discount,
              CASE 
                  WHEN da.quantity = 0 OR CURRENT_DATE > da.enddate THEN 'không hoạt động'
                  ELSE 'hoạt động'
              END AS status
          FROM 
              discount d
          JOIN 
              discount_apply da ON d.discount_id = da.discount_id
          WHERE 
              (da.quantity = 0 OR CURRENT_DATE > da.enddate)
          LIMIT ? OFFSET ?
          """;
        }

        try {
            connection = DBContext.getConnection();
            st = connection.prepareStatement(sql);
            st.setInt(1, limit);
            st.setInt(2, offset);
            rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscount_id(rs.getString("discount_id"));
                d.setDescribe_discount(rs.getString("describe_discount"));
                d.setImg_discount(rs.getString("img_discount"));
                d.setQuantity(rs.getInt("quantity"));
                // Parse percent to handle both % and VND cases
                String percentStr = rs.getString("percent");
                if (percentStr.endsWith(" %")) {
                    d.setPercent(Integer.parseInt(percentStr.replace(" %", "")));
                    d.setType_percent(1);
                } else if (percentStr.endsWith(" VND")) {
                    d.setPercent(Integer.parseInt(percentStr.replace(" VND", "")));
                    d.setType_percent(2);
                }
                d.setStartdate(rs.getDate("startdate"));
                d.setEnddate(rs.getDate("enddate"));
                d.setStatus(rs.getString("status"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    
    public int getTotalEntriesStatus(boolean isActive) {
    int totalEntries = 0;
    String query = "SELECT COUNT(*) FROM discount d JOIN discount_apply da ON d.discount_id = da.discount_id WHERE ";

    if (isActive) {
        query += "(da.quantity > 0 AND CURRENT_DATE <= da.enddate)";
    } else {
        query += "(da.quantity = 0 OR CURRENT_DATE > da.enddate)";
    }

    try (Connection conn = getConnection();
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            totalEntries = rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return totalEntries;
}


    public boolean deleteDiscountById(String discount_id) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM discount_apply WHERE discount_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, discount_id);
            int rowsDeleted = st.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

}
