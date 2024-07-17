/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CTourDAO;
import dal.DiscountDAO;
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
import java.util.List;
import model.Account;
import model.CartTour;
import model.Discount;
import model.User;

/**
 *
 * @author thait
 */
@WebServlet(name = "CheckInfoPayTour", urlPatterns = {"/checkinfopaytour"})
public class CheckInfoPayTour extends HttpServlet {

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
            out.println("<title>Servlet CheckInfoPayTour</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckInfoPayTour at " + request.getContextPath() + "</h1>");
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
        if (a == null) {
            response.sendRedirect("login");
        }else{
            CTourDAO ctd = new CTourDAO();
            UserDAO ud = new UserDAO();
            WalletDAO wd = new WalletDAO();
            String amount_raw = request.getParameter("amount");
            String pay = request.getParameter("pay");
            List<CartTour> list = ctd.getAllCartByEmail(a.getEmail());            
            User u = ud.getUserByEmail(a.getEmail());
            request.setAttribute("pay", pay);
            request.setAttribute("amount", amount_raw);
            request.setAttribute("user", u);
            request.setAttribute("listd", wd.getWalletByEmail(a.getEmail()));
            request.setAttribute("listct", list);
            request.getRequestDispatcher("checkinfopay.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        }else{
            CTourDAO ctd = new CTourDAO();
            UserDAO ud = new UserDAO();
            DiscountDAO dd = new DiscountDAO();
            String amount_raw = request.getParameter("amount");
            String pay = request.getParameter("pay");
            String discount_id = request.getParameter("discount_id");
            
            Discount d = dd.getDiscountById1(discount_id);
            List<CartTour> list = ctd.getAllCartByEmail(a.getEmail());            
            User u = ud.getUserByEmail(a.getEmail());
            
            int amount = Integer.parseInt(amount_raw);
            int discountprice;
            if(d.getType_percent() == 1){
                discountprice = (amount/100)*d.getPercent();
            }else{
                discountprice = d.getPercent();
            }
            
            request.setAttribute("pay", pay);
            request.setAttribute("amount", amount);
            request.setAttribute("user", u);
            request.setAttribute("listct", list);
            request.setAttribute("discount", d);
            request.setAttribute("discountprice", discountprice);
            request.getRequestDispatcher("checkinfopay.jsp").forward(request, response);
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
