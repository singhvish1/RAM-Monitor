import SwiftUI

struct MetricsView: View {
    @ObservedObject var viewModel: SystemMonitorViewModel

    var body: some View {
        NavigationView {
            List(viewModel.usageHistory, id: \.timestamp) { snapshot in
                Section(snapshot.timestamp.formatted(date: .omitted, time: .standard)) {
                    DetailRow(title: "CPU", value: String(format: "%.1f%%", snapshot.cpuUsage))
                    DetailRow(title: "RAM", value: String(format: "%.1f%%", snapshot.ramUsage))
                    DetailRow(title: "Storage", value: String(format: "%.1f%%", snapshot.ssdUsage))
                }
            }
            .navigationTitle("Usage History")
        }
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView(viewModel: SystemMonitorViewModel(autoStart: false))
    }
}