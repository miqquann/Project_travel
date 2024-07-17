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
public class Order {

    private String id;
    private String email;
    private Date date;
    private int price;
    private String vnp_PayDate;

    public Order() {
    }
    
    public String getVnp_PayDate() {
        return vnp_PayDate;
    }

    public void setVnp_PayDate(String vnp_PayDate) {
        this.vnp_PayDate = vnp_PayDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
