// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PowerAuth2",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "PowerAuth2", targets: ["PowerAuth2Wrapper"]),
        .library(name: "PowerAuthCore", targets: ["PowerAuthCoreBinaryTarget"])
    ],
    targets: [
        .target(
            name: "PowerAuth2Wrapper",
            dependencies: [
                .target(name: "PowerAuth2BinaryTarget"),
                .target(name: "PowerAuthCoreBinaryTarget")
            ]),
        .binaryTarget(
            name: "PowerAuth2BinaryTarget",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/%VERSION%/%SDK_ZIP%",
            checksum: "%SDK_CHECKSUM%"),
        .binaryTarget(
            name: "PowerAuthCoreBinaryTarget",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/%VERSION%/%CORE_ZIP%",
            checksum: "%CORE_CHECKSUM%"),
    ]
)