//
//  NewsAPI.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

//https://apingweb.com/api/rest/c8f0b8f55eeca0d22e5b2d23852cc8b917/finance-news

class NewsAPI{
    
    
    enum NetworkingError: Error{
        case urlInvalid
        case requeatInvalid
    }
    
    
    func fetchNews() async throws -> [News] {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/c8f0b8f55eeca0d22e5b2d23852cc8b917/finance-news"
        
        guard let url = urlComponents.url else { throw NetworkingError.urlInvalid }
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let decoder = JSONDecoder()
        
        do{
            let (data, response) = try await session.data(for: request)
            print(response)
            
            let jsonResponse = try decoder.decode(NewsResponse.self, from: data)
            return jsonResponse.news
        } catch {
            print(error)
            throw NetworkingError.requeatInvalid
        }
    }
}
