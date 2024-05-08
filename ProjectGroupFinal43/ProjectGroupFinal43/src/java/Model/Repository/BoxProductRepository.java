/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Repository;

import Model.Entity.BoxProduct;
import Model.Entity.GioHang;
import Model.Entity.Product;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Bravo
 */
public class BoxProductRepository implements Databaseinfo {

    ProductRepository pRepository = new ProductRepository();
    GioHangRepository gioHangRepository = new GioHangRepository();
    ArrayList<BoxProduct> boxProductList = new ArrayList<>();

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

    public ArrayList<BoxProduct> getAll() {

        boxProductList.clear();
        try (Connection con = getConnect()) {
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM BoxProduct");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idBoxProduct = rs.getInt("IDBoxProduct");
                int idGioHang = rs.getInt("IDGioHang");
                int idProduct = rs.getInt("IDProduct");
                int sl = rs.getInt("Sl");

                GioHang gh = gioHangRepository.getGioHangById(idGioHang);
                Product product = pRepository.getProductById(idProduct);

                BoxProduct boxProduct = new BoxProduct(idBoxProduct, gh, product, sl);
                boxProductList.add(boxProduct);
            }
            con.close();
            return boxProductList;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return boxProductList;
    }

    public ArrayList<BoxProduct> getBoxProductById(int id) {
        ArrayList<BoxProduct> boxProducts = new ArrayList<>();
        try {
            if (getAll() == null || getAll().isEmpty()) {
                return null;
            } else {
                
                for (BoxProduct boxProduct : boxProductList) {
                    if (boxProduct.getGioHang().getCustomer().getIdCustomer() == id) {
                        boxProducts.add(boxProduct);
                    }
                }
                return boxProducts;
            }
        } catch (Exception e) {
        }
        return boxProducts;
    }

   
    public boolean addNew(BoxProduct boxProduct) {
        int newId = 1;
        if (!(getAll().isEmpty() || getAll() == null)) {
            newId = getAll().get(getAll().size()-1).getIdBoxProduct() +1;
        }
        boxProduct.setIdBoxProduct(newId);

        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("INSERT INTO BoxProduct (IDBoxProduct, IDGioHang, IDProduct, Sl) VALUES (?, ?, ?, ?)");
            prsm.setInt(1, boxProduct.getIdBoxProduct());
            prsm.setInt(2, boxProduct.getGioHang().getIdGioHang());
            prsm.setInt(3, boxProduct.getProduct().getId());
            prsm.setInt(4, boxProduct.getSl());
            int result = prsm.executeUpdate();
            con.close();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean delete(int idBoxProduct) throws SQLException {

        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("DELETE FROM BoxProduct WHERE IDBoxProduct=?");
            prsm.setInt(1, idBoxProduct);
            int result = prsm.executeUpdate();
            con.close();
            return result > 0;

        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean updateCategory(BoxProduct boxProduct) throws SQLException {

        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("UPDATE BoxProduct SET IDGioHang=?, IDProduct=?, Sl =? WHERE IDBoxProduct=?");
            prsm.setInt(1, boxProduct.getGioHang().getIdGioHang());
            prsm.setInt(2, boxProduct.getProduct().getId());
            prsm.setInt(3, boxProduct.getSl());
            prsm.setInt(4, boxProduct.getIdBoxProduct());
            int i = prsm.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

}
