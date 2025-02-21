// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BusinessCardGenerator",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "BusinessCardGenerator",
            targets: ["BusinessCardGenerator"]
        )
    ],
    dependencies: [],
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