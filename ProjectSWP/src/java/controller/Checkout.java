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
import model.Account;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.User;
import util.Email;

/**
 *
 * @author thait
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

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
            out.println("<title>Servlet Checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Checkout at " + request.getContextPath() + "</h1>");
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
        OrderDetailDAO orderd = new OrderDetailDAO();
        CartDAO cd = new CartDAO();
        UserDAO ud = new UserDAO();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            User u = ud.getUserByEmail(a.getEmail());
            String id_raw = request.getParameter("vnp_TxnRef");
            String price_raw1 = request.getParameter("vnp_Amount");
            String price_raw = price_raw1.substring(0, price_raw1.length() - 2);
            String status = request.getParameter("vnp_ResponseCode");
            String hotel_id_raw = (String) session.getAttribute("hotel_id");
            if (session.getAttribute("travelmoney") != null) {
                int price = Integer.parseInt(price_raw);
                if (status.equals("00")) {
                    ad.depositTravelmoney(price, a.getEmail());
                    session.removeAttribute("travelmoney");
                    response.sendRedirect("travelmoney");
                } else {
                    session.removeAttribute("travelmoney");
                    response.sendRedirect("travelmoney");
                }
            } else {
                if (status.equals("00")) {
                    String discount_id = (String) session.getAttribute("discount_id");
                    if (discount_id != null) {
                        WalletDAO wd = new WalletDAO();
                        wd.delete(a.getEmail(), discount_id);
                    }
                    int hotel_id = Integer.parseInt(hotel_id_raw);
                    String room = "";
                    List<String> rooms = new ArrayList<String>();
                    LocalDate currentDate = LocalDate.now();
                    Date date = Date.valueOf(currentDate);
                    int price = Integer.parseInt(price_raw);
                    Order o = new Order();
                    o.setId(id_raw);
                    o.setEmail(a.getEmail());
                    o.setDate(date);
                    o.setPrice(price);
                    od.insert(o);
                    List<model.Cart> list = cd.getCartByEmail(a.getEmail(), hotel_id);
                    for (model.Cart cart : list) {
                        OrderDetail odd = new OrderDetail();
                        odd.setOrder_id(id_raw);
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
                            + "hãy đưa cho lễ tên mã này để nhận phòng: " + id_raw;
                    email.sendMail(a.getEmail(), "Đơn đặt phòng", content);
                    session.removeAttribute("hotel_id");
                    response.sendRedirect("checkout.jsp");
                } else {
                    session.removeAttribute("travelmoney");
                    session.removeAttribute("discount_id");
                    response.sendRedirect("cart1");
                }
            }
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
