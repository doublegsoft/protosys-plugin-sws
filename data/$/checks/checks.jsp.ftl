<#list vals![] as opt>
<div class="checkbox checkbox-inline">
    <input type="checkbox" name="${field.name}" value="${opt.value}">
    <label>${opt.text}</label>
</div>
</#list>