---
name: java-tests
description: Java testing standards (Mockito Extension, Given-When-Then, Mock annotations, and constructor injection).
activation: "when writing java tests"
---

# Java Testing Standards

## 5. Testing Standards
- Unit tests for all business logic.
- Integration tests for module boundaries.
- ArchUnit tests for architectural rules.
- No untested public interfaces.

**Test Structure and Style:**
- Test methods follow Given-When-Then via naming and variable organization.
- Unit under test must be named `uut`.
- Use Mockito extension (`@ExtendWith(MockitoExtension.class)`).
- Mock dependencies with `@Mock`.
- Create beans using actual constructors, not `@InjectMocks`.
- Do not use lenient stubbing; avoid `lenient()` and define mock stubbing inside individual test methods.
- No comments in test code.
