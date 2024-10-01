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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.0/PowerAuth2-1.9.0.xcframework.zip",
            checksum: "4274a2ce9d273b0acf9197bca47a460831da29f1abda01c8e1f01b429100fb85"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.0/PowerAuthCore-1.9.0.xcframework.zip",
            checksum: "08bf3f59a73dd5aca8f5b3fcf9d64c919bee444659e33012fb2f909f2d59fa8e")
    ]
)