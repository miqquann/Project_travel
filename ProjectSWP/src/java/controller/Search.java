/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.HotelDAO;
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
import java.util.List;
import model.Hotel;
import model.Location;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {

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
            out.println("<title>Servlet Search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Search at " + request.getContextPath() + "</h1>");
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
        String query = request.getParameter("query");
        String checkinStr = request.getParameter("checkin");
        String checkoutStr = request.getParameter("checkout");
        
        Date checkin = Date.valueOf(checkinStr);
        Date checkout = Date.valueOf(checkoutStr);
        
        HttpSession session = request.getSession();
        session.setAttribute("checkin", checkin);
        session.setAttribute("checkout", checkout); 
        HotelDAO hd = new HotelDAO();
        List<Hotel> list = hd.searchHotels(query);
        int numPs = list.size(); //tổng số sản phẩm có
        int numperPage = 6; // số sản pẩm trong 1 trang
        int numpage = (numPs % numperPage == 0 ? (numPs / numperPage) : ((numPs / numperPage)) + 1);// so trang
        int start, end, page;
        String tpage = request.getParameter("page");
        if (tpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(tpage);
        }
        start = (page - 1) * numperPage;
        end = Math.min(page * numperPage, numPs);
        List<Hotel> arr = hd.getListByPage(list, start, end);
        int size = list.size();
        if (size == 0) {
            request.setAttribute("size", 0);
        } else {
            request.setAttribute("size", size);
        }
        request.setAttribute("listbyLocation", arr);
        request.setAttribute("num", numpage);
        request.setAttribute("query", query);
        request.setAttribute("page", page);
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
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
        String query = request.getParameter("query");
        String checkinStr = request.getParameter("checkin");
        String checkoutStr = request.getParameter("checkout");
        
        Date checkin = Date.valueOf(checkinStr);
        Date checkout = Date.valueOf(checkoutStr);
        
        HttpSession session = request.getSession();
        session.setAttribute("checkin", checkin);
        session.setAttribute("checkout", checkout); 
        HotelDAO hd = new HotelDAO();
        List<Hotel> list = hd.searchHotels(query);
        int numPs = list.size(); //tổng số sản phẩm có
        int numperPage = 6; // số sản pẩm trong 1 trang
        int numpage = (numPs % numperPage == 0 ? (numPs / numperPage) : ((numPs / numperPage)) + 1);// so trang
        int start, end, page;
        String tpage = request.getParameter("page");
        if (tpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(tpage);
        }
        start = (page - 1) * numperPage;
        end = Math.min(page * numperPage, numPs);
        List<Hotel> arr = hd.getListByPage(list, start, end);
        int size = list.size();
        if (size == 0) {
            request.setAttribute("size", 0);
        } else {
            request.setAttribute("size", size);
        }
        request.setAttribute("listbyLocation", arr);
        request.setAttribute("num", numpage);
        request.setAttribute("query", query);
        request.setAttribute("page", page);
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
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
