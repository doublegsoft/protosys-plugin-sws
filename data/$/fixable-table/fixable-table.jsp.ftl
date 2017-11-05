<div class="col-md-12">
    <!-- 表头由服务器端渲染 -->
    <table id="${id!'TODO'}" class="table table-bordered">
        <thead>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<script>
$('#${id!"TODO"}').fxdHdrCol({
    fixedCols: 2,
    width: '100%',
    height: 300,
    colModal: [
        { width: 300, align: 'center' },
        { width: 100, align: 'center' },
        { width: 100, align: 'center' },
        { width: 300, align: 'center' },
        { width: 100, align: 'center' },
        { width: 100, align: 'center' }
    ]
});
</script>
