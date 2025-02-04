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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.3/PowerAuth2-1.9.3.xcframework.zip",
            checksum: "bd9195dbe6baf2525767047e560a871555f8cdcc7bb3a6f99fac279eae50c568"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.3/PowerAuthCore-1.9.3.xcframework.zip",
            checksum: "7dd13bde1cfce8b149d9218ac432a2d79041c8dedf22a451aa051e92f90acf4a")
    ]
)