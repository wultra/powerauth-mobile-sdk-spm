// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PowerAuth2",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(name: "PowerAuth2", targets: ["PowerAuth2"]),
        .library(name: "PowerAuthCore", targets: ["PowerAuthCore"])
    ],
    targets: [
        .binaryTarget(
            name: "PowerAuth2",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.1/PowerAuth2-1.8.1.xcframework.zip",
            checksum: "5c16cae39750ee71087e797279bcf6c090c9a3c441d7b0bd69620b7deeca8b8d"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.1/PowerAuthCore-1.8.1.xcframework.zip",
            checksum: "2205777e6d4058e185b78620e67252ba8934b61ed4a978c1c4e29993ccdad1f9")
    ]
)