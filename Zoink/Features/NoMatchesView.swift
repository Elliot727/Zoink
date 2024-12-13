import SwiftUI

struct NoMatchesView: View {
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "calendar.badge.exclamationmark")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.secondary)
                .frame(width: 100, height: 100)
            
            VStack(spacing: 8) {
                Text("No Matches Today")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                Text("Check back later or explore other dates")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoMatchesView()
}
