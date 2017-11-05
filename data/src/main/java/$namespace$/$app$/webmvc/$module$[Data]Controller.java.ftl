/*
 * Copyright (C) Kehaoinfo Co. Ltd - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 * Proprietary and confidential
 */
package <#if namespace??>${namespace}.</#if>${app.name}.webmvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import net.doublegsoft.appbase.ObjectMap;
import net.doublegsoft.appbase.SqlParams;
import net.doublegsoft.appbase.JsonData;
import net.doublegsoft.appbase.service.CommonService;
import net.doublegsoft.appbase.service.ServiceException;
import net.doublegsoft.appbase.webmvc.BaseController;

import com.kehaoinfo.sws.util.WebUtils;

/**
 * ${module}数据控制器。
 *
 * @author <a href="mailto:ganguo@kehaoinfo.com">甘果</a>
 *
 * @since 1.0.0
 */
@Controller("${app.name}-${java.nameNamespace(module)}-data-controller")
public class ${java.nameType(module)}DataController extends BaseController {

    private static final Logger TRACER = LoggerFactory.getLogger(${java.nameType(module)}DataController.class);

    private CommonService commonService;

<#list apis as api>
    /**
     * ${api.description}
     *
     * @param criteria
     *          数据操作条件，参考SQL参数设置
     *
     * @return 返回结果
     */
    @RequestMapping("${api.name}")
    @ResponseBody
    public JsonData ${h.method(api.name)}(ObjectMap criteria) {
        try {
            SqlParams params = new SqlParams().set(criteria);
<#--if api.model.action == 'save'-->
            String code = criteria.get("TODO");
            if (code == null) {
                String maxcode = commonService.value("TODO", params);
                if (maxcode == null) {
                    // TODO: 实现自己的编码规则 code = ??
                } else {
                    // TODO: code = maxcode + 1;
                }
                params.set("TODO", code);
                commonService.execute("TODO", params);
            } else {
                commonService.execute("TODO", params);
            }
            return new JsonData().set("TODO", code);
<#--elseif api.model.action == 'find'-->
            // List<ObjectMap> data = commonService.many("TODO", params);
            // return new JsonData().set("data", data);
<#--elseif api.model.action == 'paginate'-->
            // Integer start = criteria.get("start");
            // Integer limit = criteria.get("limit");
            // Pagination<ObjectMap> page = commonService.paginate("TODO", start, limit, params);
            // return new JsonData(page);
<#--else-->
            // TODO: UNSUPPORT
            // return new JsonData();
<#--/#if-->
        } catch (ServiceException ex) {
            TRACER.error(ex.getMessage(), ex);
            return JsonData.ERROR;
        }
    }

</#list>
    @Autowired
    public void setCommonService(CommonService commonService) {
        this.commonService = commonService;
    }
}
