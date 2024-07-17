/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.ReviewDAO;
import dal.RoomDAO;
import dal.UserDAO;
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
import java.sql.Date;
import model.Rating;
import model.ReviewUser;
import model.Room;
import model.User;

/**
 *
 * @author thait
 */
@WebServlet(name = "Cart", urlPatterns = {"/cart"})
public class Cart extends HttpServlet {

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
            out.println("<title>Servlet Cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cart at " + request.getContextPath() + "</h1>");
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
        Account a = (Account) session.getAttribute("account");
        CartDAO cd = new CartDAO();
        UserDAO ud = new UserDAO();
        RoomDAO rd = new RoomDAO();
        ReviewDAO rvd = new ReviewDAO();
        //////////////////////////////////////////
        if (a == null) {
            response.sendRedirect("login");
        } else {
            String hotel_id_raw = request.getParameter("hotel_id");
            int hotel_id = Integer.parseInt(hotel_id_raw);
            User u = ud.getUserByEmail(a.getEmail());
            List<model.Cart> list = cd.getCartByEmail(a.getEmail(), hotel_id);
            Rating ra = rvd.getRatingByHotelId(hotel_id);
            int total = 0;
            for (model.Cart cart : list) {
                Room r = rd.getRoomById(cart.getRoom_id());
                int qre = (r.getQuantity() - rd.getQuantityRoomEmpty(r.getId(), cart.getCheckin(), cart.getCheckout()));
                if (cart.getQuantity() > qre) {
                    if (qre == 0) {
                        cd.delete(cart.getRoom_id(), a.getEmail(), cart.getCheckin(), cart.getCheckout());
                        list.remove(cart);
                    } else {
                        cart.setQuantity(qre);
                        cd.updateQuantity2(cart.getRoom_id(), a.getEmail(), qre);
                    }
                }
                total += (cart.getPrice() * cart.getQuantity());
            }
            //////////////////////////////////////////
            request.setAttribute("user", u);
            request.setAttribute("hotel_id", hotel_id);
            request.setAttribute("listcart", list);
            request.setAttribute("total", total);
            request.setAttribute("rating", ra);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
