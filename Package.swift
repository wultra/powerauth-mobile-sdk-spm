// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PowerAuth2",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "PowerAuth2", targets: ["PowerAuth2Wrapper"]),
        .library(name: "PowerAuthCore", targets: ["PowerAuthCoreBinaryTarget"])
    ],
    targets: [
        .target(
            name: "PowerAuth2Wrapper",
            dependencies: [
                .target(name: "PowerAuth2BinaryTarget"),
                .target(name: "PowerAuthCoreBinaryTarget")
            ]),
        .binaryTarget(
            name: "PowerAuth2BinaryTarget",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.1/PowerAuth2-1.6.2.xcframework.zip",
            checksum: "82dcec253605413765b55cdd88af5ceec55d9b61060f34540190d28592409fb1"),
        .binaryTarget(
            name: "PowerAuthCoreBinaryTarget",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/0.0.1/PowerAuthCore-1.6.2.xcframework.zip",
            checksum: "92ab6d010041b8820099d956034c576e029d50b551e3eb2698034bb9d9cacc5c"),
    ]
)