@set GROOVY_VERSION=2.5.0

@set GROOVY_HOME=%USERPROFILE%\.sdkman\candidates\groovy\%GROOVY_VERSION%

@set GROOVY_JAR=""
REM @set GROOVY_JAR=%GROOVY_HOME%/embeddable/groovy-all-%GROOVY_VERSION%.jar %= Invalid since Groovy 2.5. =%
@set GROOVY_JAR=%GROOVY_JAR%;%GROOVY_HOME%/lib/groovy-%GROOVY_VERSION%.jar
@set GROOVY_JAR=%GROOVY_JAR%;%GROOVY_HOME%/lib/groovy-templates-%GROOVY_VERSION%.jar
@set GROOVY_JAR=%GROOVY_JAR%;%GROOVY_HOME%/lib/groovy-xml-%GROOVY_VERSION%.jar

@set REQUIRED_JAR=""
@set REQUIRED_JAR=%REQUIRED_JAR%;lib\CodeNarc-1.0.jar
@set REQUIRED_JAR=%REQUIRED_JAR%;lib\slf4j-api-1.7.25.jar
@set REQUIRED_JAR=%REQUIRED_JAR%;lib\slf4j-simple-1.7.25.jar
@set REQUIRED_JAR=%REQUIRED_JAR%;lib\GMetrics-1.0.jar

@set CLASSPATH=%GROOVY_JAR%;%REQUIRED_JAR%

java -classpath %CLASSPATH% org.codenarc.CodeNarc %*

:: In order to cater to the module system of Java 9+, only the individual jar files of the core and all modules will be provided since Groovy 2.5.0, i.e. the fat jar file groovy-all-x.y.z.jar will not be available.
:: http://groovy-lang.org/download.html

:: CodeNarc
:: https://search.maven.org/remotecontent?filepath=org/codenarc/CodeNarc/1.0/CodeNarc-1.0.jar

:: Command Options:
:: http://codenarc.sourceforge.net/codenarc-command-line.html
:: -includes="**/*.groovy,**/Jenkinsfile,**/*.gr"
:: -rulesetfiles=rulesets/basic.xml,rulesets/braces.xml,rulesets/concurrency.xml,rulesets/convention.xml,rulesets/design.xml,rulesets/dry.xml,rulesets/enhanced.xml,rulesets/exceptions.xml,rulesets/formatting.xml,rulesets/generic.xml,rulesets/grails.xml,rulesets/groovyism.xml,rulesets/imports.xml,rulesets/jdbc.xml,rulesets/junit.xml,rulesets/logging.xml,rulesets/naming.xml,rulesets/security.xml,rulesets/serialization.xml,rulesets/size.xml,rulesets/unnecessary.xml,rulesets/unused.xml
::
:: ./codeNarcing.cmd -includes="**/*.groovy,**/Jenkinsfile,**/*.gr" -rulesetfiles=rulesets/basic.xml,rulesets/braces.xml,rulesets/concurrency.xml,rulesets/convention.xml,rulesets/design.xml,rulesets/dry.xml,rulesets/enhanced.xml,rulesets/exceptions.xml,rulesets/formatting.xml,rulesets/generic.xml,rulesets/grails.xml,rulesets/groovyism.xml,rulesets/imports.xml,rulesets/jdbc.xml,rulesets/junit.xml,rulesets/logging.xml,rulesets/naming.xml,rulesets/security.xml,rulesets/serialization.xml,rulesets/size.xml,rulesets/unnecessary.xml,rulesets/unused.xml

:: SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder"
:: https://www.slf4j.org/codes.html#StaticLoggerBinder
:: This warning message is reported when the org.slf4j.impl.StaticLoggerBinder class could not be loaded into memory.
:: This happens when no appropriate SLF4J binding could be found on the class path.
:: Placing one (and only one) of slf4j-nop.jar slf4j-simple.jar, slf4j-log4j12.jar, slf4j-jdk14.jar or logback-classic.jar on the class path should solve the problem.
:: https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar
:: https://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-simple/1.7.25/slf4j-simple-1.7.25.jar

:: java.lang.NoClassDefFoundError: org/gmetrics/metric/Metric
:: https://search.maven.org/remotecontent?filepath=org/gmetrics/gmetrics/1.0/gmetrics-1.0.jar

:: java.lang.NoClassDefFoundError: org/junit/Assert
:: https://search.maven.org/remotecontent?filepath=junit/junit/4.12/junit-4.12.jar
