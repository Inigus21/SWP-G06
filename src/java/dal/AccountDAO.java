/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.accesscontroll.Account;
import entity.accesscontroll.Feature;
import entity.accesscontroll.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguye
 */
public class AccountDAO extends GenericDAO<Account>{

    @Override
    public List<Account> findAll() {
        return queryGenericDAO(Account.class);
    }

    @Override
    public int insert(Account  t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<Role> getRoles(String gmail) {
        String sql = "SELECT r.RoleID, r.RoleName, f.FeatureID, f.FeatureName, f.url FROM [User] u \n"
                + "    INNER JOIN UserRole ur ON ur.UserName = u.UserName\n"
                + "    INNER JOIN [Role] r ON r.RoleID = ur.RoleID\n"
                + "    INNER JOIN RoleFeature rf ON r.RoleID = rf.RoleID\n"
                + "    INNER JOIN Feature f ON f.FeatureID = rf.FeatureID\n"
                + "WHERE u.UserName = ?\n"
                + "ORDER BY r.RoleID, f.FeatureID ASC";
        
        PreparedStatement stm = null;
        ArrayList<Role> roles = new ArrayList<>();
        try {
         stm = conn.prepareStatement(sql);
            stm.setString(1, gmail);
            ResultSet rs = stm.executeQuery();
            Role currentRole = new Role();
            currentRole.setId(-1);
            while(rs.next()) {
                int roleID = rs.getInt("RoleID");
                if(roleID != currentRole.getId()) {
                    currentRole = new Role();
                    currentRole.setId(roleID);
                    currentRole.setName(rs.getString("RoleName"));
                    roles.add(currentRole);
                }
                
                Feature feature = new Feature();
                feature.setId(rs.getInt("FeatureID"));
//                feature.setName(rs.getString("FeatureName"));
//                feature.setUrl(rs.getString("url"));
                currentRole.getFeatures().add(feature);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) stm.close();
              if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return roles;
    }
    public Account get(String username, String password) {
        String sql = "SELECT UserName FROM [User] \n"
                + "WHERE UserName = ? AND [password] = ?";
        PreparedStatement stm = null;
        Account user = null;
        try {
          stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new Account();
                user.setEmail(rs.getString("UserName"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) stm.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

    
}
