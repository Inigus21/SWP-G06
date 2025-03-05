package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    private static final String GOOGLE_CLIENT_ID = "426229865715-6j4c6434pinslumq0m1l8mqjkcf6i3fv.apps.googleusercontent.com"; // Replace with your Google Client ID

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    handleNormalLogin(request, response);
}
private void handleNormalLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");
            String prevPage = request.getParameter("prevPage");
            
            UserDAO userDAO = new UserDAO();
            User user = userDAO.login(email, password);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                if (remember != null) {
                    // Implement remember me functionality if needed
                }
                
                // Redirect to admin page if user is an admin (roleId = 2)
                if (user.getRoleId() == 2) {
                    response.sendRedirect(request.getContextPath() + "/admin");
                } else if (prevPage != null && !prevPage.isEmpty() && !prevPage.contains("/login") && !prevPage.contains("/register")) {
                    response.sendRedirect(prevPage);
                } else {
                    response.sendRedirect("home.jsp");
                }
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không đúng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình đăng nhập");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
} 