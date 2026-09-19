import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: SystemMonitorViewModel

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("OVERVIEW")
                                    .font(.caption.weight(.bold))
                                    .tracking(1.5)
                                    .foregroundColor(AppTheme.muted)
                                Text("Device health")
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button(action: viewModel.refresh) {
                                Image(systemName: "arrow.clockwise")
                                    .font(.headline.weight(.semibold))
                                    .foregroundColor(AppTheme.accent)
                                    .padding(12)
                                    .background(AppTheme.card)
                                    .clipShape(Circle())
                            }
                        }

                        HStack(spacing: 12) {
                            CPUWidget(cpuUsage: viewModel.cpuUsage)
                            RAMWidget(ramUsage: viewModel.ramUsage)
                        }

                        SSDWidget(ssdUsage: viewModel.ssdUsage)
                        DeviceSpecsWidget(deviceInfo: viewModel.deviceInfo)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

enum AppTheme {
    static let background = Color(red: 0.055, green: 0.067, blue: 0.11)
    static let card = Color(red: 0.11, green: 0.13, blue: 0.19)
    static let muted = Color(red: 0.55, green: 0.59, blue: 0.68)
    static let accent = Color(red: 0.34, green: 0.78, blue: 0.98)
    static let purple = Color(red: 0.61, green: 0.47, blue: 0.98)
    static let green = Color(red: 0.32, green: 0.88, blue: 0.62)
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: SystemMonitorViewModel())
    }
}