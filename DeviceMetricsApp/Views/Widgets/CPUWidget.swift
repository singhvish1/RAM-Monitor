import SwiftUI

struct CPUWidget: View {
    let cpuUsage: Double

    var body: some View {
        VStack {
            Text("CPU Usage")
                .font(.headline)
            Text(String(format: "%.1f%%", cpuUsage))
                .font(.largeTitle)
                .foregroundColor(cpuUsage > 80 ? .red : .green)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CPUWidget_Previews: PreviewProvider {
    static var previews: some View {
        CPUWidget(cpuUsage: 25)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}