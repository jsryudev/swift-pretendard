# swift-pretendard
Swift에서 사용할 수 있는 system-ui 대체 글꼴 [Pretendard](https://github.com/orioncactus/pretendard)

## 설치
`Package.swift` 파일에 하기와 같은 코드를 추가합니다.

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/apple/swift-pretendard", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: [
                .product(name: "Pretendard", package: "swift-pretendard") // Add as a dependency
            ] 
        )
    ]
)
```

## 지원 기능
- Pretendard CJK 폰트를 제공합니다.
- 가장 많이 사용되는 4개의 Weight를 제공합니다.
  - Bold
  - Medium
  - Regular
  - Semi Bold

## 실험 필요
- [ ] variable font를 사용하여 다양한 Weight를 지원 (퍼포먼스 벤치마크 필요)
