<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="common" uri="/WEB-INF/sws-app-common.tld" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="shortcut icon" href="${r"${contextPath}"}/favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>测试框架</title>

    <!-- Bootstrap core CSS -->

    <link href="${r"${contextPath}"}/3rd/css/bootstrap.min.css" rel="stylesheet">

    <link href="${r"${contextPath}"}/3rd/fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="${r"${contextPath}"}/3rd/css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link rel="stylesheet" type="text/css" href="${r"${contextPath}"}/3rd/css/maps/jquery-jvectormap-2.0.3.css" />
    <link href="${r"${contextPath}"}/3rd/css/icheck/flat/green.css" rel="stylesheet" />
    <link href="${r"${contextPath}"}/3rd/css/floatexamples.css" rel="stylesheet" type="text/css" />
    <link href="${r"${contextPath}"}/3rd/css/calendar/fullcalendar.css" rel="stylesheet">
    <link href="${r"${contextPath}"}/3rd/css/calendar/fullcalendar.print.css" rel="stylesheet" media="print">
    <link href="${r"${contextPath}"}/js/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet">

    <script src="${r"${contextPath}"}/3rd/js/jquery.min.js"></script>
    <script>
        (function () {
            var defaultErrorProcess = function (response) {
                $("#errormodule-cnt").html("请求发生"+response.status+"错误,错误信息: "+response.statusText);
                $("#errormodule").modal('show');
            };
            var oldajax = $.ajax;
            $.ajax = function (option) {

                if(option.error == undefined){
                    option.error = defaultErrorProcess;
                }
                oldajax.call(this,option);
            }
        })();
        window.gContextPath = "${r"${contextPath}"}";
        if (window.gContextPath == "") window.gContextPath = "/";

        /**
         * 跳转到某一页。
         */
        function goto(url, clear) {
            var cntr = $('#container');
            if (url.indexOf("?") == -1) {
                url += "?_backable=true";
            } else {
                url += "&_backable=true";
            }
            $.ajax({
                url: url,
                success: function (html) {
                    cntr.empty();
                    cntr.append(html);
                }
            });
        }

        var visitedPages = [];

        /**
         * 导航栏控制页面
         */
        function navigate(url, title, params, clear) {
            if (clear) {
                visitedPages = [];
            }
            var nav = $("#navigator");
            nav.html("");
            visitedPages.push({url: url, title: title, params: params});
            for (var i = 0; i < visitedPages.length; i++) {
                if (i > 0) nav.append("&nbsp;&nbsp;>>&nbsp;&nbsp;");
                var a = $("<a href='#'>");
                a.text(visitedPages[i].title);
                a.attr("index", i);
                a.on("click", function() {
                    var idx = parseInt($(this).attr("index"));
                    var _url = visitedPages[idx].url;
                    var _title = visitedPages[idx].title;
                    var _params = visitedPages[idx].params;
                    visitedPages = visitedPages.slice(0, idx);
                    if (idx == 0) {
                        navigate(_url, _title, _params, true);
                    } else {
                        navigate(_url, _title, _params);
                    }
                });
                nav.append(a);
            }
            goto(url);
        }
    </script>
    <script src="${r"${contextPath}"}/3rd/js/nprogress.js"></script>

    <link href="${r"${contextPath}"}/3rd/css/lightslider.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${r"${contextPath}"}/3rd/css/bootstrap3/bootstrap-switch.min.css" />


    <link href="${r"${contextPath}"}/css/sws.css" rel="stylesheet">
    <link href="${r"${contextPath}"}/css/iconfont.css" rel="stylesheet">
    <link href="${r"${contextPath}"}/css/sws-bootstrap-overridden.css" rel="stylesheet">

</head>

