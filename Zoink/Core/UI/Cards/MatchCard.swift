import Kingfisher
import SwiftUI

struct MatchCard: View {
    var match:Match
    var body: some View {
        VStack{
            MatchScoreCard(match: match)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black, radius: 0, x: 6, y: 6)
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(.black, lineWidth: 2)
        }
    }
}
