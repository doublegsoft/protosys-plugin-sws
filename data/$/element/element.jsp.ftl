<#if type == 'h1'>
<h1>${text!''}</h1>
<#elseif type == 'h2'>
<h2>${text!''}</h2>
<#elseif type == 'h3'>
<h3>${text!''}</h3>
<#elseif type == 'h4'>
<h4>${text!''}</h4>
<#elseif type == 'h5'>
<h5>${text!''}</h5>
<#elseif type == 'icon'>
<span class="${icon}"></span>
<#elseif type == 'switch'>
<#elseif type == 'link'>
<#elseif type == 'date'>
<#elseif type == 'time'>
<#elseif type == 'dates'>
<#elseif type == 'tag'>
<#elseif type == 'searchbox'>
<#elseif type == 'file'>
<#elseif type == 'select'>
<select id="${id!''}">
    <option value="TODO">TODO</option>
</select>
<#elseif type == 'label'>
<label>${text!''}</label>
<#elseif type == 'image'>
<div class="${style!'col-md-12'}">
    <img style="width: ${width!'350'}px; height: ${height!'150'}px" src="${href!'http://via.placeholder.com/350x150'}">
</div>
<#elseif type == 'button'>
<button><span class="${icon!''}"></span></button>
<#else>
<div>${type!''}不支持</div>
</#if>
