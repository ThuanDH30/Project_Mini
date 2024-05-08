/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.GioHang;
import Model.Repository.GioHangRepository;
import Model.Repository.UserRepository;
import java.sql.SQLException;


import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vietn
 */
public class GioHangService implements IGioHangService{

    GioHangRepository gioHangRepo = new GioHangRepository();
    ArrayList<GioHang> ghList = new ArrayList<>();
    UserRepository user = new UserRepository();
    
    @Override
    public ArrayList<GioHang> getAll() {
        ghList = gioHangRepo.getAll();
        return ghList;
        
    }

    public GioHang getGioHangByIdCus(int id) {
        getAll();
        for (GioHang gioHang : ghList) {
            if(gioHang.getCustomer().getIdCustomer()== id){
                return gioHang;
            }
        }
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public GioHang getGioHangById(int id) {
        getAll();
        for (GioHang gioHang : ghList) {
            if(gioHang.getIdGioHang() == id){
                return gioHangRepo.getGioHangById(id);
            }
        }
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean addNew(GioHang gioHang) {
        getAll();
        if((getGioHangById(gioHang.getIdGioHang())== null) && user.getCustomerById(gioHang.getCustomer().getIdCustomer()) != null ){
            if(gioHangRepo.addNew(gioHang)){
                return  true;
            }
        }
       return false;
    }

    @Override
    public boolean delete(int idGioHang) {
        if(gioHangRepo.delete(idGioHang)){
            return true;
        }
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    
}
