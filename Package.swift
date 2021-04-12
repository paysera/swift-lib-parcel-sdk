// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PayseraParcelSDK",
    platforms: [.macOS(.v10_12), .iOS(.v10), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(name: "PayseraParcelSDK", targets: ["PayseraParcelSDK"]),
    ],
    dependencies: [
        .package(name: "PayseraCommonSDK", url: "https://github.com/paysera/swift-lib-common-sdk", from: "3.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PayseraParcelSDK",
            dependencies: ["PayseraCommonSDK"]),
        .testTarget(
            name: "PayseraParcelSDKTests",
            dependencies: ["PayseraParcelSDK"]),
    ]
)
