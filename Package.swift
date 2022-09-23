// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Analytico",
    platforms: [
        .iOS(.v10), //Add other platforms later
    ],
    products: [
        .library(
            name: "Analytico",
            targets: ["Analytico"]
        ),
    ],
    dependencies: [
        .package(name: "Fridge", url: "https://github.com/vexy/Fridge", branch: "main")
    ],
    targets: [
        .target(
            name: "Analytico",
            dependencies: []
        ),
        .testTarget(
            name: "AnalyticoTests",
            dependencies: ["Analytico"]),
    ]
)
