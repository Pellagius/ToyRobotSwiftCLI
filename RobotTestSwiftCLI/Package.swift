// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RobotTestSwiftCLI",
    products: [
        .library(name: "ToyRobotLibrary", targets: ["ToyRobotLibrary"]),
        .executable(name: "RobotTestSwiftCLI", targets: ["RobotTestSwiftCLI"])
    ],
    targets: [
        .target(
            name: "ToyRobotLibrary",
            path: "Sources/ToyRobotLibrary"
        ),
        .executableTarget(
            name: "RobotTestSwiftCLI",
            dependencies: ["ToyRobotLibrary"],
            path: "Sources/RobotTestSwiftCLI"
        ),
        .testTarget(
            name: "ToyRobotLibraryTests",
            dependencies: ["ToyRobotLibrary"]
        )
    ]
)
