import SwiftUI

struct MatchesView: View {
    var groupedMatches: [(String, [Match])]
    
    var body: some View {
        if(groupedMatches.isEmpty){
            NoMatchesView()
        }
        else{
            ScrollView {
                VStack {
                    ForEach(groupedMatches, id: \.0) { date, matches in
                        VStack(alignment: .leading) {
                            Text(date)
                                .font(.headline)
                                .padding(.top, 12)
                            
                            ForEach(matches, id: \.self) { match in
                                MatchCard(match: match)
                                    .padding(.bottom, 8)
                            }
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}
