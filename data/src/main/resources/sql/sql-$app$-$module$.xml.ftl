<?xml version="1.0" encoding="UTF-8"?>

<sqls>
<#list apis as api>
<#if api.type == 'sql'>
<#assign sql = codegen4sql.codegen(api)>
    <!-- ${sql.description} -->
    <sql id="${sql.id}">
    <![CDATA[
        ${sql.sql!''}
    ]]>
    </sql>
    
</#if>
</#list>
</sqls>