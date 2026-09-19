import SwiftUI

struct MetricsView: View {
    @ObservedObject var viewModel: SystemMonitorViewModel

    var body: some View {
        NavigationView {
            List(viewModel.usageHistory, id: \.timestamp) { snapshot in
                Section(header: Text(Self.timeFormatter.string(from: snapshot.timestamp))) {
                    DetailRow(title: "CPU", value: String(format: "%.1f%%", snapshot.cpuUsage))
                    DetailRow(title: "RAM", value: String(format: "%.1f%%", snapshot.ramUsage))
                    DetailRow(title: "Storage", value: String(format: "%.1f%%", snapshot.ssdUsage))
                }
            }
            .navigationTitle("Usage History")
        }
    }

    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        return formatter
    }()
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView(viewModel: SystemMonitorViewModel(autoStart: false))
    }
}