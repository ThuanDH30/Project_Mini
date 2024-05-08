/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Category;
import Model.Repository.CategoryRepository;
import java.util.ArrayList;


/**
 *
 * @author vietn
 */
public class CategoryService implements ICategoryService{
    
    ArrayList<Category> categoryList = new ArrayList<>();
    CategoryRepository categoryRepository = new CategoryRepository();
        
    
    @Override
    public boolean insertCategory(Category category) {
        getAllCategories();
        return categoryRepository.insertCategory(category);
    }

    @Override
    public boolean updateCategory(Category category) {
        getAllCategories();
        for (Category category1 : categoryList) {
            if(category1.getIdCategory() == category.getIdCategory()){
                return categoryRepository.updateCategory(category);
            }
        }
        return false;
    }

    @Override
    public Category getCategoryById(int categoryId) {
        getAllCategories();
        for (Category category : categoryList) {
            if(category.getIdCategory() == categoryId){
                return categoryRepository.getCategoryById(categoryId);
            }
        }
        return  null;
    }

    @Override
    public ArrayList<Category> getAllCategories() {
        this.categoryList = categoryRepository.getAllCategories();
        if(!categoryList.isEmpty() && categoryList != null){
            return categoryList;
        }
        return null;
    }
    
}
