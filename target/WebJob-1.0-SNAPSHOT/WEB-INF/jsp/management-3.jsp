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
            width: 100%;
        }

        #nav2 a:hover {
            color: black;
        }

        input[type=checkbox] {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: #fff;
            border: 1px solid red;
            height: 21px;
            width: 51px;
            border-radius: 20px;
            outline: none;
            transition: all ease-in-out 300ms;
            -webkit-transition: all ease-in-out 300ms;
            -moz-transition: all ease-in-out 300ms;
            position: relative;
        }

        input[type=checkbox]::after {
            content: '';
            display: block;
            height: 15px;
            width: 15px;
            border: 1px solid white;
            background: red;
            border-radius: 12px;
            position: absolute;
            top: 1px;
            left: 2px;
            -webkit-transition: all ease-in-out 300ms;
            -moz-transition: all ease-in-out 300ms;
            transition: all ease-in-out 300ms;
        }

        input[type=checkbox]:checked {
            background: red;
        }

        input[type=checkbox]:checked::after {
            content: '';
            left: 30px;
            background: #fff;
            color: red;
        }
        .buttonBtn{
            width: 100%;
            text-align: center;
        }
    </style>
</head>

<script>
    $(document).ready(function () {
        $("#btnsm").click(function () {
            let text = document.getElementById("context").value;
            let str = text.replace(/\n/gi, "<br>");
            document.getElementById("context").value = str;
        })
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
    <div class="row">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="myModalLabel"><span class="label label-danger">警告</span></h2>
                    </div>
                    <div class="modal-body">
                        <h3><span class="label label-warning">公告已删除</span></h3>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-success" data-dismiss="modal" href="/management-3?page=1">关闭</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row navbar" style="" id="nav2">
        <ul class="nav nav-pills  nav-justified" style="background-color: rgb(51,51,51);">
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
                <li><a href="/controlpad">个人信息</a></li>
                <li class="active"><a href="/management-1">公告管理</a></li>
            </ul>
        </div>
        <div class="col-lg-8">
            <div>
                <ul class="nav nav-tabs nav-justified">
                    <li><a href="/management-1">公告发布</a></li>
                    <li><a href="/management-2?page=1">公告修改</a></li>
                    <li class="active"><a href="/management-3?page=1">公告删除</a></li>
                </ul>
            </div>
            <div>
                <div style="width: 100%;height: 35px;">
                    <button type="submit" class="btn btn-danger" form="deleteList" id="btnsm"
                            data-toggle="modal" data-target="#myModal" style="float: right;">删除
                    </button>
                </div>
                <form role="form" id="deleteList" action="/managementcontrol" method="post" target="frameName">
                    <input type="text" class="form-control" name="controlType" style="display: none" value="3">
                    <div class="form-group">
                    <ul class="nav nav-pills nav-stacked" style="padding: 0;margin: 0;border: 0;">
                        <c:forEach items="${newsList}" var="n" begin="${(page-1)*10}" end="${(page*10)-1}"
                                   varStatus="newsStatus">
                            <li style="height: 30px;"><input type="checkbox" class="form-control" value="${n.newsid}" name="deleteNewsId">
                                <label style="position: absolute;top: 0;left:52px;">${n.head}</label>
                            </li>
                            <c:set var="count" value="${newsStatus.count}"/>
                        </c:forEach>
                    </ul>
                    </div>
                </form>
            </div>
            <div class="buttonBtn">
                <ul class="pager">
                    <c:if test="${page>1}">
                        <li class="previous"><a href="/management-3?page=${page-1}">上一页</a></li>
                    </c:if>
                    <c:if test="${page==1}">
                        <li class="previous disabled"><a href="/management-3?page=${page}">上一页</a></li>
                    </c:if>
                    <c:if test="${count>=10}">
                        <li class="next"><a href="/management-3?page=${page+1}">下一页</a></li>
                    </c:if>
                    <c:if test="${count<10}">
                        <li class="next disabled"><a href="/management-3?page=${page}">下一页</a></li>
                    </c:if>
                </ul>
                <iframe src="" frameborder="0" name="frameName" style="display: none"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>
