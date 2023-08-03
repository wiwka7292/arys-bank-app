//
//  CashBackModel.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

struct CashBackResponse: Codable {
    var cashBack: [CashBack]
}

// MARK: - Cashback
struct CashBack: Codable {
    var id: Int
    var title, text, image: String
}

