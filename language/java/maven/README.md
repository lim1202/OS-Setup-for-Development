# Maven

## Maven Installation

#### Debian, Ubuntu, etc.

```sh
sudo apt-get install maven
```

## Run a Maven project by using the Maven Docker image

```sh
docker run -it --rm -v "$PWD":/usr/src/project -v "$HOME/.m2":/root/.m2 -v "$PWD/target:/usr/src/project/target" -w /usr/src/project maven:3-jdk-8 mvn clean package
```

## Mirror in pom.xml

```xml
<repository>
    <id>aliyun-maven</id>
    <url>https://maven.aliyun.com/repository/public</url>
    <releases>
        <enabled>true</enabled>
    </releases>
    <snapshots>
        <enabled>true</enabled>
    </snapshots>
</repository>
```

## Include sdk in jar package

```xml
<build>
  <plugins>
    <plugin>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-maven-plugin</artifactId>
      <configuration>
        <includeSystemScope>true</includeSystemScope>
      </configuration>
    </plugin>
  </plugins>
</build>
```
