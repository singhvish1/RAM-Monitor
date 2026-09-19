import SwiftUI
import WidgetKit

struct DeviceMetricsWidgetEntryView: View {
    var entry: DeviceMetricsEntry

    var body: some View {
        VStack {
            Text("Device Metrics")
                .font(.headline)
                .padding()

            Text("CPU Usage: \(entry.cpuUsage)%")
                .font(.subheadline)

            Text("RAM Usage: \(entry.ramUsage)%")
                .font(.subheadline)

            Text("SSD Usage: \(entry.ssdUsage)%")
                .font(.subheadline)

            Text("Device: \(entry.deviceName)")
                .font(.subheadline)
        }
        .padding()
    }
}

struct DeviceMetricsWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceMetricsWidgetEntryView(entry: DeviceMetricsEntry(cpuUsage: 30, ramUsage: 50, ssdUsage: 20, deviceName: "iPhone 14"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}