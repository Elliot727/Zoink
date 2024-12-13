import Foundation

class LeagueTableCalculatorService: LeagueTableCalculator {
    func calculateLeagueTable(from matches: [Match]) -> [LeagueTableEntry] {
        var teamPerformances: [String: LeagueTableEntry] = [:]
        
        for match in matches {
            guard let homeTeam = match.homeTeam,
                  let awayTeam = match.awayTeam,
                  let homeScore = match.score?.fullTime?.home,
                  let awayScore = match.score?.fullTime?.away else {
                continue
            }
            
            if teamPerformances[homeTeam.name ?? ""] == nil {
                teamPerformances[homeTeam.name ?? ""] = LeagueTableEntry(team: homeTeam)
            }
            if teamPerformances[awayTeam.name ?? ""] == nil {
                teamPerformances[awayTeam.name ?? ""] = LeagueTableEntry(team: awayTeam)
            }
            
            updateTeamStats(
                team: &teamPerformances[homeTeam.name ?? ""]!,
                goalsFor: homeScore,
                goalsAgainst: awayScore,
                result: determineResult(homeScore: homeScore, awayScore: awayScore)
            )
            
            updateTeamStats(
                team: &teamPerformances[awayTeam.name ?? ""]!,
                goalsFor: awayScore,
                goalsAgainst: homeScore,
                result: determineResult(homeScore: awayScore, awayScore: homeScore)
            )
        }
        
        return teamPerformances.values.sorted {
            if $0.points != $1.points {
                return $0.points > $1.points
            }
            return $0.goalDifference > $1.goalDifference
        }
    }
    
    private func determineResult(homeScore: Int, awayScore: Int) -> MatchResult {
        if homeScore > awayScore {
            return .win
        } else if homeScore < awayScore {
            return .loss
        }
        return .draw
    }
    
    private func updateTeamStats(team: inout LeagueTableEntry, goalsFor: Int, goalsAgainst: Int, result: MatchResult) {
        team.played += 1
        team.goalsFor += goalsFor
        team.goalsAgainst += goalsAgainst
        
        switch result {
        case .win:
            team.wins += 1
        case .loss:
            team.losses += 1
        case .draw:
            team.draws += 1
        }
    }
}
