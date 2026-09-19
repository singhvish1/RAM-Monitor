import SwiftUI

struct CPUWidget: View {
    let cpuUsage: Double

    var body: some View {
        metricCard(title: "CPU", subtitle: "PROCESSOR", value: cpuUsage, icon: "cpu", color: AppTheme.accent)
    }

    private func metricCard(title: String, subtitle: String, value: Double, icon: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: icon)
                    .font(.headline)
                    .foregroundColor(color)
                    .frame(width: 34, height: 34)
                    .background(color.opacity(0.15))
                    .clipShape(Circle())
                Spacer()
                Text("\(value, specifier: "%.0f")%")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.caption2.weight(.bold))
                    .tracking(1)
                    .foregroundColor(AppTheme.muted)
            }
            ProgressView(value: min(max(value, 0), 100), total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: color))
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.card)
        .cornerRadius(18)
    }
}

struct CPUWidget_Previews: PreviewProvider {
    static var previews: some View {
        CPUWidget(cpuUsage: 25)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}