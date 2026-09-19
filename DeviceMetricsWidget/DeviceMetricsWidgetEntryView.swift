import SwiftUI
import WidgetKit

struct DeviceMetricsWidgetEntryView: View {
    let entry: DeviceMetricsWidgetEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Device Metrics")
                .font(.headline)
            metric("CPU", entry.cpuUsage)
            metric("RAM", entry.ramUsage)
            metric("Storage", entry.storageUsage)
        }
        .padding()
    }

    private func metric(_ name: String, _ value: Double) -> some View {
        HStack {
            Text(name)
            Spacer()
            Text("\(value, specifier: "%.0f")%")
        }
        .font(.caption)
    }
}

struct DeviceMetricsWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceMetricsWidgetEntryView(
            entry: DeviceMetricsWidgetEntry(
                date: Date(),
                cpuUsage: 30,
                ramUsage: 50,
                storageUsage: 20
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
