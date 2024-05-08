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
public class BoxBill implements Serializable {
    private int idBoxBill;
    private Bill bill;
    private Product product;
    private int amountBoxBill;
    private double total;

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public BoxBill(int idBoxBill, Bill bill, Product product, int amountBoxBill, double total) {
        this.idBoxBill = idBoxBill;
        this.bill = bill;
        this.product = product;
        this.amountBoxBill = amountBoxBill;
        this.total = total;
    }

    @Override
    public String toString() {
        return "BoxBill{" + "idBoxBill=" + idBoxBill + ", bill=" + bill + ", product=" + product + ", amountBoxBill=" + amountBoxBill + '}';
    }

    public int getIdBoxBill() {
        return idBoxBill;
    }

    public void setIdBoxBill(int idBoxBill) {
        this.idBoxBill = idBoxBill;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmountBoxBill() {
        return amountBoxBill;
    }

    public void setAmountBoxBill(int amountBoxBill) {
        this.amountBoxBill = amountBoxBill;
    }

    public BoxBill() {
    }

   

            
}
