<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="/WEB-INF/sws-app-common.tld" prefix="common" %>

${plugin.render(page, 0, 'jsp')}

<script>
<#list page.pageWidgets as child>
${plugin.render(child, 0, 'js')}
</#list>

$(function() {
    // 满足主框架的滚动条，每个页面都需要写，FIXME: 能不能规范化这种方法
    var screenHeight = $(window).height();
    var topDivHeight = $("#topDiv").height();

    $("#${id!''}").height(screenHeight - topDivHeight - 10);
    $("#${id!''}").perfectScrollbar();
});
</script>