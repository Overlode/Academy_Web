<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/8
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ControlPad</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .row {
            margin: 0;
            padding: 0;
            border: 0;
        }

        .logBtn {
            opacity: 0.7;
        }

        .logBtn:hover {
            opacity: 1;
        }

        .container {
            padding-left: 0;
            padding-right: 0;
        }

        #nav2 ul a {
            color: white;
            width : 100%;
        }
        #nav2 ul a:hover {
            color: black;
        }
    </style>
</head>

<script>
    $(document).ready(function () {
    })
</script>
<body>
<div class="container">
    <div class="row navbar" style="width: 100%;">
        <nav class="navbar navbar-default"
             style="padding: 0;margin: 0;border : 0;border-radius:0;background-color: rgb(68,68,68);">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/index" style="color: white">东北林业大学软件工程</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/logout" class="logBtn" style="color: white"><span
                                class="glyphicon glyphicon-log-out" style="color: white"></span> 注销</a>
                    </li>
                    <li>
                        <a href="/controlpad" class="logBtn" style="color: white"><span
                                class="glyphicon glyphicon-user" style="color: white"></span> 欢迎,${user.name}</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="row navbar" style="" id="nav2">
        <ul class="nav nav-pills  nav-justified" style="background-color: rgb(51,51,51);" >
            <li><a href="/index">主页</a></li>
            <c:forEach items="${newsList}" var="n" begin="0" end="0">
                <li><a href="/news?nid=${n.newsid}">新闻中心</a></li>
            </c:forEach>
            <li><a href="/teachers">教师队伍</a></li>
            <li><a href="/intro">专业介绍</a></li>
            <c:forEach items="${labsList}" var="l" begin="0" end="0">
                <li><a href="/labs?lid=${l.labId}">专业实验室</a></li>
            </c:forEach>
            <li class="active"><a href="/controlpad">系统管理</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="/controlpad">个人信息</a></li>
                <li><a href="/management-1">公告管理</a></li>
            </ul>
        </div>
        <div class="col-lg-8">
                <ul class="list-group">
                    <li class="list-group-item">用户名：${user.username}</li>
                    <li class="list-group-item">昵称：${user.name}</li>
                    <c:if test="${user.usertype==2}">
                        <li class="list-group-item">用户权限:管理员</li>
                    </c:if>
                    <c:if test="${user.usertype==1}">
                        <li class="list-group-item">用户权限:一般用户</li>
                    </c:if>
                </ul>
        </div>
    </div>
</div>
</body>
</html>
