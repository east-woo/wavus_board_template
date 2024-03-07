
# 웨이버스 신입사원 및 전자정부 프레임워크 개발환경 배포

## 💽 사양

- 전자정부 프레임워크 v4.1 spring boot web project
- JDK 17

## 🥅 목적

- 신입사원 및 사내 직원 개발 증진을 위한 전자정부 프레임워크 활용

## 🤦🏻‍♂️이슈

- **javax.servlet.http.HttpServletMapping javax.servlet.http.HttpServletRequest.getHttpServletMapping()**
  - 🐜 **오류 내용**
    - 원인: Javaee-api7.0과tomcat9.0.73의 서블릿버전이 맞지 않아 생긴 버그
  - 🙆🏻 **해결방안**
    - 기존에 있던 `org.egovframe.rte.psl.dataaccess` 의존성 수정 후 새로운 의존성 추가

      ```bash
          <!-- 수정 -->
              <dependency>
                  <groupId>org.egovframe.rte</groupId>
                  <artifactId>org.egovframe.rte.psl.dataaccess</artifactId>
                  <version>${org.egovframe.rte.version}</version>
                  <exclusions> <!-- 의존성 제외 --> 
                      <exclusion>
                          <groupId>javax</groupId>
                          <artifactId>javaee-api</artifactId>
                      </exclusion>
                  </exclusions>
          
          <!-- 추가 -->
              <dependency> 
                  <groupId>jakarta.platform</groupId>
                  <artifactId>jakarta.jakartaee-api</artifactId>
                  <version>9.1.0</version>
                  <scope>provided</scope>
              </dependency>
      ```


- **Path with "WEB-INF" or "META-INF" 에러**
  - 🐜 **오류 내용**
    - 원인: 내장된 tomcat에 jsp를 처리하는 서블릿이 없음, jsp 파일을 찾을 수 없음
  - 🙆🏻 **해결방안**

      ```bash
      ## gradle
      implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
      implementation 'javax.servlet:jstl'
      
      ## maven
      <dependency>
          <groupId>org.apache.tomcat.embed</groupId>
          <artifactId>tomcat-embed-jasper</artifactId>
      </dependency>
      ```


- **Failed to scan [file:/C:/Users/dongwoo/.m2/repository/rhino/js/1.6R2/xbean.jar] from classloader hierarchy**
  - 🐜 **오류 내용**
      ```bash
      java.io.IOException: java.lang.reflect.InvocationTargetException
      at org.apache.tomcat.util.compat.Jre9Compat.jarFileNewInstance(Jre9Compat.java:209)
      at org.apache.tomcat.util.scan.JarFileUrlJar.<init>(JarFileUrlJar.java:65)
      at org.apache.tomcat.util.scan.JarFactory.newInstance(JarFactory.java:49)
      at org.apache.tomcat.util.scan.StandardJarScanner.process(StandardJarScanner.java:383)
      at org.apache.tomcat.util.scan.StandardJarScanner.processURLs(StandardJarScanner.java:318)
      at org.apache.tomcat.util.scan.StandardJarScanner.doScanClassPath(StandardJarScanner.java:282)
      at org.apache.tomcat.util.scan.StandardJarScanner.scan(StandardJarScanner.java:233)
      at org.apache.jasper.servlet.TldScanner.scanJars(TldScanner.java:262)
      at org.apache.jasper.servlet.TldScanner.scan(TldScanner.java:104)
      at org.apache.jasper.servlet.JasperInitializer.onStartup(JasperInitializer.java:83)
      at org.apache.catalina.core.StandardContext.startInternal(StandardContext.java:5219)
      at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:183)
      at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1396)
      at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1386)
      at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
      at org.apache.tomcat.util.threads.InlineExecutorService.execute(InlineExecutorService.java:75)
      at java.base/java.util.concurrent.AbstractExecutorService.submit(AbstractExecutorService.java:145)
      at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.java:919)
      at org.apache.catalina.core.StandardHost.startInternal(StandardHost.java:835)
      at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:183)
      at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1396)
      at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1386)
      at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
      at org.apache.tomcat.util.threads.InlineExecutorService.execute(InlineExecutorService.java:75)
      at java.base/java.util.concurrent.AbstractExecutorService.submit(AbstractExecutorService.java:145)
      at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.java:919)
      at org.apache.catalina.core.StandardEngine.startInternal(StandardEngine.java:263)
      at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:183)
      at org.apache.catalina.core.StandardService.startInternal(StandardService.java:432)
      at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:183)
      at org.apache.catalina.core.StandardServer.startInternal(StandardServer.java:927)
      at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:183)
      at org.apache.catalina.startup.Tomcat.start(Tomcat.java:486)
      at org.springframework.boot.web.embedded.tomcat.TomcatWebServer.initialize(TomcatWebServer.java:123)
      at org.springframework.boot.web.embedded.tomcat.TomcatWebServer.<init>(TomcatWebServer.java:104)
      at org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory.getTomcatWebServer(TomcatServletWebServerFactory.java:479)
      at org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory.getWebServer(TomcatServletWebServerFactory.java:211)
      at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.createWebServer(ServletWebServerApplicationContext.java:184)
      at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.onRefresh(ServletWebServerApplicationContext.java:162)
      at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:577)
      at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:147)
      at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:734)
      at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:408)
      at org.springframework.boot.SpringApplication.run(SpringApplication.java:308)
      at egovframework.EgovBootApplication.main(EgovBootApplication.java:23)
      at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
      at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
      at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
      at java.base/java.lang.reflect.Method.invoke(Method.java:568)
      at org.springframework.boot.devtools.restart.RestartLauncher.run(RestartLauncher.java:49)
      ```

  - 🙆🏻 **해결방안**

    https://stackoverflow.com/questions/44606914/embedded-tomcat-giving-failed-to-scan-jars-from-classloader-hierarchy