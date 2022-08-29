// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Analytico",
    products: [
        .library(
            name: "Analytico",
            targets: ["Analytico"]
        ),
    ],
    dependencies: [
        // FRIDGE ?
        // .package(url: /* package url */, from: "1.0.0"),
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
