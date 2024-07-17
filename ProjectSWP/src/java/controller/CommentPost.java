/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DiscountDAO;
import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Comment;
import model.Discount;
import model.Post;

/**
 *
 * @author thait
 */
@WebServlet(name = "CommentPost", urlPatterns = {"/commentpost"})
public class CommentPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PostDAO pd = new PostDAO();
        DiscountDAO dd = new DiscountDAO();
        List<Post> list = pd.getAllPost();
        String post_id_raw = request.getParameter("post_id");
        int post_id = Integer.parseInt(post_id_raw);
        List<Comment> listcm = pd.getAllCommentById(post_id);
        List<Discount> listlt = dd.getAllDiscount();
        request.setAttribute("listd", listlt);
        request.setAttribute("listpost", list);
        request.setAttribute("listcm", listcm);
        request.setAttribute("postid", post_id);
        request.getRequestDispatcher("viewpost.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDAO pd = new PostDAO();
        String email = request.getParameter("email");
        String post_id_raw = request.getParameter("post_id");
        String comment = request.getParameter("comment");
        if (email.equals("")) {
            response.sendRedirect("login");
        } else {
            int post_id = Integer.parseInt(post_id_raw);
            Comment c = new Comment();
            c.setEmail(email);
            c.setPost_id(post_id);
            c.setCommnet(comment);
            pd.insertCommnet(c);
            response.sendRedirect("commentpost?post_id=" + post_id);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
