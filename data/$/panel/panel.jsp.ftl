<div class="panel panel-info">
    <div class="panel-heading">
        <a data-toggle="collapse" class="expanded" href="#${id!''}">${text!'标题'}</a>
        <div class="btn-group pull-right">
            <!--place any action buttons here-->
        </div>
    </div>
    <div id="${id!''}" class="panel-body collapse in">
<#list children as child>
${plugin.render(child, 8)}
</#list>
    </div>
</div>
