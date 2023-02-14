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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.7/PowerAuth2-1.7.7.xcframework.zip",
            checksum: "141875d83a7c8ddbd335ec7fde5de14a3e26374843220fd91439a8b08face5d0"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.7/PowerAuthCore-1.7.7.xcframework.zip",
            checksum: "fa08c0afad23416a283f9cfeff81f6f45285ba6731f6579130223197aa8de1e1")
    ]
)