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
public class ReviewUser {
    private int id;
    private int hotel_id;
    private String email;
    private int location_rating;
    private int service_rating;
    private int convenient_rating;
    private int cleanliness_rating;
    private double hotel_rating;
    private String comment;
    private Date date;
    private String username;

    public ReviewUser() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getLocation_rating() {
        return location_rating;
    }

    public void setLocation_rating(int location_rating) {
        this.location_rating = location_rating;
    }

    public int getService_rating() {
        return service_rating;
    }

    public void setService_rating(int service_rating) {
        this.service_rating = service_rating;
    }

    public int getConvenient_rating() {
        return convenient_rating;
    }

    public void setConvenient_rating(int convenient_rating) {
        this.convenient_rating = convenient_rating;
    }

    public int getCleanliness_rating() {
        return cleanliness_rating;
    }

    public void setCleanliness_rating(int cleanliness_rating) {
        this.cleanliness_rating = cleanliness_rating;
    }

    public double getHotel_rating() {
        return hotel_rating;
    }

    public void setHotel_rating(double hotel_rating) {
        this.hotel_rating = hotel_rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ReviewUser{" + "id=" + id + ", hotel_id=" + hotel_id + ", email=" + email + ", location_rating=" + location_rating + ", service_rating=" + service_rating + ", convenient_rating=" + convenient_rating + ", cleanliness_rating=" + cleanliness_rating + ", hotel_rating=" + hotel_rating + ", comment=" + comment + ", date=" + date + '}';
    }
    
    
    
    
}
