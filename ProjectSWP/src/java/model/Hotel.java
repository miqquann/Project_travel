/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;
import java.sql.Date;
import java.text.DecimalFormat;

/**
 *
 * @author thait
 */
public class Hotel {

    private int id;
    private String name;
    private String address;
    private boolean refund;
    private Time checkin;
    private Time checkout;
    private String imagemain;
    private String imagesub;
    private String imagesub1;
    private String emailOwn;
    private int locationId;
    private boolean status;
    private boolean poststatus;
    private String describe;
    private String utilities;
    private int price;
    private Date created_at;
    private double avgOverallRating;
    private String comment;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    
    
    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
    private double rating;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        String rating_raw = df.format(rating);
        this.rating = Double.parseDouble(rating_raw);
    }
    
    public String getImagesub1() {
        return imagesub1;
    }

    public boolean isPoststatus() {
        return poststatus;
    }

    public void setPoststatus(boolean poststatus) {
        this.poststatus = poststatus;
    }

    public void setImagesub1(String imagesub1) {
        this.imagesub1 = imagesub1;
    }

    public Hotel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isRefund() {
        return refund;
    }

    public void setRefund(boolean refund) {
        this.refund = refund;
    }

    public Time getCheckin() {
        return checkin;
    }

    public void setCheckin(Time checkin) {
        this.checkin = checkin;
    }

    public Time getCheckout() {
        return checkout;
    }

    public void setCheckout(Time checkout) {
        this.checkout = checkout;
    }

    public String getImagemain() {
        return imagemain;
    }

    public void setImagemain(String imagemain) {
        this.imagemain = imagemain;
    }

    public String getImagesub() {
        return imagesub;
    }

    public void setImagesub(String imagesub) {
        this.imagesub = imagesub;
    }

    public String getEmailOwn() {
        return emailOwn;
    }

    public void setEmailOwn(String emailOwn) {
        this.emailOwn = emailOwn;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getUtilities() {
        return utilities;
    }

    public void setUtilities(String utilities) {
        this.utilities = utilities;
    }
    
    public double getAvgOverallRating() {
        return avgOverallRating;
    }
    public void setAvgOverallRating(double avgOverallRating) {
        this.avgOverallRating = avgOverallRating;
    }

    @Override
    public String toString() {
        return "Hotel{" + "id=" + id + ", name=" + name + ", address=" + address + ", refund=" + refund + ", checkin=" + checkin + ", checkout=" + checkout + ", emailOwn=" + emailOwn + ", locationId=" + locationId + ", status=" + status + ", poststatus=" + poststatus + ", describe=" + describe + ", utilities=" + utilities + '}';
    }
    
    public DecimalFormat df = new DecimalFormat("#.0");

}
