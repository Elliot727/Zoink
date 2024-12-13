import Foundation

enum League:String, CaseIterable {
    case cl = "CL"
    case sa = "SA"
    case pl = "PL"
    case pd = "PD"
    case bl1 = "BL1"
    case ded = "DED"
    
    var displayName: String {
          switch self {
          case .cl: return "Champions League"
          case .sa: return "Serie A"
          case .pl: return "Premier League"
          case .pd: return "La Liga"
          case .bl1: return "Bundesliga"
          case .ded: return "Eredivisie"
          }
      }
}
