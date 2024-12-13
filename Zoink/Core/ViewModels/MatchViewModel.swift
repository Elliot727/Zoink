import Foundation

@Observable
class MatchViewModel {
    private var matchService: MatchServiceProtocol
    var matches: MatchesResponse?
    var errorMsg: String?
    var isLoading:Bool = false
    init(matchService: MatchServiceProtocol) {
        self.matchService = matchService
    }

    func fetchMatches(for league: Endpoint, forceCall:Bool = false) async  {
        defer{
            isLoading = false
        }
        do{
            isLoading = true
            if matches == nil || forceCall{
                matches = try await matchService.fetchMatches(for: league)
            }
            
        }
        catch{
            errorMsg = error.localizedDescription
        }
    }
    
    func getMatchResponse() -> MatchesResponse? {
        guard let matches = matches else {
            return nil
        }
        return matches
    }

}
