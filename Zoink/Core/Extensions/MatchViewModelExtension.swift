import Foundation

extension MatchViewModel {
    func groupedAndSortedMatches(for date: Date) -> [(String, [Match])] {
        guard let matches = matches?.matches else { return [] }
        
        func stringToDate(_ dateString: String) -> Date? {
            let formatter = ISO8601DateFormatter()
            return formatter.date(from: dateString)
        }
        
        let filteredMatches = matches.filter { match in
            if let utcDateString = match.utcDate,
               let matchDate = stringToDate(utcDateString) {
                return Calendar.current.isDate(matchDate, inSameDayAs: date)
            }
            return false
        }
        
        let grouped = Dictionary(grouping: filteredMatches) { match -> String in
            if let date = match.utcDate {
                return date.toHumanReadableDate() ?? "Unknown Date"
            }
            return "Unknown Date"
        }
        
        let sortedKeys = grouped.keys.sorted { (date1, date2) -> Bool in
            guard let firstDate1 = grouped[date1]?.first?.utcDate,
                  let firstDate2 = grouped[date2]?.first?.utcDate else { return false }
            return firstDate1 < firstDate2
        }
        
        return sortedKeys.compactMap { key in
            guard let matches = grouped[key] else { return nil }
            return (key, matches)
        }
    }
}
