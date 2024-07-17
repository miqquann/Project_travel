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
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author thait
 */
@MultipartConfig
@WebServlet(name = "AddHotel", urlPatterns = {"/addhotel"})
public class AddHotel extends HttpServlet {

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
            out.println("<title>Servlet AddHotel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddHotel at " + request.getContextPath() + "</h1>");
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
        LocationDAO ld = new LocationDAO();
        List<Location> list = ld.getAllLocation();
        request.setAttribute("listcity", list);
        request.getRequestDispatcher("addhotel.jsp").forward(request, response);
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
        HotelDAO hd = new HotelDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
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
        Time checkin = Time.valueOf(ci + ":00");
        Time checkout = Time.valueOf(co + ":00");
        Part filePart = request.getPart("imageFile");
        Part filePart1 = request.getPart("imageFile1");
        Part filePart2 = request.getPart("imageFile2");
        InputStream inputStream = filePart.getInputStream();
        InputStream inputStream1 = filePart1.getInputStream();
        InputStream inputStream2 = filePart2.getInputStream();
        byte[] imageByte = inputStream.readAllBytes();
        byte[] imageByte1 = inputStream1.readAllBytes();
        byte[] imageByte2 = inputStream2.readAllBytes();
        String imageData;
        String imageData1;
        String imageData2;
        imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
        imageData1 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte1);
        imageData2 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte2);

        Hotel h = new Hotel();
        h.setName(name);
        h.setAddress(address);
        h.setRefund(Boolean.parseBoolean(refund));
        h.setCheckin(Time.valueOf(ci + ":00"));
        h.setCheckout(Time.valueOf(co + ":00"));
        h.setImagemain(imageData);
        h.setImagesub(imageData1);
        h.setImagesub1(imageData2);
        h.setEmailOwn(a.getEmail());
        h.setLocationId(Integer.parseInt(li));
        h.setPoststatus(false);
        h.setStatus(false);
        h.setDescribe(describe);
        h.setUtilities(utilities);
        hd.insert(h);

        response.sendRedirect("homehotelier");

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
