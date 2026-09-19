import Foundation

struct UsageSnapshot {
    let timestamp: Date
    let cpuUsage: Double
    let ramUsage: Double
    let ssdUsage: Double

    init(timestamp: Date, cpuUsage: Double, ramUsage: Double, ssdUsage: Double) {
        self.timestamp = timestamp
        self.cpuUsage = cpuUsage
        self.ramUsage = ramUsage
        self.ssdUsage = ssdUsage
    }
}