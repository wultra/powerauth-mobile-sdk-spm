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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.1/PowerAuth2-1.7.1.xcframework.zip",
            checksum: "75a1a03dece8881371596915935526c0eca3fa88cc74a3e8e63f6d63868818f6"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.1/PowerAuthCore-1.7.1.xcframework.zip",
            checksum: "885f1b693f1e5ba67a56992e837e411e61594280c3f0542cad9a16ee22e01096")
    ]
)