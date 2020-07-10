package com.entity;

public class User {
    private int id;
    private String name;
    private String username;
    private String pwd;
    private int usertype;

    public User(int id, String name, String username, String pwd, int usertype) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.pwd = pwd;
        this.usertype = usertype;
    }

    public int getUsertype() {
        return usertype;
    }

    public void setUsertype(int usertype) {
        this.usertype = usertype;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
