/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CartDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.UserDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.Account;
import model.Order;
import model.OrderDetail;
import model.User;
import util.Email;

/**
 *
 * @author thait
 */
@WebServlet(name = "PayByTravelmoney", urlPatterns = {"/paybytravelmoney"})
public class PayByTravelmoney extends HttpServlet {

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
            out.println("<title>Servlet PayByTravelmoney</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayByTravelmoney at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        OrderDAO od = new OrderDAO();
        CartDAO cd = new CartDAO();
        OrderDetailDAO orderd = new OrderDetailDAO();
        UserDAO ud = new UserDAO();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            User u = ud.getUserByEmail(a.getEmail());
            Random r = new Random();
            /////////////////////////////////////////////
            String discount_id = request.getParameter("discount_id");
            if(discount_id != null){
                WalletDAO wd = new WalletDAO();
                wd.delete(a.getEmail(), discount_id);
            }
            String price_raw = request.getParameter("amount");
            String hotel_id_raw = request.getParameter("hotel_id");
            int price = Integer.parseInt(price_raw);
            int hotel_id = Integer.parseInt(hotel_id_raw);
            int order_id = r.nextInt(100000000, 1000000000);
            while (od.checkId(order_id) != 0) {
                order_id = r.nextInt(100000000, 1000000000);
            }
            String room = "";
            List<String> rooms = new ArrayList<String>();
            LocalDate currentDate = LocalDate.now();
            Date date = Date.valueOf(currentDate);
            Order o = new Order();
            o.setId(String.valueOf(order_id));
            o.setEmail(a.getEmail());
            o.setDate(date);
            o.setPrice(price);
            o.setVnp_PayDate("0");
            od.insert(o);
            List<model.Cart> list = cd.getCartByEmail(a.getEmail(),hotel_id);
            for (model.Cart cart : list) {
                OrderDetail odd = new OrderDetail();
                odd.setOrder_id(String.valueOf(order_id));
                odd.setHotel_id(cart.getHotel_id());
                odd.setRoom_id(cart.getRoom_id());
                odd.setQuantity(cart.getQuantity());
                odd.setPrice(cart.getPrice());
                odd.setCheckin(cart.getCheckin());
                odd.setCheckout(cart.getCheckout());
                orderd.insert(odd);
                room = "phòng:" + cart.getName_room() + "   checkin:" + cart.getCheckin() + "   checkout:" + cart.getCheckout();
                rooms.add(room);
            }
            cd.deleteAll(a.getEmail(), hotel_id);
            String x = "";
            for (int i = 1; i < rooms.size(); i++) {
                x += "<tr><td></td><td></td><td>" + rooms.get(i) + "</td></tr>";
            }
            Email email = new Email();
            String content = "<table border='1'>"
                    + "<tr><th>Anh/Chị</th><th>Số điện thoại</th><th>Chi tiết</th></tr>"
                    + "<tr><td>" + u.getName() + "</td><td>" + u.getPhone() + "</td><td>" + rooms.get(0) + "</td></tr>" + x
                    + "</table>"
                    + "hãy đưa cho lễ tên mã này để nhận phòng: " + order_id;
            email.sendMail(a.getEmail(), "Đơn đặt phòng", content);
            session.removeAttribute("hotel_id");
            ad.payByTravelmoney(price, a.getEmail());
            response.sendRedirect("checkout.jsp");
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

    public static void main(String[] args) {
        Random r = new Random();
        r.nextInt(10, 20);
        System.out.println(r.nextInt(10, 20));
    }
}
