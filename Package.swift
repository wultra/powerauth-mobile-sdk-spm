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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.10/PowerAuth2-bf20ad9.xcframework.zip",
            checksum: "5da4ee492537e0b619f26e5012b423f82f3bb69754f4f1c4b8424a7a677174c1"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.10/PowerAuthCore-bf20ad9.xcframework.zip",
            checksum: "f1c04f5a120763aea8f59e24ee7ecea68011ac66321efb2948166dce998a625c")
    ]
)