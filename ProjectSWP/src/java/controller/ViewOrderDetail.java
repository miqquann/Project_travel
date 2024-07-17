/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;
import model.OrderDetail;
import java.sql.Date;

/**
 *
 * @author thait
 */
@WebServlet(name = "ViewOrderDetail", urlPatterns = {"/vieworderdetail"})
public class ViewOrderDetail extends HttpServlet {

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
            out.println("<title>Servlet ViewOrderDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewOrderDetail at " + request.getContextPath() + "</h1>");
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
        String order_id = request.getParameter("order_id");
        OrderDetailDAO odd = new OrderDetailDAO();
        List<OrderDetail> list = odd.getOdByO_id(order_id);
        LocalDate currentDate = LocalDate.now();
        Date cudate = Date.valueOf(currentDate);
        for (OrderDetail orderDetail : list) {
            if(cudate.compareTo(orderDetail.getCheckin()) >=0  || (x(orderDetail.getCheckin(),cudate)>=1 && x(orderDetail.getCheckin(),cudate)<=3)){
                orderDetail.setRefund(false);
            }
        }
        request.setAttribute("listodd", list);
        request.getRequestDispatcher("viewOrderDetail.jsp").forward(request, response);
        
    }
    
    public long x(Date date1,Date date2) {
        long millisecondsInDay = 1000 * 60 * 60 * 24;
        long difference = Math.abs(date2.getTime() - date1.getTime());
        long differenceInDays = difference / millisecondsInDay;    
        return differenceInDays;
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
