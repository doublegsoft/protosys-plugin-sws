<#list children![] as btn>
<#if btn.role == 'save'>
function save_${btn.for!"TODO"}() {
    ajax.save('${btn.url!"TODO"}', $('#${btn.for!"TODO"}'), function(resp) {
        // TODO: ADD MORE OR REMOVE
    });
}

</#if>
<#if btn.role == 'query'>
function query_${btn.for!"TODO"}() {
    // 所有查询的操作都在pagination table中封装好了
    ${btn.for!"TODO"}.request();
}

</#if>
<#if btn.role == 'new'>
function addnew_${btn.for!"TODO"}() {
    goto('${btn.url!"TODO"}');
}

</#if>
<#if btn.role == 'activate'>
function activate_${btn.for!"TODO"}() {
    ajax.save('${btn.url!"TODO"}', $('#${btn.for!"TODO"}'), function(resp) {
        // TODO: ADD MORE OR REMOVE
    });
}

</#if>
<#if btn.role == 'deactivate'>
function deactivate_${btn.for!"TODO"}() {
    ajax.save('${btn.url!"TODO"}', $('#${btn.for!"TODO"}'), function(resp) {
        // TODO: ADD MORE OR REMOVE
    });
}

</#if>
</#list>
