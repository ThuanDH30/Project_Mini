/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Repository;





import Model.Entity.BoxBill;
import static Model.Repository.Databaseinfo.DBURL;
import static Model.Repository.Databaseinfo.DRIVERNAME;
import static Model.Repository.Databaseinfo.PASSDB;
import static Model.Repository.Databaseinfo.USERDB;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author MINH NHAT
 */
public class BoxBillRepository implements Databaseinfo {

   ArrayList<BoxBill> boxBillList = new ArrayList<>();

   
    public Connection getConnection() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
        try {
            Connection connection = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return connection;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean insertBoxBill(BoxBill boxBill) {
        int newID = 1;
        ArrayList<BoxBill> BoxBills = getAllBoxBill();
        if (getAllBoxBill() != null || !getAllBoxBill().isEmpty()) {
            newID = BoxBills.get(BoxBills.size() - 1).getIdBoxBill() + 1;

            boxBill.setIdBoxBill(newID);
        }
        System.out.println(newID);
        try (Connection con = getConnection()) {
            PreparedStatement prsm = con.prepareStatement("INSERT INTO BoxBill (ID, IDBill, IDProduct, Sl, Total) VALUES (?, ?, ?, ?, ?)");
            prsm.setInt(1, boxBill.getIdBoxBill());
            prsm.setInt(2, boxBill.getBill().getIdBill());
            prsm.setInt(2, boxBill.getProduct().getId());
            prsm.setInt(2, boxBill.getAmountBoxBill());
            prsm.setDouble(2, boxBill.getTotal());
            int i = prsm.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

    

   

    public BoxBill getBoxBillByIdBill(int billId) {
         BillRepository b = new BillRepository();
        ProductRepository p = new ProductRepository();
        
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("SELECT * FROM BoxBill WHERE IDBill=?");
            st.setInt(1, billId);
            BoxBill boxBill = null;
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    boxBill =(new BoxBill(
                        rs.getInt("ID"),
                        b.getBillById(rs.getInt("IDBill")),
                        p.getProductById(rs.getInt("IDProduct")),
                        rs.getInt("Sl"),
                        rs.getDouble("Total")
                ));
                }
            }
            con.close();
            return boxBill;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return null;
    }

    public ArrayList<BoxBill> getAllBoxBill() {

        BillRepository b = new BillRepository();
        ProductRepository p = new ProductRepository();
        try (Connection con = getConnection()) {
            boxBillList.clear();
            PreparedStatement st = con.prepareStatement("SELECT * FROM BoxBill");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                boxBillList.add(new BoxBill(
                        rs.getInt("ID"),
                        b.getBillById(rs.getInt("IDBill")),
                        p.getProductById(rs.getInt("IDProduct")),
                        rs.getInt("Sl"),
                        rs.getDouble("Total")
                ));
            }
            con.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return boxBillList;
    }

    private void handleSQLException(SQLException e) {
        // Handle or log the exception
        e.printStackTrace();
    }

    
}
