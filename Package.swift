// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "jb-detector",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "JBDetector",
            targets: ["JBDetector"]),
    ],
    targets: [
        .target(
            name: "JBDetector",
            dependencies: [])
    ]
)
