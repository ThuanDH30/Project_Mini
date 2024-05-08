/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Bill;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public interface IBillService {

    public boolean insertBill(Bill Bill);

    public boolean deleteBill(int billId);

    public Bill getBillById(int billId);
    
    public ArrayList<Bill> getBillByIdCustomer(int customerId);
    
    public ArrayList<Bill> getAllBill();
    
}
