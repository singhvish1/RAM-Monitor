import SwiftUI

struct RAMWidget: View {
    let ramUsage: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: "memorychip")
                    .font(.headline)
                    .foregroundColor(AppTheme.purple)
                    .frame(width: 34, height: 34)
                    .background(AppTheme.purple.opacity(0.15))
                    .clipShape(Circle())
                Spacer()
                Text(String(format: "%.0f%%", ramUsage))
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("RAM")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("MEMORY")
                    .font(.caption2.weight(.bold))
                    .tracking(1)
                    .foregroundColor(AppTheme.muted)
            }
            ProgressView(value: min(max(ramUsage, 0), 100), total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: AppTheme.purple))
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.card)
        .cornerRadius(18)
    }
}

struct RAMWidget_Previews: PreviewProvider {
    static var previews: some View {
        RAMWidget(ramUsage: 50)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}