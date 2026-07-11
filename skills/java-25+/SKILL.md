---
name: java-25+
description: Java 25+ rules. Enforce module imports. Trigger: Java version >= 25.
---

## 1. Imports & Modules

* **Module**: Use `import module`.
* **Group**: Same-module classes -> 1 module import.
* **Wildcard**: Mix module + wildcard -> abort.
* **No Inline**: NEVER use Fully Qualified Class Names inline (e.g., `java.time.ZoneId.systemDefault()`, `implements java.io.Serializable`). Import at top -> use simple name.
* **Explicit**: Always use fully qualified top-level imports. NO wildcard imports (e.g., `import java.util.*;`) unless conflict.
* **Static**: Use static imports only for readability. Avoid confusion.
* **Clash**: Name clash -> use explicit import.

### Module Examples

**Base**
```java
// Out
import module java.base;
```

**SQL**
```java
// Out
import module java.sql;
```

## 2. Visibility

* **Default**: `private`.
* **Package-private**: Default for Spring classes (`@RestController`, `@Service`, `@Configuration`) and methods (`@Bean`, `@GetMapping`). Spring does NOT need `public`.
* **Public**: ONLY for cross-package access.

## 3. Variables

* **var**: Use `var` ONLY when type is explicit on RHS (same line).
* **No var**: DO NOT use `var` for method returns (type not obvious).

## 4. Limits

* JDK < 25 -> abort.
* Aliasing -> fail.

## 5. Nullability & Builders

* **JSpecify + Lombok `@Builder`**: When the project uses JSpecify, if Lombok `@Builder` is used, all required properties MUST be annotated with `lombok.NonNull`.

See also: [Spring Skill](../spring/SKILL.md)

