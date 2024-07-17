// Import necessary packages

import dal.DiscountDAO;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Base64;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Discount;

@MultipartConfig
@WebServlet(name = "AddNewDiscount", urlPatterns = {"/addnewdiscount"})
public class AddNewDiscount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("createDiscountAD.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DiscountDAO dd = new DiscountDAO();
        String discount_id = request.getParameter("discount_id");
        if (dd.getDiscountById(discount_id)) {
            request.setAttribute("successMessage", "Mã này đã tồn tại hãy kiểm tra danh sách");
            request.getRequestDispatcher("createDiscountAD.jsp").forward(request, response);
        } else {
            String type_percent = request.getParameter("type_percent");
            String percent_raw = "0";
            if (type_percent.equals("VND")) {
                type_percent = "2";
                percent_raw = request.getParameter("vndInput");
            } else {
                type_percent = "1";
                percent_raw = request.getParameter("percentInput");
            }
            String quantity = request.getParameter("quantity");
            String describe = request.getParameter("description");
            InputStream inputStream = request.getPart("imageFile").getInputStream();
            byte[] imageByte = inputStream.readAllBytes();
            String imageData = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageByte);
            String startdate_raw = request.getParameter("dateRange1");
            String enddate_raw = request.getParameter("dateRange2");
            try {
                Discount d = new Discount();
                d.setDiscount_id(discount_id);
                d.setDescribe_discount(describe);
                d.setImg_discount(imageData);
                d.setType_percent(Integer.parseInt(type_percent));
                d.setPercent(Integer.parseInt(percent_raw));
                d.setQuantity(Integer.parseInt(quantity));
                d.setStartdate(Date.valueOf(startdate_raw));
                d.setEnddate(Date.valueOf(enddate_raw));

                dd.insertDiscount(d);
                dd.insertApply(d);

                request.setAttribute("successMessage", "Tạo mã giảm giá thành công");
                request.getRequestDispatcher("createDiscountAD.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
