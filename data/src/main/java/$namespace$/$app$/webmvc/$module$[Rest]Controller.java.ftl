/*
 * Copyright (C) Kehaoinfo Co. Ltd - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 * Proprietary and confidential
 */
package <#if namespace??>${namespace}.</#if>${app.name}.webmvc;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import net.doublegsoft.appbase.ObjectMap;
import net.doublegsoft.appbase.SqlParams;
import net.doublegsoft.appbase.Pagination;
import net.doublegsoft.appbase.JsonData;
import net.doublegsoft.appbase.service.CommonService;
import net.doublegsoft.appbase.service.ServiceException;
import net.doublegsoft.appbase.webmvc.BaseController;

import com.kehaoinfo.sws.util.WebUtils;

/**
 * ${module}REST控制器。
 *
 * @author <a href="mailto:ganguo@kehaoinfo.com">甘果</a>
 *
 * @since 1.0.0
 */
@RestController("${app.name}-${java.nameNamespace(module)}-rest-controller")
public class ${java.nameType(module)}RestController extends BaseRestController {

    private static final Logger TRACER = LoggerFactory.getLogger(${java.nameType(module)}RestController.class);

    private CommonService commonService;

<#list apis as api>
<#assign rootAttrs = api.model.root.returnedAttributes>
    /**
     * ${api.description}
     *
     * @param criteria
     *          数据操作条件，参考SQL参数设置
     *
     * @return 返回结果
     */
    @RequestMapping(value = "${api.model.uri}", method = RequestMethod.${api.model.action?upper_case})
    @ResponseBody
    public JsonData ${api.model.action}${java.nameType(api.model.uri)}(ObjectMap criteria) {
        try {
            JsonData retVal = new JsonData();
            SqlParams params = new SqlParams().set(criteria);
<#if api.action == 'get'>
    <#if api.model.root.array>
            Integer start = criteria.get("start");
            Integer limit = criteria.get("limit");
            start = start == null ? 0 : start;
            limit = limit == null ? -1 : limit;
            Pagination<ObjectMap> page = commonService.paginate("${api.model.provision!'TODO'}", start, limit, params);
            return retVal.set(page);
    <#else>
            ObjectMap found = commonService.single("${api.model.provision!'TODO'}", params);
            if (found == null) {
                return error("404", "未找到对应数据。");
            }
            return retVal.set(found);
    </#if>
<#elseif api.action == 'post'>
    <#if rootAttrs[0]??>
            String ${rootAttrs[0].name} = criteria.get("${rootAttrs[0].name}");
            ${rootAttrs[0].name} = UUID.randomUUID().toString();
            params.set("${rootAttrs[0].name}", ${rootAttrs[0].name});
            commonService.execute("${api.model.provision!'TODO'}", params);
            return retVal.set("${rootAttrs[0].name}", ${rootAttrs[0].name});
    <#else>
            commonService.execute("${api.model.provision!'TODO'}", params);
            return retVal;
    </#if>
<#else>
            commonService.execute("${api.model.provision!'TODO'}", params);
            return retVal;
</#if>
        } catch (ServiceException ex) {
            TRACER.error(ex.getMessage(), ex);
            return error("500", "${api.description}出错");
        }
    }

</#list>
    @Autowired
    public void setCommonService(CommonService commonService) {
        this.commonService = commonService;
    }
}
