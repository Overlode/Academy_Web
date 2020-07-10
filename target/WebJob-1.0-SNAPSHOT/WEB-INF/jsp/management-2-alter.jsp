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
    </style>
</head>

<script>
    $(document).ready(function () {
        $("#context").click(function () {
            let text = document.getElementById("context").value;
            let str = text.replace(/<br>/gi, "\n");
            document.getElementById("context").value = str;
        })
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
                        <h3 class="modal-title" id="myModalLabel">修改成功</h3>
                    </div>
                    <div class="modal-body">
                        <span>公告已修改</span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
                    <li class="active"><a href="/management-2?page=1">公告修改</a></li>
                    <li><a href="/management-3?page=1">公告删除</a></li>
                </ul>
            </div>
            <div>
                <form role="form" id="newContext" action="/managementcontrol" method="post"  target="frameName">
                    <input type="text" class="form-control" name="controlType" style="display: none" value="2">
                    <div class="form-group">
                        <label>标题</label>
                        <input type="text" class="form-control" placeholder="标题" name="headline" value="${news.head}">
                    </div>
                    <div class="form-group">
                        <label>详细内容</label>
                        <textarea class="form-control" rows="10" name="context" id="context">${news.context}</textarea>
                    </div>
                </form>
                <button type="submit" class="btn btn-primary btn-lg btn-block" form="newContext" id="btnsm"
                        data-toggle="modal" data-target="#myModal">发布
                </button>
                <button type="reset" class="btn btn-warning btn-lg btn-block" form="newContext">重置</button>
                <br>
                <iframe src="" frameborder="0" name="frameName" style="display: none"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>
