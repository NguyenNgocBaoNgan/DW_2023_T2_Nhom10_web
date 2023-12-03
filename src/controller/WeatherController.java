package controller;

import Service.WeatherMartService;
import model.Weather_day_record;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WeatherController", value = "/WeatherController")
public class WeatherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Connect to the weather_mart database
        if (!WeatherMartService.isDatabaseConnected()) {
            response.getWriter().write("Database not connected");
            return;
        }

        // Step 2: Query data from the weather_mart database
        List<Weather_day_record> weatherDataList = WeatherMartService.getAllWeatherData();

        // Step 3: Close the database connection
        WeatherMartService.closeDatabaseConnection();

        // Step 4: Check if data is available
        if (weatherDataList.isEmpty()) {
            response.getWriter().write("No data found");
            return;
        }

        // Step 5: Set data list in request attribute
        request.setAttribute("weatherDataList", weatherDataList);

        // Step 6: Forward to the JSP page to display data
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
