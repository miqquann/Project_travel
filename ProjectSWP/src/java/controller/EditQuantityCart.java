/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.HotelDAO;
import dal.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Account;
import model.Room;

/**
 *
 * @author thait
 */
@WebServlet(name = "EditQuantityCart", urlPatterns = {"/editquantitycart"})
public class EditQuantityCart extends HttpServlet {

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
            out.println("<title>Servlet EditQuantityCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditQuantityCart at " + request.getContextPath() + "</h1>");
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
        CartDAO cd = new CartDAO();
        RoomDAO rd = new RoomDAO();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            String action = request.getParameter("action");
            String room_id_raw = request.getParameter("room_id");
            String quantity_raw = request.getParameter("quantity");
            String hotel_id_raw = request.getParameter("hotel_id");
            int room_id = Integer.parseInt(room_id_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int hotel_id = Integer.parseInt(hotel_id_raw);
            String checkin_raw = request.getParameter("checkin");
            String checkout_raw = request.getParameter("checkout");
            Date checkin = Date.valueOf(checkin_raw);
            Date checkout = Date.valueOf(checkout_raw);
            Room r = rd.getRoomById(room_id);
            int qre = rd.getQuantityRoomEmpty(room_id, checkin, checkout);
            switch (action) {
                case "incre":
                    if (quantity < (r.getQuantity() - qre)) {
                        cd.updateQuantity(room_id, a.getEmail());
                    }
                    break;
                case "decre":
                    if (quantity == 1) {
                        cd.delete(room_id, a.getEmail(), checkin, checkout);
                    } else {
                        cd.updateQuantity1(room_id, a.getEmail());
                    }
                    break;
                default:
                    cd.delete(room_id, a.getEmail(), checkin, checkout);
            }
            response.sendRedirect("cart?hotel_id=" + hotel_id);
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
