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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.23/MySDK.xcframework.zip",
            checksum: "316fa8bbb27bc99173599cc4271e46058e3d09490536b8d6ee3f3f928c1d85c7"
        )
    ]
)
