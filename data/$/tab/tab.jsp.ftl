<div class="tab">
    <ul class="nav nav-tabs">
<#list children as child>
<#if child?index == 0>
        <li class="active"><a data-toggle="pill" href="#${child.id!'TODO'}">${child.getExtension("title")!'TODO'}</a></li>
<#else>
        <li><a data-toggle="pill" href="#${child.id!'TODO'}">${child.getExtension("title")!'TODO'}</a></li>
</#if>
</#list>
    </ul>

    <div class="tab-content">
<#list children as child>
<#if child?index == 0>
        <div id="${child.id!'TODO'}" class="tab-pane fade in active">
${child.getExtension("html")!''}
        </div>
<#else>
        <div id="${child.id!'TODO'}" class="tab-pane fade in">
${child.getExtension("html")!''}
        </div>
</#if>
</#list>
    </div>
</div>
