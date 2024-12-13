import Combine
import Foundation

class MatchService:MatchServiceProtocol{
    
    var networkProtocol:NetworkServiceProtocol
    
    init(networkProtocol: NetworkServiceProtocol) {
        self.networkProtocol = networkProtocol
    }
    
    func fetchMatches(for league: Endpoint)async throws -> MatchesResponse{
         guard let url = URLBuilder(endpoint: league).buildURL() else {
             throw URLError(.badURL)
         }
         return try await networkProtocol.fetch(url)
     }
    
}
