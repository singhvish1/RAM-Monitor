import Foundation

#if canImport(UIKit)
import UIKit
#endif

struct DeviceInfo {
    let deviceName: String
    let model: String
    let osVersion: String
    let batteryLevel: Float
    let totalStorage: Int64

    init() {
#if canImport(UIKit)
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.deviceName = UIDevice.current.name
        self.model = UIDevice.current.model
        self.osVersion = UIDevice.current.systemVersion
        self.batteryLevel = UIDevice.current.batteryLevel
#else
        self.deviceName = Host.current().localizedName ?? "Mac"
        self.model = "Mac"
        self.osVersion = ProcessInfo.processInfo.operatingSystemVersionString
        self.batteryLevel = -1
#endif
        self.totalStorage = (try? FileManager.default.attributesOfFileSystem(
            forPath: NSHomeDirectory()
        )[.systemSize] as? NSNumber)?.int64Value ?? 0
    }
}