// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MySDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MySDK",
            targets: ["MySDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "MySDK",
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.22/MySDK.xcframework.zip",
            checksum: "f860e0918b501a5501aa4def83851f4578a40b1ace2cb2fdc4e5d494c4b8b164"
        )
    ]
)
