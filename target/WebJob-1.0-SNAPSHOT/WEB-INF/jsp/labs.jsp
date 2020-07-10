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
    <title>${lab.name}</title>
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
        .buttonBtn{
            width: 100%;
            height: 25px;
            text-align: center;
        }
    </style>
</head>

<script>
    $(document).ready(function () {
        $("#btnsm").click(function () {
            let text = document.getElementById("context1").value;
            let str = text.replace(/\n/gi, "<br>");
            document.getElementById("context1").value = str;
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
                    <c:if test="${flgLogin==0}">
                        <li><a href="#" onclick="" class="logBtn" data-toggle="modal" data-target="#myModal"
                               style="color: white"><span
                                class="glyphicon glyphicon-log-in" style="color: white"></span> 登录</a></li>
                    </c:if>
                    <c:if test="${flgLogin==1}">
                        <li>
                            <a href="/logout" class="logBtn" style="color: white"><span
                                    class="glyphicon glyphicon-log-out" style="color: white"></span> 注销</a>
                        </li>
                        <li>
                            <a href="/controlpad" class="logBtn" style="color: white"><span
                                    class="glyphicon glyphicon-user" style="color: white"></span> 欢迎,${user.name}</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <div class="row">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" id="myModalLabel">用户登录</h3>
                        </div>
                        <div class="modal-body">
                            <form action="/login" method="post" id="loginForm">
                                用户名：<input type="text" name="username" class="form-control"><br>
                                密码：<input type="password" name="pwd" class="form-control"><br>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" form="loginForm" value="Submit">登录</button>
                        </div>
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
                <li class="active"><a href="/labs?lid=${l.labId}">专业实验室</a></li>
            </c:forEach>
            <li><a href="/controlpad">系统管理</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <ul class="nav nav-pills nav-stacked" style="padding: 0;margin: 0;border: 0;">
                <c:forEach items="${labsList}" var="l" varStatus="vs">
                    <c:if test="${lab.labId==l.labId}">
                        <li class="active"><a href="/labs?lid=${l.labId}">${l.name}</a></li>
                        <c:set var="page" value="${vs.count}"></c:set>
                        <c:set var="count" value="${vs.count}"></c:set>
                    </c:if>
                    <c:if test="${lab.labId!=l.labId}">
                        <li><a href="/labs?lid=${l.labId}">${l.name}</a></li>
                        <c:set var="count" value="${vs.count}"></c:set>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="col-lg-8">
            <div class="buttonBtn">
                <ul class="pager">
                    <c:if test="${page!=1}">
                        <c:forEach items="${labsList}" var="l" begin="${page-2}" end="${page-2}">
                            <li class="previous"><a href="/labs?lid=${l.labId}">&larr; 上一页</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page==1}">
                        <c:forEach items="${labsList}" var="l" begin="${page-1}" end="${page-1}">
                            <li class="previous disabled"><a href="/labs?lid=${l.labId}">&larr; 上一页</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page!=count}">
                        <c:forEach items="${labsList}" var="l" begin="${page}" end="${page}">
                            <li class="next"><a href="/labs?lid=${l.labId}" >下一页&rarr;</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page==count}">
                        <c:forEach items="${labsList}" var="l" begin="${page-1}" end="${page-1}">
                            <li class="next disabled"><a href="/labs?lid=${l.labId}">下一页&rarr;</a></li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
            <div>
                <h2>${lab.labId}${lab.name}</h2>
                <img src="/IMG/labs/${lab.labId}.jpg" style="width: 100%;border-radius: 5px;height: 300px;"><br>
                <p style="font-size: medium;text-indent: 2em;">
                    ${lab.context}
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
