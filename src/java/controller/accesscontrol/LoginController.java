/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;

import dal.AccountDAO;
import entity.accesscontroll.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author sonng
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("gmail");
        String pass = req.getParameter("password");

        AccountDAO db = new AccountDAO();
        Account account = db.get(user, pass);

        if (account != null) {
            req.getSession().setAttribute("account", account);
            resp.sendRedirect("/home");
        } else {
            // Đăng nhập thất bại, thêm tham số lỗi vào URL
            resp.sendRedirect("login.html?error=1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //pre-processing
        req.getRequestDispatcher("login.html").forward(req, resp);
        //post-processing
    }

}
