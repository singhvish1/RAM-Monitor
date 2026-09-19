import Foundation
import UIKit

struct DeviceInfo {
    let deviceName: String
    let model: String
    let osVersion: String
    let batteryLevel: Float
    let totalStorage: Int64

    init() {
        self.deviceName = UIDevice.current.name
        self.model = UIDevice.current.model
        self.osVersion = UIDevice.current.systemVersion
        self.batteryLevel = UIDevice.current.batteryLevel
        self.totalStorage = (try? FileManager.default.attributesOfFileSystem(
            forPath: NSHomeDirectory()
        )[.systemSize] as? NSNumber)?.int64Value ?? 0
    }
}