package model;
import java.sql.*;
public class Weather_day_record {
    public int id;
    public String province;
    public Time time_record;
    public Date date_record;
    public Date date_forcast;
    public int temperature;
    public int feel_like;
    public String description;
    public int humidity;
    public int cloud_cover;
    public int precipitation;
    public float accumulation;
    public String is_available;

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
}
