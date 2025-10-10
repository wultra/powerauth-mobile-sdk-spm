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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.5/PowerAuth2-1.9.5.xcframework.zip",
            checksum: "b15312ed9d6eb6474d6663302c3639345b0510c229f6a560c9b2e4156fb2e239"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.5/PowerAuthCore-1.9.5.xcframework.zip",
            checksum: "014e8cea095947a04c9383cf5c55275263fd3668a57c7e272b16edeb28fb64d4")
    ]
)