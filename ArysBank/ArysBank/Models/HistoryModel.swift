
import Foundation

struct HistoryModel: Codable {
    let histories: [History]
}

struct History: Codable {
    var amount: Int
    var name: String
}

