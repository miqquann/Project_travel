/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hotelierManagement;

import dal.LocationDAO;
import dal.TourDAO;
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
import java.util.Base64;
import java.util.List;
import model.Account;
import model.Location;
import model.Tour;

/**
 *
 * @author thait
 */
@MultipartConfig
@WebServlet(name = "AddTour", urlPatterns = {"/addtour"})
public class AddTour extends HttpServlet {

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
            out.println("<title>Servlet AddTour</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTour at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("createTour.jsp").forward(request, response);
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
        TourDAO td = new TourDAO();
        Account a = (Account) session.getAttribute("account");
        String name = request.getParameter("name");
        String quantity_raw = request.getParameter("quantity");
        String description = request.getParameter("description");
        Part filePart = request.getPart("imageFile");
        InputStream inputStream = filePart.getInputStream();
        byte[] imageByte = inputStream.readAllBytes();
        String imageData;
        imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
        String location_id_raw = request.getParameter("locationId");
        String price_raw = request.getParameter("price");
        try{
            int quantity = Integer.parseInt(quantity_raw);
            int location_id = Integer.parseInt(location_id_raw);
            int price = Integer.parseInt(price_raw);
            Tour t = new Tour();
            t.setTour_name(name);
            t.setTour_describe(description);
            t.setTour_img(imageData);
            t.setQuantity(quantity);
            t.setPrice(price);
            t.setLocation_id(location_id);
            t.setEmail(a.getEmail());
            td.insertTour(t);
            td.insertTour_Apply(t);
            
            LocationDAO ld = new LocationDAO();
            List<Location> list = ld.getAllLocation();
            request.setAttribute("listcity", list);
            request.setAttribute("successMessage", "Thêm thành công");
            request.getRequestDispatcher("createTour.jsp").forward(request, response);
        }catch(Exception e){
            
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
