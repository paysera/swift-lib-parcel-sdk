// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PayseraParcelSDK",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "PayseraParcelSDK", targets: ["PayseraParcelSDK"]),
    ],
    dependencies: [
        .package(
            name: "PayseraCommonSDK",
            url: "https://github.com/paysera/swift-lib-common-sdk",
            .exact("4.2.0")
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
