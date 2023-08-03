//
//  CardModel.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import Foundation

struct CardResponse: Codable {
    var cart: [Card]
}

// MARK: - Cart
struct Card: Codable {
    var id: Int
    var nameSurname, period, numberCart: String
    var balance: Int
}
