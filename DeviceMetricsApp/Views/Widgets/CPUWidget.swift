import SwiftUI

struct CPUWidget: View {
    let cpuUsage: Double

    var body: some View {
        VStack {
            Text("CPU Usage")
                .font(.headline)
            Text("\(viewModel.cpuUsage, specifier: "%.2f")%")
                .font(.largeTitle)
                .foregroundColor(viewModel.cpuUsage > 80 ? .red : .green)
        }
        .padding()
        .background(Color(.systemGray6))
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