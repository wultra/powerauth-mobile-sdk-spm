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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.2/PowerAuth2-1.6.2.xcframework.zip",
            checksum: "bed5442992e31036128676bde73a5a75059cdb8287a68bd376ff39598bbb67b4"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.2/PowerAuthCore-1.6.2.xcframework.zip",
            checksum: "9874dd4c051265fdcbd6d3ddc121703cce9ced72b9b6cf914a00bda8b6edfbad")
    ]
)