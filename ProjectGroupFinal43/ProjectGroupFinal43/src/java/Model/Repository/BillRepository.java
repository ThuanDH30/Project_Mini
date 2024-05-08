package Model.Repository;

import Model.Entity.Bill;
import java.sql.*;
import java.util.ArrayList;

public class BillRepository implements Databaseinfo {

    ArrayList<Bill> billList = new ArrayList<>();

    public BillRepository() {
    }

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

    public boolean insertBill(Bill Bill) {
        int newID = 1;
        ArrayList<Bill> Bills = getAllBill();
        if (getAllBill() != null || !getAllBill().isEmpty()) {
            newID = Bills.get(Bills.size() - 1).getIdBill() + 1;

            Bill.setIdBill(newID);
        }
        System.out.println(newID);
        try (Connection con = getConnection()) {
            PreparedStatement prsm = con.prepareStatement("INSERT INTO Bill (ID, IDCustomer, Date) VALUES (?, ?, ?)");
            prsm.setInt(1, Bill.getIdBill());
            prsm.setInt(2, Bill.getCustomer().getIdCustomer());
            int i = prsm.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

    public boolean deleteBill(int billId) {

        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("DELETE FROM Bill WHERE ID=?");
            st.setInt(1, billId);
            int i = st.executeUpdate();
            con.close();
            return i > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return false;
    }

    public Bill getBillById(int billId) {
        UserRepository u = new UserRepository();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("SELECT * FROM Bill WHERE ID=?");
            st.setInt(1, billId);
            Bill bill = null;
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    bill = new Bill(rs.getInt("ID"), u.getCustomerById(rs.getInt("IDCustomer")), rs.getString("Date"));
                }
            }
            con.close();
            return bill;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return null;
    }

    public ArrayList<Bill> getBillByIdCustomer(int customerId) {
        ArrayList<Bill> getList = new ArrayList<>();
        UserRepository u = new UserRepository();
        try (Connection con = getConnection()) {
            getList.clear();
            PreparedStatement st = con.prepareStatement("SELECT * FROM Bill WHERE IDCustomer=?");
            st.setInt(1, customerId);
            
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Bill bill = new Bill(rs.getInt("ID"), u.getCustomerById(rs.getInt("IDCustomer")), rs.getString("Date"));
                    getList.add(bill);
                }
            }
            con.close();
            return getList;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return null;
    }

    public ArrayList<Bill> getAllBill() {

        UserRepository u = new UserRepository();

        try (Connection con = getConnection()) {
            billList.clear();
            PreparedStatement st = con.prepareStatement("SELECT * FROM Bill");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                billList.add(new Bill(
                        rs.getInt("ID"),
                        u.getCustomerById(rs.getInt("IDCustomer")),
                        rs.getString("Date")
                ));
            }
            con.close();
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return billList;
    }

    private void handleSQLException(SQLException e) {
        // Handle or log the exception
        e.printStackTrace();
    }

   
}
