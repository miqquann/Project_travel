/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.adminManagement;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name="SearchRegisteredUser", urlPatterns={"/searchRegisteredUser"})
public class SearchRegisteredUser extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       request.getRequestDispatcher("listRegisteredUser.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String query = request.getParameter("name");
        if (!query.equals(query.trim())) {
        request.setAttribute("error", "Vui lòng nhập một từ khóa tìm kiếm hợp lệ mà không có khoảng trắng ở đầu.");
        request.getRequestDispatcher("listRegisteredUser.jsp").forward(request, response);
        return;
    }
        UserDAO u = new UserDAO();
        List<User> list = u.searchRegisteredUser(query);
        request.setAttribute("query", query);
        request.setAttribute("listRegisteredUser", list);
        request.getRequestDispatcher("listRegisteredUser.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
