/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.BoxBill;
import Model.Repository.BoxBillRepository;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public class BoxBillService implements IBoxBillService {
    
    BoxBillRepository boxBillRepository = new  BoxBillRepository();
    ArrayList<BoxBill> boxBillList = new ArrayList<>();

    @Override
    public boolean insertBoxBill(BoxBill boxBill) {
        if(boxBillRepository.insertBoxBill(boxBill)){
            return true;
        }
        
        return false;
    }

    @Override
    public BoxBill getBoxBillByIdBill(int billId) {
        return boxBillRepository.getBoxBillByIdBill(billId);
    }

    @Override
    public ArrayList<BoxBill> getAllBoxBill() {
        this.boxBillList = boxBillRepository.getAllBoxBill();
        return boxBillList;
    }

}
