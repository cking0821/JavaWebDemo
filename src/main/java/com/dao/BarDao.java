package com.dao;

import com.bean.Bar;

import java.sql.*;
import java.util.ArrayList;

public class BarDao {
    public static String driver ="com.mysql.jdbc.Driver";
    public static String url = "jdbc:mysql://192.168.211.3:3306" +
            "/mydatabase?useUnicode=true&characterEncoding=utf-8&useSSL=true";
    public static String user ="root";
    public static String password ="root";
    public static String sql = "select * from mydatabase.bar";

    public ArrayList<Bar> query() {
        ArrayList<Bar> bars = new ArrayList<Bar>();
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, user, password);
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            Bar bar;
            while (rs.next()) {
                bar = new Bar();
                System.out.println(rs.getString("name"));
                System.out.println(rs.getInt("num"));
                bar.setName(rs.getString(1));
                bar.setNum(rs.getInt(2));
                bars.add(bar);
            }
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bars;
    }
}
