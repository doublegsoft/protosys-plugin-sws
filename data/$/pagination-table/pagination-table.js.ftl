var ${id} = new PaginationTable({
    url: "${r'${contextPath}'}/common/paginate.do",
    limit: 15,
    boundedQuery: $("#${query!''}"),
    columns: [{
<#list children as child>
<#if child?index gt 0>
    }, {
</#if>
        title: '${child.text!"TODO"}',
        template: '{${child.id!"TODO"}}',
        displayFunction: function(row, td) {
            var a = $('<a>');
            a.css('cursor', 'pointer');
            a.text(row.${child.id!'TODO'});
            a.on('click', function() {
                goto('${child.href!'TODO'}');
            });
            // TODO: 实现链接功能
            td.append(a).append('&nbsp;&nbsp;');
        }
</#list>
    }]
});
${id}.addFilter('sqlId', '${sqlId!'TODO'}');
${id}.render('cntr_${id!'TODO'}');
