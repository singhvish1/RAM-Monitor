// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DeviceMetricsApp",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DeviceMetricsWidget",
            targets: ["DeviceMetricsWidget"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DeviceMetricsApp",
            dependencies: [],
            path: "DeviceMetricsApp"
        ),
        .target(
            name: "DeviceMetricsWidget",
            dependencies: [],
            path: "DeviceMetricsWidget"
        )
    ]
)