<#macro html_input field>
<input class="form-control" id="${field.id}" type="text" name="${field.id}" label="${field.text}" value="${r'${'}${field.id}${r'}'}" domain-type="${field.domain!''}" <#if field.required??>required</#if>/>
</#macro>

<#macro html_dict field>
<common:dict elementName="${field.id}" elementType="select" label="${field.text}" valueKey="cd" textKey="nm" wrp="${field.wrp!"TODO"}" field="${field.id}" style="" <#if field.required??>required</#if>/>
</#macro>

<#macro html_addv field>
<common:addv elementName="${field.id}" elementType="select" label="${field.text}" valueKey="cd" textKey="nm" wrp="${field.wrp!"TODO"}" field="${field.id}" style="" <#if field.required??>required</#if>/>
</#macro>

<#macro html_check field>
<common:dict elementName="${field.name}" elementType="checkbox" label="${field.text}" valueKey="cd" textKey="nm" wrp="${field.wrp!"TODO"}" field="${field.id}"/>
</#macro>

<#macro html_file field>
<input class="form-control" id="${field.id}" type="file" name="${field.id}" label="${field.text}" value="${r'${'}${field.id}${r'}'}" <#if field.required??>required</#if>/>
</#macro>

<#macro html_element field indent>
<#if field.type == "dict">
${""?left_pad(indent)}<@html_dict field=field/>
<#elseif field.type == "addv">
${""?left_pad(indent)}<@html_addv field=field/>
<#elseif field.type == "select">
${plugin.render(field, indent)}
<#elseif field.type == "dicts">
${""?left_pad(indent)}<@html_check field=field/>
<#elseif field.type == "file">
${""?left_pad(indent)}<@html_file field=field/>
<#else>
${""?left_pad(indent)}<@html_input field=field/>
</#if>
<#if field.unit??>
${""?left_pad(indent)}<span class="input-group-addon">${field.unit}</span>
</#if>
</#macro>

<#assign displayFields = []>
<div id="${id!''}" class="form form-horizontal ${style!'col-md-10'}" style="margin-top: 15px;">
<#list children![] as field>
<#if field.type == 'hidden'>
    <input type="hidden" id="${field.name}" name='${field.name}' value="<#if field.value??>${field.value}<#else>${r'${'}${field.name}${r'}'}</#if>"/>
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
        <label class="col-md-2 form-label">${field.text}：</label>
        <div class="col-md-4">
            <div class="input-group col-md-10">
                <@html_element field=field indent=16/>
            </div>
        </div>
<#assign index = rowIndex * 2 + 1>
<#if index lt displayFields?size>
<#assign field = displayFields[index]>
        <label class="col-md-2 form-label">${field.text}：</label>
        <div class="col-md-4">
            <div class="input-group col-md-10">
                <@html_element field=field indent=16/>
            </div>
        </div>
<#else>
        <label class="col-md-2 form-label"></label>
        <div class="col-md-4 input-group"></div>
</#if>
</#if>
    </div>
</#list>
</#if>
</div>
