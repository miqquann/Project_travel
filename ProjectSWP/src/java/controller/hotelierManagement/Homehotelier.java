/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hotelierManagement;

import dal.HotelDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ReviewDAO;
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
import model.Hotel;
import model.OrderDetail;
import model.ReviewUser;

/**
 *
 * @author thait
 */
@WebServlet(name = "Homehotelier", urlPatterns = {"/homehotelier"})
public class Homehotelier extends HttpServlet {

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
            out.println("<title>Servlet Homehotelier</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Homehotelier at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        HotelDAO hd = new HotelDAO();
        OrderDAO od = new OrderDAO();
        ReviewDAO rd = new  ReviewDAO();
        OrderDetailDAO odd = new OrderDetailDAO();
        List<OrderDetail> listorder = odd.getOdCheckInToday(a.getEmail());
        List<Hotel> list = hd.getAllHotelTrue(a.getEmail());
        List<ReviewUser> listreview = rd.getReviewOfHotelier(a.getEmail());
        String totalMoney = od.getTotalMonneyHotelier(a.getEmail());
        int totalbooking = od.getTotalBookingHotelier(a.getEmail());
        int totalreview = rd.getTotalReviewHotelier(a.getEmail());
        request.setAttribute("list", list);
        request.setAttribute("listreview", listreview);
        request.setAttribute("listorder", listorder);
        request.setAttribute("totalmoney", totalMoney);
        request.setAttribute("totalbooking", totalbooking);
        request.setAttribute("totalreview", totalreview);
        request.getRequestDispatcher("testMainSuplier.jsp").forward(request, response);
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
