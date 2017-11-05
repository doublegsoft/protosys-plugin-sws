<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">${r'${rsnm}'}</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <#list navs as nav>
                <li><a data-toggle="tab" data-url="${r'${contextPath}'}/${nav.href}" data-target="#${nav.target!'TODO'}" data-lazy="true" style="cursor: pointer">${nav.text}</a></li>
                </#list>
            </ul>
        </div>
    </div>
</nav>
