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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.3/PowerAuth2-1.6.2.xcframework.zip",
            checksum: "dbc5b3dded8f5cf5ceacbc7724720b613f6891331a0d13278f867bc2c7ee93ce"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.3/PowerAuthCore-1.6.2.xcframework.zip",
            checksum: "b59b9374812dde009f51e535a6bb04c482af0539c9d7d6afcae4d68fb123ae3a")
    ]
)