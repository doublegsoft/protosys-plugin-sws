<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
       xmlns:tx="http://www.springframework.org/schema/tx" xmlns:aop="http://www.springframework.org/schema/aop" xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:p="http://www.springframework.org/schema/p" xmlns:jdbc="http://www.springframework.org/schema/jdbc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
          http://www.springframework.org/schema/beans/spring-beans.xsd
          http://www.springframework.org/schema/context
          http://www.springframework.org/schema/context/spring-context.xsd
          http://www.springframework.org/schema/tx
          http://www.springframework.org/schema/tx/spring-tx.xsd
          http://www.springframework.org/schema/aop
          http://www.springframework.org/schema/aop/spring-aop.xsd
          http://www.springframework.org/schema/mvc
          http://www.springframework.org/schema/mvc/spring-mvc.xsd
          http://www.springframework.org/schema/jdbc
          http://www.springframework.org/schema/jdbc/spring-jdbc.xsd">

    <!-- 全局变量 -->
    <bean class="org.springframework.beans.factory.config.MethodInvokingFactoryBean">
        <property name="targetClass" value="com.kehaoinfo.sws.Globals"/>
        <property name="targetMethod" value="initialize"/>
        <property name="arguments">
            <map>
                <entry key="" value=""/>
            </map>
        </property>
    </bean>

    <bean id="dataSource" class="com.jolbox.bonecp.BoneCPDataSource" destroy-method="close">
        <property name="driverClass" value="org.h2.Driver" />
        <property name="jdbcUrl" value="jdbc:h2:mem:test;MODE=MSSQLServer;DATABASE_TO_UPPER=false;DB_CLOSE_DELAY=-1" />
        <property name="idleConnectionTestPeriodInMinutes" value="1"/>
        <property name="idleMaxAgeInMinutes" value="1"/>
        <property name="maxConnectionsPerPartition" value="2"/>
        <property name="minConnectionsPerPartition" value="1"/>
        <property name="partitionCount" value="1"/>
        <property name="acquireIncrement" value="1"/>
        <property name="statementsCacheSize" value="100"/>
    </bean>

    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <bean id="txAspect" class="net.doublegsoft.appbase.service.TransactionManagementAspect"/>

    <tx:annotation-driven transaction-manager="transactionManager"/>

    <!-- 基础服务和SQL模板 -->
    <bean id="sqlManager" class="net.doublegsoft.appbase.sql.SqlManager">
        <property name="resources">
            <list>
                <value>/sql/sws-common-infocoding.xml</value>
                <value>/sql/sws-common.xml</value>
                <#list sqlxmls![] as sqlxml>
                <value>/sql/${sqlxml}.xml</value>
                </#list>
            </list>
        </property>
    </bean>

    <!-- 文件存储管理 -->
    <bean id="fileStoreManager" class="com.kehaoinfo.sws.domain.FileStoreManager">
        <property name="resources">
            <map>
                <entry key="download" value="/download"/>
            </map>
        </property>
    </bean>

    <!-- 模板 -->
    <bean class="com.kehaoinfo.sws.domain.TemplateManager">
        <property name="resources">
            <map>

            </map>
        </property>
    </bean>

    <!-- Services -->
    <bean class="com.kehaoinfo.sws.service.TreeService">
        <property name="commonService" ref="commonService"/>
    </bean>

    <bean class="com.kehaoinfo.sws.service.FormService">
        <property name="commonService" ref="commonService"/>
    </bean>

    <bean id="commonService" class="net.doublegsoft.appbase.service.CommonService">
        <property name="sqlManager" ref="sqlManager"/>
        <property name="commonDataAccess" ref="commonDataAccess"/>
    </bean>

    <bean id="commonDataAccess" class="net.doublegsoft.appbase.dao.JdbcCommonDataAccess" destroy-method="close">
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <!-- 在Web Runtime环境获取Spring Context -->
    <bean class="com.kehaoinfo.sws.util.ApplicationContextProvider"/>

    <!-- 图片资源管理 -->
    <!--
    <bean class="org.springframework.beans.factory.config.MethodInvokingFactoryBean">
        <property name="targetClass" value="com.kehaoinfo.sws.ams.domain.ImageManager"/>
        <property name="targetMethod" value="initialize"/>
        <property name="arguments">
            <value>E:\\local\\works\\kehaoinfo.com\\sws\\code\\sws-app\\sws-app-ams\\src\\main\\webapp\\data\\ams</value>
        </property>
    </bean>
    -->

    <!-- 加载字典数据 -->
    <!--
    <bean class="org.springframework.beans.factory.config.MethodInvokingFactoryBean">
        <property name="targetClass" value="com.kehaoinfo.sws.domain.DictManager"/>
        <property name="targetMethod" value="reload"/>
        <property name="arguments">
            <list>
                <ref bean="commonService"/>
            </list>
        </property>
    </bean>
    -->

    <!-- 加载元数据 -->
    <!--
    <bean class="org.springframework.beans.factory.config.MethodInvokingFactoryBean">
        <property name="targetClass" value="com.kehaoinfo.sws.domain.MetaManager"/>
        <property name="targetMethod" value="reload"/>
        <property name="arguments">
            <list>
                <ref bean="commonService"/>
            </list>
        </property>
    </bean>
    -->

    <!-- webmvc -->
    <context:component-scan base-package="com.kehaoinfo.sws" use-default-filters="false">
        <context:include-filter type="annotation" expression="org.springframework.stereotype.Controller"/>
        <context:exclude-filter type="regex" expression="com.kehaoinfo.sws.priv.webmvc.*"/>
    </context:component-scan>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix">
            <value>/jsp/</value>
        </property>
        <property name="suffix">
            <value>.jsp</value>
        </property>
    </bean>

    <!-- 拦截器 -->
    <bean id="request4BackInterceptor" class="com.kehaoinfo.sws.webmvc.Request4BackInterceptor"/>

    <bean id="requestAttributeInterceptor" class="com.kehaoinfo.sws.webmvc.RequestAttributeInterceptor"/>

    <mvc:interceptors>
        <mvc:interceptor>
            <mvc:mapping path="/**"/>
            <ref bean="request4BackInterceptor"/>
        </mvc:interceptor>
        <mvc:interceptor>
            <mvc:mapping path="/**"/>
            <ref bean="requestAttributeInterceptor"/>
        </mvc:interceptor>
    </mvc:interceptors>

    <!-- Custom HTTP Request Resolver -->
    <bean id="objectMapResolver" class="net.doublegsoft.appbase.webmvc.ObjectMapArgumentResolver" lazy-init="false"/>

    <!-- Adds ObjectMap as HTTP Request Object and JsonData as HTTP Response Object -->
    <bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter" p:customArgumentResolver-ref="objectMapResolver">
        <property name="messageConverters">
            <array>
                <bean class="org.springframework.http.converter.StringHttpMessageConverter">
                    <property name="supportedMediaTypes" value="text/plain;charset=UTF-8"/>
                </bean>
                <bean class="net.doublegsoft.appbase.webmvc.JsonDataHttpMessageConverter"/>
            </array>
        </property>
    </bean>

    <!-- 定时服务 -->

    <!-- 实时数据 -->
</beans>
