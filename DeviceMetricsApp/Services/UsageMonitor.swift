import Foundation
import Combine

class UsageMonitor: ObservableObject {
    @Published var cpuUsage: Double = 0.0
    @Published var ramUsage: Double = 0.0
    @Published var ssdUsage: Double = 0.0

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        // Start a timer to update usage metrics periodically
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateUsageMetrics()
            }
            .store(in: &cancellables)
    }
    
    private func updateUsageMetrics() {
        // Logic to retrieve and update CPU, RAM, and SSD usage
        self.cpuUsage = fetchCPUUsage()
        self.ramUsage = fetchRAMUsage()
        self.ssdUsage = fetchSSDUsage()
    }
    
    private func fetchCPUUsage() -> Double {
        // Implement logic to fetch CPU usage
        return Double.random(in: 0...100) // Placeholder
    }
    
    private func fetchRAMUsage() -> Double {
        // Implement logic to fetch RAM usage
        return Double.random(in: 0...100) // Placeholder
    }
    
    private func fetchSSDUsage() -> Double {
        // Implement logic to fetch SSD usage
        return Double.random(in: 0...100) // Placeholder
    }
}