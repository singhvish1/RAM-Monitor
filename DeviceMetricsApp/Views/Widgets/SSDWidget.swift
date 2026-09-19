import SwiftUI

struct SSDWidget: View {
    let ssdUsage: Double

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle().stroke(AppTheme.green.opacity(0.18), lineWidth: 9)
                Circle()
                    .trim(from: 0, to: min(max(ssdUsage, 0), 100) / 100)
                    .stroke(AppTheme.green, style: StrokeStyle(lineWidth: 9, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                Text(String(format: "%.0f%%", ssdUsage))
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            .frame(width: 78, height: 78)
            VStack(alignment: .leading, spacing: 5) {
                Text("STORAGE")
                    .font(.caption.weight(.bold))
                    .tracking(1.2)
                    .foregroundColor(AppTheme.muted)
                Text("SSD capacity")
                    .font(.title3.weight(.semibold))
                    .foregroundColor(.white)
                Text("Available space is looking healthy")
                    .font(.caption)
                    .foregroundColor(AppTheme.muted)
            }
            Spacer()
        }
        .padding(18)
        .background(AppTheme.card)
        .cornerRadius(18)
    }
}

struct SSDWidget_Previews: PreviewProvider {
    static var previews: some View {
        SSDWidget(ssdUsage: 35)
    }
}