<body class="nav-md">
<div class="container body">
    <div class="row nav-menu" style="background-color: #139de5; padding: 5px 0 5px 15px; position: fixed; top: 0; height: 75px; width: 100%; z-index: 10000;">
        <img alt="" src="${r"${contextPath}"}/img/title.png">
        <ul class="nav navbar-nav navbar-right">
            <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <!--img src="images/img.jpg" alt=""-->
            <span class=" fa fa-angle-down"></span>
                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                    <li><a href="javascript:;">修改密码</a></li>
                    <li><a href="javascript:;">帮助文档</a></li>
                    <li><a href="${r"${contextPath}"}/priv/login.do"><i class="fa fa-sign-out pull-right"></i>退出</a></li>
                </ul></li>
        </ul>
    </div>
    <div class="main_container" style="padding-top: 75px;">
        <div class="col-md-3 left_col" style="position: fixed; top: 75px; width: 250px; height: 100%;">
            <div class="left_col scroll-view" style="width: 100%">
                <div class="clearfix"></div>
                <!-- sidebar menu -->
                <div id="sidebar-menu"
                     class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu">
                        <#list funcs![] as func>
                            <li>
                                <a  <#if func.url??> href="javascript:navigate('${r"${contextPath}"}${func.url}', '${func.name!'未设置名称'}', {}, true);" </#if>>
                                ${func.name!'未设置名称'}
                                </a>
                            </li>
                        </#list>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav" style="display: none">
            <div class="nav_menu">
                <nav class="" role="navigation">
                    <div id="navigator" class="nav" style="width: 100%; margin-top: 10px; padding-left: 20px; font-size: 16px; font-weight: bold"></div>
                </nav>
            </div>

        </div>
        <!-- /top navigation -->

        <div id="container" class="right_col" role="main">
        </div>
    </div>

</div>

<script src="${r"${contextPath}"}/3rd/js/bootstrap.min.js"></script>

<!-- bootstrap progress js -->
<script src="${r"${contextPath}"}/3rd/js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="${r"${contextPath}"}/3rd/js/nicescroll/jquery.nicescroll.min.js"></script>
<!-- icheck -->
<script src="${r"${contextPath}"}/3rd/js/icheck/icheck.min.js"></script>
<!-- daterangepicker -->
<script type="text/javascript" src="${r"${contextPath}"}/3rd/js/moment/moment.min.js"></script>
<script type="text/javascript" src="${r"${contextPath}"}/3rd/js/datepicker/daterangepicker.cn.min.js"></script>
<!-- chart js -->
<script src="${r"${contextPath}"}/3rd/js/chartjs/chart.min.js"></script>

<!-- mainframe -->
<script src="${r"${contextPath}"}/js/mainframe.js"></script>
<script src="${r"${contextPath}"}/3rd/js/bootstrap-switch.min.js"></script>

<!--bootstrap-select.js-->
<link href="${r"${contextPath}"}/js/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<script src="${r"${contextPath}"}/js/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

<script type="text/javascript" src="${r"${contextPath}"}/js/perfect-scrollbar/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${r"${contextPath}"}/js/perfect-scrollbar/perfect-scrollbar.js"></script>

<!-- pace -->
<script src="${r"${contextPath}"}/3rd/js/pace/pace.min.js"></script>
<script src="${r"${contextPath}"}/3rd/js/calendar/fullcalendar.min.js"></script>

<script src="${r"${contextPath}"}/3rd/js/echarts3/echarts.min.js"></script>

<!-- Bootstrap Dialog -->
<link href="${r"${contextPath}"}/3rd/css/bootstrapdialog.min.css" rel="stylesheet" />
<script src="${r"${contextPath}"}/3rd/js/bootstrapdialog.min.js"></script>
<script src="${r"${contextPath}"}/3rd/js/bootbox.js"></script>
<script src="${r"${contextPath}"}/3rd/js/bootstrap-notify.min.js"></script>

<!-- 模板 -->
<script src="${r"${contextPath}"}/3rd/js/handlebars.min.js"></script>

<%--弹层组件--%>
<script src="${r"${contextPath}"}/3rd/js/layer/layer.js"></script>

<script src="${r"${contextPath}"}/js/wrChart/ychart.min.js"></script>

<!-- SWS -->
<script src="${r"${contextPath}"}/js/jquery.pagination-table-2.1.js"></script>
<script src="${r"${contextPath}"}/js/jquery.fixed-columns-1.0.js"></script>
<script src="${r"${contextPath}"}/js/jquery.formdata-1.0.js"></script>

</body>
</html>

