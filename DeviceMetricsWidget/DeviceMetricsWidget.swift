import SwiftUI
import WidgetKit

struct DeviceMetricsWidgetEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let systemMetrics: SystemMetrics
}

struct DeviceMetricsWidget: Widget {
    let kind: String = "DeviceMetricsWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, provider: DeviceMetricsTimelineProvider()) { entry in
            DeviceMetricsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Device Metrics")
        .description("Displays real-time system metrics including RAM, CPU, and SSD usage.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct DeviceMetricsTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DeviceMetricsWidgetEntry {
        DeviceMetricsWidgetEntry(date: Date(), configuration: ConfigurationIntent(), systemMetrics: SystemMetrics(cpuUsage: 0, ramUsage: 0, ssdUsage: 0))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DeviceMetricsWidgetEntry) -> Void) {
        let entry = DeviceMetricsWidgetEntry(date: Date(), configuration: configuration, systemMetrics: SystemMetrics(cpuUsage: 0, ramUsage: 0, ssdUsage: 0))
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<DeviceMetricsWidgetEntry>) -> Void) {
        var entries: [DeviceMetricsWidgetEntry] = []
        let currentDate = Date()
        
        // Generate a timeline with entries for the next hour
        for hourOffset in 0 ..< 3 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset * 20, to: currentDate)!
            let entry = DeviceMetricsWidgetEntry(date: entryDate, configuration: configuration, systemMetrics: SystemMetrics(cpuUsage: 0, ramUsage: 0, ssdUsage: 0))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}