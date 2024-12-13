struct LeagueTableEntry: Codable, Hashable {
    let team: Team
    var played: Int = 0
    var wins: Int = 0
    var draws: Int = 0
    var losses: Int = 0
    var goalsFor: Int = 0
    var goalsAgainst: Int = 0
    var goalDifference: Int {
        goalsFor - goalsAgainst
    }
    var points: Int {
        (wins * 3) + draws
    }
}
