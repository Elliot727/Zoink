import Foundation

@Observable
class LeagueTableCalculatorViewModel{
    var leagueTableCalculatorService:LeagueTableCalculator
    var leagueTableEntries:[LeagueTableEntry] = []
    
    init(leagueTableCalculatorService: LeagueTableCalculator) {
        self.leagueTableCalculatorService = leagueTableCalculatorService
    }
    
    func calculateLeagueTable(from matches: [Match])  {
        leagueTableEntries = leagueTableCalculatorService.calculateLeagueTable(from: matches)
    }
    
    func getLeague()->[LeagueTableEntry]{
        return leagueTableEntries
    }
}
