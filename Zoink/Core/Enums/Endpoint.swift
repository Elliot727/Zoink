import Foundation

enum Endpoint {
    case competition(String)
    case match(String)
    
    var path: String {
        switch self {
        case .competition(let competition):
            return "/competitions/\(competition)/matches"
        case .match(let matchId):
            return "/matches/\(matchId)"
        }
    }
    
    var url: URL? {
        return URL(string: "https://api.football-data.org/v4" + path)
    }
    
    static func competitionEndpoint(_ competition: String) -> Endpoint {
        return .competition(competition)
    }
    
    static func matchEndpoint(_ matchId: String) -> Endpoint {
        return .match(matchId)
    }
}

