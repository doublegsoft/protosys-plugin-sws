<#macro html_btn_save button>
<button class="btn btn-save" onclick="save_${button.ref!"TODO"}();">保存</button>
</#macro>

<#macro html_btn_edit button>
<button class="btn btn-edit" onclick="edit_${button.ref!"TODO"}();">编辑</button>
</#macro>

<#macro html_btn_new button>
<button class="btn btn-new" onclick="edit_${button.ref!"TODO"}();">新建</button>
</#macro>

<#macro html_btn_query button>
<button class="btn btn-query" onclick="query_${button.ref!"TODO"}();">查询</button>
</#macro>

<#macro html_btn_back button>
<button class="btn btn-back" onclick="back();">返回</button>
</#macro>

<#macro html_btn_close button>
<button class="btn btn-dismiss" onclick="close();">关闭</button>
</#macro>

<#macro html_btn_delete button>
<button class="btn btn-delete" onclick="delete_${button.ref!"TODO"}();">删除</button>
</#macro>

<#macro html_btn_activate button>
<button class="btn btn-activate" onclick="activate_${button.ref!"TODO"}();">激活</button>
</#macro>

<#macro html_btn_deactivate button>
<button class="btn btn-deactivate" onclick="deactivate_${button.ref!"TODO"}();">禁用</button>
</#macro>

<#macro html_btn button indent>
<#if button.role == 'save'>
${""?left_pad(indent)}<@html_btn_save button=button/>
<#elseif button.role == 'query'>
${""?left_pad(indent)}<@html_btn_query button=button/>
<#elseif button.role == 'new'>
${""?left_pad(indent)}<@html_btn_new button=button/>
<#elseif button.role == 'edit'>
${""?left_pad(indent)}<@html_btn_edit button=button/>
<#elseif button.role == 'close'>
${""?left_pad(indent)}<@html_btn_close button=button/>
<#elseif button.role == 'delete'>
${""?left_pad(indent)}<@html_btn_delete button=button/>
<#elseif button.role == 'activate'>
${""?left_pad(indent)}<@html_btn_activate button=button/>
<#elseif button.role == 'deactivate'>
${""?left_pad(indent)}<@html_btn_deactivate button=button/>
<#elseif button.role == 'back'>
${""?left_pad(indent)}<@html_btn_back button=button/>
<#else>
${""?left_pad(indent)}<button class="btn btn-default" onclick="">${button.label}</button>
</#if>
</#macro>

<div class="${style!'col-md-12'}"  style="margin-top: 10px;">
    <div class="pull-right">
<#list children![] as button>
<@html_btn button=button indent=8/>
</#list>
    </div>
</div>
