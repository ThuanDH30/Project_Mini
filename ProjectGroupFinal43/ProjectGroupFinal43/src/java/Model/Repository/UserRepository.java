/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Repository;

import Model.Entity.Customer;

import java.sql.*;

import java.util.ArrayList;


/**
 * /**
 *
 * @author Bravo
 */
public class UserRepository implements Databaseinfo {

        ArrayList<Customer> customers = new ArrayList<>();
    
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

    public boolean addCustomer(Customer customer) {
        ArrayList<Customer> existingCustomers = getAllCustomers();
        
        int newId = 1;
        if (!existingCustomers.isEmpty()) {
            newId = existingCustomers.get(existingCustomers.size()).getIdCustomer();
        }
        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("INSERT INTO Customer (ID, Name, Email, Password, Sdt, Age, Address, CCCD, role_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            prsm.setInt(1, newId);
            prsm.setString(2, customer.getNameCustomer());
            prsm.setString(3, customer.getEmailCustomer());
            prsm.setString(4, customer.getPassWordCustomer());
            prsm.setString(5, customer.getNumPhoneCustomer());
            prsm.setInt(6, customer.getAgeCustomer());
            prsm.setString(7, customer.getAddressCustomer());
            prsm.setString(8, customer.getCccdCustomer());
            int role_ID = (customer.getRole_ID()==1 || customer.getRole_ID()==2) ? customer.getRole_ID(): 2;
            prsm.setInt(9, role_ID);
            int i =prsm.executeUpdate();
            con.close();
            return i>0;
        } catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }

    public ArrayList<Customer> getAllCustomers() {
        
        try (Connection con = getConnect()) {
            customers.clear();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM Customer");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setIdCustomer(resultSet.getInt("ID"));
                customer.setNameCustomer(resultSet.getString("Name"));
                customer.setEmailCustomer(resultSet.getString("Email"));
                customer.setPassWordCustomer(resultSet.getString("Password"));
                customer.setNumPhoneCustomer(resultSet.getString("Sdt"));
                customer.setAgeCustomer(resultSet.getInt("Age"));
                customer.setAddressCustomer(resultSet.getString("Address"));
                customer.setCccdCustomer(resultSet.getString("CCCD"));
                customers.add(customer);
            }
            con.close();
        } catch (Exception e) {
        }

        return customers;
    }

    public boolean updateCustomer(Customer customer){
 
        try (Connection con = getConnect()) {
            PreparedStatement preparedStatement = con.prepareStatement("UPDATE Customer SET Name=?, Email=?, Password=?, Sdt=?, Age=?, Address=?, CCCD=? WHERE ID=?");
            preparedStatement.setString(1, customer.getNameCustomer());
            preparedStatement.setString(2, customer.getEmailCustomer());
            preparedStatement.setString(3, customer.getPassWordCustomer());
            preparedStatement.setString(4, customer.getNumPhoneCustomer());
            preparedStatement.setInt(5, customer.getAgeCustomer());
            preparedStatement.setString(6, customer.getAddressCustomer());
            preparedStatement.setString(7, customer.getCccdCustomer());
            preparedStatement.setInt(8, customer.getIdCustomer());
            int i = preparedStatement.executeUpdate();
            con.close();
            return i >0;
        } catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteCustomer(int customerId){
        try (Connection con = getConnect()) {
            PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM Customer WHERE ID=?");
            preparedStatement.setInt(1, customerId);
            int i =preparedStatement.executeUpdate();
            con.close();
            return  i>0;
        }  catch(SQLException e){
            System.out.println(e);
        }
        return false;
        
    }

    public Customer getCustomerById(int id){

        try (Connection con = getConnect()) {
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM Customer WHERE ID = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Customer customer = new Customer();
                customer.setIdCustomer(resultSet.getInt("ID"));
                customer.setNameCustomer(resultSet.getString("Name"));
                customer.setEmailCustomer(resultSet.getString("Email"));
                customer.setPassWordCustomer(resultSet.getString("Password"));
                customer.setNumPhoneCustomer(resultSet.getString("Sdt"));
                customer.setAgeCustomer(resultSet.getInt("Age"));
                customer.setAddressCustomer(resultSet.getString("Address"));
                customer.setCccdCustomer(resultSet.getString("CCCD"));
                return customer;
            }
        }  catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }

}
