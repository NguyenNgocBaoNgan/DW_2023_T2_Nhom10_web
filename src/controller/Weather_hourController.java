package controller;

import Service.WeatherMartService;
import Service.Weather_hour_record_Service;
import model.Weather_hour_record;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Weather_hourController", value = "/detail")
public class Weather_hourController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Connect to the weather_mart database
        if (!Weather_hour_record_Service.isDatabaseConnected()) {
            response.getWriter().write("Database not connected");
            return;
        }
        // Step 2: Query data from the weather_mart database

        String id = request.getParameter("id");
        int actualID = Integer.parseInt(id);
        System.out.println(actualID);
        Weather_hour_record whr = null;
        try {
            whr = Weather_hour_record_Service.getWeatherhourById(actualID);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Step 3: Close the database connection
        Weather_hour_record_Service.closeDatabaseConnection();
//        List<Review> reviewList = ReviewService.getAllReviewByIdp(String.valueOf(product.getId()));
//        request.setAttribute("reviewList", reviewList);
        request.setAttribute("whr", whr);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
