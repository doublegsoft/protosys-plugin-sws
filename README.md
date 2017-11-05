## MISUML语言

### 项目名称

<pre>
name: dsom
codegen: sws
</pre>

### API设计

#### SQL语言

<pre>
api:
-   description: 查询测点列表
    module: mps
    sqlModel: 'find@dsom.mps.measpoint.find(t_measpoint-[mnritmfile] + sws_t_section ? mpnm%%, crscnm%%, pointid=)'
</pre>

<b>find</b>是数据库操作的动作名称，共有如下几类：

- create，相当于insert
- update，相当于update
- delete，相当于delete
- find，相当于select

<b>dsom.mps.measpoint.find</b>是在xml中的sqlId。


<b>t_measpoint-[mnritmfile] + sws_t_section ? mpnm%%, crscnm%%, pointid=</b>就是具体SQL的抽象表达语言。

属性字段符号：

- []，在中括号内的字段会指定为在select语句中的字段名，如果没有中括号，则表示全部
- -，减号表示在中括号内的字段不会出现在select语句中

条件查询符号：

- ?，条件查询起始符号
- =，对该字段采用等于条件符
- %%，相当于like条件符
- %_，相当于left like条件符
- _%，相当于right like条件符
- []，相当于in条件符
- <>，相当于大于并且小于的符合条件符，适用于日期查询，查询某个日期区间

排序符号，

- !，排序起始符号
- ^，升序排列，如果没有则表示降序排列 

比如：

<pre>
-   description: 查询测点列表
    module: mps
    sqlModel: 'find@dsom.mps.measpoint.find(t_measpoint-[mnritmfile] + sws_t_section ? mpnm%%, crscnm%%, pointid=)'

-   description: 查询断面列表
    module: mps
    sqlModel: 'find@dsom.mps.section.find(sws_t_section ? crscnm%%, pointid=)'

-   description: 创建一个测点
    module: mps
    sqlModel: 'create@dsom.mps.measpoint.create(t_measpoint)'

-   description: 更新一个测点
    module: mps
    sqlModel: 'update@dsom.mps.measpoint.update(t_measpoint ? pointid=)'

-   description: 更新一个测点的扩展属性
    module: mps
    sqlModel: 'update@dsom.mps.measpoint.xproperty.update(t_measpoint[xproperty] ? pointid=)'

-   description: 创建一个断面
    module: mps
    sqlModel: 'create@dsom.mps.section.create(sws_t_section)'

-   description: 更新一个测点
    module: mps
    sqlModel: 'update@dsom.mps.section.update(sws_t_section ? crsc=)'

-   description: 更新一个测点的扩展属性
    module: mps
    sqlModel: 'update@dsom.mps.section.xproperty.update(sws_t_section[xproperty] ? crsc=)'
</pre>

#### 数据控制器

#### 视图控制器
<pre>
-   description: 测点列表
    module: mps
    name: 测点列表
    viewModel: |-
        get@/view/dsom/mps/measpoints (wrp, wrpcd) </mps/measpoints> {

        }
</pre>

get是http method。

/view/dsom/mps/measpoints是请求的链接路径。

(wrp, wrpcd)是请求必须的参数。

</mps/measpoints>是返回的jsp路径标识。

#### REST控制器

#### 页面

<pre>
-   name: measpoints
    module: mps
    description: 测点列表
    view: '
        measpoints:page(text: "测点列表")<
            measpoint_sheet:form(sqlId: "todo")<
                mpnm:file(text: "上传测点配置表")
            >,
            measpoints_query:query(sqlId: "todo")<
                mpnm:input(text: "测点名称"),
                crscnm:select(text: "断面名称"),
                mnritm:select(text: "监测要素")
            >,
            buttons<
                (type: "query", text: "查询", for: "measpoints_list")
            >,
            measpoints_list:pagination-table(with: "measpoints_query")<
                mpnm:label(text: "测点名称"),
                crscnm:label(text: "断面名称"),
                link(text: "操作")
            >
        >
    '
</pre>