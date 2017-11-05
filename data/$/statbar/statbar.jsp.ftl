<div class="statbar ${style!'col-md-12'}">
    <#list items![] as item>
    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="statbar-item">
            <div class="statbar-item-title">
                <span class="label label-success pull-right">今天</span>
                <h5>${item.text}</h5>
            </div>
            <div class="statbar-item-content">
                <h1 class="no-margins">${r'${'}${item.countKey!'TODO'}${r'}'}</h1>
                <div class="statbar-item-percent font-bold text-success">${r'${'}${item.percentKey!'TODO'}${r'}'}</div>
                <small>${item.unit!'TODO'}</small>
            </div>
        </div>
    </div>
    </#list>
</div>
