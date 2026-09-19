import Foundation
import UIKit

class DeviceInfoService {
    func getDeviceInfo() -> DeviceInfo {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return DeviceInfo()
    }
}