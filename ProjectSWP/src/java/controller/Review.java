/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.sql.Date;
import model.Account;
import model.ReviewUser;

/**
 *
 * @author thait
 */
@WebServlet(name = "Review", urlPatterns = {"/review"})
public class Review extends HttpServlet {

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
            out.println("<title>Servlet Review</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Review at " + request.getContextPath() + "</h1>");
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
        String hotel_id = request.getParameter("hotel_id");
        session.setAttribute("review", hotel_id);
        response.sendRedirect("detailhotel?id=" + hotel_id + "#review");
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
        HttpSession session = request.getSession();
        session.removeAttribute("review");
        ReviewDAO rd = new ReviewDAO();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            String rating1_raw = request.getParameter("rating1");
            String rating2_raw = request.getParameter("rating2");
            String rating3_raw = request.getParameter("rating3");
            String rating4_raw = request.getParameter("rating4");
            String hotel_id_raw = request.getParameter("hotel_id");
            String comment = request.getParameter("comment");
            if (comment.matches("^\\s*$") || comment.equals("")) {
                comment = "Không có bình luận";
            }
            int hotel_id = Integer.parseInt(hotel_id_raw);
            int r1 = Integer.parseInt(rating1_raw);
            int r2 = Integer.parseInt(rating2_raw);
            int r3 = Integer.parseInt(rating3_raw);
            int r4 = Integer.parseInt(rating4_raw);
            double r5 = (double) (r1 + r2 + r3 + r4) * 1.0 / 4;
            LocalDate currentDate = LocalDate.now();
            Date date = Date.valueOf(currentDate);
            ReviewUser r = new ReviewUser();
            r.setHotel_id(hotel_id);
            r.setEmail(a.getEmail());
            r.setLocation_rating(r1);
            r.setService_rating(r2);
            r.setConvenient_rating(r3);
            r.setCleanliness_rating(r4);
            r.setHotel_rating(r5);
            r.setComment(comment);
            r.setDate(date);
            rd.insert(r);
            response.sendRedirect("detailhotel?id=" + hotel_id + "#review");
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
