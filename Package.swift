// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIBindingTransformations",
    platforms: [
        .macOS(.v10_14), .iOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftUIBindingTransformations",
            targets: ["SwiftUIBindingTransformations"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftUIBindingTransformations",
            dependencies: []
        ),
    ]
)
