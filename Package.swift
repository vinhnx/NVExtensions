// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NVExtensions",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NVExtensions",
            targets: ["NVExtensions"]
        ),
    ],
    dependencies: [
        .package(name: "SwiftDate", url: "https://github.com/malcommac/SwiftDate", from: "6.2.0")
    ],
    targets: [
        .target(
            name: "NVExtensions",
            dependencies: ["SwiftDate"]
        )
    ]
)
