/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thait
 */
public class Tour {
    private int tour_id;
    private String tour_describe;
    private String tour_name;
    private String tour_img;
    private int location_id;
    private String email;
    private int quantity;
    private int price;
    private boolean status;
    //temp
    private String city;
    public Tour() {
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public String getTour_describe() {
        return tour_describe;
    }

    public void setTour_describe(String tour_describe) {
        this.tour_describe = tour_describe;
    }

    public String getTour_name() {
        return tour_name;
    }

    public void setTour_name(String tour_name) {
        this.tour_name = tour_name;
    }

    public String getTour_img() {
        return tour_img;
    }

    public void setTour_img(String tour_img) {
        this.tour_img = tour_img;
    }

    public int getLocation_id() {
        return location_id;
    }

    public void setLocation_id(int location_id) {
        this.location_id = location_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Tour{" + "tour_id=" + tour_id + ", tour_describe=" + tour_describe + ", tour_name=" + tour_name + ", location_id=" + location_id + ", email=" + email + ", quantity=" + quantity + ", price=" + price + ", status=" + status + '}';
    }
     
    
}
