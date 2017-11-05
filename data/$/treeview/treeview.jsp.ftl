<div id="${id!'TODO'}" class="${style!'col-md-4'}">
</div>
<script>
ajax.load('${r"${contextPath}"}/common/tree/plain.do', {
    sqlId: 'TODO',
    'parentIdKeys[]': 'TODO',
    'parentTextKeys[]': 'TODO'
}, function(resp) {
    var nodes = [];
    for (var i = 0; i < resp.data.length; i++) {
        var parent = resp.data[i];
        var children = [];
        if (typeof d.children !== 'undefined') {
            for (var j = 0; j < d.children.length; j++) {
                var child = d.children[j];
                children.push({id: 'TODO', text: 'TODO'});
            }
        }
        nodes.push({id: 'TODO', text: 'TODO', nodes: children});
    }
    $('#${id!'TODO'}').treeview({
        data: nodes,
        showBorder: false,
        onNodeSelected: function(event, data) {

        }
    });
});
</script>
