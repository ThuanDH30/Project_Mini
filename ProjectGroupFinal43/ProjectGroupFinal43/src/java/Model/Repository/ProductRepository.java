package Model.Repository;

import Model.Entity.Product;

import java.sql.*;
import java.util.ArrayList;

public class ProductRepository implements Databaseinfo {

    CategoryRepository categoryRepository = new CategoryRepository();
    ArrayList<Product> productList = new ArrayList<>();

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

    public boolean insertProduct(Product product) {
        int newID = 1;
        ArrayList<Product> products = getAllProducts();
        if (getAllProducts() != null || !getAllProducts().isEmpty()) {
            newID = products.get(products.size() - 1).getId()+ 1;

            product.setId(newID);
        }
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("INSERT INTO Product (ID, Name, IDCategory, Price, XS, Detail, SL) VALUES (?, ?, ?, ?, ?, ?, ?)");
            st.setInt(1, product.getId());
            st.setString(2, product.getName());
            st.setInt(3, product.getCategory().getIdCategory());
            st.setDouble(4, product.getPrice());
            st.setString(5, product.getOrigin());
            st.setString(6, product.getDetail());
            st.setInt(7, product.getQuantity());
            int i = st.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

    public boolean updateProduct(Product product) {
        String sql = "UPDATE Product SET Name=?, IDCategory=?, Price=?, XS=?, Detail=?, SL=? WHERE ID=?";
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, product.getName());
            st.setInt(2, product.getCategory().getIdCategory());
            st.setDouble(3, product.getPrice());
            st.setString(4, product.getOrigin());
            st.setString(5, product.getDetail());
            st.setInt(6, product.getQuantity());
            st.setInt(7, product.getId());
            int i = st.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

    public boolean deleteProduct(int productId) {
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("DELETE FROM Product WHERE ID=?");
            st.setInt(1, productId);
            int i = st.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

    public Product getProductById(int productId) {
       
        getAllProducts();
        for (Product product : productList) {
            if(product.getId() == productId){
                return product;
            }
        }
        return  null;
    }

    public ArrayList<Product> getAllProducts() {

        try (Connection con = getConnect()) {
            productList.clear();
            PreparedStatement st = con.prepareStatement("SELECT * FROM Product");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                productList.add(new Product(
                        rs.getInt("ID"),
                        rs.getString("Name"),
                        categoryRepository.getCategoryById(rs.getInt("IDCategory")),
                        rs.getDouble("Price"),
                        rs.getString("XS"),
                        rs.getString("Detail"),
                        rs.getInt("SL")
                ));
            }
            con.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return productList;
    }

    public ArrayList<Product> performSearch(String condition) {
        ArrayList<Product> searchList = new ArrayList<>();
        getAllProducts();
        for (Product product : productList) {
            if (product.getName().toLowerCase().contains(condition.toLowerCase()) || condition.toLowerCase().equals(product.getName().toLowerCase()) || product.getOrigin().toLowerCase().contains(condition.toLowerCase()) || condition.toLowerCase().equals(product.getOrigin().toLowerCase()) || product.getCategory().getNameCategory().toLowerCase().contains(condition.toLowerCase()) || condition.toLowerCase().equals(product.getCategory().getNameCategory().toLowerCase())) {
                searchList.add(product);
            }
        }
        return searchList;
    }

    private void handleSQLException(SQLException e) {
        // Handle or log the exception
        e.printStackTrace();
    }

}
