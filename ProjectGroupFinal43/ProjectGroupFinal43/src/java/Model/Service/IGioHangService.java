/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.GioHang;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public interface IGioHangService {
    public ArrayList<GioHang> getAll();
    public GioHang getGioHangById(int id);
    public boolean addNew(GioHang gioHang);
    public boolean delete(int idGioHang);
    
}
