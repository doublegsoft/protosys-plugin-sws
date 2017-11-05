<#if lazy == "true">
<ul class="nav nav-tabs">
    <#list children![] as tab>
    <li>
        <a data-toggle="tab" data-url="${tab.href}" data-target="#${id!'TODO'}" data-lazy="true" style="cursor: pointer">${tab.text!'TODO'}</a>
    </li>
    </#list>
</ul>
<div id="${id!'TODO'}" class="tab-content contentHolder">

</div>
<#else>
<div class="tab">
    <ul class="nav nav-tabs">
        <#list children![] as child>
        <#if child?index == 0>
        <li class="active"><a data-toggle="pill" href="#${child.id!'TODO'}">${child.getExtension("title")!'TODO'}</a></li>
        <#else>
        <li><a data-toggle="pill" href="#${child.id!'TODO'}">${child.getExtension("title")!'TODO'}</a></li>
        </#if>
        </#list>
    </ul>

    <div class="tab-content">
        <#list children![] as child>
        <#if child?index == 0>
        <div id="${child.id!'TODO'}" class="tab-pane fade in active">
${plugin.render(child, 8)}
        </div>
        <#else>
        <div id="${child.id!'TODO'}" class="tab-pane fade in">
${plugin.render(child, 8)}
        </div>
        </#if>
        </#list>
    </div>
</div>
</#if>
