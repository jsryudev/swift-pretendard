// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-pretendard",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Pretendard",
            targets: ["Pretendard"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Pretendard",
            dependencies: [],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "PretendardTests",
            dependencies: ["Pretendard"]
        ),
    ]
)
