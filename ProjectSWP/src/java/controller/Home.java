/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FavoriteHotelDAO;
import dal.HotelDAO;
import dal.LocationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Account;
import model.Hotel;
import model.ReviewUser;

/**
 *
 * @author thait
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        ///////////////////////
        HttpSession session = request.getSession();
        if (session.getAttribute("checkin") == null) {
            LocalDate currentDate = LocalDate.now();
            LocalDate nextDate = currentDate.plusDays(1);
            LocalDate nextDate1 = currentDate.plusDays(3);
            LocalDate nextDate2 = currentDate.plusDays(2);
            Date checkin = Date.valueOf(nextDate);
            Date checkout = Date.valueOf(nextDate1);
            Date max = Date.valueOf(nextDate2);
            session.setAttribute("checkin", checkin);
            session.setAttribute("checkout", checkout);
            session.setAttribute("min", checkin);
            session.setAttribute("max", max);
        }
        ///////////////////////
        HotelDAO hd = new HotelDAO();
        LocationDAO ld = new LocationDAO();
        FavoriteHotelDAO fhd = new FavoriteHotelDAO();
        List<Integer> listfh = new ArrayList<>();
        List<Hotel> list = hd.ShowHotel();
        Account a = (Account) session.getAttribute("account");
        //////////////////////phan trang
        int numPs = list.size(); //tổng số sản phẩm có
        int numperPage = 8; // số sản pẩm trong 1 trang
        int numpage = (numPs % numperPage == 0 ? (numPs / numperPage) : (numPs / numperPage) + 1);// so trang
        int start, end, page;
        String url = "";
        String tpage = request.getParameter("page");
        if (tpage == null || tpage.equals("")) {
            page = 1;
        } else {
            page = Integer.parseInt(tpage);
        }
        start = (page - 1) * numperPage;
        end = Math.min(page * numperPage, numPs);
        List<Hotel> arr = getListByPage(list, start, end);
        if (a != null) {
            listfh = fhd.getAllFH(a.getEmail());
        }
        /////////////////////
        session.setAttribute("listfh", listfh);
        request.setAttribute("indexpage", page);
        request.setAttribute("listhotel", arr);
        request.setAttribute("listlocation", ld.getLocationHot());
        request.setAttribute("num", numpage);
        request.getRequestDispatcher("hometung.jsp").forward(request, response);
    }

    public List<Hotel> getListByPage(List<Hotel> list,
            int start, int end) {
        ArrayList<Hotel> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
