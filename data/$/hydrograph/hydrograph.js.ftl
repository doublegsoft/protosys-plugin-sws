var ${id!'TODO'} = new Hydrograph({
    containerId: '${id!'TODO'}',
    url: '${r'${contextPath}'}/ams/hydrograph/data.do',
    sqlIds: ['t_datameas.selectCalculated', 'env.day.rz2', 'env.day.dyp2'],
    method: 'merge',
    dateField: 'tm',
    groupField: 'mpnm',
    mixed: false,
    title: '测点数据与水位雨量关系图',
    charts: [{
        name: ['TODO: 某某工情值'],
        item: ['TODO: 数据集中那个字段作为组的指标'],
        type: ['line'],
        axis: ['TODO: 指标名称(指标单位)'],
        color: ['#F2711C'],
        grouping: 'TODO: 数据集中那个字段作为组的指标'
    }, {
        name: ['库水位', '降雨量'] ,
        item: ['rz', 'dyp'],
        type: ['line', 'bar'],
        axis: ['库水位(m)', '降雨量(mm)'],
        color: ['#74ccf4', '#2185D0'],
        grouping: 'TODO: 数据集中那个字段作为组的指标'
    }]
});

${id!'TODO'}.render({
    startDate: '${r'${startDate}'}',
    endDate: '${r'${endDate}'} 23:59:59',
    timeSeries: 'day',
    display: '${sec.mm.display}'
});
