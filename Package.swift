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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.12/PowerAuth2-1.7.12.xcframework.zip",
            checksum: "4119752f0492cb218ee8501976a09b19d718379d556521e8259e93be669ef00c"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.12/PowerAuthCore-1.7.12.xcframework.zip",
            checksum: "7e1d6692b5545b4fa2dc91331b61d226e899cff1d33de55945964cfa311f85bb")
    ]
)