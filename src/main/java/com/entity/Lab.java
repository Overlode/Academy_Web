package com.entity;

public class Lab {
    private String name;
    private String context;
    private int labId;

    public Lab(int labId, String name, String context) {
        this.name = name;
        this.context = context;
        this.labId = labId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public int getLabId() {
        return labId;
    }

    public void setLabId(int labId) {
        this.labId = labId;
    }
}
