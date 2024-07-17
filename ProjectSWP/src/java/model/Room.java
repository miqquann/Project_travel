/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thait
 */
public class Room {

    private int id;
    private int hotel_id;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String img5;
    private String name;
    private int cate_id;
    private int quantity;
    private int price;
    private String describe;
    private String utilities;
    private int nop;
    private String[] listutilities;
    private int quantityRoomEmpty;

    public int getQuantityRoomEmpty() {
        return quantityRoomEmpty;
    }

    public void setQuantityRoomEmpty(int quantityRoomEmpty) {
        this.quantityRoomEmpty = quantityRoomEmpty;
    }

    public String[] getListutilities() {
        return listutilities;
    }

    public void setListutilities(String[] listutilities) {
        this.listutilities = listutilities;
    }

    public Room() {
    }

    public int getNop() {
        return nop;
    }

    public void setNop(int nop) {
        this.nop = nop;
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

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public String getImg5() {
        return img5;
    }

    public void setImg5(String img5) {
        this.img5 = img5;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
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

    @Override
    public String toString() {
        return "Room{" + "id=" + id + ", hotel_id=" + hotel_id + ", name=" + name + ", cate_id=" + cate_id + ", quantity=" + quantity + ", price=" + price + ", describe=" + describe + ", utilities=" + utilities + ", nop=" + nop + '}';
    }

}
