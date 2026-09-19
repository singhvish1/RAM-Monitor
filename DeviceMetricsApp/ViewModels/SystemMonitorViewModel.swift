import Foundation
import Combine

class SystemMonitorViewModel: ObservableObject {
    @Published var cpuUsage: Double = 0.0
    @Published var ramUsage: Double = 0.0
    @Published var ssdUsage: Double = 0.0
    @Published var deviceInfo: DeviceInfo?
    
    private var cancellables = Set<AnyCancellable>()
    private let deviceInfoService = DeviceInfoService()
    private let systemMetricsService = SystemMetricsService()
    
    init(autoStart: Bool = true) {
        fetchDeviceInfo()
        if autoStart { startMonitoring() }
    }
    
    private func fetchDeviceInfo() {
        deviceInfo = deviceInfoService.getDeviceInfo()
    }
    
    func startMonitoring() {
        guard cancellables.isEmpty else { return }
        systemMetricsService.monitorSystemMetrics()
            .receive(on: RunLoop.main)
            .sink { [weak self] metrics in
                self?.cpuUsage = metrics.cpuUsage
                self?.ramUsage = metrics.ramUsage
                self?.ssdUsage = metrics.ssdUsage
                self?.usageHistory.insert(
                    UsageSnapshot(timestamp: Date(), cpuUsage: metrics.cpuUsage,
                                  ramUsage: metrics.ramUsage, ssdUsage: metrics.ssdUsage),
                    at: 0
                )
                if self?.usageHistory.count ?? 0 > 60 {
                    self?.usageHistory.removeLast()
                }
            }
            .store(in: &cancellables)
    }

    func stopMonitoring() {
        cancellables.removeAll()
    }

    func refresh() {
        stopMonitoring()
        startMonitoring()
    }
}