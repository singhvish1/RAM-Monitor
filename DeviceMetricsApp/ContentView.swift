import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SystemMonitorViewModel()

    var body: some View {
        TabView {
            DashboardView(viewModel: viewModel)
                .tabItem { Label("Dashboard", systemImage: "gauge.with.dots.needle.33percent") }
            MetricsView(viewModel: viewModel)
                .tabItem { Label("History", systemImage: "chart.xyaxis.line") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}