<#macro jsp_var name>${r"${"}${name}${r"}"}</#macro>

<div id="${id!TODO}" style="${style!'col-md-12'}">
</div>
<script>
$('#${id!"TODO"}').groupSelection({
    data: '<@jsp_var name=data!"TODO"/>',
    selectFunction: function (selected) {
        // TODO: ADD YOUR LOGIC AFTER SELECTING
    }
});
</script>
