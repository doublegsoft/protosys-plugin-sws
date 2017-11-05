<project xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://maven.apache.org/POM/4.0.0"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
	
	<groupId>com.kehaoinfo.sws</groupId>
    <artifactId>sws-app-dsom</artifactId>
	<version>1.0.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <description>智慧水务系统之TODO</description>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<sws-parent.version>1.0.0</sws-parent.version>
		<sws-app-common.version>1.1.0-SNAPSHOT</sws-app-common.version>
		<sws-app-reporting.version>2.0.0</sws-app-reporting.version>
		<sws-app-wrp.version>1.0.1-SNAPSHOT</sws-app-wrp.version>
		<sws-app-ams.version>1.2.0-SNAPSHOT</sws-app-ams.version>
		<sws-app-searching.version>1.0.0</sws-app-searching.version>
		<sws-app-ims.version>2.0.0</sws-app-ims.version>
        <sws-app-priv.version>1.0.1-SNAPSHOT</sws-app-priv.version>
    </properties>
	
    <build>
        <finalName>sws-app-${java.nameNamespace(app.name)}</finalName>
        <plugins>
			<plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.2</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>utf8</encoding>
                </configuration>
            </plugin>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>  
				<artifactId>maven-surefire-plugin</artifactId>  
				<version>2.12.4</version>  
				<configuration>  
					<skipTests>true</skipTests>  
				</configuration>  
			</plugin>
            <plugin>
                <artifactId>maven-war-plugin</artifactId>
                <configuration>
                    <attachClasses>true</attachClasses>
                    <classesClassifier>classes</classesClassifier>

                    <dependentWarExcludes>
                    WEB-INF/spring*.xml, WEB-INF/lib/*priv*.jar, WEB-INF/lib/*wrp*.jar, WEB-INF/classes/,
                    WEB-INF/lib/sws-app-commons-1.0.0-*.jar
                    </dependentWarExcludes>
				    <overlays>
                        <overlay>
                            <groupId>com.kehaoinfo.sws</groupId>
                            <artifactId>sws-app-priv</artifactId>
                        </overlay>
                        <overlay>
                            <groupId>com.kehaoinfo.sws</groupId>
                            <artifactId>sws-app-ams</artifactId>
                        </overlay>
                        <overlay>
                            <groupId>com.kehaoinfo.sws</groupId>
                            <artifactId>sws-app-wrp</artifactId>
                        </overlay>
                    </overlays>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>0.7.9</version>
                <executions> 
                    <execution>
                        <id>prepare-agent</id>
                        <goals>
                            <goal>prepare-agent</goal>
                        </goals>
                    </execution>
                    <execution>
                        <id>report</id>
                        <phase>prepare-package</phase>
                        <goals>
                            <goal>report</goal>
                        </goals>
                    </execution>
                    <execution>
                        <id>post-unit-test</id>
                        <phase>test</phase>
                        <goals>
                            <goal>report</goal>
                        </goals>
                        <configuration>
                            <dataFile>target/jacoco.exec</dataFile>
                            <!-- Sets the output directory for the code coverage report. -->
                            <outputDirectory>target/jacoco-ut</outputDirectory>
                        </configuration>
                    </execution>
                </executions>
                <configuration>
                    <systemPropertyVariables>
                        <jacoco-agent.destfile>target/jacoco.exec</jacoco-agent.destfile>
                    </systemPropertyVariables>
                </configuration>
            </plugin>
        </plugins>
    </build>
	
	<repositories>
        <repository>
            <id>kehaoinfo-maven-repository</id>
            <url>http://59.55.137.184:5008/repository/maven-releases/</url>
            <snapshots><enabled>false</enabled></snapshots>
        </repository>
        <repository>
            <id>kehaoinfo-maven-snapshot-repository</id>
            <url>http://59.55.137.184:5008/repository/maven-snapshots/</url>
        </repository>
    </repositories>
	
	<distributionManagement>
		<repository>
            <id>kehaoinfo-maven-repository</id>
            <url>http://59.55.137.184:5008/repository/maven-releases/</url>
        </repository>
		<snapshotRepository>
			<id>kehaoinfo-maven-snapshot-repository</id>
            <url>http://59.55.137.184:5008/repository/maven-snapshots/</url>
		</snapshotRepository>
	</distributionManagement>
	
	<dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>com.kehaoinfo.sws</groupId>
                <artifactId>sws-parent</artifactId>
                <version>${r"${sws-parent.version}"}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <dependencies>
        
        <!-- 智慧水务基础模块  -->
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-common</artifactId>
            <version>${r"${sws-app-common.version}"}</version>
            <classifier>classes</classifier>
        </dependency>
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-common</artifactId>
            <version>${r"${sws-app-common.version}"}</version>
            <type>war</type>
        </dependency>
        
        <!-- 自动化监测业务模块  -->
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-ams</artifactId>
            <version>${r"${sws-app-ams.version}"}</version>
            <type>war</type>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-ams</artifactId>
            <version>${r"${sws-app-ams.version}"}</version>
            <classifier>classes</classifier>
        </dependency>
        
        <!-- 水利工程业务模块  -->
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-wrp</artifactId>
            <version>${r"${sws-app-wrp.version}"}</version>
            <classifier>classes</classifier>
        </dependency>
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-wrp</artifactId>
            <version>${r"${sws-app-wrp.version}"}</version>
            <type>war</type>
            <scope>runtime</scope>
        </dependency>
        
        <!-- 报表业务模块 -->
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-reporting</artifactId>
            <version>${r"${sws-app-reporting.version}"}</version>
            <classifier>classes</classifier>
        </dependency>
        
        <!-- 权限业务模块 -->
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-priv</artifactId>
            <version>${r"${sws-app-priv.version}"}</version>
            <classifier>classes</classifier>
        </dependency>
        
        <dependency>
            <groupId>com.kehaoinfo.sws</groupId>
            <artifactId>sws-app-priv</artifactId>
            <version>${r"${sws-app-priv.version}"}</version>
            <type>war</type>
            <scope>runtime</scope>
        </dependency>
        
        <!-- 数据库及连接池 -->
        <dependency>
            <groupId>com.jolbox</groupId>
            <artifactId>bonecp</artifactId>
        </dependency>

        <dependency>
            <groupId>com.microsoft.sqlserver</groupId>
            <artifactId>sqljdbc4</artifactId>
        </dependency>
        
        <!-- JSTL技术 -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>jstl</artifactId>
        </dependency>
        <dependency>
            <groupId>org.glassfish.web</groupId>
            <artifactId>jstl-impl</artifactId>
            <exclusions>
                <exclusion>
                    <artifactId>servlet-api</artifactId>
                    <groupId>javax.servlet</groupId>
                </exclusion>
            </exclusions>
        </dependency>
        
        <!-- Spring环境下的定时任务  -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context-support</artifactId>
        </dependency>
        
        <dependency>
            <groupId>org.quartz-scheduler</groupId>
            <artifactId>quartz</artifactId>
        </dependency>
        
        <!-- 模板引擎  -->
        <dependency>
            <groupId>org.freemarker</groupId>
            <artifactId>freemarker</artifactId>
        </dependency>
        
        
        <!-- Excel和Word文档操作 -->
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-ooxml</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-scratchpad</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.xmlbeans</groupId>
            <artifactId>xmlbeans</artifactId>
        </dependency>
        <dependency>
          <groupId>fr.opensagres.xdocreport</groupId>
          <artifactId>xdocreport</artifactId>
        </dependency>
        <dependency>
          <groupId>org.apache.poi</groupId>
          <artifactId>poi-ooxml-schemas</artifactId>
        </dependency>
        <dependency>
          <groupId>org.apache.poi</groupId>
          <artifactId>ooxml-schemas</artifactId>
        </dependency>
        
        <!-- 单元测试 -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <scope>test</scope>
        </dependency>
        
        <!-- 测试用数据驱动 -->
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <version>1.4.196</version>
            <scope>test</scope>
        </dependency>
        
        <!-- webapp应用环境 -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <scope>provided</scope>
        </dependency>
        
    </dependencies>
</project>
