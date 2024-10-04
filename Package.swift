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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.1/PowerAuth2-1.9.1.xcframework.zip",
            checksum: "9c1b3f4795807f633d884e060f7246e05102d492190e1e7d4b3ade333c7394af"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.1/PowerAuthCore-1.9.1.xcframework.zip",
            checksum: "aac7ee23e0bfaac3f170b49d83c630a41660daa717df8352132ae368f2c160ce")
    ]
)