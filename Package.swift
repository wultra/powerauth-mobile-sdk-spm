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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.0/PowerAuth2-1.8.0.xcframework.zip",
            checksum: "8eac4c16f2db326cb83145cd4349dbd5139cee575cd06ac5088976d57cf37f72"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.0/PowerAuthCore-1.8.0.xcframework.zip",
            checksum: "451ce60cb6e2d2841690a4ac319e3a2456ca4b2171ce80ab0659cf3b09fe12f3")
    ]
)