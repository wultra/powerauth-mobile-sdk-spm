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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.6/PowerAuth2-1.9.6.xcframework.zip",
            checksum: "4eac69111551c731cfad1b6a471678e507bb9ec32d702f4d2943afbd7bf8288a"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.6/PowerAuthCore-1.9.6.xcframework.zip",
            checksum: "b3015a31a669f1549620ec3065ebfcf72bd266294bb92541bcea5fa0820445d8")
    ]
)