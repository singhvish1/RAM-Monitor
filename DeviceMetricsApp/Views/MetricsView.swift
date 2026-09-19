import SwiftUI

struct MetricsView: View {
    @ObservedObject var viewModel: SystemMonitorViewModel

    var body: some View {
        NavigationView {
            List(viewModel.usageHistory, id: \.timestamp) { snapshot in
                Section(snapshot.timestamp.formatted(date: .omitted, time: .standard)) {
                    DetailRow(title: "CPU", value: "\(snapshot.cpuUsage, specifier: "%.1f")%")
                    DetailRow(title: "RAM", value: "\(snapshot.ramUsage, specifier: "%.1f")%")
                    DetailRow(title: "Storage", value: "\(snapshot.ssdUsage, specifier: "%.1f")%")
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