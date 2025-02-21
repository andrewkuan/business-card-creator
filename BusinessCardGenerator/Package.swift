// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BusinessCardGenerator",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "BusinessCardGenerator",
            targets: ["BusinessCardGenerator"]
        )
    ],
    targets: [
        .executableTarget(
            name: "BusinessCardGenerator",
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "BusinessCardGeneratorTests",
            dependencies: ["BusinessCardGenerator"]
        )
    ]
) 