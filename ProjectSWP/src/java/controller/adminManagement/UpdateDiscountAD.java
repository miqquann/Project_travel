/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminManagement;

import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.sql.Date;
import java.util.Base64;
import java.util.List;
import model.Discount;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "UpdateDiscountAD", urlPatterns = {"/updateDiscountAD"})
public class UpdateDiscountAD extends HttpServlet {

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
            out.println("<title>Servlet UpdateDiscountAD</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDiscountAD at " + request.getContextPath() + "</h1>");
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
        DiscountDAO dd = new DiscountDAO();
        String discountId = request.getParameter("discount_id");
        Discount d = dd.getDiscountById1(discountId);
        request.setAttribute("Discount", d);
        request.getRequestDispatcher("updateDiscountAD.jsp").forward(request, response);
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
        DiscountDAO dd = new DiscountDAO();
        String discount_id = request.getParameter("discount_id");
        String quantity = request.getParameter("quantity");
        String describe = request.getParameter("description");
        String type_percent = request.getParameter("type_percent");
        if (type_percent.equals("VND")) {
            type_percent = "2";
        } else {
            type_percent = "1";
        }
        String percent = request.getParameter("percent");
        InputStream inputStream = request.getPart("imageFile").getInputStream();
        byte[] imageByte = inputStream.readAllBytes();
        String imageData;
        if (imageByte.length == 0) {
            imageData = request.getParameter("data");
        } else {
            imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
        }
        String startdate_raw = request.getParameter("dateRange1");
        String enddate_raw = request.getParameter("dateRange2");
        try {
            Discount d = new Discount();
            d.setDiscount_id(discount_id);
            d.setType_percent(Integer.parseInt(type_percent));
            d.setPercent(Integer.parseInt(percent));
            d.setDescribe_discount(describe);
            d.setImg_discount(imageData);
            d.setQuantity(Integer.parseInt(quantity));
            d.setStartdate(Date.valueOf(startdate_raw));
            d.setEnddate(Date.valueOf(enddate_raw));

            dd.updateDiscount(d);
            dd.updateApply(d);

            String discountId = request.getParameter("discount_id");
            Discount newd = dd.getDiscountById1(discount_id);
            request.setAttribute("Discount", d);
            request.setAttribute("successMessage", "Chỉnh sửa thành công");
            request.getRequestDispatcher("updateDiscountAD.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
