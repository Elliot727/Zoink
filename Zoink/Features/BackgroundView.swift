import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom))
            .opacity(0.4)
            .rotationEffect(.degrees(45))
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
