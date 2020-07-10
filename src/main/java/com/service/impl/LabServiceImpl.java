package com.service.impl;

import com.entity.Lab;
import com.service.LabService;
import com.util.DataSourceUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LabServiceImpl implements LabService {
    @Override
    public void addLab(int labId, String name, String context) {
        String sql ="insert into labs(labId,name,context) values(?,?,?)";
        try(Connection conn= DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql)){
            st.setInt(1,labId);
            st.setString(2,name);
            st.setString(3,context);
            st.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
        }
    }

    @Override
    public List<Lab> listLabs() {
        List<Lab> newsList = new ArrayList<>();
        Lab lab = null;
        String sql="select * from labs order by labId asc";
        try(Connection conn=DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery()){
            while (rs.next()){
                lab = new Lab(rs.getInt("labId"), rs.getString("name"),rs.getString("context"));
                newsList.add(lab);
            }
        }catch (SQLException se){
            se.printStackTrace();
        }
        return newsList;
    }

    @Override
    public Lab getLab(int labId) {
        Lab lab = null;
        String sql="select * from labs where labId = ?";
        try(Connection conn=DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql);
            ){
            st.setInt(1,labId);
            try(ResultSet rs = st.executeQuery()){
                while (rs.next()){
                    lab = new Lab(rs.getInt("labId"), rs.getString("name"),rs.getString("context"));
                }
            }
        }catch (SQLException se){
            se.printStackTrace();
        }
        return lab;
    }
}
