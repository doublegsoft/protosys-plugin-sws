<#macro html_input field>
<input class="form-control" type="text" name="${field.id}"/>
</#macro>

<#macro html_select field>
<common:dict elementName="${field.id}" elementType="select" label="${field.text}" valueKey="cd" textKey="nm" wrp="${field.wrp!"TODO"}" field="${field.id}"/>
</#macro>

<#macro html_check field>
<common:dict elementName="${field.id}" elementType="checkbox" label="${field.text}" valueKey="cd" textKey="nm" wrp="${field.wrp!"TODO"}" field="${field.id}"/>
</#macro>

<#macro html_addv field>
<common:addv elementName="${field.id}" label="不限" precision="${r'${gPrecision}'}" parentCode="${r'${gDistrictCode}'}"/>
</#macro>

<#macro html_element field indent>
<#if field.type == "dict">
${""?left_pad(indent)}<@html_check field=field/>
<#elseif field.type == "addv">
${""?left_pad(indent)}<@html_addv field=field/>
<#elseif field.type == "select">
${plugin.render(field, indent)}
<#elseif field.type == "checks">
                      <#list field.opts![] as opt>
${""?left_pad(indent)}<div class="checkbox checkbox-inline">
${""?left_pad(indent)}    <input type="checkbox" name="${field.id}" value="${opt.value}">
${""?left_pad(indent)}    <label>${opt.text}</label>
${""?left_pad(indent)}</div>
                      </#list>
<#else>
${""?left_pad(indent)}<@html_input field=field/>
</#if>
</#macro>

<#assign residue = children?size % 2>
<#assign rowCount = children?size / 2>
<#if residue == 0>
<#assign rowCount = rowCount - 1>
</#if>

<div id="${id!''}" class="form form-horizontal ${style!'col-md-12'}"  style="margin-top: 15px;">
<#if rowCount gt 0>
<#list 0..rowCount as rowIndex>
    <div class="form-group">
<#if (rowIndex * 2) lt children?size>
<#assign field = children[rowIndex * 2]>
        <label class="col-md-2 col-form-label" style="text-align: left">${field.text}：</label>
        <div class="col-md-4">
<@html_element field=field indent=12/>
        </div>
<#assign index = rowIndex * 2 + 1>
<#if index lt children?size>
<#assign field = children[index]>
        <label class="col-md-2 col-form-label" style="text-align: left">${field.text}：</label>
        <div class="col-md-4">
<@html_element field=field indent=12/>
        </div>
<#else>
        <label class="col-md-2 col-form-label" style="text-align: left"></label>
        <div class="col-md-4"></div>
</#if>
</#if>
    </div>
</#list>
</#if>
</div>
