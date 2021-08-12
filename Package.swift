// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PayseraParcelSDK",
    platforms: [.macOS(.v10_12), .iOS(.v10), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(name: "PayseraParcelSDK", targets: ["PayseraParcelSDK"]),
    ],
    dependencies: [
        .package(
            name: "PayseraCommonSDK",
            url: "https://github.com/paysera/swift-lib-common-sdk",
            .branch("xcode13")
        )
    ],
    targets: [
        .target(
            name: "PayseraParcelSDK",
            dependencies: ["PayseraCommonSDK"]),
        .testTarget(
            name: "PayseraParcelSDKTests",
            dependencies: ["PayseraParcelSDK"]),
    ]
)
