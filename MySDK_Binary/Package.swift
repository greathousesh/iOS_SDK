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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.7/MySDK.xcframework.zip",
            checksum: "bb187ef7ee546d3497f4657c33fee856b563b442c0db51d419a7d79a2edd44cc"
        )
    ]
)
