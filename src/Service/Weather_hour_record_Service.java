package Service;

import model.Weather_hour_record;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Weather_hour_record_Service {
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
//    public static List<Weather_hour_record> getAllWeatherData() {
//        List<Weather_hour_record> weatherData_hour_List = new ArrayList<Weather_hour_record>();
//
//        try {
//            String query = "SELECT * FROM weather_hour_records";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            ResultSet resultSet = preparedStatement.executeQuery();
//
//            while (resultSet.next()) {
//                Weather_hour_record weatherData_hour = new Weather_hour_record();
//                weatherData_hour.setId(resultSet.getInt("id"));
//                weatherData_hour.setProvince(resultSet.getString("province"));
//                weatherData_hour.setTime_record(resultSet.getTime("time_record"));
//                weatherData_hour.setDate_record(resultSet.getDate("date_record"));
//                weatherData_hour.setDate_forcast(resultSet.getDate("date_forcast"));
//                weatherData_hour.setTemperature(resultSet.getInt("temperature"));
//                weatherData_hour.setFeel_like(resultSet.getInt("feel_like"));
//                weatherData_hour.setDescription(resultSet.getString("description"));
//                weatherData_hour.setHumidity(resultSet.getInt("humidity"));
//                weatherData_hour.setCloud_cover(resultSet.getInt("cloud_cover"));
//                weatherData_hour.setPrecipitation(resultSet.getInt("precipitation"));
//                weatherData_hour.setAccumulation(resultSet.getFloat("accumulation"));
//                weatherData_hour.setIs_vailable("is_vailable");
//                // Set other attributes as needed
//                weatherData_hour_List.add(weatherData_hour);
//            }
//
//            // Close resources
//            resultSet.close();
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return weatherData_hour_List;
//    }
    public static Weather_hour_record getWeatherhourById(int id) throws SQLException {
        Weather_hour_record weatherHourRecord = null;
        String query = "SELECT * FROM weather_hour_records WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);

            // Step 3: Execute the query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // Step 4: Process the result set
                if (resultSet.next()) {
                    // Assuming WeatherHourRecord has a constructor that takes a ResultSet
                    weatherHourRecord = new Weather_hour_record(resultSet);
                }
            }


        // Step 5: Close the database connection
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

        return weatherHourRecord;

    }
}
