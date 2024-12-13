import SwiftUI

struct ContentView: View {
    @Environment(OrientationManager.self) var orientationManager:OrientationManager
    @Environment(MatchViewModel.self) var matchViewModel:MatchViewModel
    @Environment(LeagueTableCalculatorViewModel.self) var leagueTableCalculatorViewModel:LeagueTableCalculatorViewModel
    @Environment(LeagueViewModel.self) var leagueViewModel:LeagueViewModel
    private var isLandscape: Bool {
        orientationManager.isLandscape
    }
    @State var selectedDate:Date = Date()
    @State var selectedView:SelectedView = .score
    @State var showError:Bool = false
    var body: some View {
        @Bindable var leagueVM = leagueViewModel
        NavigationStack {
            ZStack{
                BackgroundView()
                if(matchViewModel.isLoading){
                    LoadingView()
                }
                else{
                    VStack {
                        LeagueHeaderView(
                            competitionName: matchViewModel.getMatchResponse()?.competition.name ?? "",
                            competitionCode: matchViewModel.getMatchResponse()?.competition.code ?? "",
                            onLeaguePickerToggle: { leagueViewModel.showLeaguePicker.toggle() },
                            selectedDate: $selectedDate
                        )
                        MainContentSelector(
                            isLandscape: isLandscape,
                            selectedView: selectedView,
                            selectedDate: selectedDate,
                            leagueTableCalculatorViewModel: leagueTableCalculatorViewModel,
                            matchViewModel: matchViewModel
                        )
                        
                        if !isLandscape {
                            TabBar(selectedView: $selectedView)
                        }
                    }
                }
            }
            .onAppear {
                Task{
                    await matchViewModel.fetchMatches(for: .competition(leagueViewModel.selectedLeague.rawValue))
                    if let matches = matchViewModel.getMatchResponse(){
                        leagueTableCalculatorViewModel.calculateLeagueTable(from: matches.matches)
                    }
                }
            }
            .onChange(of: leagueViewModel.selectedLeague) { _, _ in
                Task{
                    await matchViewModel.fetchMatches(for: .competition(leagueViewModel.selectedLeague.rawValue), forceCall: true)
                    if let matches = matchViewModel.getMatchResponse(){
                        leagueTableCalculatorViewModel.calculateLeagueTable(from: matches.matches)
                    }
                }
            }
            
            .alert("Failed to get data", isPresented: $showError) {
                Button("OK", action: {})
            }
            .sheet(isPresented: $leagueVM.showLeaguePicker) {
                LeaguePickerView(
                    selectedLeague: $leagueVM.selectedLeague,
                    showLeaguePicker: $leagueVM.showLeaguePicker
                )
            }
        }
    }
}
