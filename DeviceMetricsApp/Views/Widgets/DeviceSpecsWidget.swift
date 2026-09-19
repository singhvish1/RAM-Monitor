import SwiftUI

struct DeviceSpecsWidget: View {
    let deviceInfo: DeviceInfo?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "iphone")
                    .foregroundColor(AppTheme.accent)
                Text("DEVICE DETAILS")
                    .font(.caption.weight(.bold))
                    .tracking(1.2)
                    .foregroundColor(AppTheme.muted)
                Spacer()
            }

            if let deviceInfo {
                detail("Device", deviceInfo.deviceName)
                detail("Model", deviceInfo.model)
                detail("Software", deviceInfo.osVersion)
                detail("Capacity", ByteCountFormatter.string(fromByteCount: deviceInfo.totalStorage, countStyle: .file))
            } else {
                ProgressView()
            }
        }
        .padding(18)
        .background(AppTheme.card)
        .cornerRadius(18)
    }

    private func detail(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title).foregroundColor(AppTheme.muted)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(1)
        }
        .font(.subheadline)
    }
}

struct DeviceSpecsWidget_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSpecsWidget(deviceInfo: DeviceInfo())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}