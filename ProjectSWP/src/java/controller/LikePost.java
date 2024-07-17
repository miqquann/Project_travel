/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.Like;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author thait
 */
@WebServlet(name = "LikePost", urlPatterns = {"/likepost"})
public class LikePost extends HttpServlet {

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
            out.println("<title>Servlet LikePost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LikePost at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        JSONObject jsonResponse = new JSONObject();
        HttpSession session = request.getSession();
        PostDAO pd = new PostDAO();
        Account a = (Account) session.getAttribute("account");
        String post_id_raw = request.getParameter("post_id");
        if (a == null) {
            jsonResponse.put("status", "login");
        } else {
            List<Integer> listlike = pd.getAllLikeByEmail(a.getEmail());
            int post_id = Integer.parseInt(post_id_raw);
            Like x = pd.getLikeByEmailAndPost(a.getEmail(), post_id);
            Like l = new Like();
            l.setEmail(a.getEmail());
            l.setPost_id(post_id);
            boolean isLike;
            if (x == null) {
                pd.insertLike(l);
                isLike = true;
            } else {
                pd.deleteLike(l);
                isLike = false;
            }
            jsonResponse.put("isLike", isLike);
            jsonResponse.put("listlike", new JSONArray(listlike));
        }
        
        try (PrintWriter out = response.getWriter()) {
            out.print(jsonResponse.toString());
        }
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
        processRequest(request, response);
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
