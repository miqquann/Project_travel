/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CTourDAO;
import dal.TourDAO;
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
import model.CartTour;

/**
 *
 * @author thait
 */
@WebServlet(name = "EditQuantityCartTour", urlPatterns = {"/editquantitycarttour"})
public class EditQuantityCartTour extends HttpServlet {

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
            out.println("<title>Servlet EditQuantityCartTour</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditQuantityCartTour at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        CTourDAO ct = new CTourDAO();
        TourDAO td = new TourDAO();
        Account a = (Account) session.getAttribute("account");
        String tour_id_raw = request.getParameter("tour_id");
        String quantity_raw = request.getParameter("quantity");
        String id_raw  = request.getParameter("id");
        String action = request.getParameter("action");
        if (a == null) {
            response.sendRedirect("login");
        }else{
            int tour_id = Integer.parseInt(tour_id_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int id = Integer.parseInt(id_raw);
            model.Tour t = td.getTourById(tour_id);
            switch (action) {
                case "incre":
                    if (quantity < t.getQuantity()) {
                        ct.insert(id, t.getPrice());
                    }
                    break;
                case "decre":
                    if (quantity > 1){
                        ct.insertDesc(id, t.getPrice());
                    }else{
                        ct.delete(id);
                    }
                    break;
                default:
                    ct.delete(id);
            }
            List<CartTour> list = ct.getAllCartByEmail(a.getEmail());
            request.setAttribute("listct", list);
            request.getRequestDispatcher("cartTour.jsp").forward(request, response);
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
