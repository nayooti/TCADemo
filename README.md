# TCA-DemoApp

Im getting a Linker-Error framework (‘CoreAudioTypes' not found) when importing a framework that uses UUIDGenerator via:
```
@Dependency(\.uuid) var uuid
```

Here is a barebones demo project to demonstrate this issue:
https://github.com/nayooti/TCADemo/blob/main/DemoFramework/DemoFramework/DemoView.swift

Summery:
- DemoApp uses DemoFramework
- DemoFeature does compile
- DemoFramework is a TCA module with a `DemoFeature: Reducer` 
- DemoFeature uses  `@Dependency(\.uuid) var uuid`
- When building DemoApp I get this error:
```
Link DemoFramework (arm64):
  ld: warning: Could not find or use auto-linked framework 'CoreAudioTypes': framework 'CoreAudioTypes' not found
  ld: Undefined symbols:
  Dependencies.Dependency.wrappedValue.getter : A, referenced from:
  DemoFramework.DemoFeature.uuid.getter : Dependencies.UUIDGenerator in DemoView.o
```

Observations:
- Obviously I am not using CoreAudioTypes anywhere in the project
- When commenting out  `@Dependency(\.uuid) var uuid` DemoApp builds without any errors
- Also happens to any other framework that uses DemoFramework
