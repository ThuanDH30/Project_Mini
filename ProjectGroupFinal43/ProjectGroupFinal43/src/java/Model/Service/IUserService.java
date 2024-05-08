/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Customer;
import java.util.List;

/**
 *
 * @author Bravo
 */
public interface IUserService {

    void insert(Customer user);

    boolean edit(Customer user);

    boolean delete(int id);

    Customer get(String username);

    Customer get(int id);

    Customer login(String username, String password);

    boolean register(String email, String password, String username);

    List<Customer> getAll();

    List<Customer> search(String keyword);

    boolean checkExistEmail(String email);

    boolean checkExistUsername(String username);
}
