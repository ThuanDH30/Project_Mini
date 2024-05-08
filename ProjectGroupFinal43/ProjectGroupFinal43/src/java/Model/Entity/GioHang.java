/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Entity;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class GioHang implements Serializable {
    private int idGioHang;
    private Customer customer;

    public GioHang(int idGioHang, Customer customer) {
        this.idGioHang = idGioHang;
        this.customer = customer;
    }

    public GioHang() {
    }

    public int getIdGioHang() {
        return idGioHang;
    }

    public void setIdGioHang(int idGioHang) {
        this.idGioHang = idGioHang;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "GioHang{" + "idGioHang=" + idGioHang + ", customer=" + customer + '}';
    }

    

   
    
}
