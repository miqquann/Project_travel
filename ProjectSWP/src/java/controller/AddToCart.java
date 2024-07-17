/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import java.sql.Date;

/**
 *
 * @author thait
 */
@MultipartConfig
@WebServlet(name = "AddToCart", urlPatterns = {"/addtocart"})
public class AddToCart extends HttpServlet {

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
            out.println("<title>Servlet AddToCart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        CartDAO cd = new CartDAO();
        Account a = (Account) session.getAttribute("account");
        if(a == null){
            response.sendRedirect("login");
        }else{
            String hotel_id_raw = request.getParameter("hotel_id");
        String room_id_raw = request.getParameter("room_id");
        String name_hotel = request.getParameter("name_hotel");
        String name_room = request.getParameter("name_room");
        String address = request.getParameter("address");
        String price_raw = request.getParameter("price");
        String checkin_raw = request.getParameter("checkin");
        String checkout_raw = request.getParameter("checkout");
        String imageData = request.getParameter("imageFile");
        /////////////////////////////
        int hotel_id = Integer.parseInt(hotel_id_raw);
        int room_id = Integer.parseInt(room_id_raw);
        int price = Integer.parseInt(price_raw);
        Date checkin = Date.valueOf(checkin_raw);
        Date checkout = Date.valueOf(checkout_raw);
        /////////////////////////////
        Cart carcheck = cd.getcartByRoomId(room_id,a.getEmail(),checkin,checkout);
        if(carcheck == null){
        Cart c = new Cart();
        c.setEmail(a.getEmail());
        c.setHotel_id(hotel_id);
        c.setRoom_id(room_id);
        c.setName_hotel(name_hotel);
        c.setName_room(name_room);
        c.setAddress(address);
        c.setPrice(price);
        c.setCheckin(checkin);
        c.setCheckout(checkout);
        c.setImg(imageData);
        c.setAddress(address);
        c.setQuantity(1);
        cd.insert(c);
        }else{
            cd.updateQuantity(room_id,a.getEmail());
        }
        response.sendRedirect("detailhotel?id="+hotel_id_raw+"&mess=1"+"#"+room_id_raw);
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
