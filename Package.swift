// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DeviceMetricsApp",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [],
    dependencies: [],
    targets: [
        .target(
            name: "DeviceMetricsApp",
            dependencies: [],
            path: "DeviceMetricsApp"
        )
    ]
)