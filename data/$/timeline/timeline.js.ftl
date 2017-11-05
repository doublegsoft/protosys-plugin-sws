$.ajax({
    url: '${r'${contextPath}'}/data/common/timeline.do',
    data: {},
    dataType: 'json',
    success: function (events) {
        var tpl = handlebars.compile($('#template-${id!'TODO'}').html());
        var html = tpl({events: events});
        $('#${id!'TODO'}').html(html);
    }
});
