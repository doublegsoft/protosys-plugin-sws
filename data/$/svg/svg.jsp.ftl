<div id="${id!'TODO'}" class="${style!'col-md-12'}">
</div>
<script>
$.ajax({
    url: '${r"${contextPath}"}/${uri!"TODO"}.do',
    data: {},
    method: 'POST',
    success: function(html) {
        $('#${id!"TODO"}').empty();
        $('#${id!"TODO"}').append(html);
    }
});
</script>
