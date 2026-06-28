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

## 5. Visibility
* Default to `private`.
* Use package-private if needed. This includes Spring classes (`@RestController`, `@Service`, `@Configuration`) and their methods (e.g. `@GetMapping`, `@Bean`). Spring does NOT require them to be `public`.
* Use `public` ONLY if strictly required for cross-package access.

## 6. Imports
* Always use fully qualified imports (e.g., `import java.util.List;`), NO wildcard imports (`import java.util.*;`) unless there is a conflict.
* Use static imports when it improves readability, but ensure it doesn't create confusion.
* NEVER use fully qualified class names directly in the code (e.g., inline in method parameters or field declarations like `public MessageListenerAdapter listenerAdapter(com.sdrc.agent.service.EngramSubscriber subscriber)`). Always import the class and use the simple class name instead.

## 7. Variables
* Use `var` whenever the type is explicitly clear on the right side of the assignment (in the current line).
* DO NOT use `var` when assigning from a method return, as the type is not immediately obvious.
