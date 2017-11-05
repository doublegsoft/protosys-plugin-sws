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

import com.kehaoinfo.sws.domain.SqlParamsEx;
import com.kehaoinfo.sws.util.WebUtils;

/**
 * ${module}模块页面控制器。
 *
 * @author <a href="mailto:ganguo@kehaoinfo.com">甘果</a>
 *
 * @since 1.0.0
 */
@Controller("${app.name}-${java.nameNamespace(module)}-view-controller")
public class ${java.nameType(module)}ViewController extends BaseController {

    private static final Logger TRACER = LoggerFactory.getLogger(${java.nameType(module)}ViewController.class);

    private CommonService commonService;

<#list apis as api>
    /**
     * 查看【${api.description!'TODO'}】页面。
     *
     * @param criteria
     *          请求参数规范对象
     *
     * @return 具体页面路径
     */
    @RequestMapping(value="${api.model.uri}", method=RequestMethod.${api.model.method?upper_case})
    public String viewFor${java.nameType(api.model.page)}(ObjectMap criteria) {
        WebUtils.setAttributesInRequest(getRequest(), criteria);
        return "${app.name}${api.model.page}";
    }

</#list>
    @Autowired
    public void setCommonService(CommonService commonService) {
        this.commonService = commonService;
    }
}
