/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login.register;

import dal.AccountDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.User;
import util.Email;
import util.Sha1;

/**
 *
 * @author thait
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String role = request.getParameter("role");
        request.setAttribute("role", role);
        request.getRequestDispatcher("register.jsp").forward(request, response);

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
        //processRequest(request, response);
        AccountDAO ad = new AccountDAO();
        UserDAO ud = new UserDAO();
        Sha1 sha1 = new Sha1();
        String email = request.getParameter("email");
        String roleID_raw = request.getParameter("role");
        if(roleID_raw == null){
            response.sendRedirect("chooseRole.jsp");
        }
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String confirm = request.getParameter("confirm");       
        try {
            if (!pass.equals(confirm) || pass.equals("")  || confirm.equals("")) {
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                Account a = ad.getAccountByEmail(email);
                if (a == null) {
                    String password = sha1.getSHAHash(pass);
                    int roleID = Integer.parseInt(roleID_raw);
                    Account anew = new Account();
                    User unew = new User();
                    anew.setEmail(email);
                    anew.setPass(password);
                    anew.setRoleID(roleID);
                    anew.setStatus(false);
                    ad.insert(anew);
                    unew.setName(name);
                    unew.setEmail(email);
                    unew.setPhone(phone);
                    ud.insert(unew);
                    Email e = new Email();
                    String link = "http://localhost:9999/ProjectSWP/accountauthentication?email=" + email;
                    e.sendMail(email, "Xác thực tài khoản ", "<a href=\" " + link + "\">Nhấn vào đây</a>");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("name", name);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phone);
                    request.setAttribute("err", "Email was registered!");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("err", e);
            request.getRequestDispatcher("Console.jsp").forward(request, response);
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
