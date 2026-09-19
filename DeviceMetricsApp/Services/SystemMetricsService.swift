import Combine
import Foundation
import Darwin

final class SystemMetricsService {
    func monitorSystemMetrics() -> AnyPublisher<SystemMetrics, Never> {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .map { [weak self] _ in self?.currentMetrics() ?? SystemMetrics() }
            .prepend(currentMetrics())
            .eraseToAnyPublisher()
    }

    private func currentMetrics() -> SystemMetrics {
        SystemMetrics(
            cpuUsage: processCPUUsage(),
            ramUsage: memoryUsagePercentage(),
            ssdUsage: storageUsagePercentage()
        )
    }

    private func storageUsagePercentage() -> Double {
        guard let values = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
              let total = (values[.systemSize] as? NSNumber)?.int64Value,
              let free = (values[.systemFreeSize] as? NSNumber)?.int64Value,
              total > 0 else { return 0 }
        return Double(max(0, total - free)) / Double(total) * 100
    }

    private func memoryUsagePercentage() -> Double {
        let total = Double(ProcessInfo.processInfo.physicalMemory)
        guard total > 0 else { return 0 }

        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4
        let result = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }
        guard result == KERN_SUCCESS else { return 0 }
        return Double(info.resident_size) / total * 100
    }

    private func processCPUUsage() -> Double {
        var info = task_thread_times_info()
        var count = mach_msg_type_number_t(MemoryLayout<task_thread_times_info>.size) / 4
        let result = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(TASK_THREAD_TIMES_INFO), $0, &count)
            }
        }
        guard result == KERN_SUCCESS else { return 0 }
        let user = Double(info.user_time.seconds) + Double(info.user_time.microseconds) / 1_000_000
        let system = Double(info.system_time.seconds) + Double(info.system_time.microseconds) / 1_000_000
        return min(100, max(0, (user + system) * 10))
    }
}
