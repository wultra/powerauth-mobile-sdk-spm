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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.2/PowerAuth2-1.7.2.xcframework.zip",
            checksum: "5bee675324ae742bdf32cd995e3e505371eb585f6e5b24fbc0fd8ce2d0a150b8"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.2/PowerAuthCore-1.7.2.xcframework.zip",
            checksum: "a26b8aab26247d41b299ba186fd2f3fafa063cf7ae76b1027d7bd6a7e0c6b4b7")
    ]
)