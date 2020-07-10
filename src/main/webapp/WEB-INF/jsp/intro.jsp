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
            width: 100%;
        }

        #nav2 ul a:hover {
            color: black;
        }

        .buttonBtn {
            width: 100%;
            height: 25px;
            text-align: center;
        }
    </style>
</head>

<script>
    $(document).ready(function () {
        $("#intro1btn").click(function () {
            $("#intro1").fadeIn();
            $("#intro2-2").fadeOut();
            $("#intro2-3").fadeOut();
            $("#intro2-1").fadeOut();
            document.getElementById("intro1btnbox").setAttribute("class", "active");
            document.getElementById("intro2-1btnbox").setAttribute("class", "");
            document.getElementById("intro2-2btnbox").setAttribute("class", "");
            document.getElementById("intro2-3btnbox").setAttribute("class", "");
        });
        $("#intro2-1btn").click(function () {
            $("#intro1").fadeOut();
            $("#intro2-2").fadeOut();
            $("#intro2-3").fadeOut();
            $("#intro2-1").fadeIn();
            document.getElementById("intro1btnbox").setAttribute("class", "");
            document.getElementById("intro2-1btnbox").setAttribute("class", "active");
            document.getElementById("intro2-2btnbox").setAttribute("class", "");
            document.getElementById("intro2-3btnbox").setAttribute("class", "");
        });
        $("#intro2-2btn").click(function () {
            $("#intro1").fadeOut();
            $("#intro2-2").fadeIn();
            $("#intro2-3").fadeOut();
            $("#intro2-1").fadeOut();
            document.getElementById("intro1btnbox").setAttribute("class", "");
            document.getElementById("intro2-1btnbox").setAttribute("class", "");
            document.getElementById("intro2-2btnbox").setAttribute("class", "active");
            document.getElementById("intro2-3btnbox").setAttribute("class", "");
        });
        $("#intro2-3btn").click(function () {
            $("#intro1").fadeOut();
            $("#intro2-1").fadeOut();
            $("#intro2-2").fadeOut();
            $("#intro2-3").fadeIn();
            document.getElementById("intro1btnbox").setAttribute("class", "");
            document.getElementById("intro2-1btnbox").setAttribute("class", "");
            document.getElementById("intro2-2btnbox").setAttribute("class", "");
            document.getElementById("intro2-3btnbox").setAttribute("class", "active");
        });
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
            <li class="active"><a href="/intro">专业介绍</a></li>
            <c:forEach items="${labsList}" var="l" begin="0" end="0">
                <li><a href="/labs?lid=${l.labId}">专业实验室</a></li>
            </c:forEach>
            <li><a href="/controlpad">系统管理</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <ul class="nav nav-pills nav-stacked" style="padding: 0;margin: 0;border: 0;">
                <li id="intro1btnbox" class="active"><a id="intro1btn">专业介绍</a></li>
                <li id="intro2btnbox">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">方向介绍
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li id="intro2-1btnbox"><a id="intro2-1btn">可视化编程</a></li>
                        <li id="intro2-2btnbox"><a id="intro2-2btn">WEB应用程序设计</a></li>
                        <li id="intro2-3btnbox"><a id="intro2-3btn">数据库管理</a></li>
                    </ul>
                </li>
                </li>
            </ul>
        </div>
        <div class="col-lg-8">
            <div id="intro1">
                <p style="font-size: medium;text-indent: 2em;">
                    软件工程（Software Engineering）是一门研究用工程化方法构建和维护有效的、实用的和高质量的软件的学科，它涉及程序设计语言、数据库、软件开发工具、系统平台、标准、设计模式等多方面。
                    <br><br>
                    现代社会，软件几乎应用于各个行业，如工业、农业、银行、航空、政府部门等，这些应用促进了经济和社会的发展，使得人们的工作效率和生活效率得以提高。典型的软件有电子邮件、嵌入式系统、人机界面、办公套件、操作系统、编译器、数据库、游戏等。
                    <br><br>
                    软件工程是指导计算机软件开发和维护的工程学科。
                    <br><br>
                    采用工程的概念、原理、技术和方法来开发与维护软件，把经过时间考验而证明正确的管理技术和当前能够得到的最好的技术方法结合起来，这就是软件工程。
                    <br><br>
                    软件工程强调使用生存周期方法学和各种结构分析及结构设计技术。它们是在七十年代为了对付应用软件日益增长的复杂程度、漫长的开发周期以及用户对软件产品经常不满意的状况而发展起来的。人类解决复杂问题时普遍采用的一个策略就是“各个击破”，也就是对问题进行分解然后再分别解决各个子问题的策略。软件工程采用的生存周期方法学就是从时间角度对软件开发和维护的复杂问题进行分解，把软件生存的漫长周期依次划分为若干个阶段，每个阶段有相对独立的任务，然后逐步完成每个阶段的任务。采用软件工程方法论开发软件的时候，从对任务的抽象逻辑分析开始，一个阶段一个阶段地进行开发。
                    <br><br>
                    前一个阶段任务的完成是开始进行后一个阶段工作的前提和基础，而后一阶段任务的完成通常是使前一阶段提出的解法更进一步具体化，加进了更多的物理细节。每一个阶段的开始和结束都有严格标准，对于任何两个相邻的阶段而言，前一阶段的结束标准就是后一阶段的开始标准。在每一个阶段结束之前都必须进行正式严格的技术审查和管理复审，从技术和管理两方面对这个阶段的开发成果进行检查，通过之后这个阶段才算结束；如果检查通不过，则必须进行必要的返工，并且返工后还要再经过审查。审查的一条主要标准就是每个阶段都应该交出“最新式的”（即和所开发的软件完全一致的）高质量的文档资料，从而保证在软件开发工程结束时有一个完整准确的软件配置交付使用。文档是通信的工具，它们清楚准确地说明了到这个时候为止，关于该项工程已经知道了什么，同时确立了下一步工作的基础。此外，文档也起备忘录的作用，如果文档不完整，那么一定是某些工作忘记做了，在进入生存周期的下一阶段之前，必须补足这些遗漏的细节。在完成生存周期每个阶段的任务时，应该采用适合该阶段任务特点的系统化的技术方法──结构分析或结构设计技术。
                    <br><br>
                    把软件生存周期划分成若干个阶段，每个阶段的任务相对独立，而且比较简单，便于不同人员分工协作，从而降低了整个软件开发工程的困难程度；在软件生存周期的每个阶段都采用科学的管理技术和良好的技术方法，而且在每个阶段结束之前都从技术和管理两个角度进行严格的审查，合格之后才开始下一阶段的工作，这就使软件开发工程的全过程以一种有条不紊的方式进行，保证了软件的质量，特别是提高了软件的可维护性。总之，采用软件工程方法论可以大大提高软件开发的成功率，软件开发的生产率也能明显提高。
                    <br><br>
                    目前划分软件生存周期阶段的方法有许多种，软件规模、种类、开发方式、开发环境以及开发时使用的方法论都影响软件生存周期阶段的划分。在划分软件生存周期的阶段时应该遵循的一条基本原则就是使各阶段的任务彼此间尽可能相对独立，同一阶段各项任务的性质尽可能相同，从而降低每个阶段任务的复杂程度，简化不同阶段之间的联系，有利于软件开发工程的组织管理。一般说来，软件生存周期由软件定义、软件开发和软件维护三个时期组成，每个时期又进一步划分成若干个阶段。下面的论述主要针对应用软件，对系统软件也基本适用。
                    <br><br>
                    软件定义时期的任务是确定软件开发工程必须完成的总目标；确定工程的可行性，导出实现工程目标应该采用的策略及系统必须完成的功能；估计完成该项工程需要的资源和成本，并且制定工程进度表。这个时期的工作通常又称为系统分析，由系统分析员负责完成。软件定义时期通常进一步划分成三个阶段，即问题定义、可行性研究和需求分析。
                    <br><br>
                    开发时期具体设计和实现在前一个时期定义的软件，它通常由下述四个阶段组成：总体设计，详细设计，编码和单元测试，综合测试。
                    <br><br>
                    维护时期的主要任务是使软件持久地满足用户的需要。具体地说，当软件在使用过程中发现错误时应该加以改正；当环境改变时应该修改软件以适应新的环境；当用户有新要求时应该及时改进软件满足用户的新需要。通常对维护时期不再进一步划分阶段，但是每一次维护活动本质上都是一次压缩和简化了的定义和开发过程。
                </p>
            </div>
            <div id="intro2">
                <div id="intro2-1" style="display: none;">
                    <h2>可视化编程</h2>
                    <p style="font-size: medium;text-indent: 2em;">要求：掌握程序设计方法及可视化技术，精通一种可视化平台及其软件开发技术。获取Delphi程序员系列、Java初级或VB开发能手认证。
                        <br><br>就业方向：企业、政府、社区、各类学校等可视化编程程序员。</p>
                </div>
                <div id="intro2-2" style="display: none;">
                    <h2>数据库管理</h2>
                    <p style="font-size: medium;text-indent: 2em;">要求：能应用关系范式进行数据库设计，精通SQL语言，胜任数据库服务器管理与应用工作。获取Oracle数据库管理或SQL Server数据库应用或Windows XP应用认证。<br>
                        <br>就业方向：企业、政府、社区、各类学校等部门的中、大型数据库管理员。<br>
                    </p>
                </div>
                <div id="intro2-3" style="display: none;">
                    <h2>WEB应用程序设计</h2>
                    <p style="font-size: medium;text-indent: 2em;">要求：具有美工基础和网页动画设计能力，掌握交互式网页程序的设计技术，能进行网站建设和维护。获取Macromedia多媒体互动设计师或Delphi初级程序员或Delphi快速网络开发工程师认证。<br>
                        <br>就业方向：企业、政府、社区、各类学校等WEB应用程序员。<br>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
