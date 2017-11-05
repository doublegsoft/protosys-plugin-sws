/*
 * Copyright (C) Kehaoinfo Co. Ltd - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 * Proprietary and confidential
 */
package <#if namespace??>${namespace}.</#if>${app.name};

import org.junit.BeforeClass;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 所有测试基类。
 *
 * @author <a href="mailto:ganguo@kehaoinfo.com">甘果</a>
 *
 * @since 1.0.0
 */
public class TestBase {
    
    protected static ApplicationContext context;

    @BeforeClass
    public static void setup() throws Exception {
        context = new ClassPathXmlApplicationContext("/spring/spring-sws-app-${app.name}-test.xml");
    }
    
}
