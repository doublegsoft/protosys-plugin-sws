<table class="table table-bordered">
    <thead>
        <tr>
            <#list hdrs as hdr>
            <th>${hdr}</th>
            </#list>
        </tr>
    </thead>
    <tbody>
        <#list rows as row>
        <tr>
            <#list row.cols as col>
            <td>${col}</td>
            </#list>
        </tr>
        </#list>
    </tbody>
</table>
