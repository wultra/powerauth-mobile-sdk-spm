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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.9/PowerAuth2-1.7.9.xcframework.zip",
            checksum: "bed201e8eb400bedc5b8477b699c79c6ee21b3a3cee5b04350fe9182176deea4"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.9/PowerAuthCore-1.7.9.xcframework.zip",
            checksum: "65e45bec01c9701f591c20eb349f93e2b20e7bf7275d2d18c694ab48e47f856a")
    ]
)