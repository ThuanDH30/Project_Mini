package Model.Entity;

import java.io.Serializable;


public class Bill implements Serializable{
    private int idBill;
    private Customer customer;

    private String date;

    public Bill(int idBill, Customer customer, String date) {
        this.idBill = idBill;
        this.customer = customer;
       
        this.date = date;
    }

    public Bill() {
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

   

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Bill{" + "idBill=" + idBill + ", customer=" + customer + ", total=" + ", date=" + date + '}';
    }

    
    
}