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
public class BoxProduct implements  Serializable{
    private int idBoxProduct;
    private GioHang gioHang;
    private Product product;
    private int sl;

    public BoxProduct(int idBoxProduct, GioHang gioHang, Product product, int sl) {
        this.idBoxProduct = idBoxProduct;
        this.gioHang = gioHang;
        this.product = product;
        this.sl = sl;
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

    

    public BoxProduct() {
    }

    public int getIdBoxProduct() {
        return idBoxProduct;
    }

    public void setIdBoxProduct(int idBoxProduct) {
        this.idBoxProduct = idBoxProduct;
    }

    public GioHang getGioHang() {
        return gioHang;
    }

    public void setGioHang(GioHang gioHang) {
        this.gioHang = gioHang;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "BoxProduct{" + "idBoxProduct=" + idBoxProduct + ", gioHang=" + gioHang + ", product=" + product + '}' + "\n";
    }
  
        
}
