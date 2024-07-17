/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author thait
 */
public class Rating {
    private double r1;
    private double r2;
    private double r3;
    private double r4;
    private double r5;
    private int quantity;

    public Rating() {
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    

    public double getR1() {
        return r1;
    }

    public void setR1(double r1) {
        String r1_raw = df.format(r1);
        this.r1 = Double.parseDouble(r1_raw);
    }

    public double getR2() {
        return r2;
    }

    public void setR2(double r2) {
        String r2_raw = df.format(r2);
        this.r2 = Double.parseDouble(r2_raw);
    }

    public double getR3() {
        return r3;
    }

    public void setR3(double r3) {
        String r3_raw = df.format(r3);
        this.r3 = Double.parseDouble(r3_raw);
    }

    public double getR4() {
        return r4;
    }

    public void setR4(double r4) {
        String r4_raw = df.format(r4);
        this.r4 = Double.parseDouble(r4_raw);
    }

    public double getR5() {
        return r5;
    }

    public void setR5(double r5) {
        String r5_raw = df.format(r5);
        this.r5 = Double.parseDouble(r5_raw);
    }  
    
    public DecimalFormat df = new DecimalFormat("#.0");
}
