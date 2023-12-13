package model;
import java.sql.*;
import java.sql.Date;
import java.sql.Time;

public class Weather_hour_record {
        public int id;
        public String province;
        public Time time_record;
        public Time time_forcast;
        public Date date_record;
        public Date date_forcast;
        public int temperature;
        public int feel_like;
        public String description;
        public int humidity;
        public int cloud_cover;
        public int precipitation;
        public float accumulation;
        public String wind_direction;
        public int wind_speed;
        public int uv_index;

    public String getWind_direction() {
        return wind_direction;
    }

    public void setWind_direction(String wind_direction) {
        this.wind_direction = wind_direction;
    }

    public int getWind_speed() {
        return wind_speed;
    }

    public void setWind_speed(int wind_speed) {
        this.wind_speed = wind_speed;
    }

    public int getUv_index() {
        return uv_index;
    }

    public void setUv_index(int uv_index) {
        this.uv_index = uv_index;
    }

    public String is_available;
        public Time getTime_forcast() {
        return time_forcast;
    }

         public void setTime_forcast(Time time_forcast) {
        this.time_forcast = time_forcast;
    }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province;
        }

        public Time getTime_record() {
            return time_record;
        }

        public void setTime_record(Time time_record) {
            this.time_record = time_record;
        }

        public Date getDate_record() {
            return date_record;
        }

        public void setDate_record(Date date_record) {
            this.date_record = date_record;
        }

        public Date getDate_forcast() {
            return date_forcast;
        }

        public void setDate_forcast(Date date_forcast) {
            this.date_forcast = date_forcast;
        }

        public int getTemperature() {
            return temperature;
        }

        public void setTemperature(int temperature) {
            this.temperature = temperature;
        }

        public int getFeel_like() {
            return feel_like;
        }

        public void setFeel_like(int feel_like) {
            this.feel_like = feel_like;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public int getHumidity() {
            return humidity;
        }

        public void setHumidity(int humidity) {
            this.humidity = humidity;
        }

        public int getCloud_cover() {
            return cloud_cover;
        }

        public void setCloud_cover(int cloud_cover) {
            this.cloud_cover = cloud_cover;
        }

        public int getPrecipitation() {
            return precipitation;
        }

        public void setPrecipitation(int precipitation) {
            this.precipitation = precipitation;
        }

        public float getAccumulation() {
            return accumulation;
        }

        public void setAccumulation(float accumulation) {
            this.accumulation = accumulation;
        }

        public String getIs_available() {
            return is_available;
        }

        public void setIs_available(String is_available) {
            this.is_available = is_available;
        }

    public Weather_hour_record(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.province = resultSet.getString("province");
        this.time_record = resultSet.getTime("time_record");
        this.time_forcast = resultSet.getTime("time_forcast");
        this.date_record = resultSet.getDate("date_record");
        this.date_forcast = resultSet.getDate("date_forcast");
        this.temperature = resultSet.getInt("temperature");
        this.feel_like = resultSet.getInt("feel_like");
        this.description = resultSet.getString("description");
        this.humidity = resultSet.getInt("humidity");
        this.cloud_cover = resultSet.getInt("cloud_cover");
        this.precipitation = resultSet.getInt("precipitation");
        this.accumulation= resultSet.getFloat("accumulation");
        this.wind_direction = resultSet.getString("wind_direction");
        this.wind_speed = resultSet.getInt("wind_speed");
        this.uv_index = resultSet.getInt("uv_index");
        this.is_available = resultSet.getString("is_available");

    }


}

