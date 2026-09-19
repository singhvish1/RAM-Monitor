import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: SystemMonitorViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    HStack {
                        CPUWidget(cpuUsage: viewModel.cpuUsage)
                        RAMWidget(ramUsage: viewModel.ramUsage)
                    }
                    SSDWidget(ssdUsage: viewModel.ssdUsage)
                    DeviceSpecsWidget(deviceInfo: viewModel.deviceInfo)
                }
                .padding()
            }
            .navigationTitle("Dashboard")
            .toolbar {
                Button("Refresh") { viewModel.refresh() }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: SystemMonitorViewModel())
    }
}