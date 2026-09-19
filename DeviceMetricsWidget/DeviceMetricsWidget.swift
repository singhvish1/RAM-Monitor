import SwiftUI
import WidgetKit

struct DeviceMetricsWidgetEntry: TimelineEntry {
    let date: Date
    let cpuUsage: Double
    let ramUsage: Double
    let storageUsage: Double
}

struct DeviceMetricsTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> DeviceMetricsWidgetEntry {
        entry()
    }

    func getSnapshot(in context: Context, completion: @escaping (DeviceMetricsWidgetEntry) -> Void) {
        completion(entry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DeviceMetricsWidgetEntry>) -> Void) {
        let now = Date()
        let entries = (0..<3).map { offset in
            DeviceMetricsWidgetEntry(
                date: Calendar.current.date(byAdding: .minute, value: offset * 20, to: now) ?? now,
                cpuUsage: 0,
                ramUsage: 0,
                storageUsage: 0
            )
        }
        completion(Timeline(entries: entries, policy: .atEnd))
    }

    private func entry() -> DeviceMetricsWidgetEntry {
        DeviceMetricsWidgetEntry(date: Date(), cpuUsage: 0, ramUsage: 0, storageUsage: 0)
    }
}

struct DeviceMetricsWidget: Widget {
    let kind = "DeviceMetricsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: DeviceMetricsTimelineProvider()) { entry in
            DeviceMetricsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Device Metrics")
        .description("Displays CPU, RAM, and storage usage.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
