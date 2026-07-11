---
name: spring
description: Strict Spring configuration. Constructor injection, Lombok, Config classes, Record properties. No @Value.
---

# Spring

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
* Place nested `record` definitions at bottom of enclosing class.
* NEVER hardcode defaults in Config logic (e.g., `prop != null ? prop : "default"`). Let Spring inject or fail.

### Example
```java
@Configuration
@EnableConfigurationProperties(MyConfig.Properties.class)
@RequiredArgsConstructor
class MyConfig {
    private final Properties properties;

    @Bean
    MyService myService() {
        return new MyService(properties.propName());
    }

    @ConfigurationProperties(prefix = "my.app.feature")
    record Properties(String propName, int timeout) {}
}
```

## 4. Exceptions
* Direct binding allowed ONLY when forced by annotation: `@Scheduled`, `@KafkaListener`, etc.

See also: [Java 25+ Skill](../java-25+/SKILL.md)

