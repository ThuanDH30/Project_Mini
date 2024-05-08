/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.BoxProduct;

import Model.Repository.BoxProductRepository;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vietn
 */
public class BoxProductService implements IBoxProductService {

    BoxProductRepository boxProductRepository = new BoxProductRepository();
    ArrayList<BoxProduct> boxList = new ArrayList<>();

    @Override
    public ArrayList<BoxProduct> getAll() {
        this.boxList = boxProductRepository.getAll();
        return boxList;
    }

    @Override
    public ArrayList<BoxProduct> getBoxProductById(int id) {

        return boxProductRepository.getBoxProductById(id);

    }

    public BoxProduct getBoxProductByIDBox(int id) {
        getAll();
        for (BoxProduct boxProduct : boxList) {
            if (boxProduct.getIdBoxProduct() == id) {
                return boxProduct;
            }
        }
        return null;
    }

    @Override
    public boolean addNew(BoxProduct boxProduct) {
        if (boxProductRepository.addNew(boxProduct)) {
            return true;
        }
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int idBoxProduct) {
        try {
            if (boxProductRepository.delete(idBoxProduct)) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BoxProductService.class.getName()).log(Level.SEVERE, null, ex);
        }
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateCategory(BoxProduct boxProduct) {
        try {
            if (boxProductRepository.updateCategory(boxProduct)) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BoxProductService.class.getName()).log(Level.SEVERE, null, ex);
        }
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
