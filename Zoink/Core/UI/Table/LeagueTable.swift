import SwiftUI

struct LeagueTable: View {
    var matches:[LeagueTableEntry]
    var body: some View {
        VStack{
            HStack {
                Text("Pos").frame(width: 30)
                Text("Team").frame(maxWidth: .infinity, alignment: .leading)
                Text("P").frame(width: 30)
                Text("W").frame(width: 30)
                Text("D").frame(width: 30)
                Text("L").frame(width: 30)
                Text("GD").frame(width: 50)
                Text("Pts").frame(width: 40)
            }
            .font(.headline)
            ScrollView{
                VStack{
                    ForEach(Array(matches.enumerated()), id: \.element) { (index, entry) in
                        HStack {
                            Text("\(index + 1)").frame(width: 30)
                            Text(entry.team.name ?? "Unknown").frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(entry.played)").frame(width: 30)
                            Text("\(entry.wins)").frame(width: 30)
                            Text("\(entry.draws)").frame(width: 30)
                            Text("\(entry.losses)").frame(width: 30)
                            Text("\(entry.goalDifference)").frame(width: 50)
                            Text("\(entry.points)").frame(width: 40)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding([.top, .horizontal])
    }
}
