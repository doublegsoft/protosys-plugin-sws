<div class="row">
    <c:forEach items="${r"${realtimeItems}"}" var="item">
    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="panel panel-primary text-center no-boder blue">
            <div class="panel-left pull-left">
                <i class="fa fa-eye fa-5x"></i>
            </div>
            <div class="panel-right">
    			<h3>${r"${item.value}"}${r"${item.unit}"}</h3>
               <strong>${r"${item.descr}"}</strong>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
