import Foundation

struct MatchesResponse: Codable {
    let filters: Filters
    let resultSet: ResultSet
    let competition: Competition
    var matches: [Match]
}

struct Filters: Codable {
    let season: String?
}

struct Competition: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let type: String?
    let emblem: String?
}

struct Match: Codable, Hashable, Equatable {
    let area: Area?
    let season: Season?
    let id: Int?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
    let lastUpdated: String?
    let homeTeam: Team?
    let awayTeam: Team?
    let score: Score?

    enum CodingKeys: String, CodingKey {
        case area
        case season
        case id
        case utcDate
        case status
        case matchday
        case stage
        case lastUpdated
        case homeTeam
        case awayTeam
        case score
    }
    static func ==(lhs: Match, rhs: Match) -> Bool {
        return lhs.area == rhs.area &&
               lhs.season == rhs.season &&
               lhs.id == rhs.id &&
               lhs.utcDate == rhs.utcDate &&
               lhs.status == rhs.status &&
               lhs.matchday == rhs.matchday &&
               lhs.stage == rhs.stage &&
               lhs.lastUpdated == rhs.lastUpdated &&
               lhs.homeTeam == rhs.homeTeam &&
               lhs.awayTeam == rhs.awayTeam &&
               lhs.score == rhs.score
    }
}

struct Area: Codable, Hashable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case code
        case flag
    }
}

struct Team: Codable, Hashable {
    let id: Int?
    let name: String?
    let shortName: String?
    let tla: String?
    let crest: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case shortName
        case tla
        case crest
    }
}

struct Score: Codable, Hashable {
    let winner: String?
    let duration: String?
    let fullTime: Time?
    let halfTime: Time?

    enum CodingKeys: String, CodingKey {
        case winner
        case duration
        case fullTime
        case halfTime
    }
}

struct Time: Codable, Hashable {
    let home: Int?
    let away: Int?

    enum CodingKeys: String, CodingKey {
        case home
        case away
    }
}

struct Season: Codable, Hashable {
    let id: Int?
    let startDate: String?
    let endDate: String?
    let currentMatchday: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case startDate
        case endDate
        case currentMatchday
    }
}

struct ResultSet: Codable, Hashable {
    let count: Int?
    let first: String?
    let last: String?
    let played: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case first
        case last
        case played
    }
}
