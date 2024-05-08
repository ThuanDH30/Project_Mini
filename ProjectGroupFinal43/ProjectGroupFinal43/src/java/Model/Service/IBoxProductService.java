/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Service;

import Model.Entity.BoxProduct;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public interface IBoxProductService {
    public ArrayList<BoxProduct> getAll();
    public ArrayList<BoxProduct> getBoxProductById(int id);
    public boolean addNew(BoxProduct boxProduct);
    public boolean delete(int idBoxProduct);
    public boolean updateCategory(BoxProduct boxProduct);
}
