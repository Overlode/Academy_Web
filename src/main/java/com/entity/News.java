package com.entity;

import java.util.Date;

public class News {
    private int newsid;
    private int userid;
    private String head;
    private String context;
    private Date date;

    public News(int newsid, int userid,String head, String context , Date date) {
        this.newsid = newsid;
        this.userid = userid;
        this.context = context;
        this.head = head;
        this.date = date;
    }

    public int getNewsid() {
        return newsid;
    }

    public void setNewsid(int newsid) {
        this.newsid = newsid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
