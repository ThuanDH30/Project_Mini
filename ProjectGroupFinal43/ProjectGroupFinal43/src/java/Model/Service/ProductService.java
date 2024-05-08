/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Product;
import Model.Repository.ProductRepository;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public class ProductService implements IProductService {

    ArrayList<Product> productList = new ArrayList<>();
    ProductRepository products = new ProductRepository();

    @Override
    public boolean insertProduct(Product product) {
        if (products.insertProduct(product)) {
            return true;
        }
        return false;
    }

    @Override
    public ArrayList<Product> performSearch(String condition) {
        if (products.performSearch(condition) != null || !products.performSearch(condition).isEmpty()) {
            return products.performSearch(condition);
        }
        return null;
    }

    @Override
    public ArrayList<Product> getAllProducts() {
        this.productList = products.getAllProducts();
        return productList;
    }

    @Override
    public Product getProductById(int productId) {
        if (products.getProductById(productId) != null) {
            return products.getProductById(productId);
        }

        return null;
    }

    @Override
    public boolean deleteProduct(int productId) {
        if (products.deleteProduct(productId)) {
            return true;
        }

        return false;
    }

    @Override
    public boolean updateProduct(Product product) {
        if (products.updateProduct(product)) {
            return true;
        }

        return false;
    }

}
