/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.Like;
import model.Post;

/**
 *
 * @author thait
 */
public class PostDAO extends DBContext {

    ///////////////////////  post
    public void insert(Post p) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "INSERT INTO post\n"
                + "(email,img,caption,date)\n"
                + "VALUES(?,?,?,CURDATE())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getEmail());
            st.setString(2, p.getImg());
            st.setString(3, p.getCaption());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void update(Post p) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "UPDATE post\n"
                + "SET img = ?,\n"
                + "   caption = ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getImg());
            st.setString(2, p.getCaption());
            st.setInt(3, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(int id) {
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "DELETE from post\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT p.id,p.email,p.img,p.caption,p.date,u.`name`,COUNT(l.id) AS total\n"
                + "FROM post AS p JOIN `user` AS u ON u.email = p.email\n"
                + "left JOIN `like` AS l ON l.post_id = p.id\n"
                + "GROUP BY p.id,p.email,p.img,p.caption,p.date,u.`name`\n"
                + "order BY DATE desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setEmail(rs.getString("email"));
                p.setCaption(rs.getString("caption"));
                p.setImg(rs.getString("img"));
                p.setDate(rs.getDate("date"));
                p.setName(rs.getString("name"));
                p.setTotalLike(rs.getInt("total"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Post> getAllHotPost() {
        List<Post> list = new ArrayList<>();
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT p.id,p.email,p.img,p.caption,p.date,u.`name`,COUNT(l.id) AS total\n"
                + "FROM post AS p JOIN `user` AS u ON u.email = p.email\n"
                + "left JOIN `like` AS l ON l.post_id = p.id\n"
                + "GROUP BY p.id,p.email,p.img,p.caption,p.date,u.`name`\n"
                + "order BY COUNT(l.id) DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setEmail(rs.getString("email"));
                p.setCaption(rs.getString("caption"));
                p.setImg(rs.getString("img"));
                p.setDate(rs.getDate("date"));
                p.setName(rs.getString("name"));
                p.setTotalLike(rs.getInt("total"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Post> getAllPostByEmail(String email) {
        List<Post> list = new ArrayList<>();
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT p.id,p.email,p.img,p.caption,p.date,u.`name`,COUNT(l.id) AS total\n"
                + "FROM post AS p JOIN `user` AS u ON u.email = p.email\n"
                + "left JOIN `like` AS l ON l.post_id = p.id\n"
                + "WHERE p.email = ?\n"
                + "GROUP BY p.id,p.email,p.img,p.caption,p.date,u.`name`\n"
                + "order BY DATE desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setEmail(rs.getString("email"));
                p.setCaption(rs.getString("caption"));
                p.setImg(rs.getString("img"));
                p.setDate(rs.getDate("date"));
                p.setName(rs.getString("name"));
                p.setTotalLike(rs.getInt("total"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Post> getAllPostBySearch(String query) {
        List<Post> list = new ArrayList<>();
        Connection connection = (Connection) DBContext.getConnection();
        String sql = "SELECT p.id,p.email,p.img,p.caption,p.date,u.`name`,COUNT(l.id) AS total\n"
                + "FROM post AS p JOIN `user` AS u ON u.email = p.email\n"
                + "left JOIN `like` AS l ON l.post_id = p.id\n"
                + "WHERE p.caption like  ? OR u.`name` like ?\n"
                + "GROUP BY p.id,p.email,p.img,p.caption,p.date,u.`name`\n"
                + "order BY COUNT(l.id) DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%"+query+"%");
            st.setString(2, "%"+query+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setEmail(rs.getString("email"));
                p.setCaption(rs.getString("caption"));
                p.setImg(rs.getString("img"));
                p.setDate(rs.getDate("date"));
                p.setName(rs.getString("name"));
                p.setTotalLike(rs.getInt("total"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    /////////////////////// post
    /////////////////////// like
    public void insertLike(Like l) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO `like`\n"
                + "(email,post_id)\n"
                + "VALUES(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, l.getEmail());
            st.setInt(2, l.getPost_id());
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void deleteLike(Like l) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM  `like`\n"
                + "WHERE email = ? AND post_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, l.getEmail());
            st.setInt(2, l.getPost_id());
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public List<Integer> getAllLikeByEmail(String email) {
        List<Integer> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT post_id FROM `like`\n"
                + "WHERE email = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("post_id");
                list.add(id);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Like getLikeByEmailAndPost(String email, int post_id) {
        Connection connection = DBContext.getConnection();
        String sql = "SELECT * FROM `like`\n"
                + "WHERE email = ? AND post_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, post_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Like l = new Like();
                l.setId(rs.getInt("id"));
                l.setEmail(rs.getString("email"));
                l.setPost_id(rs.getInt("post_id"));
                return l;
            }
        } catch (Exception e) {
        }
        return null;
    }
    /////////////////////// like

    /////////////////////// comment
    public void insertCommnet(Comment c) {
        Connection connection = DBContext.getConnection();
        String sql = "INSERT INTO `comment`\n"
                + "(email,post_id,`comment`,DATE)\n"
                + "VALUES(?,?,?,CURDATE())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getEmail());
            st.setString(3, c.getCommnet());
            st.setInt(2, c.getPost_id());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Comment> getAllCommentById(int post_id) {
        List<Comment> list = new ArrayList<>();
        Connection connection = DBContext.getConnection();
        String sql = "SELECT c.`⁯id`AS  id, c.email,c.post_id,c.`comment`,c.date,u.`name` FROM `comment` AS c join `user` AS u ON u.email =  c.email\n"
                + "WHERE c.post_id = ? order BY DATE desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, post_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getInt("id"));
                c.setEmail(rs.getString("email"));
                c.setPost_id(rs.getInt("post_id"));
                c.setCommnet(rs.getString("comment"));
                c.setDate(rs.getDate("date"));
                c.setName(rs.getString("name"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteComment(int id) {
        Connection connection = DBContext.getConnection();
        String sql = "DELETE FROM `comment`\n"
                + "WHERE `⁯id` = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    /////////////////////// comment

    public static void main(String[] args) {
        PostDAO pd = new PostDAO();
        System.out.println(pd.getAllCommentById(7));
    }
}
