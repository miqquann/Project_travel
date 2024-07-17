/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminManagement;

import dal.AccountDAO;
import dal.HotelDAO;
import dal.OrderDAO;
import dal.ReviewDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import model.Hotel;
import model.Order;
import model.User;

/**
 *
 * @author thait
 */
@WebServlet(name = "HomeAdmin", urlPatterns = {"/homeadmin"})
public class HomeAdmin extends HttpServlet {

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
            out.println("<title>Servlet HomeAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeAdmin at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        HotelDAO hd = new HotelDAO();
        UserDAO ud = new UserDAO();
        OrderDAO od = new OrderDAO();
        ReviewDAO rd = new ReviewDAO();

        Calendar startDateCal = Calendar.getInstance();
        startDateCal.add(Calendar.DATE, -7);
        Date startDateDefault = new Date(startDateCal.getTime().getTime());
        Date endDateDefault = new Date(System.currentTimeMillis());

        String dateRange = request.getParameter("dateRange");
        Date startDate;
        Date endDate;
        if (dateRange != null && dateRange.contains(" to ")) {
            String[] dates = dateRange.split(" to ");
            String startDate_raw = dates[0].trim();
            String endDate_raw = dates[1].trim();

            startDate = Date.valueOf(startDate_raw);
            endDate = Date.valueOf(endDate_raw);
            request.setAttribute("dateRange", dateRange);
        } else {
            startDate = startDateDefault;
            endDate = endDateDefault;

            dateRange = startDate.toString() + " to " + endDate.toString();
            request.setAttribute("dateRange", dateRange);
        }

        List<Order> list = od.selectOrdersByDateRange(startDate, endDate);
        request.setAttribute("orders", list);

        int totalHotels = hd.getTotalHotel();
        int hotelsAddedToday = hd.getTotalHotelsAddedToday();
        int totalSupliers = ud.getTotalSuppliers();
        int supliersAdderToday = ad.getTotalSuplierAddedToday();
        int totalUserRegestered = ud.getTotalRegisteredUser();
        int userReAdderToday = ad.getTotalUserReAddedToday();
        String totalMonney = od.getTotalMonney();
        String totalMonneyToday = od.getTotalMoneyToday();
        List<Hotel> topHotels = rd.getTopHotel();
        List<User> topUserMonney = ud.getTopUsersByTotalPrice();

        request.setAttribute("topHotel", topHotels);
        request.setAttribute("supliersAdderToday", supliersAdderToday);
        request.setAttribute("userReAdderToday", userReAdderToday);
        request.setAttribute("hotelsAddedToday", hotelsAddedToday);
        request.setAttribute("totalHotels", totalHotels);
        request.setAttribute("totalSupliers", totalSupliers);
        request.setAttribute("totalUserRegestered", totalUserRegestered);
        request.setAttribute("totalMonney", totalMonney);
        request.setAttribute("totalMonneyToday", totalMonneyToday);
        request.setAttribute("topUserMonney", topUserMonney);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
