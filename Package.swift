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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.2/PowerAuth2-1.6.2.xcframework.zip",
            checksum: "878aae9c896f7be03a9d0a80f5b6429764270d0fb18474de7ab2b60f8159950f"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.2/PowerAuthCore-1.6.2.xcframework.zip",
            checksum: "2b337d137c46d8f18996c32601a95fc188c7cf9c50da5cd86fae70a912cc553b")
    ]
)