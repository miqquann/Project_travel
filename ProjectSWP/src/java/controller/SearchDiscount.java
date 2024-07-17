/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
 * @author thait
 */
@WebServlet(name = "SearchDiscount", urlPatterns = {"/searchdiscount"})
public class SearchDiscount extends HttpServlet {

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
            out.println("<title>Servlet SearchDiscount</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchDiscount at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String type_raw = request.getParameter("type");
        int type = 0;
        if(type_raw != null){
            type = Integer.parseInt(type_raw);
        }
        DiscountDAO dd = new DiscountDAO();
        List<Discount> list = dd.getSearchDiscount(query, type);
        int numPs = list.size(); //tổng số sản phẩm có
        int numperPage = 8; // số sản pẩm trong 1 trang
        int numpage = (numPs % numperPage == 0 ? (numPs / numperPage) : (numPs / numperPage) + 1);// so trang
        int start, end, page;
        String url = "";
        String tpage = request.getParameter("page");
        if (tpage == null || tpage.equals("")) {
            page = 1;
        } else {
            page = Integer.parseInt(tpage);
        }
        start = (page - 1) * numperPage;
        end = Math.min(page * numperPage, numPs);
        List<Discount> listd = getListByPage(list, start, end);
        request.setAttribute("listd", listd);
        request.setAttribute("num", numpage);
        request.setAttribute("indexpage", page);
        request.setAttribute("query", query);
        request.setAttribute("type", type);
        request.getRequestDispatcher("viewdiscount.jsp").forward(request, response);
    }
    
    public List<Discount> getListByPage(List<Discount> list,
            int start, int end) {
        ArrayList<Discount> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
