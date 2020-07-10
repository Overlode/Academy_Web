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
    <title>index</title>
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

        .imgguide {
            padding: 0;
            display: block;
            text-align: center;
        }

        .imgguide img {
            display: block;
            text-align: center;
            width: 100%;
            height: 400px;
        }

        .panel {
            padding: 0;
            margin: 0;
        }

        #panels > .col-lg-4 {
            padding: 0;
            margin: 0;
        }
    </style>
</head>

<script>
    $(document).ready(function () {
        $("#checkForMore").click(function () {
            window.location.href = "https://icec.nefu.edu.cn/xygk/xyjj.htm";
        });
        $("#btnsm").click(function () {
            let text = document.getElementById("context").value;
            let str = text.replace(/\n/gi, "<br>");
            document.getElementById("context").value = str;
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
            <li class="active"><a href="/index">主页</a></li>
            <c:forEach items="${newsList}" var="n" begin="0" end="0">
                <li><a href="/news?nid=${n.newsid}">新闻中心</a></li>
            </c:forEach>
            <li><a href="/teachers">教师队伍</a></li>
            <li><a href="/intro">专业介绍</a></li>
            <c:forEach items="${labsList}" var="l" begin="0" end="0">
                <li><a href="/labs?lid=${l.labId}">专业实验室</a></li>
            </c:forEach>
            <li><a href="/controlpad">系统管理</a></li>
        </ul>
    </div>
    <div class="row header">
        <div class="col-lg-8 imgguide">
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/IMG/1.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="/IMG/2.jpg" alt="Second slide">
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="col-lg-4" style="background-color: rgb(250,250,250); height: 418px;">
            <h2 style="">专业介绍
                <small>ZHUAN YE GAI KUANG</small>
            </h2>
            <div style="text-align: center;">
                <p>
                    软件工程专业以IT业需求为导向，培养具有良好综合素质和职业道德，掌握扎实的基础理论和专业知识，具有软件分析、设计、开发、测试与管理能力，具备较强工程实践能力、技术创新能力和团队精神，能快速适应软件工程新技术发展并具有国际视野和国际竞争力的高级软件工程师。专业实施灵活的“211”人才培养模式（其中,2年基础教育,1年面向企业的专业教育,1年企业顶岗实习），在教学上着力推动基于问题、基于项目和基于案例的学习，对于实践性强的课程，采取校企联合“双师制”培养，同时以大学生创新实践活动、科技大赛为补充，突出工程化培养。
                </p>
                <p>
                    教师队伍采用专兼结合的用人机制，现有专职教师12人，其中高级职称7人，讲师5人，博士8人，硕士4人，其中6人具有国外留学或访学经历。
                </p>
            </div>
            <a href="/intro" class="btn btn-primary" style="display:block;right:0;float: right;bottom: 0;">查看更多</a>
        </div>
    </div>
    <div class="row" id="panels">
        <div class="col-lg-4">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">专业实验室</h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked" style="padding: 0;margin: 0;border: 0;">
                        <c:forEach items="${labsList}" var="l" begin="0" end="4">
                            <li><a href="/labs?lid=${l.labId}">${l.labId}${l.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">新闻中心
                        <small style="padding-left: 5px">XIN WEN ZHONG XIN</small>
                    </h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked" style="padding: 0;margin: 0;border: 0;">
                        <c:forEach items="${newsList}" var="n" begin="0" end="4">
                                <li><a href="/news?nid=${n.newsid}">${n.head}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">联系我们</h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked" style="padding: 0;margin: 0;border: 0;">
                        <li><a>电话：</a></li>
                        <li><a>地址：</a></li>
                        <li><a>邮箱：</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
