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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.6/PowerAuth2-1.7.6.xcframework.zip",
            checksum: "2733da500b178d65ad33ee7e5d6152f632c91434d565c7e339b6e54c14e6ea0d"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.6/PowerAuthCore-1.7.6.xcframework.zip",
            checksum: "11240d9839654980b2c09b91b40844de89420bcb2b296b4b51dc14749a9cd03f")
    ]
)