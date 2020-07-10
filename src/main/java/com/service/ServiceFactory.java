
package com.service;

import com.service.impl.LabServiceImpl;
import com.service.impl.NewsServiceImpl;
import com.service.impl.UserServiceImpl;

public class ServiceFactory {
    private static final UserService userService = uCreate();
    private static final NewsService newsService = nCreate();
    private static final LabService labService = lCreate();

    private static UserService uCreate() {
        return new UserServiceImpl();
    }

    private static NewsService nCreate() {
        return new NewsServiceImpl();
    }

    private static LabService lCreate() {
        return new LabServiceImpl();
    }

    public static NewsService getNewsService(){
        return newsService;
    }
    public static UserService getUserService() {
        return userService;
    }

    public static LabService getLabService() {
        return labService;
    }
}