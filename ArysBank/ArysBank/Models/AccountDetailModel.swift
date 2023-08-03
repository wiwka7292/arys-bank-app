//
//  AccountDetailModel.swift
//  ArysBank
//
//  Created by Жека on 03/08/2023.
//

import UIKit

struct DetailsOfSettingsResponse: Codable {
    let details: [DetailsOfSetting]
}

// MARK: - Detail
struct DetailsOfSetting: Codable {
    let nameOfSection, statusOfSection: String
}

