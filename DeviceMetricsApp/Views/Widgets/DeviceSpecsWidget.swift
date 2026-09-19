import SwiftUI

struct DeviceSpecsWidget: View {
    let deviceInfo: DeviceInfo?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Device Specifications")
                .font(.headline)
                .padding(.bottom, 5)

            if let deviceInfo {
                Text("Device Name: \(deviceInfo.deviceName)")
                Text("Model: \(deviceInfo.model)")
                Text("OS Version: \(deviceInfo.osVersion)")
                Text("Storage: \(ByteCountFormatter.string(fromByteCount: deviceInfo.totalStorage, countStyle: .file))")
            } else {
                ProgressView()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct DeviceSpecsWidget_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSpecsWidget(deviceInfo: DeviceInfo())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}