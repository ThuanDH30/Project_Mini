package Model.Repository;

import Model.Entity.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements Databaseinfo {

    ArrayList<Category> categoryList = new ArrayList<>();

    public Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
           
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
   

    public boolean insertCategory(Category category) {
        int newID =1;
        ArrayList<Category> categorys = getAllCategories();
        if(getAllCategories() != null || !getAllCategories().isEmpty()){
            newID = categorys.get(categorys.size()-1).getIdCategory() +1;
            
            category.setIdCategory(newID);
        }
        System.out.println(newID);
        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("INSERT INTO Category (IDCategory, NameCategory) VALUES (?, ?)");
            prsm.setInt(1, category.getIdCategory());
            prsm.setString(2, category.getNameCategory());
            int i = prsm.executeUpdate();
            con.close();
            return  i>0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

   
    public boolean updateCategory(Category category) {

        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("UPDATE Category SET NameCategory=? WHERE IDCategory=?");
            st.setString(1, category.getNameCategory());
            st.setInt(2, category.getIdCategory());
            int i = st.executeUpdate();
            con.close();
            return i >0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        
        return false;
    }

    public void deleteCategory(int categoryId) {

        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("DELETE FROM Category WHERE IDCategory=?");
            st.setInt(1, categoryId);
            st.executeUpdate();
            con.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    public Category getCategoryById(int categoryId) {

        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("SELECT * FROM Category WHERE IDCategory=?");
            st.setInt(1, categoryId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    return new Category(
                            rs.getInt("IDCategory"),
                            rs.getString("NameCategory")
                    );
                }
            }
            con.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return null;
    }

    public ArrayList<Category> getAllCategories() {

        try (Connection con = getConnect()) {
            categoryList.clear();
            PreparedStatement st = con.prepareStatement("SELECT * FROM Category");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                categoryList.add(new Category(
                        rs.getInt("IDCategory"),
                        rs.getString("NameCategory")
                ));
            }
            con.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return categoryList;
    }

    public ArrayList<Category> searchCategories(String searchName) {
        ArrayList<Category> searchResults = new ArrayList<>();
        getAllCategories();
        for (Category category : categoryList) {
            if(category.getNameCategory().equals(searchName) || category.getNameCategory().contains(searchName)){
                searchResults.add(category);
            }
        }

        return searchResults;
    }

    private void handleSQLException(SQLException e) {
        // Handle or log the exception
        e.printStackTrace();
    }

}
