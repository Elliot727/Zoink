import SwiftUI

struct MainContentSelector: View {
    let isLandscape: Bool
    let selectedView: SelectedView
    let selectedDate: Date
    let leagueTableCalculatorViewModel: LeagueTableCalculatorViewModel
    let matchViewModel: MatchViewModel
    
    var body: some View {
        Group {
            switch selectedView {
            case .score:
                if !isLandscape {
                    MatchesView(groupedMatches: matchViewModel.groupedAndSortedMatches(for: selectedDate))
                } else {
                    LeagueTable(matches: leagueTableCalculatorViewModel.getLeague())
                }
            case .table:
                LeagueTable(matches: leagueTableCalculatorViewModel.getLeague())
            }
        }
    }
}
