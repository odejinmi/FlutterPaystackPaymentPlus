// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "advert",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "advert", targets: ["advert"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "advert",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            // path: ".",
            // exclude: [
            //     "advert.podspec",
            //     ".gitignore"
            // ],
            // sources: [
            //     "Classes"
            // ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
