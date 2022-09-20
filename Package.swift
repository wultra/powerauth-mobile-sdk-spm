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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.3/PowerAuth2-1.7.3.xcframework.zip",
            checksum: "e76f14367680d36101e683ab124fa7d279afc1572d965b756f944fe5ca902817"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.3/PowerAuthCore-1.7.3.xcframework.zip",
            checksum: "c7e99a55a2ce2e8a74bcc44b060fb6518be85d0449bceb69b09d378765c38eb4")
    ]
)