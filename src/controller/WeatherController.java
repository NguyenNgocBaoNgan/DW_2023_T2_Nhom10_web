package controller;

import Service.WeatherMartService;
import Service.Weather_hour_record_Service;
import model.Weather_day_record;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import model.Weather_hour_record;

@WebServlet(name = "WeatherController", value = "/WeatherController")
public class WeatherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Connect to the weather_mart database
        if (!WeatherMartService.isDatabaseConnected()) {
            response.getWriter().write("Database not connected");
            return;
        }

        if (!Weather_hour_record_Service.isDatabaseConnected()) {
            response.getWriter().write("Database not connected");
            return;
        }

        // Step 2: Query data from the weather_mart database
        String province = request.getParameter("province");

       // System.out.println(actualID);

        List<Weather_hour_record> whr_byProvince = null;
        List<Weather_day_record> weatherDataList = WeatherMartService.getAllWeatherData();
        whr_byProvince = Weather_hour_record_Service.getWeatherhourByProvince(province);

        // Step 4: Check if data is available
        if (weatherDataList.isEmpty()) {
            response.getWriter().write("No data found");
            return;
        }

        // Step 5: Set data list in request attribute
        request.setAttribute("weatherDataList", weatherDataList);
        request.setAttribute("whr_byProvince",whr_byProvince);


        // Step 6: Forward to the JSP page to display data
        request.getRequestDispatcher("index.jsp").forward(request, response);

        //Step 3: Close the database connection
        //WeatherMartService.closeDatabaseConnection();
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thực hiện cập nhật dữ liệu AJAX ở đây
        if (!Weather_hour_record_Service.isDatabaseConnected()) {
            response.getWriter().write("Database not connected");
            return;
        }
        response.setContentType("text/plain");

        String province = request.getParameter("province");
        System.out.println(province);
        //  phương thức để lấy dữ liệu đã cập nhật
        List<Weather_hour_record> updatedWeatherDataList = null;
        try {
            updatedWeatherDataList = getUpdatedWeatherData(province);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        // Chuyển đổi dữ liệu đã cập nhật thành JSON
        String json = convertDataListToJson(updatedWeatherDataList);
        System.out.println(json);

        // Gửi phản hồi JSON trở lại cho máy khách
        response.getWriter().write(json);

        // Close the database connection
        //WeatherMartService.closeDatabaseConnection();
    }

    private List<Weather_hour_record> getUpdatedWeatherData(String province) throws SQLException {
        // Thực hiện logic để lấy dữ liệu thời tiết đã cập nhật từ cơ sở dữ liệu

        return Weather_hour_record_Service.getWeatherhourByProvince(province);
    }

    private String convertDataListToJson(List<Weather_hour_record> dataList) {
        // Thực hiện logic để chuyển đổi danh sách dữ liệu thành định dạng JSON

        Gson gson = new Gson();
        return gson.toJson(dataList);
    }
    }

