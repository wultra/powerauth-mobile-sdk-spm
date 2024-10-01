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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.3/PowerAuth2-1.8.3.xcframework.zip",
            checksum: "856f329331ed62f27ca39c3e70254b31f952d673f43b93bfbb6ea4bb5bc936ee"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.3/PowerAuthCore-1.8.3.xcframework.zip",
            checksum: "4a9aea1373808110297969b8c2a2c7af9c806765cb631ccf96da2da7560ef265")
    ]
)