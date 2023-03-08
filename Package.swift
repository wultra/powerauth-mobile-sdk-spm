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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.8/PowerAuth2-1.7.8.xcframework.zip",
            checksum: "d6b70a6a041b8195dfa67dcce7a9a8fa99afd2e7ebfd883e71ce582027a67985"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.8/PowerAuthCore-1.7.8.xcframework.zip",
            checksum: "5438254fb5e1a3c01787cc3ee8c06b025499755fd223867b7d7529754f686457")
    ]
)