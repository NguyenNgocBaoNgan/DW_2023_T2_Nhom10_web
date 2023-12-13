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
        //WeatherMartService.closeDatabaseConnection();

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
        // Thực hiện cập nhật dữ liệu AJAX ở đây
        if (!Weather_hour_record_Service.isDatabaseConnected()) {
            response.getWriter().write("Database not connected");
            return;
        }
        response.setContentType("text/plain");

        // Giả sử bạn có một phương thức để lấy dữ liệu đã cập nhật
        List<Weather_day_record> updatedWeatherDataList = null;
        try {
            updatedWeatherDataList = getUpdatedWeatherData();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Chuyển đổi dữ liệu đã cập nhật thành JSON
        String json = convertDataListToJson(updatedWeatherDataList);
        System.out.println(json);

        // Gửi phản hồi JSON trở lại cho máy khách
        response.getWriter().write(json);
    }

    private List<Weather_day_record> getUpdatedWeatherData() throws SQLException {
        // Thực hiện logic để lấy dữ liệu thời tiết đã cập nhật từ cơ sở dữ liệu
        // Bạn có thể tái sử dụng dịch vụ WeatherMartService hiện tại hoặc tạo một phương thức dịch vụ mới
        // Ví dụ:
        return WeatherMartService.getAllWeatherData();
    }

    private String convertDataListToJson(List<Weather_day_record> dataList) {
        // Thực hiện logic để chuyển đổi danh sách dữ liệu thành định dạng JSON
        // Bạn có thể sử dụng một thư viện JSON như Jackson hoặc Gson cho mục đích này
        // Ví dụ sử dụng Gson:
        Gson gson = new Gson();
        return gson.toJson(dataList);
    }
    }

