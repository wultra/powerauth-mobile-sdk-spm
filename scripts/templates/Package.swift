// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PowerAuth2",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "PowerAuth2", targets: ["PowerAuth2"]),
        .library(name: "PowerAuthCore", targets: ["PowerAuthCore"])
    ],
    targets: [
        .binaryTarget(
            name: "PowerAuth2",
            url: "%BASE_URL%/releases/download/%VERSION%/%SDK_ZIP%",
            checksum: "%SDK_CHECKSUM%"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "%BASE_URL%/releases/download/%VERSION%/%CORE_ZIP%",
            checksum: "%CORE_CHECKSUM%")
    ]
)