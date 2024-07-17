/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import org.json.JSONArray;
import org.json.JSONObject;
import dal.FavoriteHotelDAO;
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

/**
 *
 * @author thait
 */
@WebServlet(name = "FavoriteHotel", urlPatterns = {"/favoritehotel"})
public class FavoriteHotel extends HttpServlet {

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
            out.println("<title>Servlet FavoriteHotel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FavoriteHotel at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        JSONObject jsonResponse = new JSONObject();

        if (a == null) {
            jsonResponse.put("status", "login");
        } else {
            FavoriteHotelDAO fhd = new FavoriteHotelDAO();
            String hotel_id_raw = request.getParameter("hotel_id");
            int hotel_id = Integer.parseInt(hotel_id_raw);
            model.FavoriteHotel fh = fhd.check(hotel_id, a.getEmail());

            boolean isFavorite;
            if (fh == null) {
                fhd.insert(hotel_id, a.getEmail());
                isFavorite = true;
            } else {
                fhd.delete(hotel_id, a.getEmail());
                isFavorite = false;
            }

            List<Integer> listfh = fhd.getAllFH(a.getEmail());

            jsonResponse.put("isFavorite", isFavorite);
            jsonResponse.put("favoriteHotels", new JSONArray(listfh));
        }

        try (PrintWriter out = response.getWriter()) {
            out.print(jsonResponse.toString());
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
