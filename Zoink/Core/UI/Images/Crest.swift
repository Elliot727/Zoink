import SwiftUI
import SDWebImageSwiftUI

struct Crest: View {
    var urlString: String
    var body: some View {
        WebImage(url: URL(string: urlString))
            .resizable()
            .scaledToFill()
            .frame(width: 24, height: 24)
            .padding()
            .overlay {
                Circle()
                    .stroke(.black,lineWidth: 1)
            }
            .shadow(radius: 1)
    }
}

#Preview {
    Crest(urlString: "https://crests.football-data.org/99.svg")
}

