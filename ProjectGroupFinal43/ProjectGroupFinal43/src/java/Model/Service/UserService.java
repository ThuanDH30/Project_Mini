/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Customer;
import Model.Repository.UserRepository;

import java.util.List;

import java.sql.*;


/**
 *
 * @author Bravo
 */
public class UserService implements IUserService {

    UserRepository userDao = new UserRepository();

    @Override
    public void insert(Customer User) {
        userDao.addCustomer(User);
    }

    @Override
    public boolean edit(Customer newUser) {
        Customer oldUser = null;

       oldUser = userDao.getCustomerById(newUser.getIdCustomer());
            
     

        // Kiểm tra nếu người dùng cũ không tồn tại, bạn có thể xử lý tùy ý
        if (oldUser == null) {
            // Xử lý tùy ý khi người dùng cũ không tồn tại
            return false;
        }

        // Cập nhật thông tin của người dùng cũ bằng thông tin của người dùng mới
        oldUser = newUser;

        // Gọi phương thức update trong DAO để cập nhật thông tin của người dùng trong cơ sở dữ liệu
        return userDao.updateCustomer(oldUser);
    }

    @Override
    public boolean delete(int id) {
        return userDao.deleteCustomer(id);
    }

    @Override
    public Customer get(String username) {

        return null;

    }

    @Override
    public Customer get(int id) {
        return userDao.getCustomerById(id);
    }

    @Override
    public Customer login(String usernameInput, String passwordInput) {

        Customer user = null;
        try(Connection con = userDao.getConnect();) {
            
            PreparedStatement pre = con.prepareStatement("SELECT * FROM Customer WHERE Email = ? AND Password = ?");
            pre.setString(1, usernameInput);
            pre.setString(2, passwordInput);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("ID");
                String username = rs.getString("Name");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String SDT = rs.getString("Sdt");
                int age = rs.getInt("Age");
                String address = rs.getString("Address");
                String cccd = rs.getString("CCCD");
                int role = rs.getInt("role_ID");
                user = new Customer(id, username, email, password, SDT, age, address, cccd, role);
            
            }
            
            con.close();
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean register(String email, String password, String username) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Customer> getAll() {
        return userDao.getAllCustomers();
    }

    @Override
    public List<Customer> search(String keyword) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean checkExistEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean checkExistUsername(String username) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
