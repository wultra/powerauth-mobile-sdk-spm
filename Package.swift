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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.4/PowerAuth2-1.9.4.xcframework.zip",
            checksum: "b10c5d43ebb6094c9616ce707bee0908bf640e76267a8e64afd2540a236cb48f"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.4/PowerAuthCore-1.9.4.xcframework.zip",
            checksum: "1be3b501ecb133bcc67050a9edb84589d06ef57efb1a4792b0bc5eeaf845654d")
    ]
)