/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminManagement;

import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Discount;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FilterDiscountAD", urlPatterns = {"/filterDiscountAD"})
public class FilterDiscountAD extends HttpServlet {

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
            out.println("<title>Servlet FilterDiscountAD</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterDiscountAD at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int limit = 5;
        int offset = 0;

        String limitParam = request.getParameter("limit");
        if (limitParam != null) {
            limit = Integer.parseInt(limitParam);
        }

        String pageParam = request.getParameter("page");
        int currentPage = 1;
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
            offset = (currentPage - 1) * limit;
        }

        DiscountDAO discountDAO = new DiscountDAO();
        String isOrderRaw = request.getParameter("isOrder");
        List<Discount> list = new ArrayList<>();
        int totalEntries = 0;

        if (isOrderRaw != null) {
            if (isOrderRaw.equals("1")) {
                list = discountDAO.getListDiscountStatus(true, limit, offset);
                totalEntries = discountDAO.getTotalEntriesStatus(true);
            } else if (isOrderRaw.equals("0")) {
                list = discountDAO.getListDiscountStatus(false, limit, offset);
                totalEntries = discountDAO.getTotalEntriesStatus(false);
            }
        }

        int totalPages = (int) Math.ceil((double) totalEntries / limit);

        request.setAttribute("discounts", list);
        request.setAttribute("limit", limit);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalEntries", totalEntries);
        request.setAttribute("isOrder", isOrderRaw);

        request.getRequestDispatcher("listDiscountAD.jsp").forward(request, response);
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
