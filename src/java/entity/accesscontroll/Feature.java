/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontroll;

import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class Feature {
      private int id;
   
    private String feature_url;
    private ArrayList<Role> roles = new ArrayList<>();

    public Feature() {
    }

    public Feature(int id, String feature_url) {
        this.id = id;
        this.feature_url = feature_url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFeature_url() {
        return feature_url;
    }

    public void setFeature_url(String feature_url) {
        this.feature_url = feature_url;
    }

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }
    
}
