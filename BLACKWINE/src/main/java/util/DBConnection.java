package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/helpdesk";
    private static final String USER = "root";
    private static final String PASSWORD = "1234"; // change if needed

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ensure DB exists
            Connection tempCon = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/", "root", "1234"
            );
            tempCon.createStatement()
                   .executeUpdate("CREATE DATABASE IF NOT EXISTS BLACKWINE");

            // now connect to BLACKWINE DB
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/BLACKWINE", "root", "1234"
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
