//
//  ExchangeModel.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import Foundation

struct ExchangeCurency: Codable {
    var curency: [Currency]
}

// MARK: - Curency
struct Currency: Codable {
    var name, flag: String
    var buyNum, sellNum: Double
//    var id: Int?
}
