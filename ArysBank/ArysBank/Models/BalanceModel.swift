//
//  BalanceModel.swift
//  ArysBank
//
//  Created by Жека on 31/07/2023.
//

import Foundation

struct BalancesCard: Codable {
    let balances: [Balance]
}

// MARK: - Balance
struct Balance: Codable {
    let balance: Int
}
