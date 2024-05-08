
package Model.Repository;


import Model.Entity.Customer;
import Model.Entity.GioHang;


import java.sql.*;
import java.util.ArrayList;


/**
 *
 * @author vietn
 */
public class GioHangRepository implements Databaseinfo{
    ArrayList<GioHang> gList = new ArrayList<>();
    UserRepository udao = new UserRepository();
    
    
    public Connection getConnect(){
        try{ 
            Class.forName(DRIVERNAME); 
	} catch(ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
	}
        try{            
            Connection con = DriverManager.getConnection(DBURL,USERDB,PASSDB);
            return con;
        }
        catch(SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
     
    public ArrayList<GioHang> getAll(){   
        try (Connection con = getConnect()) {
            gList.clear();
            PreparedStatement st = con.prepareStatement("SELECT * FROM GioHang");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idGioHang = rs.getInt("ID");
                int idCustomer = rs.getInt("IDCustomer");
                Customer cus = udao.getCustomerById(idCustomer);
                GioHang gioHang = new GioHang(idGioHang, cus);
                gList.add(gioHang);
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return gList;    
    }
     
    public GioHang getGioHangById(int id){   
        try {
            if(getAll() == null || getAll().isEmpty()){
                return null;
            } else{
                for (GioHang gioHang : gList) {
                    if(gioHang.getIdGioHang() == id){
                       return gioHang;
                    }
                }
            }
        } catch (Exception e) {
        }
       return null;
    }   
    
    public boolean addNew(GioHang gioHang){
        
        int newId = 1;
        if (!(getAll().isEmpty() || getAll() == null)) {
            newId = getAll().get(getAll().size()).getIdGioHang()+1;
        }
        gioHang.setIdGioHang(newId);
        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("INSERT INTO GioHang (ID, IDGioHang) VALUES (?, ?)");
            prsm.setInt(1, gioHang.getIdGioHang());
            prsm.setInt(2, gioHang.getCustomer().getIdCustomer());
            int result = prsm.executeUpdate();
            con.close();
            return result>0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    public boolean delete(int idGioHang){
        
        try (Connection con = getConnect()) {
            PreparedStatement prsm = con.prepareStatement("DELETE FROM GioHang WHERE ID=?");
            prsm.setInt(1, idGioHang);
            int result = prsm.executeUpdate();
            con.close();
            return result>0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return false;
    }
}
