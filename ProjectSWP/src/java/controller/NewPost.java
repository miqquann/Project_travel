/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DiscountDAO;
import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;
import model.Account;
import model.Discount;
import model.Post;

/**
 *
 * @author thait
 */
@MultipartConfig
@WebServlet(name = "NewPost", urlPatterns = {"/newpost"})
public class NewPost extends HttpServlet {

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
            out.println("<title>Servlet NewPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPost at " + request.getContextPath() + "</h1>");
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
        PostDAO pd = new PostDAO();
        DiscountDAO dd = new DiscountDAO();
        List<Discount> listlt = dd.getAllDiscount();
        request.setAttribute("listd", listlt);
        
        Account a = (Account) session.getAttribute("account");
        if (a != null) {
            List<Integer> list1 = pd.getAllLikeByEmail(a.getEmail());
            request.setAttribute("listlike", list1);
        }
        List<Post> list = pd.getAllPost();
        request.setAttribute("listpost", list);
        request.getRequestDispatcher("viewpost.jsp").forward(request, response);
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
        PostDAO pd = new PostDAO();
        String email = request.getParameter("email");
        String caption = request.getParameter("caption");
        Part filePart = request.getPart("imageFile");
        InputStream inputStream = filePart.getInputStream();
        byte[] imageByte = inputStream.readAllBytes();
        String imageData;
        imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
        Post p = new Post();
        p.setCaption(caption);
        p.setEmail(email);
        p.setImg(imageData);
        pd.insert(p);
        response.sendRedirect("newpost");
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
