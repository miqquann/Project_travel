/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hotelierManagement;

import dal.HotelDAO;
import dal.LocationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Time;
import java.util.Base64;
import java.util.List;
import model.Account;
import model.Hotel;
import model.Location;

/**
 *
 * @author thait
 */
@MultipartConfig
@WebServlet(name = "EditHotel", urlPatterns = {"/edithotel"})
public class EditHotel extends HttpServlet {

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
            out.println("<title>Servlet EditHotel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditHotel at " + request.getContextPath() + "</h1>");
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
        HotelDAO hd = new HotelDAO();
        LocationDAO ld = new LocationDAO();
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        Hotel h = hd.getHotelById(id);
        List<Location> list = ld.getAllLocation();
        request.setAttribute("hotel", h);
        request.setAttribute("listcity", list);
        request.getRequestDispatcher("edithotel.jsp").forward(request, response);
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
        //processRequest(request, response);
        HotelDAO hd = new HotelDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String refund = request.getParameter("refund");
        String ci = request.getParameter("checkin");
        String co = request.getParameter("checkout");
        String li = request.getParameter("locationId");
        String describe = request.getParameter("describe");
        String[] utilities_list = request.getParameterValues("utilities");
        String utilities;
        if (utilities_list != null) {
            utilities = utilities_list[0];
            for (int i = 1; i < utilities_list.length; i++) {
                utilities += "-" + utilities_list[i];
            }
        } else {
            utilities = "";
        }
        int id = Integer.parseInt(id_raw);
        Time checkin = Time.valueOf((ci + ":00").substring(0, 8));
        Time checkout = Time.valueOf((co + ":00").substring(0, 8));

        if (checkin.compareTo(checkout) == 0 || checkin.compareTo(checkout) == -1) {
            LocationDAO ld = new LocationDAO();
            Hotel h = hd.getHotelById(id);
            List<Location> list = ld.getAllLocation();
            request.setAttribute("hotel", h);
            request.setAttribute("listcity", list);
            request.setAttribute("err", "giờ trả phòng phải sớm hơn giờ nhận phòng");
            request.getRequestDispatcher("edithotel.jsp").forward(request, response);
        } else {
            InputStream inputStream = request.getPart("imageFile").getInputStream();
            byte[] imageByte = inputStream.readAllBytes();
            String imageData;
            if (imageByte.length == 0) {
                imageData = request.getParameter("data");
            } else {
                imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
            }
            InputStream inputStream1 = request.getPart("imageFile1").getInputStream();
            byte[] imageByte1 = inputStream1.readAllBytes();
            String imageData1;
            if (imageByte1.length == 0) {
                imageData1 = request.getParameter("data1");
            } else {
                imageData1 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte1);
            }
            InputStream inputStream2 = request.getPart("imageFile2").getInputStream();
            byte[] imageByte2 = inputStream2.readAllBytes();
            String imageData2;
            if (imageByte2.length == 0) {
                imageData2 = request.getParameter("data2");
            } else {
                imageData2 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte2);
            }
            Hotel h = new Hotel();
            h.setId(id);
            h.setName(name);
            h.setAddress(address);
            h.setRefund(Boolean.parseBoolean(refund));
            h.setCheckin(checkin);
            h.setCheckout(checkout);
            h.setImagemain(imageData);
            h.setImagesub(imageData1);
            h.setImagesub1(imageData2);
            h.setEmailOwn(a.getEmail());
            h.setLocationId(Integer.parseInt(li));
            h.setDescribe(describe);
            h.setUtilities(utilities);
            hd.update(h);
            response.sendRedirect("homehotelier");
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
