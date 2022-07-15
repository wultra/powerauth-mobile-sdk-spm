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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.4/PowerAuth2-1.6.4.xcframework.zip",
            checksum: "9e285f218eef32192a613e0a9041994d69d909b96a7ea9d48960dc4216add277"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.4/PowerAuthCore-1.6.4.xcframework.zip",
            checksum: "db786012a21f064fe008e6ac045cb3bad52d05d48c0aedf70454b63c1cba8552")
    ]
)