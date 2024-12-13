import SwiftUI

struct MatchScoreCard: View {
    var match: Match
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {

                    Crest(urlString: match.homeTeam?.crest ?? "")
                    Text("\(match.score?.fullTime?.home ?? 0)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
             
                }
                Text(match.homeTeam?.shortName ?? "")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
            }
            Spacer()
            VStack(alignment: .trailing) {
                HStack(spacing: 16) {

                    Text("\(match.score?.fullTime?.away ?? 0)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Crest(urlString: match.awayTeam?.crest ?? "")
                }
                Text(match.awayTeam?.shortName ?? "")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
            }
        }
    }
}
