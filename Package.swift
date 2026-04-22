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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.24/MySDK.xcframework.zip",
            checksum: "f02384e3326787c49f86303fb2e2d740a1ab8f2be251b51094f14f2c49d5dabc"
        )
    ]
)
