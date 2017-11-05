<#assign displayFields = []]>
<div id="${id!''}" class="form form-horizontal ${style!''}">
<#list fields![] as field>
<#if field.type == 'hidden'>
    <input type="hidden" id="${field.name}" name='${field.name}' value="${r'${'}${field.name}${r'}'}"/>
<#else>
<#assign displayFields = displayFields + [field]>
</#if>
</#list>

<#assign residue = displayFields?size % 2>
<#assign rowCount = displayFields?size / 2>
<#if residue == 0>
<#assign rowCount = rowCount - 1>
</#if>
<#if rowCount gt 0>
<#list 0..rowCount as rowIndex>
    <div class="form-group">
<#if (rowIndex * 2) lt displayFields?size>
<#assign field = displayFields[rowIndex * 2]>
        <label class="col-md-2 col-form-label">${field.label}：</label>
        <label class="col-md-4 col-form-label">${r'${'}${field.name}${r'}'}</label>
<#assign index = rowIndex * 2 + 1>
<#if index lt displayFields?size>
<#assign field = displayFields[index]>
        <label class="col-md-2 col-form-label">${field.label}：</label>
        <label class="col-md-4 col-form-label">${r'${'}${field.name}${r'}'}</label>
<#else>
        <label class="col-md-2 col-form-label"></label>
        <div class="col-md-4"></div>
</#if>
</#if>
    </div>
</#list>
</#if>
</div>
