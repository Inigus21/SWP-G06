/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;

import dal.AccountDAO;
import dal.AccountDAO;
import entity.accesscontroll.Feature;
import entity.accesscontroll.Role;
import entity.accesscontroll.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author sonnt-local
 */
public abstract class BaseRBACController extends BaseRequiredAuthenticationController {
    
    private boolean isAuthorized(HttpServletRequest req,Account account)
    {
        String current_url  = req.getServletPath();
        AccountDAO db = new AccountDAO();
        ArrayList<Role> roles = db.getRoles(account.getFullName());
        account.setRoles(roles);
        
        for (Role role : account.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if(feature.getFeature_url().equals(current_url))
                    return true;
            }
        }
        
        return false;
    }
    
     protected abstract void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;
     protected abstract void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        if(isAuthorized(req, account))
        {
            doAuthorizedGet(req, resp, account);
        }
        else
            resp.sendError(403, "You do not have right to access this feature!");
    
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
    if(isAuthorized(req, account))
        {
            doAuthorizedPost(req, resp, account);
        }
        else
            resp.sendError(403, "You do not have right to access this feature!");
    }
    
}
