// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Analytico",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_14) // Fridge inheritance
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
            dependencies: ["Fridge"]
        ),
        .testTarget(
            name: "AnalyticoTests",
            dependencies: ["Analytico", "Fridge"]
        )
    ]
)
