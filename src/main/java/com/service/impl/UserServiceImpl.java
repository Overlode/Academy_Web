package com.service.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.entity.User;
import com.service.UserService;
import com.util.DataSourceUtils;

import javax.sql.DataSource;

public class UserServiceImpl implements UserService {
    private static Logger logger = Logger.getLogger(UserServiceImpl.class.getName());

    @Override
    public User userLogin(String username, String pwd) {
        User user = null;
        String sql = "select * from user where username = ? and password = ?";
        try(Connection conn = DataSourceUtils.getConnection(); PreparedStatement st = conn.prepareStatement(sql)){
            st.setString(1, username);
            st.setString(2,pwd);
            try(ResultSet rs=st.executeQuery()){
                while (rs.next()){
                    user = new User(rs.getInt("id"),rs.getString("name"),rs.getString("username"),rs.getString("password"),rs.getInt("usertype"));
                }
            }
        }catch (SQLException se){
            se.printStackTrace();
        }
        return user;
    }
}
