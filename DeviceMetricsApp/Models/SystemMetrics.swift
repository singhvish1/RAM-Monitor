import Foundation

struct SystemMetrics {
    var cpuUsage: Double
    var ramUsage: Double
    var ssdUsage: Double
    
    init(cpuUsage: Double = 0.0, ramUsage: Double = 0.0, ssdUsage: Double = 0.0) {
        self.cpuUsage = cpuUsage
        self.ramUsage = ramUsage
        self.ssdUsage = ssdUsage
    }
}