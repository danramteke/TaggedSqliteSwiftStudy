// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "taggedtest",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "taggedtest",
            targets: ["taggedtest"]),
    ],
    dependencies: [
            .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.12.2"),
            .package(url: "https://github.com/pointfreeco/swift-tagged", from: "0.4.0")
            
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "taggedtest",
            dependencies: ["SQLite", "Tagged"]),
        .testTarget(
            name: "taggedtestTests",
            dependencies: ["taggedtest", "SQLite", "Tagged"]),
    ]
)
