/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.BoxBill;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public interface IBoxBillService {

    public boolean insertBoxBill(BoxBill boxBill);

    public BoxBill getBoxBillByIdBill(int billId);

    public ArrayList<BoxBill> getAllBoxBill();
}
