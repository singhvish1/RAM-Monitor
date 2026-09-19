import SwiftUI

struct MetricsView: View {
    @ObservedObject var viewModel: SystemMonitorViewModel

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("RECENT ACTIVITY")
                            .font(.caption.weight(.bold))
                            .tracking(1.4)
                            .foregroundColor(AppTheme.muted)
                        if viewModel.usageHistory.isEmpty {
                            Text("Your metrics will appear here as the monitor collects data.")
                                .foregroundColor(AppTheme.muted)
                                .padding(.top, 30)
                        } else {
                            ForEach(viewModel.usageHistory, id: \.timestamp) { snapshot in
                                historyCard(snapshot)
                            }
                        }
                    }
                    .padding(20)
                }
            }
            .navigationBarTitle("History", displayMode: .inline)
            .background(AppTheme.background)
        }
    }

    private func historyCard(_ snapshot: UsageSnapshot) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Self.timeFormatter.string(from: snapshot.timestamp))
                .font(.caption.weight(.semibold))
                .foregroundColor(AppTheme.muted)
            HStack {
                historyMetric("CPU", snapshot.cpuUsage, AppTheme.accent)
                Divider().frame(height: 28).background(AppTheme.muted.opacity(0.3))
                historyMetric("RAM", snapshot.ramUsage, AppTheme.purple)
                Divider().frame(height: 28).background(AppTheme.muted.opacity(0.3))
                historyMetric("SSD", snapshot.ssdUsage, AppTheme.green)
            }
        }
        .padding(16)
        .background(AppTheme.card)
        .cornerRadius(16)
    }

    private func historyMetric(_ title: String, _ value: Double, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title).font(.caption).foregroundColor(AppTheme.muted)
            Text(String(format: "%.0f%%", value))
                .font(.headline)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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