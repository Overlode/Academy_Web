package com.util;

import javax.annotation.Resource;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.SQLException;

@WebListener
public class DataSourceUtils implements ServletContextListener {
    @Resource(name="jdbc/MySQL")
    private static DataSource ds;
    public static Connection getConnection() throws SQLException{
        return ds.getConnection();
    }
}
