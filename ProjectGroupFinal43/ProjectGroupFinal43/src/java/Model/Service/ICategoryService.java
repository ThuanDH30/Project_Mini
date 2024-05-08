/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Category;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public interface ICategoryService {
    public boolean insertCategory(Category category);
    public boolean updateCategory(Category category);
    public Category getCategoryById(int categoryId);
    public ArrayList<Category> getAllCategories();
}
