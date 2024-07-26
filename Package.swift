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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.2/PowerAuth2-1.8.2.xcframework.zip",
            checksum: "fec8648d6b29d604f781eedd7098658679a4f8e39bd56056eab480e6bbfe6cd6"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.2/PowerAuthCore-1.8.2.xcframework.zip",
            checksum: "4bd57f64004d2f3579eb17bf83f6f540ca3484ffc2300ed387691a6a1a1f071a")
    ]
)