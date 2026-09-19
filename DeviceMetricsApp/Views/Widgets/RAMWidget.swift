import SwiftUI

struct RAMWidget: View {
    let ramUsage: Double

    var body: some View {
        VStack {
            Text("RAM Usage")
                .font(.headline)
            Text(String(format: "%.1f%%", ramUsage))
                .font(.largeTitle)
                .foregroundColor(ramUsage > 80 ? .red : .green)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RAMWidget_Previews: PreviewProvider {
    static var previews: some View {
        RAMWidget(ramUsage: 50)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}