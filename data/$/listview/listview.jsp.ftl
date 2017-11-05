<script id="entry-template" type="text/x-handlebars-template">
	<div class="row">
        <br />
        <div class="col-sm-12 col-md-4">
        </div>
        <div class="col-sm-12 col-md-4 contents">
            <div class="panel text-center">
                <div class="panel1 pull-left">
                    <div>
                        <i class="fa fa-sun-o bigicon"></i>
                    </div>
                </div>
                <div class="panel1 text-right">
                    <div>
                        <span class="bigicon">34 oC</span>
                    </div>
                </div>
                <div class="panel1 text-center">
                    <div>
                        <i class="fa fa-map-marker medicon"></i><span class="medicon">  Paris, France</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-4">
        </div>
    </div>
</script>

<div id="${id!'TODO'}" class="${style!'col-md-12'}">
</div>

<script>
ajax.load('${r"${contextPath}"}/TODO.do', {}, function(resp) {
	var source   = $("#entry-template").html();
	var template = Handlebars.compile(source);
	for (var i = 0; i < resp.data.length; i++) {
		var d = resp.data[i];
		$('#${id!"TODO"}').append(template(d));
	}
});
</script>
