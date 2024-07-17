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
import java.util.List;
import model.Discount;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListDiscount", urlPatterns = {"/listDiscount"})
public class ListDiscount extends HttpServlet {

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
            out.println("<title>Servlet ListDiscount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListDiscount at " + request.getContextPath() + "</h1>");
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
        List<Discount> discounts = discountDAO.getListDiscount(limit, offset);

        int totalEntries = discountDAO.getTotalEntrie();
        int totalPages = (int) Math.ceil((double) totalEntries / limit);

        request.setAttribute("discounts", discounts);
        request.setAttribute("limit", limit);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalEntries", totalEntries);

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiscountDAO discountDAO = new DiscountDAO();
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String discountId = request.getParameter("id");
            try {
                boolean isDeleted = discountDAO.deleteDiscountById(discountId);
                if (isDeleted) {
                    request.setAttribute("successMessage", "Xóa discount thành công");
                } else {
                    request.setAttribute("errorMessage", "Discount không tìm thấy hoặc bị lỗi");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi xóa discount");
            }
        }
        doGet(request, response);
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
