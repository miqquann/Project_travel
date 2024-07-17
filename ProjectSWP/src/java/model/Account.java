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
public class Account {
    private String email;
    private String pass;
    private int roleID;
    private boolean status;
    private Date created_at;
    private int travelmoney;
    

    public Account() {
    }

    public Account(String email, String pass, int roleID, boolean status, Date created_at) {
        this.email = email;
        this.pass = pass;
        this.roleID = roleID;
        this.status = status;
        this.created_at = created_at;
    }

    public int getTravelmoney() {
        return travelmoney;
    }

    public void setTravelmoney(int travelmoney) {
        this.travelmoney = travelmoney;
    }
 
    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

    public int getRoleID() {
        return roleID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
    
    
}
