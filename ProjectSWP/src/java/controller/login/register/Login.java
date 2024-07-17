/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login.register;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import util.Sha1;

/**
 *
 * @author thait
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        AccountDAO ad = new AccountDAO();
        Sha1 sha1 = new Sha1();
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");
        String password = sha1.getSHAHash(pass);
        Account a = ad.getAccountByEmailAndPass(email, password);
        if (a != null) {            
            // start cookie
              Cookie e = new Cookie("e", email);
              Cookie p = new Cookie("p", pass);
              Cookie r = new Cookie("r", remember);
              if(remember != null){
                  e.setMaxAge(60*60*24*7);
                  p.setMaxAge(60*60*24*7);
                  r.setMaxAge(60*60*24*7);
              }else{
                  e.setMaxAge(0);
                  p.setMaxAge(0);
                  r.setMaxAge(0);
              }
              response.addCookie(e);
              response.addCookie(p);
              response.addCookie(r);
            // end cookie
            session.setAttribute("account", a);
            if(a.getRoleID() == 3){
                if(a.isStatus()){
                    response.sendRedirect("home");
                }else{
                    response.sendRedirect("errpage.jsp");
                }
            }else if(a.getRoleID() == 1){
                response.sendRedirect("homeadmin");
            }else{
                if(a.isStatus()){
                    response.sendRedirect("homehotelier");
                }else{
                    response.sendRedirect("errpage.jsp");
                }               
            }
            
        } else {
            request.setAttribute("err", "Email address or password is incorrect");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
