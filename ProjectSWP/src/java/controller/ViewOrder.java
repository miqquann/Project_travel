/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Hotel;
import model.Order;
import java.sql.Date;

/**
 *
 * @author thait
 */
@WebServlet(name = "ViewOrder", urlPatterns = {"/vieworder"})
public class ViewOrder extends HttpServlet {

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
            out.println("<title>Servlet ViewOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewOrder at " + request.getContextPath() + "</h1>");
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
    public long x(Date date1, Date date2) {
        long millisecondsInDay = 1000 * 60 * 60 * 24;
        long difference = Math.abs(date2.getTime() - date1.getTime());
        long differenceInDays = difference / millisecondsInDay;
        return differenceInDays;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            OrderDAO od = new OrderDAO();
            List<Order> list = od.getOrderByEmail(a.getEmail());
            int numPs = list.size(); //tổng số sản phẩm có
            int numperPage = 5; // số sản pẩm trong 1 trang
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
            List<Order> arr = getListByPage(list, start, end);
            request.setAttribute("listod", arr);
            request.setAttribute("num", numpage);
            request.getRequestDispatcher("viewOrder.jsp").forward(request, response);
        }
    }

    public List<Order> getListByPage(List<Order> list,
            int start, int end) {
        ArrayList<Order> arr = new ArrayList<>();
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
