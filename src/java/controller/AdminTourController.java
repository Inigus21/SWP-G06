package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.TourDAO;
import dao.TourImageDAO;
import dao.TripDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.City;
import model.Tour;
import model.TourImage;
import model.TourSchedule;
import model.Trip;
import model.User;

@WebServlet(name = "AdminTourController", urlPatterns = {"/admin/tours/*"})
public class AdminTourController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        // Check if user is logged in and is admin (roleId = 2)
        if (user == null || user.getRoleId() != 2) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        String pathInfo = request.getPathInfo();
        if (pathInfo == null) {
            pathInfo = "/";
        }
        
        String action = pathInfo.substring(1);
        if (action.isEmpty()) {
            action = "list";
        }
        
        switch (action) {
            case "list":
                listTours(request, response);
                break;
            case "view":
                viewTour(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteTour(request, response);
                break;
            case "trips":
                viewTourTrips(request, response);
                break;
            case "schedules":
                viewTourSchedules(request, response);
                break;
            default:
                listTours(request, response);
        }
    }
