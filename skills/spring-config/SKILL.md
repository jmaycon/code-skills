---
name: spring-config
description: Strict Spring configuration. Constructor injection, Lombok, Config classes, Record properties. No @Value.
---

# Spring Config

Strict rules for Spring DI & properties.

## 1. Injection
* Use constructor injection. 
* Use Lombok `@RequiredArgsConstructor`.
* No field injection (`@Autowired`).

## 2. Bean Wiring
* Wire all beans via explicit Config classes (`@Configuration`).
* No implicit `@Component`/`@Service` scanning unless forced by framework.

## 3. Properties
* NEVER use `@Value`.
* Define properties as Java `record` inside the Config class.
* Bind via `@ConfigurationProperties`.
* Use multiple Config classes for different hierarchy levels in `application.yaml`.

### Example
```java
@Configuration
@EnableConfigurationProperties(MyConfig.Properties.class)
@RequiredArgsConstructor
public class MyConfig {
    private final Properties properties;

    @ConfigurationProperties(prefix = "my.app.feature")
    public record Properties(String propName, int timeout) {}

    @Bean
    public MyService myService() {
        return new MyService(properties.propName());
    }
}
```

## 4. Exceptions
* Direct binding allowed ONLY when forced by annotation: `@Scheduled`, `@KafkaListener`, etc.
