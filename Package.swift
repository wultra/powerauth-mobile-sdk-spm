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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.10/PowerAuth2-1.7.10.xcframework.zip",
            checksum: "f87da784ee0960a4b6fd0a90a291a1d8bd4195dc2c72e2649d7f6edcaf7e6179"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.10/PowerAuthCore-1.7.10.xcframework.zip",
            checksum: "766b4fc6ae1a162c2dad27d823bca237f947909e14dd2259fe21fa11965a60fb")
    ]
)