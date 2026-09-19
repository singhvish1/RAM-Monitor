import SwiftUI

struct SSDWidget: View {
    let ssdUsage: Double

    var body: some View {
        VStack {
            Text("SSD Usage")
                .font(.headline)
            Text(String(format: "%.1f%%", ssdUsage))
                .font(.largeTitle)
                .foregroundColor(ssdUsage > 80 ? .red : .green) // Change color based on usage
        }
        .padding()
    }
}

struct SSDWidget_Previews: PreviewProvider {
    static var previews: some View {
        SSDWidget(ssdUsage: 35)
    }
}