/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
/**
 *
 * @author thait
 */
public class Discount {
    private String discount_id ;
    private String describe_discount;
    private String img_discount;
    private int quantity;
    private int percent;
    private int type_percent;
    private Date startdate;
    private Date enddate;
    private String status;

    public Discount() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public String getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(String discount_id) {
        this.discount_id = discount_id;
    }

    public String getDescribe_discount() {
        return describe_discount;
    }

    public void setDescribe_discount(String describe_discount) {
        this.describe_discount = describe_discount;
    }

    public String getImg_discount() {
        return img_discount;
    }

    public void setImg_discount(String img_discount) {
        this.img_discount = img_discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public int getType_percent() {
        return type_percent;
    }

    public void setType_percent(int type_percent) {
        this.type_percent = type_percent;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    @Override
    public String toString() {
        return "Discount{" + "discount_id=" + discount_id + ", describe_discount=" + describe_discount + ", quantity=" + quantity + ", percent=" + percent + ", type_percent=" + type_percent + ", startdate=" + startdate + ", enddate=" + enddate + '}';
    }

    
    
}
