package com.service;

import com.entity.Lab;

import java.util.List;

public interface LabService {
    public void addLab(int labId,String name,String context);
    public List<Lab> listLabs();
    public Lab getLab(int labId);
}
