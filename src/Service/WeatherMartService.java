package Service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Weather_day_record;

import java.util.ArrayList;
import java.util.List;
public class WeatherMartService {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/weather_mart";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static Connection connection;

    // Method to check database connection
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static boolean isDatabaseConnected() {
        try {
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to close database connection
    public static void closeDatabaseConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get all weather data from the database
    public static List<Weather_day_record> getAllWeatherData() {
        List<Weather_day_record> weatherDataList = new ArrayList<Weather_day_record>();

        try {
            String query = "SELECT * FROM weather_day_records WHERE is_vailable= 'TRUE' AND date_forcast >= NOW()";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Weather_day_record weatherData = new Weather_day_record();
                weatherData.setId(resultSet.getInt("id"));
                weatherData.setProvince(resultSet.getString("province"));
                weatherData.setTime_record(resultSet.getTime("time_record"));
                weatherData.setDate_record(resultSet.getDate("date_record"));
                weatherData.setDate_forcast(resultSet.getDate("date_forcast"));
                weatherData.setTemperature(resultSet.getInt("temperature"));
                weatherData.setFeel_like(resultSet.getInt("feel_like"));
                weatherData.setDescription(resultSet.getString("description"));
                weatherData.setHumidity(resultSet.getInt("humidity"));
                weatherData.setCloud_cover(resultSet.getInt("cloud_cover"));
                weatherData.setPrecipitation(resultSet.getInt("precipitation"));
                weatherData.setAccumulation(resultSet.getFloat("accumulation"));
                weatherData.setIs_available("is_available");
                // Set other attributes as needed
                weatherDataList.add(weatherData);
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return weatherDataList;
    }
}
