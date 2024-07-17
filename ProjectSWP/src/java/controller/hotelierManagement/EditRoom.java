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
@WebServlet(name = "EditRoom", urlPatterns = {"/editroom"})
public class EditRoom extends HttpServlet {

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
            out.println("<title>Servlet EditRoom</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditRoom at " + request.getContextPath() + "</h1>");
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
        RoomDAO rd = new RoomDAO();
        String id_raw = request.getParameter("id");
        String hotel_id = request.getParameter("hotel_id");
        int id = Integer.parseInt(id_raw);
        Room r =  rd.getRoomById(id);
        CateRoomDAO cd = new CateRoomDAO();
        List<CateRoom> list = cd.getAllCate();
        request.setAttribute("list", list);
        request.setAttribute("hotel_id", hotel_id);
        request.setAttribute("room", r);
        request.setAttribute("hotel_id", hotel_id);
        request.getRequestDispatcher("editRoom.jsp").forward(request, response);
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
        RoomDAO rd = new RoomDAO();
        String name = request.getParameter("name");
        String cate_raw = request.getParameter("cate_id");
        String quantity_raw = request.getParameter("quantity");
        String price_raw = request.getParameter("price");
        String hotelid_raw = request.getParameter("hotel_id");
        String describe = request.getParameter("describe");
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        String[] utilities_list =  request.getParameterValues("utilities");
        String utilities = utilities_list[0];
        for (int i=1;i<utilities_list.length;i++) {
            utilities += "-"+utilities_list[i];
        }
        
        InputStream inputStream = request.getPart("imageFile").getInputStream();
        byte[] imageByte = inputStream.readAllBytes();
        String imageData;
        if (imageByte.length == 0) {
            imageData = request.getParameter("data1");
        } else {
            imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
        }
        InputStream inputStream1 = request.getPart("imageFile1").getInputStream();
        byte[] imageByte1 = inputStream1.readAllBytes();
        String imageData1;
        if (imageByte1.length == 0) {
            imageData1 = request.getParameter("data2");
        } else {
            imageData1 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte1);
        }
        InputStream inputStream2 = request.getPart("imageFile2").getInputStream();
        byte[] imageByte2 = inputStream2.readAllBytes();
        String imageData2;
        if (imageByte2.length == 0) {
            imageData2 = request.getParameter("data3");
        } else {
            imageData2 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte2);
        }
        InputStream inputStream3 = request.getPart("imageFile3").getInputStream();
        byte[] imageByte3 = inputStream3.readAllBytes();
        String imageData3;
        if (imageByte3.length == 0) {
            imageData3 = request.getParameter("data4");
        } else {
            imageData3 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte3);
        }
        InputStream inputStream4 = request.getPart("imageFile4").getInputStream();
        byte[] imageByte4 = inputStream4.readAllBytes();
        String imageData4;
        if (imageByte4.length == 0) {
            imageData4 = request.getParameter("data5");
        } else {
            imageData4 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte4);
        }
        Room r = new Room();
        r.setId(id);
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
        rd.update(r);
        response.sendRedirect("detailhotel?id="+r.getHotel_id());
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
