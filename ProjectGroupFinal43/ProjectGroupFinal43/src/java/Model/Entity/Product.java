package Model.Entity;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class Product implements Serializable  {
   private int id;
    private String name;
    private Category category;
    private double price;
    private String origin;
    private String detail;
    private int quantity;

    public Product(int aInt, String string) {
    }

    public Product(int id, String name, Category category, double price, String origin, String detail, int quantity) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.origin = origin;
        this.detail = detail;
        this.quantity = quantity;
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

    public Category getCategory() {
        return category;
    }

    public void setIdCategory(Category category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", idCategory=" + category + ", price=" + price + ", origin=" + origin + ", detail=" + detail + ", quantity=" + quantity + '}';
    }

}