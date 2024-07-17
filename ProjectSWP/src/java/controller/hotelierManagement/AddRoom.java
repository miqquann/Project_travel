/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hotelierManagement;

import dal.CateRoomDAO;
import dal.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;

import java.util.Base64;
import java.util.List;

import model.CateRoom;

import model.Room;

/**
 *
 * @author thait
 */
@MultipartConfig
@WebServlet(name = "AddRoom", urlPatterns = {"/addroom"})
public class AddRoom extends HttpServlet {

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
            out.println("<title>Servlet AddRoom</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRoom at " + request.getContextPath() + "</h1>");
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
        CateRoomDAO cd = new CateRoomDAO();
        List<CateRoom> list = cd.getAllCate();
        String hotel_id = request.getParameter("id");
        request.setAttribute("list", list);
        request.setAttribute("hotel_id", hotel_id);
        request.getRequestDispatcher("addroom.jsp").forward(request, response);
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
        RoomDAO rd = new RoomDAO();
        String name = request.getParameter("name");
        String cate_raw = request.getParameter("cate_id");
        String quantity_raw = request.getParameter("quantity");
        String price_raw = request.getParameter("price");
        String hotelid_raw = request.getParameter("hotel_id");
        String describe = request.getParameter("describe");
        String[] utilities_list = request.getParameterValues("utilities");
        String utilities;
        if (utilities_list != null) {
            utilities = utilities_list[0];
            for (int i = 1; i < utilities_list.length; i++) {
                utilities += "-" + utilities_list[i];
            }
        }else{
            utilities ="";
        }

        Part filePart = request.getPart("imageFile");
        Part filePart1 = request.getPart("imageFile1");
        Part filePart2 = request.getPart("imageFile2");
        Part filePart3 = request.getPart("imageFile3");
        Part filePart4 = request.getPart("imageFile4");
        InputStream inputStream = filePart.getInputStream();
        InputStream inputStream1 = filePart1.getInputStream();
        InputStream inputStream2 = filePart2.getInputStream();
        InputStream inputStream3 = filePart3.getInputStream();
        InputStream inputStream4 = filePart4.getInputStream();
        byte[] imageByte = inputStream.readAllBytes();
        byte[] imageByte1 = inputStream1.readAllBytes();
        byte[] imageByte2 = inputStream2.readAllBytes();
        byte[] imageByte3 = inputStream3.readAllBytes();
        byte[] imageByte4 = inputStream4.readAllBytes();
        String imageData;
        String imageData1;
        String imageData2;
        String imageData3;
        String imageData4;
        imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
        imageData1 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte1);
        imageData2 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte2);
        imageData3 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte3);
        imageData4 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte4);

        Room r = new Room();
        r.setName(name);
        r.setHotel_id(Integer.parseInt(hotelid_raw));
        r.setImg1(imageData);
        r.setImg2(imageData1);
        r.setImg3(imageData2);
        r.setImg4(imageData3);
        r.setImg5(imageData4);
        r.setCate_id(Integer.parseInt(cate_raw));
        r.setQuantity(Integer.parseInt(quantity_raw));
        r.setPrice(Integer.parseInt(price_raw));
        r.setDescribe(describe);
        r.setUtilities(utilities);
        rd.insert(r);
        response.sendRedirect("homehotelier");
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
