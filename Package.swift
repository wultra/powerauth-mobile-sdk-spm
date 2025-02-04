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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.11/PowerAuth2-1.7.11.xcframework.zip",
            checksum: "9ad68c137be204caf141998f50ade0666280717409d41d3d7021764016824efc"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.11/PowerAuthCore-1.7.11.xcframework.zip",
            checksum: "e47b06812bb5d6afbfab7e650120430c854a63bffc86b9a851f2b59b1874c97b")
    ]
)