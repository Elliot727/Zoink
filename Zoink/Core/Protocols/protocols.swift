import Foundation

protocol URLBuilding {
    func buildURL() -> URL?
}

protocol NetworkServiceProtocol {
    func fetch(_ endpoint: URL) async throws -> MatchesResponse
}
protocol MatchServiceProtocol{
    func fetchMatches(for league: Endpoint) async throws -> MatchesResponse
}

protocol LeagueTableCalculator {
    func calculateLeagueTable(from matches: [Match]) -> [LeagueTableEntry]
}
