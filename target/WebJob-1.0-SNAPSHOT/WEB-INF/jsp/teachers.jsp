<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/8
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teachers</title>
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

        #nav1 ul a {
            color: white;
            transition: opacity 0.5s;
        }

        #nav2 ul a {
            color: white;
            width : 100%;
        }
        #nav2 ul a:hover {
            color: black;
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

        #nav2 .active {
            border-radius: 0;
        }
        .listT img{
            width:175px;
            height:200px;
            border-radius:50%;
            overflow:hidden;
        }
        .teacherBox:hover{
            background-color: rgb(51,122,183);
            color:white;
        }
    </style>
</head>

<script>
    $(document).ready(function () {
        $(".teacherBox").click(function () {
            $(".context").hide().eq($(".teacherBox").index(this)).show();
        })
    });
</script>
<body>
<div class="container">
    <div class="row" style="width: 100%;" id="nav1">
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
    <div class="row" id="nav2">
        <ul class="nav nav-pills  nav-justified" style="background-color: rgb(51,51,51);">
            <li><a href="/index">主页</a></li>
            <c:forEach items="${newsList}" var="n" begin="0" end="0">
                <li><a href="/news?nid=${n.newsid}">新闻中心</a></li>
            </c:forEach>
            <li class="active"><a href="/teachers">教师队伍</a></li>
            <li><a href="/intro">专业介绍</a></li>
            <c:forEach items="${labsList}" var="l" begin="0" end="0">
                <li><a href="/labs?lid=${l.labId}">专业实验室</a></li>
            </c:forEach>
            <li><a href="/controlpad">系统管理</a></li>
        </ul>
    </div>
    <div class="row listT">
        <h1>教师队伍<small>Teaching staff</small></h1>
    </div>
    <div class="row listT">
        <h2>教授<small>Professor</small></h2>
        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/sujianmin.jpg" style="text-align: center">
                <h3>苏建民</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    苏健民，教授，硕士，硕士生导师，软件工程一级学科带头人，省计算机学会嵌入式专委会委员。主要研究方向：自动控制、信号与信息处理。主持或参加科研、教学项目11项，科研与教学获奖11项，出版教材2部，发表论文32篇。
                </p><br>
                <p style="font-size: medium">
                    E-mail:1216649568@qq.com
                </p><br>
            </div>
        </div>
    </div>
    <div class="row listT">
        <h2>副教授<small>associate professor</small></h2>
        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/luosiqin.png" style="text-align: center">
                <h3>罗嗣卿</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    罗嗣卿，硕士，副教授，硕士生导师。主要研究方向：信息系统析与设计、图像处理、软件服务与应用。主持和参加省攻关重点、省自然基金、国家林业公益性行业专项、省教改项目15项，发表论文20余篇，教材3部。
                </p><br>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/lili.jpg" style="text-align: center">
                <h3>李莉</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    李莉，博士，副教授，软件工程专业主任，专业教工党支部书记，硕士生导师。主要研究方向：先进软件工程技术、群智能优化、大型分布式计算。在国内外核心期刊及国际学术会议上发表学术论文 10余篇，编写教材3部。
                </p><br>
                <p style="font-size: medium;">
                    邮箱：lli@nefu.edu.cn
                </p><br>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/liudan.jpg" style="text-align: center">
                <h3>刘丹</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    刘丹，副教授，博士，硕士生导师，软件工程专业副主任。主要研究方向：无线传感器网络相关技术、数据仓库，数据挖掘。主持或参与科技部支撑计划项目、省自然科学基金项目、省科技攻关项目、哈尔滨科技局等项目。
                </p><br>
            </div>
        </div>
    </div>
    <div class="row listT">
        <h2>讲师<small>lecturer</small></h2>
        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/wangbo.jpg" style="text-align: center">
                <h3>王波</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    王波，讲师，硕士。主要研究方向：计算数学，软件开发。发表学术论文3篇。
                </p><br>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/liyan.jpg" style="text-align: center">
                <h3>李琰</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    李琰，讲师，主要研究方向：软件工程，遥感和林业信息。参与科研项目多项，参编教材1部，并发表部分相关论文。
                </p><br>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="teacherBox" style=" text-align:center; font-szie:18px;">
                <img src="/IMG/teacher/shanying.png" style="text-align: center">
                <h3>单颖</h3>
            </div>
            <div class="context" style="display: none;">
                <h4>所在学科：软件工程，软件工程（专业学位）</h4>
                <p style="font-size: medium">
                    单颖，博士，讲师，主要研究方向：软件工程，林业信息。参与科研项目多项，并发表相关论文。
                </p><br>
            </div>
        </div>
    </div>
</div>
</body>
</html>
