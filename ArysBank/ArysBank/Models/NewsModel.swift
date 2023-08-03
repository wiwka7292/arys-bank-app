//
//  NewsModel.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import Foundation

struct NewsResponse: Codable {
    var news: [News]
}

// MARK: - News
struct News: Codable {
    var id: Int
    var title, text, image: String
}
