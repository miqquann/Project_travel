/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import model.Hotel;
import model.Location;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "HotelByLocation", urlPatterns = {"/hotellocation"})
public class HotelByLocation extends HttpServlet {

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
            out.println("<title>Servlet HotelByLocation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HotelByLocation at " + request.getContextPath() + "</h1>");
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

        LocalDate currentDate = LocalDate.now();
        LocalDate nextDate = currentDate.plusDays(1);
        LocalDate nextDate1 = currentDate.plusDays(3);
        Date checkin = Date.valueOf(nextDate);
        Date checkout = Date.valueOf(nextDate1);
        HttpSession session = request.getSession();
        session.setAttribute("checkin", checkin);
        session.setAttribute("checkout", checkout);

        HotelDAO hd = new HotelDAO();
        LocationDAO ld = new LocationDAO();
        try {

            String getIDLocation = request.getParameter("locationId");
            int id = Integer.parseInt(getIDLocation);
            List<Hotel> list = hd.getHotelByLocationID(id);
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
            Location l = ld.getCityById(id);
            int size = list.size();
            if (size == 0) {
                request.setAttribute("size", 0);
            } else {
                request.setAttribute("size", size);
            }

            //so phan tu cua 1 trang
            request.setAttribute("listbyLocation", arr);
            //so trang
            request.setAttribute("location_id", getIDLocation);
            request.setAttribute("num", numpage);
            request.setAttribute("page", page);
            request.setAttribute("getCity", l);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println(e);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
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
        String getIDLocation = request.getParameter("locationId");
        String getMinPrice = request.getParameter("minPrice");
        String getMaxPrice = request.getParameter("maxPrice");
        String getRating = request.getParameter("rating");
        String[] getAmenities = request.getParameterValues("amenities");
        HotelDAO listHotel = new HotelDAO();
        LocationDAO ld = new LocationDAO();
        try {
            int id = Integer.parseInt(getIDLocation);
            int minPrice = Integer.parseInt(getMinPrice);
            int maxPrice = Integer.parseInt(getMaxPrice);
            Double rating = (getRating != null && !getRating.isEmpty()) ? Double.parseDouble(getRating) : null;
            List<Hotel> list;
            if (rating != null && getAmenities != null && getAmenities.length > 0) {
                list = listHotel.getHotelByFilter(minPrice, maxPrice, rating, id, getAmenities);
            } else if (rating != null) {
                list = listHotel.getHotelByFilter(minPrice, maxPrice, id, rating);
            } else if (getAmenities != null && getAmenities.length > 0) {
                list = listHotel.getHotelByFilter(minPrice, maxPrice, id, getAmenities);
            } else {
                list = listHotel.getHotelByFilter(minPrice, maxPrice, id);
            }
            int numPs = list.size(); //tổng số sản phẩm có
            int numperPage = 6; // số sản phẩm trong 1 trang
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
            List<Hotel> arr = listHotel.getListByPage(list, start, end);
            int size = list.size();
            if (size == 0) {
                request.setAttribute("size", 0);
            } else {
                request.setAttribute("size", size);
            }
            Location l = ld.getCityById(id);
            request.setAttribute("getCity", l);
            request.setAttribute("minPrice", getMinPrice);
            request.setAttribute("maxPrice", getMaxPrice);
            request.setAttribute("listbyLocation", arr);
            request.setAttribute("location_id", getIDLocation);
            //so trang
            request.setAttribute("num", numpage);
            request.setAttribute("page", page);

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log the exception for debugging
            // Optionally, you can set an error message to the request and forward to an error page
        } catch (Exception e) {
            e.printStackTrace(); // Log other exceptions
            // Optionally, you can set an error message to the request and forward to an error page
        }

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
