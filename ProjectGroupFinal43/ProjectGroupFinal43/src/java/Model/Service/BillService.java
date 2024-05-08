/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.Bill;
import Model.Repository.BillRepository;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public class BillService implements IBillService{
    BillRepository billRepository = new BillRepository();
    ArrayList<Bill> billList = new ArrayList<>();
    
    @Override
    public boolean insertBill(Bill Bill) {
       if(billRepository.insertBill(Bill)){
           return true;
       }
       
       return false;
    }

    @Override
    public boolean deleteBill(int billId) {
        if(billRepository.deleteBill(billId)){
            return true;
        }
        return false;
    }

    @Override
    public Bill getBillById(int billId) {
       return billRepository.getBillById(billId);
    }

    @Override
    public ArrayList<Bill> getBillByIdCustomer(int customerId) {
         return billRepository.getBillByIdCustomer(customerId);
    }

    @Override
    public ArrayList<Bill> getAllBill() {
        this.billList = billRepository.getAllBill();
        return billList;
    }
    
}
