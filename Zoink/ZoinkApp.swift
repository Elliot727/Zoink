import SwiftUI
import SDWebImageSVGCoder

@main
struct ZoinkApp: App {
    
    private var networkService: NetworkServiceProtocol
    private var matchService: MatchServiceProtocol
    private var leagueTableCalculatorService: LeagueTableCalculator
    
    @State private var matchViewModel: MatchViewModel
    @State private var leagueTableCalculatorViewModel: LeagueTableCalculatorViewModel
    @State private var leagueViewModel:LeagueViewModel
    @State private var orientationManager: OrientationManager
    
    init() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
        
        self.networkService = NetworkService()
        self.matchService = MatchService(networkProtocol: networkService)
        self.leagueTableCalculatorService = LeagueTableCalculatorService()
        
        let matchViewModel = MatchViewModel(matchService: matchService)
        let leagueTableCalculatorViewModel = LeagueTableCalculatorViewModel(leagueTableCalculatorService: leagueTableCalculatorService)
        
        _matchViewModel = State(wrappedValue: matchViewModel)
        _leagueTableCalculatorViewModel = State(wrappedValue: leagueTableCalculatorViewModel)
        _leagueViewModel = State(wrappedValue: LeagueViewModel())
        _orientationManager = State(wrappedValue: OrientationManager())
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(matchViewModel)
                .environment(leagueTableCalculatorViewModel)
                .environment(orientationManager)
                .environment(leagueViewModel)
        }
    }
}
