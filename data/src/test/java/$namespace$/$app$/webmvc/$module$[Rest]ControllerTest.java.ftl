/*
 * Copyright (C) Kehaoinfo Co. Ltd - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 * Proprietary and confidential
 */
package <#if namespace??>${namespace}.</#if>${app.name}.webmvc;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.Ignore;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import net.doublegsoft.appbase.ObjectMap;
import net.doublegsoft.appbase.SqlParams;
import net.doublegsoft.appbase.JsonData;
import net.doublegsoft.appbase.service.CommonService;

import <#if namespace??>${namespace}.</#if>${app.name}.TestBase;

/**
 * ${module}模块REST控制器测试用例。
 *
 * @author <a href="mailto:ganguo@kehaoinfo.com">甘果</a>
 *
 * @since 1.0.0
 */
public class ${java.nameType(module)}RestControllerTest extends TestBase {
    
<#list apis as api>
    /**
     * 测试【${api.description!'TODO'}】。
     */
    @Ignore
    public void test_restFor${h.method(api.name)}() throws Exception {
        ${java.nameType(module)}RestController controller = new ${java.nameType(module)}RestController();
        controller.setCommonService(context.getBean(CommonService.class));
        ObjectMap criteria = new ObjectMap();
<#list api.model.parameters as param>
        criteria.set("${param.name}", "TODO");
</#list>
        JsonData resp = controller.${h.method(api.name)}(criteria);
    }

</#list>
}
