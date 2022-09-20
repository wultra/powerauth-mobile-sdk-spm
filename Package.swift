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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.6/PowerAuth2-1.6.6.xcframework.zip",
            checksum: "9395e4fd37fcce8fbe67ebd1ae289aeabf498afc550a111e5e03125661fb21bb"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.6.6/PowerAuthCore-1.6.6.xcframework.zip",
            checksum: "b3113fb7a4ffcccadc8a94e39aa1e83816bbb487e5e6c5059ef31822c1795a71")
    ]
)