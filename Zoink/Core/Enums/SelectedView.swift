import Foundation

enum SelectedView:String, CaseIterable {
    case score = "Score"
    case table = "Table"
    
    var icon: String {
        switch self {
        case .score: return "sportscourt"
        case .table: return "trophy"
        }
    }
}
