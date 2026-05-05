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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/2.0.0-beta1/PowerAuth2-2.0.0-beta1.xcframework.zip",
            checksum: "de387a55c36e6db9b588cdc5cc049ccdbe97f36669bffffa24476f9e2e5666c8"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/2.0.0-beta1/PowerAuthCore-2.0.0-beta1.xcframework.zip",
            checksum: "2e19fa31ea02fea22d89bffadf519a0dc5ce51804586ee7210698933af5ad4f9")
    ]
)