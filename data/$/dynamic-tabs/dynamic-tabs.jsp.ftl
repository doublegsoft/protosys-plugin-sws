<#macro jsp_var name>${r"${"}${name}${r"}"}</#macro>

<div id="${id!'TODO'}" class="${style!'col-md-12'}">
    <ul class="nav nav-tabs">
        <c:forEach items="<@jsp_var name=itemsName!'TODO'/>" var="${varName!'TODO'}" varStatus="loop">
        <c:if test="${r'${loop.index == 0}'}">
        <li class="active"><a href="#<@jsp_var name=idInVar!'TODO'/>" data-toggle="tab"><@jsp_var name=nameInVar!'TODO'/></a></li>
        </c:if>
        <c:if test="${r'${loop.index != 0}'}">
        <li><a href="#<@jsp_var name=idInVar!'TODO'/>" data-toggle="tab"><@jsp_var name=nameInVar!'TODO'/></a></li>
        </c:if>
        </c:forEach>
    </ul>

    <div class="tab-content contentHolder"  style="border:0px solid red; position: relative; overflow: hidden">
        <c:forEach items="<@jsp_var name=itemsName!'TODO'/>" var="${varName!'TODO'}" varStatus="loop">
        <c:if test="${r'${loop.index == 0}'}">
        <div class="tab-pane active content" id="<@jsp_var name=idInVar!'TODO'/>"></div>
        </c:if>
        <c:if test="${r'${loop.index != 0}'}">
        <div class="tab-pane content" id="<@jsp_var name=idInVar!'TODO'/>"></div>
        </c:if>
        <script type="text/javascript">
        // TODO: ADD JAVASCRIPT FOR EACH TAB
        </script>
        </c:forEach>
    </div>
</div>
