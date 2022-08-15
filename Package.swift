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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.5/PowerAuth2-1.6.5.xcframework.zip",
            checksum: "e59ef5afa1087a590890fa4ea58bedbca0b7b2416164f1efa569d30dd26ed238"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.5/PowerAuthCore-1.6.5.xcframework.zip",
            checksum: "230fe7ad2e4f1580dc6f35e92275536b06348cf7f204d6d2039e53101edd162f")
    ]
)