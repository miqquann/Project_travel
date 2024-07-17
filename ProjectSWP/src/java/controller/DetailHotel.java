/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.HotelDAO;
import dal.ReviewDAO;
import dal.RoomDAO;
import dal.TourDAO;
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
import java.util.ArrayList;
import model.Hotel;
import model.Rating;
import model.ReviewUser;
import model.Room;
import model.Tour;

/**
 *
 * @author thait
 */
@WebServlet(name = "DetailHotel", urlPatterns = {"/detailhotel"})
public class DetailHotel extends HttpServlet {

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
            out.println("<title>Servlet DetailHotel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailHotel at " + request.getContextPath() + "</h1>");
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
        HotelDAO hd = new HotelDAO();
        RoomDAO rd = new RoomDAO();
        ReviewDAO rvd = new ReviewDAO();
        TourDAO td = new TourDAO();
        ///////////////////////////////////////////////////////////
        Date checkin = (Date) session.getAttribute("checkin");
        Date checkout = (Date) session.getAttribute("checkout");
        String id = request.getParameter("id");
        String mess = request.getParameter("mess");
        Hotel h = hd.getHotelById(Integer.parseInt(id));
        Rating ra = rvd.getRatingByHotelId(Integer.parseInt(id));
        List<Room> r = rd.getRoomByHotelId(Integer.parseInt(id));
        List<ReviewUser> listreview = rvd.getReviewByHotelId(Integer.parseInt(id));
        List<Tour> listtour = td.getAllTourByLocation(h.getLocationId());
        //////////////////////////////////////////////////////////
        String[] list = h.getUtilities().split("-");
        for (Room room : r) {
            String[] list1 = room.getUtilities().split("-");
            room.setListutilities(list1);
            int qre = rd.getQuantityRoomEmpty(room.getId(), checkin, checkout);
            room.setQuantityRoomEmpty(qre);
        }
        ////////////////////////////////////////////////////////// phan trang
        int numPs = listreview.size(); //tổng số review có
        int numperPage = 3; // số review trong 1 trang
        int numpage = (numPs % numperPage == 0 ? (numPs / numperPage) : (numPs / numperPage) + 1);// so trang
        int start, end, page;
        String tpage = request.getParameter("page");
        if (tpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(tpage);
        }
        start = (page - 1) * numperPage;
        end = Math.min(page * numperPage, numPs);
        List<ReviewUser> arr = getListByPage(listreview, start, end);
        request.setAttribute("num", numpage);
        request.setAttribute("listreview", arr);
        request.setAttribute("uh", list);
        request.setAttribute("hotel", h);
        request.setAttribute("listt", listtour);
        request.setAttribute("room", r);
        request.setAttribute("rating", ra);
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("DetailHotel.jsp").forward(request, response);

    }

    public List<ReviewUser> getListByPage(List<ReviewUser> list,
            int start, int end) {
        ArrayList<ReviewUser> arr = new ArrayList<>();
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
