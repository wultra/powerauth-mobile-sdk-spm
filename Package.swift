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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.4/PowerAuth2-1.8.4.xcframework.zip",
            checksum: "f4f87cbe07aeb5773651f3cb94438b5072ced800ccccc83c9d080b43753c700f"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.4/PowerAuthCore-1.8.4.xcframework.zip",
            checksum: "70660b8f17305dacaa36acd00fefe01853e1ed238e634d8134f2c2eefeb0aadb")
    ]
)