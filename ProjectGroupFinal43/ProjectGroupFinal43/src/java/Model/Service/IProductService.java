/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Product;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public interface IProductService {
    public boolean insertProduct(Product product);
    public ArrayList<Product> performSearch(String condition);
    public ArrayList<Product> getAllProducts();
    public Product getProductById(int productId);
    public boolean deleteProduct(int productId);
    public boolean updateProduct(Product product) ;
}
